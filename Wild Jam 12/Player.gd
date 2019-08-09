extends Node2D

var health = 100
var attack_range = 100
var attack_rate = 10
var movement_speed = 120
var damage_type = "melee"

var path : PoolVector2Array

# Called when the node enters the scene tree for the first time.
func _ready():
	Events.connect("player_wants_move", self, "move_player")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var move_distance = movement_speed * delta
	var start_point =  position
	
	
	for i in range( path.size() ):
		
		var distance_to_next = start_point.distance_to(path[0])
		Events.emit_signal("draw_player_line", position, path[path.size()-1])
		
		if move_distance <= distance_to_next and move_distance >= 0.0:
			position = start_point.linear_interpolate( path[0], move_distance / distance_to_next )
			
			var direction = position.direction_to(path[0]).normalized()
			
			$AnimatedSprite.play("side_walk")
			
			if direction.x > 0:
				#$AnimatedSprite.play("side_walk")
				$AnimatedSprite.flip_h = false
			elif direction.x < 0:
				#$AnimatedSprite.play("side_walk")
				$AnimatedSprite.flip_h = true
			
			break
		elif move_distance <= 0.0:
			print("move_distance <= 0.0")
			position = path[0]
			$AnimatedSprite.play("front_idle")
			break
			
		move_distance -= distance_to_next
		start_point = path[0]
		
		
		path.remove(0)
		
	
	
	
func move_player(new_position):
	path = get_parent().get_parent().get_node("Navigation2D").get_simple_path(position, new_position)
	

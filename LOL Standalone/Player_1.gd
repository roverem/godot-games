extends Sprite

var health = 100
var attack_range = 100
var attack_rate = 10
var movement_speed = 250
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
		if move_distance <= distance_to_next and move_distance >= 0.0:
			position = start_point.linear_interpolate( path[0], move_distance / distance_to_next )
			break
		elif move_distance <= 0.0:
			position = path[0]
			break
		move_distance -= distance_to_next
		start_point = path[0]
		path.remove(0)
	
func move_player(new_position):
	path = get_parent().get_node("Navigation2D").get_simple_path(position, new_position)
	print(path)
	print(position, new_position)
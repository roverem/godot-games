extends Sprite

var health = 100
var attack_range = 500
var attack_rate = 300
var attack_timer = attack_rate
var damage_type = "ranged"

var projectile = preload("res://projectile.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	$Line2D.add_point( Vector2(0,0) )
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if ( position.distance_to( get_parent().get_node("Player_2").position ) < attack_range):
		$Line2D.remove_point( 1 )
		$Line2D.add_point( Vector2(get_parent().get_node("Player_2").position.x - position.x, get_parent().get_node("Player_2").position.y - position.y ) )
		if ( attack_timer >= attack_rate):
			var p = projectile.instance() 
			p.target = get_parent().get_node("Player_2")
			p.position = position
			get_parent().add_child(p)
			print("FIRED")
			
		
	attack_timer += 1
	if (attack_timer > attack_rate):
		attack_timer = 0
	
	
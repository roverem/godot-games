extends Sprite

var health = 100
var attack_range = 600
var attack_rate = 10
var movement_speed = 250
var damage_type = "ranged"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x += floor(rand_range(-movement_speed, movement_speed)) * delta
	position.y += floor(rand_range(-movement_speed, movement_speed)) * delta
	
	if ( position.x > get_viewport_rect().size.x ):
		position.x = 0
	elif (position.x < 0 ):
		position.x = get_viewport().size.x - 1;
		
	if ( position.y > get_viewport_rect().size.y ):
		position.y = 0
	elif ( position.y < 0 ):
		position.y = get_viewport_rect().size.y - 1

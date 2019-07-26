extends Node2D

var target

# Called when the node enters the scene tree for the first time.
func _ready():
	print("instanced")
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (target):
		var direction = Vector2(target.position.x - position.x, target.position.y - position.y)
		position.x += direction.normalized().x
		position.y += direction.normalized().y

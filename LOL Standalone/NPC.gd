extends Node2D

enum {
	IDLE,
	NEW_DIRECTION,
	MOVE
}

const SPEED = 100;
var state = MOVE;
var direction = Vector2.RIGHT;


func _process(delta):
	match state:
		IDLE:
			pass
		NEW_DIRECTION:
			pass
		MOVE:
			move(delta);
			
func move(delta):
	position += direction * SPEED * delta;

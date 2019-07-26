extends Node2D



func _ready():
	pass

func _input(event):
	if event.is_action("right_mouse") and not event.is_action_released("right_mouse"):
		print("right clicked")
		Events.emit_signal("player_wants_move", get_viewport().get_mouse_position() )
		
	if event.is_action("left_mouse") and not event.is_action_released("left_mouse"):
		print("left clicked")
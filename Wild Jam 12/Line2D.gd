extends Line2D

# Declare member variables here. Examples:
var player_position_informed
var destination_position_informed
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	Events.connect("draw_player_line", self, "player_inform_line")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	clear_points()
	if player_position_informed:
		add_point(player_position_informed)
	if destination_position_informed:
		add_point(destination_position_informed)


func player_inform_line(player_position, destination_position):
	player_position_informed = player_position
	destination_position_informed = destination_position

extends Line2D

# Declare member variables here. Examples:
var chained = []
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	Events.connect("add_chain_line", self, "add_to_chained")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	clear_points()
	for i in range(chained.size()):
		add_point(chained[i])


func add_to_chained(position):
	chained.append(position)

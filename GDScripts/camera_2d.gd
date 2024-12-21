extends Camera2D
class_name MainCamera

var player : Node2D

func _ready() -> void:
	# Get a reference to the player
	player = get_tree().get_first_node_in_group("player")
	if player == null:
		printerr("PLAYER CANNOT BE FOUND! CREATING A NEW REPLACEMENT NODE...")
		player = Node2D.new()
		get_tree().get_root().add_child(player)
	
func _process(delta: float) -> void:
	global_position = player.global_position

extends Node2D
class_name Weapon

@onready var movement_fsm: MovementFSM = $"../../MovementFSM"
@export var projectile : PackedScene

func _ready() -> void:
	if projectile == null:
		printerr("THE PROJECTILE CANNOT BE NULL!")

func _shoot() -> void:
	var new_projectile = projectile.instantiate()
	new_projectile.global_position = global_position
	match movement_fsm.last_orientation:
		movement_fsm.PLAYER_ORIENTATION.UP:
			new_projectile.rotation_degrees = -90
		movement_fsm.PLAYER_ORIENTATION.DOWN:
			new_projectile.rotation_degrees = 90
		movement_fsm.PLAYER_ORIENTATION.LEFT:
			new_projectile.rotation_degrees = 180
		movement_fsm.PLAYER_ORIENTATION.RIGHT:
			new_projectile.rotation_degrees = 0
	get_tree().root.add_child(new_projectile)
	
func _input(event: InputEvent) -> void:
	if event is InputEventKey and event.is_action_pressed("Shoot"):
		print_debug("Spawning arrow...")
		_shoot()

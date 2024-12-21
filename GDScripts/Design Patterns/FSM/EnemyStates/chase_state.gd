extends EnemyState
class_name EnemyChase

@onready var navigation_agent_2d: NavigationAgent2D = $"../../NavigationAgent2D"
var target : Node2D = null
@export var speed := 150.0

func Enter() -> void:
	print_debug("Enemy entering chase state...")
	animator.play("Run")
	
func Exit() -> void:
	pass
	
func Physics_Update(delta: float) -> void:
	super(delta)
	var destination = navigation_agent_2d.get_next_path_position()
	var local_destination = destination - body.global_position
	var direction = local_destination.normalized()
	
	body.velocity = direction * speed
	body.move_and_slide()

func Update(delta: float) -> void:
	if target != null:
		navigation_agent_2d.set_target_position(target.global_position)

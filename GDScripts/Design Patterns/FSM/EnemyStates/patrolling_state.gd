extends EnemyState
class_name EnemyPatrol

@export var speed := 100
@onready var navigation_agent_2d: NavigationAgent2D = $"../../NavigationAgent2D"
@export var patrolling_range := 200.0
var target_point := Vector2.ZERO

const MAX_ITERATIONS := 1000
var iteration := 0

func Enter() -> void:
	print_debug("Enemy entering patrolling state...")
	iteration = 0
	choose_patrolling_point()
	await navigation_agent_2d.target_reached
	state_transition.emit(self, "Idle")
	
func Physics_Update(delta: float) -> void:
	super(delta)
	var destination = navigation_agent_2d.get_next_path_position()
	var local_destination = destination - body.global_position
	var direction = local_destination.normalized()
	
	body.velocity = direction * speed
	body.move_and_slide()
	
func choose_patrolling_point() -> void:
	iteration += 1
	# Generate two random angles for the points
	var angle1 = randf() * TAU

	# Convert polar coordinates to Cartesian coordinates
	target_point = initial_position + Vector2(
		cos(angle1) * patrolling_range,
		sin(angle1) * patrolling_range
	)
	while iteration < MAX_ITERATIONS and navigation_agent_2d.is_target_reachable() == false:
		choose_patrolling_point()
	print_debug("Destination set at %s" % target_point)
	navigation_agent_2d.set_target_position(target_point)
	animator.play("Run")

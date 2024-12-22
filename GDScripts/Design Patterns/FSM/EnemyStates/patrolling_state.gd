extends EnemyState
class_name EnemyPatrol

@export var speed := 100
@onready var navigation_agent_2d: NavigationAgent2D = $"../../NavigationAgent2D"
@export var patrolling_range := 200.0
var target_point := Vector2.ZERO

func _ready() -> void:
	super()
	Events.start_chasing_player.connect(_go_to_chase_state)
	Events.projectile_hit.connect(_go_to_hit_state)
	Events.enemy_died.connect(_go_to_dead_state)
	Events.enemy_attacking.connect(_go_to_attack_state)

func Enter() -> void:
	#print_debug("Enemy entering patrolling state...")
	choose_patrolling_point()
	e_fsm.enemy_brain.walking.emit()
	await navigation_agent_2d.target_reached
	state_transition.emit(self, "Idle")
	
func Physics_Update(delta: float) -> void:
	super(delta)
	var destination = navigation_agent_2d.get_next_path_position()
	var distance_to_destination = body.global_position.distance_to(destination)
	
	if distance_to_destination < 5.0:  # Threshold to prevent jitter
		state_transition.emit(self, "Idle")
		return
	
	var local_destination = destination - body.global_position
	var direction = local_destination.normalized()
	
	animator.flip_h = direction.x < 0
	body.velocity = direction * speed
	body.move_and_slide()
	
func choose_patrolling_point() -> void:
	# Generate two random angles for the points
	var angle1 = randf() * TAU

	# Convert polar coordinates to Cartesian coordinates
	target_point = initial_position + Vector2(
		cos(angle1) * patrolling_range,
		sin(angle1) * patrolling_range
	)
	print_debug("Destination set at %s" % target_point)
	navigation_agent_2d.set_target_position(target_point)
	animator.play("Run")

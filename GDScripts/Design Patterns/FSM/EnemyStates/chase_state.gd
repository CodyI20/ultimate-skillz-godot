extends EnemyState
class_name EnemyChase

@onready var navigation_agent_2d: NavigationAgent2D = $"../../NavigationAgent2D"
var target : Node2D = null
@export var speed := 150.0
var close_enough := false

func _ready() -> void:
	super()
	Events.enemy_died.connect(_go_to_dead_state)
	Events.projectile_hit.connect(_go_to_hit_state)
	Events.enemy_attacking.connect(_go_to_attack_state)

func Enter() -> void:
	if close_enough == false:
		animator.play("Run")
	else:
		animator.play("Idle")
	
func Physics_Update(delta: float) -> void:
	super(delta)
	if close_enough == true:
		if body.global_position.distance_to(target.global_position) >= navigation_agent_2d.target_desired_distance:
			close_enough = false
			animator.play("Run")
		else:
			animator.play("Idle")
			return
	if target != null:
		navigation_agent_2d.set_target_position(target.global_position)
	var destination = navigation_agent_2d.get_next_path_position()
	var local_destination = destination - body.global_position
	var direction = local_destination.normalized()
	if direction.x < 0:
		animator.flip_h = true
	else:
		animator.flip_h = false
	
	body.velocity = direction * speed
	body.move_and_slide()


func _on_navigation_agent_2d_target_reached() -> void:
	if e_fsm.current_state != self:
		return
	close_enough = true
	animator.play("Idle")
	print_debug("REACHED")

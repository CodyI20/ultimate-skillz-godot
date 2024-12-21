extends EnemyState
class_name EnemyHit

func Enter() -> void:
	print_debug("Enemy entering hit state...")
	animator.play("Hit")
	await animator.animation_finished
	state_transition.emit(self, chase.name)
	

func _ready() -> void:
	super()
	Events.start_chasing_player.connect(_go_to_chase_state)
	Events.enemy_died.connect(_go_to_dead_state)
	Events.projectile_hit.connect(set_chase_variables)
	Events.enemy_attacking.connect(_go_to_attack_state)

func set_chase_variables(enemy_area : Area2D, damage: int, source:Node2D) -> void:
	if enemy_area != e_fsm.inner_area:
		return
	chase.target = source

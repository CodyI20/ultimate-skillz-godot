extends EnemyState
class_name EnemyAttack

func Enter() -> void:
	animator.play("Attack")
	await animator.animation_finished
	Events.enemy_attack_damage_dealer.emit(e_fsm.enemy_brain)
	state_transition.emit(self, chase.name)

func _ready() -> void:
	super()
	Events.projectile_hit.connect(_go_to_hit_state)
	Events.enemy_died.connect(_go_to_dead_state)

extends MovementFSM
class_name EnemyFSM

@onready var stats: Enemy = $"../Stats"
@onready var area_2d: Area2D = $"../InnerArea"

func _ready() -> void:
	super()
	Events.enemy_died.connect(_go_to_dead_state)
	Events.projectile_hit.connect(_go_to_hit_state)
	Events.start_chasing_player.connect(_go_to_chase_state)
	
func _go_to_chase_state(fsm: MovementFSM, target: Node2D) -> void:
	if fsm != self:
		return
	var new_state = EnemyChase
	new_state.target = target
	on_child_transition(current_state, new_state.name)
	
func _go_to_dead_state(enemy: Enemy) -> void:
	if enemy != stats:
		return
	on_child_transition(current_state, "Dead")
		
func _go_to_hit_state(enemy: Area2D, damage: int) -> void:
	if enemy != area_2d:
		return
	on_child_transition(current_state, "Hit")

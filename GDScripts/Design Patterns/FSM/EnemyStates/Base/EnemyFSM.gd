extends MovementFSM
class_name EnemyFSM

@onready var stats: Enemy = $"../Stats"
@onready var area_2d: Area2D = $"../Area2D"

func _ready() -> void:
	super()
	Events.enemy_died.connect(_go_to_dead_state)
	Events.projectile_hit.connect(_go_to_hit_state)
	
func _go_to_dead_state(enemy: Enemy) -> void:
	if enemy != stats:
		return
	on_child_transition(current_state, "Dead")
		
func _go_to_hit_state(enemy: Area2D, damage: int) -> void:
	if enemy != area_2d:
		return
	on_child_transition(current_state, "Hit")

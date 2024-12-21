extends MovementState
class_name EnemyState

@onready var e_fsm: EnemyFSM = $"../../FSM"
@onready var area_2d: Area2D = $"../../InnerArea"
var initial_position : Vector2

@onready var idle: EnemyIdle = $"../Idle"
@onready var patrolling: EnemyPatrol = $"../Patrolling"
@onready var chase: EnemyChase = $"../Chase"
@onready var hit: EnemyHit = $"../Hit"
@onready var attacking: EnemyAttack = $"../Attacking"
@onready var dead: EnemyDead = $"../Dead"


func _ready() -> void:
	initial_position = body.global_position
	#print_debug("Setting the initial position to %s" % initial_position)
	
func _go_to_attack_state(input_enemy_brain : EnemyBrain) -> void:
	if e_fsm.enemy_brain != input_enemy_brain:
		return
	state_transition.emit(self, attacking.name)
	
func _go_to_hit_state(area: Area2D, damage: int, source : Node2D) -> void:
	if area != e_fsm.inner_area:
		print_debug("NOT THE SAME AREA.............")
		return
	state_transition.emit(self, hit.name)

func _go_to_dead_state(enemy: Enemy) -> void:
	if enemy != e_fsm.enemy:
		return
	state_transition.emit(self, dead.name)

func _go_to_chase_state(enemy_body : CharacterBody2D, chase_target_body : Node2D) -> void:
	if enemy_body != body:
		#print_debug("BODY NOT THE SAME")
		return
	chase.target = chase_target_body
	state_transition.emit(self, chase.name)

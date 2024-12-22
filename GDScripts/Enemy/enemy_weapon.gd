extends Node2D
class_name EnemyWeapon

@onready var enemy: EnemyBrain = $".."
@onready var attack_range: CollisionShape2D = $"../AttackArea/Range"

@export var damage := 20.0
@export var attack_cooldown := 3.0
var can_try_attack := true
var attacking := false

signal attack

func _ready() -> void:
	Events.enemy_attack_damage_dealer.connect(deal_damage)
	
func deal_damage(enemy_brain : EnemyBrain) -> void:
	if enemy != enemy_brain:
		return
	if attacking:
		enemy.current_aggro_target._take_damage(damage)

func _process(delta: float) -> void:
	try_attack()
	
func try_attack() -> void:
	if not can_try_attack or not attacking:
		return
	can_try_attack = false
	attack.emit()
	get_tree().create_timer(attack_cooldown).timeout.connect(enable_attack_after_cd)
	Events.enemy_attacking.emit(enemy)
	
func enable_attack_after_cd() -> void:
	can_try_attack = true


func _on_attack_area_area_entered(area: Area2D) -> void:
	if area.is_in_group("player"):
		attacking = true


func _on_attack_area_area_exited(area: Area2D) -> void:
	if area.is_in_group("player"):
		attacking = false
		

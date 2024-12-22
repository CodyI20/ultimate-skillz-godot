extends Node2D
class_name Weapon

enum WEAPON_TYPE {Ranged, Melee}

@export var weapon_type : WEAPON_TYPE

@onready var animator: AnimatedSprite2D = $"../../AnimatedSprite2D"
@onready var fsm: PlayerFSM = $"../../FSM"

@export var melee_damage := 45.0
var enemies_in_range: Array[Enemy]

# Make it so that it's visible only when the weapon type is set to Ranged
@export var projectile : PackedScene

func _ready() -> void:
	if weapon_type == WEAPON_TYPE.Ranged and projectile == null:
		printerr("THE PROJECTILE CANNOT BE NULL!")
	Events.player_melee_anim_finished.connect(deal_damage_to_enemies)
	
func deal_damage_to_enemies() -> void:
	for enemy in enemies_in_range:
		enemy._take_damage(melee_damage)
	
func _attack() -> void:
	if weapon_type == WEAPON_TYPE.Ranged:
		Events.player_shooting.emit(projectile, self)
		Events.player_range_attack.emit()
	elif weapon_type == WEAPON_TYPE.Melee:
		Events.player_melee.emit()
	
func _input(event: InputEvent) -> void:
	if event is InputEventKey and event.is_action_pressed("Attack"):
		_attack()


func _on_melee_area_area_entered(area: Area2D) -> void:
	if area.is_in_group("enemy"):
		enemies_in_range.append(area.get_parent().find_child("Stats") as Enemy)


func _on_melee_area_area_exited(area: Area2D) -> void:
	if area.is_in_group("enemy"):
		enemies_in_range.remove_at(enemies_in_range.find(area.get_parent().find_child("Stats") as Enemy))

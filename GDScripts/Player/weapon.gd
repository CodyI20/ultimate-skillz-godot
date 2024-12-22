extends Node2D
class_name Weapon

enum WEAPON_TYPE {Ranged, Melee}

@export var weapon_type : WEAPON_TYPE

@onready var animator: AnimatedSprite2D = $"../../AnimatedSprite2D"
@onready var fsm: PlayerFSM = $"../../FSM"

# Make it so that it's visible only when the weapon type is set to Ranged
@export var projectile : PackedScene

func _ready() -> void:
	if weapon_type == WEAPON_TYPE.Ranged and projectile == null:
		printerr("THE PROJECTILE CANNOT BE NULL!")
	
func _attack() -> void:
	if weapon_type == WEAPON_TYPE.Ranged:
		Events.player_shooting.emit(projectile, self)
		Events.player_range_attack.emit()
	
func _input(event: InputEvent) -> void:
	if event is InputEventKey and event.is_action_pressed("Attack"):
		_attack()

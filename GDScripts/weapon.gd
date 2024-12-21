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

func _shoot() -> void:
	animator.play("Shoot")
	await animator.animation_finished
	# LOGIC FOR SHOOTING
	var new_projectile = projectile.instantiate() as Projectile
	new_projectile.global_position = global_position
	new_projectile.projectile_source = self
	match fsm.last_orientation:
		#fsm.PLAYER_ORIENTATION.UP:
			#new_projectile.rotation_degrees = -90
		#fsm.PLAYER_ORIENTATION.DOWN:
			#new_projectile.rotation_degrees = 90
		fsm.ORIENTATION.LEFT:
			new_projectile.rotation_degrees = 180
		fsm.ORIENTATION.RIGHT:
			new_projectile.rotation_degrees = 0
	get_tree().root.add_child(new_projectile)
	
func _attack() -> void:
	if weapon_type == WEAPON_TYPE.Ranged:
		_shoot()
	
func _input(event: InputEvent) -> void:
	if event is InputEventKey and event.is_action_pressed("Attack"):
		_attack()

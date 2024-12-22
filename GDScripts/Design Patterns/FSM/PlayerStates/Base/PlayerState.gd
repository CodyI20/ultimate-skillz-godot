extends MovementState
class_name PlayerState

@onready var player_fsm: PlayerFSM = $".."

func _ready() -> void:
	Events.player_shooting.connect(go_to_shooting_state)

func go_to_shooting_state(projectile : PackedScene, source: Node2D) -> void:
	player_fsm.shooting.projectile = projectile
	player_fsm.shooting.source = source
	state_transition.emit(self, player_fsm.shooting.name)

func StateInput(event: InputEvent) -> void:
	StateSwitchLogic()

func StateSwitchLogic() -> void:
	super()
	if Input.is_action_just_pressed("Roll"):
		state_transition.emit(self, "Roll")
		
func check_for_player_attack():
	if Input.is_action_just_pressed("Attack"):
		if player_fsm.weapon.weapon_type == player_fsm.weapon.WEAPON_TYPE.Ranged:
			state_transition.emit(self, "Shooting")
		else:
			state_transition.emit(self, "Melee")
func check_for_player_movement():
	if Input.is_action_just_pressed("Right") or Input.is_action_just_pressed("Left") or Input.is_action_just_pressed("Down") or Input.is_action_just_pressed("Up"):
		state_transition.emit(self, "Walking")
	if Input.is_action_just_released("Down") or Input.is_action_just_released("Up") or Input.is_action_just_released("Left") or Input.is_action_just_released("Right"):
		state_transition.emit(self, "Walking")
func check_for_lack_of_player_movement():
	if Input.is_action_pressed("Left") and Input.is_action_pressed("Right") or Input.is_action_pressed("Up") and Input.is_action_pressed("Down"):
		state_transition.emit(self, "Idle")
	if !Input.is_action_pressed("Left") and !Input.is_action_pressed("Right") and !Input.is_action_pressed("Up") and !Input.is_action_pressed("Down"):
		state_transition.emit(self, "Idle")

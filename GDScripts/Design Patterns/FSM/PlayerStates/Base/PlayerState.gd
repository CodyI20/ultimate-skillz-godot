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

extends MovementFSM
class_name PlayerFSM

@onready var stats: Player = $"../Stats"
@onready var idle: PlayerIdle = $Idle
@onready var walking: PlayerWalk = $Walking
@onready var shooting: PlayerShoot = $Shooting
@onready var dead: PlayerDead = $Dead


func _ready() -> void:
	super()
	Events.player_died.connect(_go_to_dead_state)

func _go_to_dead_state() -> void:
	if current_state != dead:
		on_child_transition(current_state, dead.name)
		

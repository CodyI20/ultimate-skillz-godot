extends CharacterBody2D
class_name EnemyBrain

var current_aggro_target : Player

@onready var navigation_agent_2d: NavigationAgent2D = $NavigationAgent2D
@onready var range: CollisionShape2D = $AttackArea/Range

signal walking
signal walking_stopped
signal aggro

var aggroed := false

func _on_detection_area_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		set_aggro_true()
		current_aggro_target = body.find_child("Stats") as Player
		Events.start_chasing_player.emit(self, body)

func _ready() -> void:
	# Reset aggro state
	aggroed = false
	# Set the nav_agent stop distance to range
	navigation_agent_2d.target_desired_distance = range.shape.radius
	
func set_aggro_true() -> void:
	if not aggroed:
		aggro.emit()
		aggroed = true

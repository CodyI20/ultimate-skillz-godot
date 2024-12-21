extends CharacterBody2D
class_name EnemyBrain

var current_aggro_target : Player

@onready var navigation_agent_2d: NavigationAgent2D = $NavigationAgent2D
@onready var range: CollisionShape2D = $AttackArea/Range


func _on_detection_area_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		current_aggro_target = body.get_parent().find_child("Stats") as Player
		Events.start_chasing_player.emit(self, body)

func _ready() -> void:
	# Set the nav_agent stop distance to range
	navigation_agent_2d.target_desired_distance = range.shape.radius * 2

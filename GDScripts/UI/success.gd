extends Label
class_name GameComplete

@onready var animation_player: AnimationPlayer = $"../AnimationPlayer"
var succesful := false

func _ready() -> void:
	Events.finished_demo.connect(success)
	Events.game_over.connect(failure)
	
func failure() -> void:
	succesful = false
	go_to_highscore_after_animation()
	
func success() -> void:
	succesful = true
	go_to_highscore_after_animation()

func go_to_highscore_after_animation() -> void:
	if succesful:
		animation_player.play("EndGameSuccessAnimation")
	else:
		animation_player.play("EndGameFailureAnimation")
	await animation_player.animation_finished
	Utility.go_to_high_score_scene() 

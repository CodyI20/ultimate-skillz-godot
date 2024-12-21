extends PlayerState
class_name PlayerDead

func Enter() -> void:
	animator.play("Death")
	await get_tree().create_timer(2.0).timeout
	#body.get_tree().reload_current_scene()
	
func Exit() -> void:
	pass
	
func Update(delta: float) -> void:
	pass
	
func Physics_Update(delta: float) -> void:
	pass
	
func StateInput(event: InputEvent) -> void:
	pass

func StateSwitchLogic() -> void:
	pass

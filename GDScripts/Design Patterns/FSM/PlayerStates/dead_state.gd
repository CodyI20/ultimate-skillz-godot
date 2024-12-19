extends PlayerState
class_name PlayerDead

func Enter() -> void:
	animator.play("Death")
	
func Exit() -> void:
	pass

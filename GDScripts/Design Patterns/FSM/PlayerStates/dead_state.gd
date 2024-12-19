extends PlayerState
class_name PlayerDead

func Enter() -> void:
	animator.play("Death")
	print_debug("Entering dead state...")
	
func Exit() -> void:
	print_debug("Exiting dead state...")

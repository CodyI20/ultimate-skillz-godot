extends Node
class_name GameManager

var NoResume := false
var NoPause := false

func _ready() -> void:
	Events.options_menu_toggle.connect(handle_options_menu_toggle)

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("Esc"):
		if NoResume:
			NoResume = false
			return
		if NoPause:
			NoPause = false
			return
		Utility.pause_game(!get_tree().paused)
		
func handle_options_menu_toggle(is_on: bool) -> void:
	if is_on:
		no_resume()
	
func no_resume() -> void:
	NoResume = true
	
func no_pause() -> void:
	NoPause = true

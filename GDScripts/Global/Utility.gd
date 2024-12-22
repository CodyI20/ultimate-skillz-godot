extends Node

# SETTINGS - INPUT ACTIONS TO REMAP
var input_actions = {
	"Left" : "Move Left",
	"Right" : "Move Right",
	"Up" : "Move Up",
	"Down" : "Move Down",
	"Attack" : "Attack",
	"Roll" : "Roll"
}

# SCENE SWAPPING LOGIC
func go_to_main_menu() -> void:
	reload_scene()
	get_tree().call_deferred("change_scene_to_file", "res://Scenes/Menus/main_menu.tscn")
	
## This function handles both the pausing/resuming of the game and the event firing (emitting signals)
## CALL THIS FUNCTION WHENEVER YOU WANT TO PAUSE/RESUME THE GAME
func pause_game(shouldPause := false):
	print_debug("Pausing game... ", shouldPause)
	get_tree().paused = shouldPause;
	Events.toggle_game_state.emit(shouldPause)

func toggle_options_menu(is_active : bool) -> void:
	Events.options_menu_toggle.emit(is_active)

func reload_scene() -> void:
	get_tree().paused = false
	get_tree().reload_current_scene()

func retry_level() -> void:
	get_tree().call_deferred("change_scene_to_file", "res://Scenes/MainScene/game.tscn")

func go_to_high_score_scene() -> void:
	get_tree().call_deferred("change_scene_to_file", "res://Scenes/Menus/highscore.tscn")

func go_to_game_scene() -> void:
	get_tree().call_deferred("change_scene_to_file", "res://Scenes/MainScene/game.tscn")

func quit_game() -> void:
	get_tree().quit()

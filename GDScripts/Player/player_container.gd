extends Node2D
class_name PlayerContainer

const ARCHER_CLASS = preload("res://Scenes/Player/archer_class.tscn")
const NIGHTBORNE = preload("res://Scenes/Player/nightborne.tscn")

func _ready() -> void:
	var player_class
	if Utility.selected_player_class == Utility.PLAYER_CLASS.ARCHER:
		player_class = ARCHER_CLASS.instantiate()
	elif Utility.selected_player_class == Utility.PLAYER_CLASS.NIGHTBORNE:
		player_class = NIGHTBORNE.instantiate()
	
	add_child(player_class)

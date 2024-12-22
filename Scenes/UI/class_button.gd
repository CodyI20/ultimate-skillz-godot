extends Button
class_name ClassChoiceButton

@onready var class_name_label: Label = $MarginContainer/VBoxContainer/ClassName
@onready var class_icon: TextureRect = $MarginContainer/VBoxContainer/ClassIcon

@export var name_of_the_class : Utility.PLAYER_CLASS
@export var icon_of_the_class : Texture2D


func _ready() -> void:
	class_name_label.text = Utility.enum_to_string(Utility.PLAYER_CLASS, name_of_the_class)
	if icon_of_the_class != null:
		class_icon.texture = icon_of_the_class


func _on_pressed() -> void:
	Utility.go_to_game_scene(name_of_the_class)
	Events.class_selected.emit(name_of_the_class)


func _on_mouse_entered() -> void:
	scale = Vector2(1.2,1.2)

func _on_mouse_exited() -> void:
	scale = Vector2(1,1)

extends Control

@onready var v_box_container: VBoxContainer = $Panel/MarginContainer/VBoxContainer

func _ready() -> void:
	for action in Utility.input_actions:
		var new_label = RichTextLabel.new()
		new_label.bbcode_enabled = true
		new_label.fit_content = true
		new_label.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
		new_label.text = "[center][font_size=20]Press [color=RED]%s[/color] to [color=AQUA]%s" % [OS.get_keycode_string(InputMap.action_get_events(action)[0].physical_keycode), Utility.input_actions[action]]
		v_box_container.add_child(new_label)

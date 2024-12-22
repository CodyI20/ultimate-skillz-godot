extends Button

@onready var panel: Panel = $"../Panel"


func _ready() -> void:
	if panel == null:
		printerr("Label not set!")
	pressed.connect(toggle_label)
	set_button_text()
	
func toggle_label() -> void:
	panel.visible = !panel.visible
	set_button_text() 

func set_button_text() -> void:
	if panel.visible:
		text = "HIDE"
	else:
		text = "SHOW"

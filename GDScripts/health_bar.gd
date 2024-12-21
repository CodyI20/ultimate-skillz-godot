extends TextureProgressBar
class_name HealthBar

@onready var progress_bar: ProgressBar = $ProgressBar
@export var attached_stats_component : EntityStats

func _ready() -> void:
	if attached_stats_component == null:
		printerr("NO STATS COMPONENT ASSIGNED!!!")
	attached_stats_component.stats.health_changed.connect(update_health_bar)
	update_health_bar()
	
func update_health_bar() -> void:
	value = attached_stats_component.stats.health * 100 / attached_stats_component.stats.max_health
	progress_bar.value = value

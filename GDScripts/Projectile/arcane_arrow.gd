extends Projectile
class_name ArcaneArrow

func _ready() -> void:
	super()
	Events.arrow_released.emit()

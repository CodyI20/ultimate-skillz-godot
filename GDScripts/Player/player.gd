extends EntityStats
class_name Player

func _ready() -> void:
	if stats == null:
		printerr("PLAYER STATS ARE NOT SET!")

func _input(event: InputEvent) -> void:
	if event is InputEventKey and event.is_action_pressed("SelfDamage"):
		_take_damage(stats.self_damage)

func _take_damage(damage: int) -> void:
	stats.health -= damage
	Events.player_took_damage.emit(damage)
	stats.health_changed.emit()
	print_debug("You have taken damage. New health : %s" % stats.health)
	if stats.health <= 0:
		_die()
	
func _die() -> void:
	stats.health = 0
	print_debug("You have died...")
	Events.player_died.emit()

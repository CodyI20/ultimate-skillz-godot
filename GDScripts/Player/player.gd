extends EntityStats
class_name Player

var is_dead := false

func _ready() -> void:
	is_dead = false
	if stats == null:
		printerr("PLAYER STATS ARE NOT SET!")

func _input(event: InputEvent) -> void:
	if event is InputEventKey and event.is_action_pressed("SelfDamage"):
		_take_damage(stats.self_damage)

func _take_damage(damage: int) -> void:
	stats.health -= damage
	hit.emit()
	Events.player_took_damage.emit(damage)
	stats.health_changed.emit()
	print_debug("You have taken damage. New health : %s" % stats.health)
	if stats.health <= 0 and not is_dead:
		_die()
	
func _die() -> void:
	is_dead = true
	stats.health = 0
	dead.emit()
	print_debug("You have died...")
	Events.player_died.emit()
	Events.game_over.emit()

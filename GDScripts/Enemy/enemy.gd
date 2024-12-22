extends EntityStats
class_name Enemy

@onready var area_2d: Area2D = $"../InnerArea"

var is_dead := false

func _ready() -> void:
	is_dead = false
	if stats == null:
		printerr("ENEMY STATS ARE MISSING ON %s" % self.name)
	Events.enemy_spawn.emit(self)
	Events.projectile_hit.connect(handle_projectile_hit)
	
func handle_projectile_hit(area : Area2D, damage: int, source: Node2D) -> void:
	if area == area_2d:
		_take_damage(damage)

func _take_damage(damage: int) -> void:
	hit.emit()
	stats.health -= damage
	stats.health_changed.emit()
	print_debug("The enemy has taken damage. New health : %s" % stats.health)
	if stats.health < 0 and not is_dead:
		_die()
	
func _die() -> void:
	dead.emit()
	is_dead = true
	stats.health = 0
	area_2d.queue_free()
	Events.enemy_died.emit(self)
	print_debug("The enemy %s has died..." % self.name)

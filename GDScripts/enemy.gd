extends Node2D
class_name Enemy

@export var stats : EnemyStats

func _ready() -> void:
	if stats == null:
		printerr("ENEMY STATS ARE MISSING ON %s" % self.name)

func _take_damage(damage: int) -> void:
	stats.health -= damage
	print_debug("The enemy has taken damage. New health : %s" % stats.health)
	if stats.health < 0:
		_die()
	
func _die() -> void:
	stats.health = 0
	print_debug("The enemy %s has died..." % self.name)

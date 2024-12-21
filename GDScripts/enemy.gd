extends Node2D
class_name Enemy

@export var stats : EnemyStats
@onready var area_2d: Area2D = $"../InnerArea"


func _ready() -> void:
	if stats == null:
		printerr("ENEMY STATS ARE MISSING ON %s" % self.name)
	Events.projectile_hit.connect(handle_projectile_hit)
	
func handle_projectile_hit(area : Area2D, damage: int, source: Node2D) -> void:
	if area == area_2d:
		_take_damage(damage)

func _take_damage(damage: int) -> void:
	stats.health -= damage
	print_debug("The enemy has taken damage. New health : %s" % stats.health)
	if stats.health < 0:
		_die()
	
func _die() -> void:
	stats.health = 0
	Events.enemy_died.emit(self)
	print_debug("The enemy %s has died..." % self.name)

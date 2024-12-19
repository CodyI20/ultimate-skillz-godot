extends Node2D
class_name EnemyStats

@export var health := 100

func _ready() -> void:
	Events.projectile_hit.connect(take_damage)

func take_damage(damage: int) -> void:
	health -= damage
	if health < 0:
		die()

func die() -> void:
	health = 0
	print_debug("Enemy %s has died..." % self.name)
	queue_free()

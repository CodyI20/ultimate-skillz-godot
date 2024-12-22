extends EnemyState
class_name EnemyDead

func Enter() -> void:
	#print_debug("Enemy entering death state...")
	animator.play("Death")
	await get_tree().create_timer(4.0).timeout
	Events.enemy_queue_freed.emit()
	body.queue_free()

extends EnemyState
class_name EnemyDead

func Enter() -> void:
	#print_debug("Enemy entering death state...")
	animator.play("Death")
	await get_tree().create_timer(2.0).timeout
	body.queue_free()
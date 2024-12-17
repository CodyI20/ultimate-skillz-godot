extends RigidBody2D
class_name Projectile

@export var speed := 500.0  # Speed of the projectile
@export var time_until_despawn := 3 # The time it takes for the arrow to disappear

func _ready() -> void:
	# Set the initial velocity when the projectile is created
	linear_velocity = transform.x * speed  # Move in the local x-axis direction
	await get_tree().create_timer(time_until_despawn).timeout
	queue_free()

func _on_body_entered(body: Node) -> void:
	# Handle collision logic, for example, removing the projectile
	if body.is_in_group("enemy"):
		body.queue_free()  # Destroy the enemy
		queue_free()  # Destroy the projectile

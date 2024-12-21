extends RigidBody2D
class_name Projectile

@export var speed := 500.0  # Speed of the projectile
@export var time_until_despawn := 3 # The time it takes for the arrow to disappear
@export var projectile_damage := 40

var projectile_source : Node2D

func _ready() -> void:
	# Set the initial velocity when the projectile is created
	linear_velocity = transform.x * speed  # Move in the local x-axis direction
	await get_tree().create_timer(time_until_despawn).timeout
	queue_free()


func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("enemy"):
		#print_debug("Projectile hit an enemy...")
		Events.projectile_hit.emit(area, projectile_damage, projectile_source)
		queue_free()


func _on_area_2d_body_entered(body: Node2D) -> void:
	set_deferred("freeze", true)

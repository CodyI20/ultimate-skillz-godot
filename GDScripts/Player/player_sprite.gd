extends AnimatedSprite2D
class_name PlayerSprite

func _ready() -> void:
	Events.player_took_damage.connect(flash_character)
	
func flash_character(damage: int) -> void:
	var wait_times = [0.15, 0.1]
		
	for wait_time in wait_times:
		material.set_shader_parameter('flash', true)
		await get_tree().create_timer(wait_time).timeout
		material.set_shader_parameter('flash', false)
		await get_tree().create_timer(wait_time/2).timeout

extends PlayerSprite

func _ready() -> void:
	Events.player_took_damage.connect(play_hit_animation)
	
func play_hit_animation() -> void:
	play("Hurt")

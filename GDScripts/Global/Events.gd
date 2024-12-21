extends Node

signal projectile_hit(area: Node2D, damage: int, source: Node2D)
signal shooting()
signal player_died()


signal enemy_died()
signal start_chasing_player(enemy: CharacterBody2D, target: Node2D)

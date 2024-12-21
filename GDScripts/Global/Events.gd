extends Node

signal projectile_hit(area: Node2D, damage: int)
signal shooting()
signal player_died()


signal enemy_died()
signal start_chasing_player(enemy: EnemyFSM, target: Node2D)

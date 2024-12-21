extends Node

signal projectile_hit(area: Area2D, damage: int, source: Node2D)
signal shooting()
signal player_died()


signal enemy_died()
signal enemy_attack_damage_dealer(enemy_brain : EnemyBrain)
signal enemy_attacking(enemy_brain : EnemyBrain)
signal start_chasing_player(enemy: CharacterBody2D, target: Node2D)

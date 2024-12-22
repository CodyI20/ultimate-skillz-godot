extends Node

signal projectile_hit(area: Area2D, damage: int, source: Node2D)
signal shooting()
signal player_died()
signal player_took_damage(damage: int)
signal player_shooting(projectile : PackedScene, source: Node2D)


signal enemy_died(enemy: Enemy)
signal enemy_spawn(enemy: Enemy)
signal enemy_attack_damage_dealer(enemy_brain : EnemyBrain)
signal enemy_attacking(enemy_brain : EnemyBrain)
signal start_chasing_player(enemy: CharacterBody2D, target: Node2D)

# OPTIONS MENU FEEDBACK
signal sfx_slider_value_set()

# SCENE
signal toggle_game_state(is_paused : bool)
signal options_menu_toggle(is_on: bool)
signal finished_demo()
signal game_over()

# DATA
signal set_highscore(score: int)

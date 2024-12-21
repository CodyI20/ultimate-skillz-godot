extends MovementFSM
class_name EnemyFSM

@onready var enemy: Enemy = $"../Stats"
@onready var area_2d: Area2D = $"../InnerArea"
@onready var enemy_brain: EnemyBrain = $".."

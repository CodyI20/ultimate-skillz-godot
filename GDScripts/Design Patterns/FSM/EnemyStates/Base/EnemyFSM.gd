extends MovementFSM
class_name EnemyFSM

@onready var enemy: Enemy = $"../Stats"
@onready var inner_area: Area2D = $"../InnerArea"
@onready var enemy_brain: EnemyBrain = $".."

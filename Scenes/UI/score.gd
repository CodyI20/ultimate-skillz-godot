extends Label
class_name ScoreLabel

var enemies_killed := 0
var total_enemies := 0

func _ready() -> void:
	Events.enemy_spawn.connect(update_max_enemy_number)
	Events.enemy_died.connect(update_score)
	total_enemies = get_tree().get_node_count_in_group("enemy_parent")
	set_score_text()
	
func set_score_text() -> void:
	text = "Kills: %s/%s" % [enemies_killed, total_enemies]

func update_score(enemy: Enemy) -> void:
	enemies_killed += 1
	set_score_text()
	if enemies_killed == total_enemies:
		Events.finished_demo.emit()

func update_max_enemy_number(enemy: Enemy) -> void:
	total_enemies += 1
	set_score_text()

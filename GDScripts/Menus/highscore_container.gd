extends VBoxContainer

@onready var highscore: RichTextLabel = $Highscore
@onready var highscore_2: RichTextLabel = $Highscore2
@onready var highscore_3: RichTextLabel = $Highscore3
@onready var highscore_4: RichTextLabel = $Highscore4
@onready var highscore_5: RichTextLabel = $Highscore5


func _ready() -> void:
	highscore.text = "[b][font_size=25]TOP SCORE 			[font_size=20]%s" % MatchData.high_score_save_data.high_score
	highscore_2.text = "[b] 2nd 			[font_size=20]%s" % MatchData.high_score_save_data.high_score_2
	highscore_3.text = "[b] 3rd 			[font_size=20]%s" % MatchData.high_score_save_data.high_score_3
	highscore_4.text = "[b] 4th 			[font_size=20]%s" % MatchData.high_score_save_data.high_score_4
	highscore_5.text = "[b] 5th 			[font_size=20]%s" % MatchData.high_score_save_data.high_score_5

extends HBoxContainer

onready var levelLabel := $LevelLabel
onready var livesLabel := $LivesLabel
onready var scoreLabel := $ScoreLabel

onready var level_text := "Level: %d"
onready var lives_text := "Lives: %d"
onready var score_text := "Score: %d"

func _ready():
	Master.connect("update_level",self,"update_level")
	Master.connect("update_lives",self,"update_lives")
	Master.connect("update_score",self,"update_score")

	levelLabel.text = level_text % Master.level
	livesLabel.text = lives_text % Master.lives
	scoreLabel.text = score_text % Master.score

func update_level():
	Master.level += 1
	levelLabel.text = level_text % Master.level

func update_lives(add):
	Master.lives += 1 if add else -1
	livesLabel.text = lives_text % Master.lives

func update_score():
	Master.score += 1
	Master.level_score += 1
	scoreLabel.text = score_text % Master.score

extends Node

# Stats.gd signals
signal update_level
signal update_lives
signal update_score

var board_size := Vector2(3, 2)
var level := 1
var lives := 5
var score := 0
var level_score := 0

var cards_picked := 0
var first_card := ""

func reset_stats():
	board_size = Vector2(3, 2)
	level = 1
	lives = 5
	score = 0
	level_score = 0

func get_total_cards() -> float:
	return board_size.x * board_size.y

func add_card(card):
	#check if first or second card of the pair
	if first_card.empty():
		first_card = card
	else:
		if first_card == card:
			emit_signal("update_score")
		first_card = ""
	cards_picked += 1
	
	#if all cards picked
	if cards_picked == get_total_cards():
		next_level()
		
func next_level():
	cards_picked = 0
	get_tree().call_group("Cards","flip",false,false)
	
	yield(get_tree().create_timer(1),"timeout")
	
	emit_signal("update_level")
	if level % 6 == 0:
		emit_signal("update_lives",true)
		board_size += Vector2(1, 1)
	if level_score < get_total_cards()/2:
		emit_signal("update_lives",false)
	level_score = 0
	
	if lives == 0:
		get_tree().change_scene("res://Menu/GameOver.tscn")
	else:
		get_tree().reload_current_scene()

extends Control

onready var stats := $Panel/MarginContainer/VBoxContainer/Stats
onready var board := $Panel/MarginContainer/VBoxContainer/Board

func _ready():
	start_game()

func start_game():
	board.create_board(Master.board_size)
	
	yield(get_tree().create_timer(1),"timeout")
	
	get_tree().call_group("Cards","flip",true,true)
	
	yield(get_tree().create_timer(Master.get_total_cards()/2),"timeout")

	get_tree().call_group("Cards","flip",false,true)
	
	# start game

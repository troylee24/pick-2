extends GridContainer

var card := preload("res://Game/Card.tscn")

const num := ["A", "2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K"]
const letter := ["C", "D", "H", "S"]

func create_board(board_size: Vector2):
	#creating the board size
	columns = int(board_size.x)
	var card_size := rect_size / board_size
	
	#creating the cards
	var cards := get_random_cards(board_size)
	while !cards.empty():
		var new_card := card.instance()
		add_child(new_card)
		var random_card := randi() % cards.size()
		new_card._create(cards[random_card], card_size)
		cards.remove(random_card)

func get_random_cards(board_size: Vector2) -> Array:
	randomize()
	var cards = []
	while cards.size() < (board_size.x * board_size.y)/2:
		var value: String = num[randi() % num.size()]
		var type: String = letter[randi() % letter.size()]
		var new_card := value + type
		if !cards.has(new_card):
			cards.append(new_card)
	# duplicate array
	cards += cards
	return cards

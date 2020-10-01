extends TextureButton

onready var animPlayer := $AnimationPlayer
onready var face_up: Texture = null
onready var face_down := texture_normal

var card_name := ""

func _ready():
	disabled = true

func _create(random_card: String, card_size: Vector2):
	card_name = random_card
	rect_pivot_offset = card_size / 2
	face_up = load("res://Deck/%s.png" % [card_name])
	add_to_group("Cards")

func _on_Card_pressed():
	yield(flip(true, true), "completed")
	Master.add_card(card_name)

# picking - during pair picking stage
func flip(facing_up: bool, picking: bool):
	if facing_up:
		if picking: disabled = true
		animPlayer.play("face_up")
		yield(animPlayer,"animation_finished")
	else:
		animPlayer.play("face_down")
		yield(animPlayer,"animation_finished")
		if picking: disabled = false

# used by AnimationPlayer
func set_card(up: bool):
	texture_normal = face_up if up else face_down

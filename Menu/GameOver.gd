extends ColorRect

func _on_RestartButton_pressed():
	Master.reset_stats()
	get_tree().change_scene("res://Game/Game.tscn")

func _on_QuitButton_pressed():
	get_tree().quit()

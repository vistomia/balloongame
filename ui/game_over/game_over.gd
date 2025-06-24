extends Control

func _ready() -> void:
	$VBoxContainer/score.text = str(Global.score)
	$VBoxContainer/highScore.text = str(Global.high_score)

func _on_yes_button_up() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://levels/level_endless/level_endless.tscn")

func _on_no_button_up() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://ui/menu/menu.tscn")

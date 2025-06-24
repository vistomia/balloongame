extends Node

@export var health := 5
var score := 0

func _on_hitzone_area_entered(area: Area2D) -> void:
	if	area.name != "Cursor":
		Global.hearth -= 1
		check_hearth()
		
func _ready() -> void:
	$Cursor.connect("score", on_score)

func on_score():
	Global.score += 1

func check_hearth() -> void:
	if Global.hearth < 1:
		if Global.score > Global.high_score:
			Global.high_score = Global.score
		get_tree().paused = true
		var game_over = preload("res://ui/game_over/game_over.tscn").instantiate()
		add_child(game_over)

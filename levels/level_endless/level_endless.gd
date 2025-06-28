extends Node2D

func _ready() -> void:
	Global.score = 0
	Global.hearth = 5
	get_tree().paused = false

func _process(delta: float) -> void:
	print(Engine.get_frames_per_second())
	if Input.is_action_just_pressed("esc"):
		get_tree().change_scene_to_file("res://ui/menu/menu.tscn")
	
	$InterfaceLayer/Label.text = str(Global.hearth)

func _on_menu_button_up() -> void:
	get_tree().change_scene_to_file("res://ui/menu/menu.tscn")
	Global.score = 0

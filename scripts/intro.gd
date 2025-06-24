extends Control

func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_HIDDEN
	
	$AnimationPlayer.play("new_animation")
	await get_tree().create_timer(4.3).timeout
	get_tree().change_scene_to_file("res://ui/menu/menu.tscn")

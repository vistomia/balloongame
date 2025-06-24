extends Control



func _on_back_button_up() -> void:
	await click_sound()
	get_tree().change_scene_to_file("res://ui/menu/menu.tscn")

func click_sound():
	$Click.play()
	await $Click.finished

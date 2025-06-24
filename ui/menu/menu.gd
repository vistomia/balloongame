extends Control

func _ready() -> void:
	if OS.get_name() == 'Web':
		$CenterContainer/ButtonsContainer/quit.disabled = true

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("esc"):
		get_tree().quit()

func _on_start_button_up() -> void:
	await click_sound()
	get_tree().change_scene_to_file("res://levels/level_endless/level_endless.tscn")

func _on_options_button_up() -> void:
	await click_sound()
	get_tree().change_scene_to_file("res://ui/options/options.tscn")

func _on_credits_button_up() -> void:
	await click_sound()
	get_tree().change_scene_to_file("res://ui/credits/credits.tscn")
	
func _on_quit_button_up() -> void:
	click_sound()
	get_tree().quit()

func click_sound():
	$Click.play()
	await $Click.finished

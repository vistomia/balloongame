extends Control

func _ready() -> void:
	$VBoxContainer/MusicSlider.value = Audio.volume_linear*100
	$VBoxContainer/EffectSlider.value = Audio.effect_volume

func _on_back_button_up() -> void:
	await click_sound()
	get_tree().change_scene_to_file("res://ui/menu/menu.tscn")

func _on_music_slider_value_changed(volume: float) -> void:
	Audio.change_sound(volume/100)

func _on_effect_slider_value_changed(volume: float) -> void:
	Audio.effect_volume = volume

func click_sound():
	$Click.play()
	await $Click.finished

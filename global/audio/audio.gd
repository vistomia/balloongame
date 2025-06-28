extends Node

@export var volume_linear := 100.0
@export var effect_volume := 70.0

func change_sound(volume) -> void:
	volume_linear = volume
	$Music.volume_linear = volume

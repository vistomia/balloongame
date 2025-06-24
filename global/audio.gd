extends AudioStreamPlayer2D

@export var effect_volume := 70.0

func _ready() -> void:
	self.play()

func change_sound(volume) -> void:
	self.volume_linear = volume 

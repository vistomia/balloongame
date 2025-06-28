extends Area2D

var time := 0.0
var initial_pos := randi_range(25, 150)
var frequency := randi_range(5, 10)
var amplitude := randi_range(8, 20)
var speed := randf_range(0.5, 2)

var sound: Resource
var is_pop := false

var original_color := Color(randf_range(0.2, 1.4),randf_range(0.0,1),randf_range(0.4, 1))
var inverted_color := invert_color_hsv(original_color)

@onready var pop_sound: AudioStreamPlayer2D = $PopSound
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite
@onready var collision: CollisionShape2D = $Collision

func _ready() -> void:
	$AnimatedSprite.self_modulate = original_color
	sound = load("res://assets/songs/sfx/explosion/explosion"+str(randi_range(1,6))+".wav")

func _process(delta: float) -> void:
	time += delta
	
	if is_pop and int(time*10) % 2 == 0:
		blink()

	if is_pop:
		rotation += 0.01
		speed = lerp(speed, -1.4, 0.04)
	else:
		rotation = sin(time) * 0.2
	
	position.y -= speed
	position.x = initial_pos + sin(time * frequency) * amplitude

func pop() -> void:
	collision.disabled = true
	speed /= 3
	frequency = 0
	amplitude = 0
	is_pop = true
	await explosion_sound()
	
	animated_sprite.play("pop")
	await animated_sprite.animation_finished
	await get_tree().create_timer(4).timeout
	queue_free()

func explosion_sound() -> void:
	pop_sound.stream = sound
	pop_sound.volume_linear = Audio.effect_volume / 100
	pop_sound.pitch_scale = randf_range(0.5, 1) 
	pop_sound.play()

func invert_color_hsv(color: Color) -> Color:
	var h = color.h
	var s = color.s
	var v = color.v
	return Color.from_hsv(fmod(h + 0.5, 1.0), s, v)

func get_color() -> Variant:
	return $AnimatedSprite.self_modulate

func blink() -> void:
	if $AnimatedSprite.modulate != original_color:
		$AnimatedSprite.modulate = original_color
	else:
		$AnimatedSprite.modulate = inverted_color

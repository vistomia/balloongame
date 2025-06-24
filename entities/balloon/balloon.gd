extends Area2D

var on_mouse := false
var time := 0.0
var initial_pos := randi_range(25, 150)
var rand1 := randi_range(5, 10)
var rand2 := randi_range(8, 20)
var speed := randf_range(0.5, 2)

func _ready() -> void:
	$AnimatedSprite2D.play("default")
	$AnimatedSprite2D.self_modulate = Color(randf_range(0.2, 1.4),randf_range(0.0,1),randf_range(0.4, 1))

func _process(delta: float) -> void:
	time += delta
	rotation = sin(time) * 0.2
	position.y -= speed
	position.x = initial_pos + sin(time * rand1) * rand2

func destroy() -> void:
	var a = "res://assets/songs/sfx/explosion"+str(randi_range(1,6))+".wav"
	var sound = load(a)
	$AudioStreamPlayer2D.stream = sound
	$AudioStreamPlayer2D.volume_linear = Audio.effect_volume / 100
	$AudioStreamPlayer2D.play()
	$AudioStreamPlayer2D.pitch_scale = randf_range(0.5, 1) 
	$CollisionShape2D.disabled = true
	speed /= 3
	rand1 = 0
	rand2 = 0
	$AnimatedSprite2D.play("pop")
	await $AnimatedSprite2D.animation_finished
	speed = -1
	await get_tree().create_timer(4).timeout
	queue_free()

func _on_mouse_entered() -> void:
	on_mouse = true

func _on_mouse_exited() -> void:
	on_mouse = false

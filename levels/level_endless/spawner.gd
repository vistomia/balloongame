extends Marker2D

var time := 0.0
var time_played := 0.0
var BalloonScene = preload("res://entities/balloon/balloon.tscn")  # Pré-carrega a cena do balão

func _process(delta: float) -> void:
	time += delta
	time_played += delta
	if time > clamp(6.0 - log(1.0 + time_played) * 1.5, 0.4, 6.0):
		time = 0
		spawn_balloon()

func spawn_balloon():
	var balloon = BalloonScene.instantiate()
	balloon.global_position = global_position  # Aparece na posição do Marker2D
	get_parent().add_child(balloon)  # Adiciona o balão à cena

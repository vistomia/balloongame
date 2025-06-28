extends Area2D

signal score

var volume_effect := Audio.effect_volume

func _process(delta: float) -> void:
	rotation += 0.1

func _input(event: InputEvent) -> void:
	if (event is InputEventMouseButton or event is InputEventMouseMotion):
		$Sprite2D.show()
	elif (event is InputEventScreenTouch or event is InputEventScreenDrag):
		$Sprite2D.hide()
	
	if event is InputEventMouseButton and event.is_pressed():
		self.position = get_global_mouse_position()
		var results := check(get_global_mouse_position())
		if results == null:
			click(0.4)
			return
		$Sprite2D.position = get_global_mouse_position()

		if results.has_method('pop'):
			click(0.13)
			emit_signal("score")
			var explosion = load("res://entities/sfx/explosion.tscn").instantiate()
			explosion.global_position = global_position  # Aparece na posição do Marker2D
			print(results.modulate)
			explosion.self_modulate = results.get_color()
			explosion.emitting = true
			get_parent().add_child(explosion)  # Adiciona o balão à cena
			await results.pop()

func click(pitch: float) -> void:	
	$Click.stream = load("res://assets/songs/sfx/click/click"+ str(randi_range(1, 5))+".wav")
	$Click.pitch_scale = pitch
	$Click.volume_linear = volume_effect / 100
	$Click.play()

func check(pos: Vector2) -> Area2D:
	var query = PhysicsPointQueryParameters2D.new()
	query.position = pos
	query.collision_mask = 1
	query.collide_with_areas = true
	query.collide_with_bodies = false
	var space = get_world_2d().direct_space_state
	var results = space.intersect_point(query)
	if results == []:
		return null
	return results[0].collider

extends Area2D

var mouse_pressed

signal score

func _ready() -> void:
	$Sprite2D.hide()

func _process(delta: float) -> void:
	rotation += 0.1

func _input(event: InputEvent) -> void:
	$Sprite2D.show()
	position = get_global_mouse_position()
	
	if event is InputEventMouseButton:
		mouse_pressed = event.pressed
	
	if event.is_pressed():
		destroy()

func destroy():
	var areas = get_overlapping_areas()
	if len(areas) > 0 and areas[0].has_method("destroy"):
		areas[0].destroy()
		emit_signal("score")

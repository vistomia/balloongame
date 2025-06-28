extends Sprite2D
var time := 0.0
func _process(delta: float) -> void:
	time+=delta
	rotation = sin(time)

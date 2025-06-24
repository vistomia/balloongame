extends Label

func _process(delta: float) -> void:
	self.text = str(Global.score)
	if Global.score >= 50:
		self.add_theme_color_override("font_color",Color.WHITE)

extends Control
signal mouse_clicked

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _input(event):
	if event is InputEventMouseButton:
		mouse_clicked.emit()

func _on_char_1_new_sprite_called() -> void:
	pass # Replace with function body

func _on_char_1_sprite_exited() -> void:
	pass

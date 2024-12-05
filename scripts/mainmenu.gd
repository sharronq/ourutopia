extends Node2D
signal change_scene_main(scene: String)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_load_save_pressed() -> void:
	change_scene_main.emit("load")

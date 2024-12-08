extends Node2D
@onready var dialog_box = preload("res://scripts/dialog_ui.gd")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_dialog_ui_mouse_clicked() -> void:
	print("input!")

extends Control
@onready var sprite = $Sprite

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	visible = false

func _on_scan_button_scan_complete() -> void:
	visible = true
	pass # Replace with function body.

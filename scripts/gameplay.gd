extends Node2D
@onready var dialog_box = $CanvasLayer/DialogUI
@onready var sprite = $sprite
var character

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	character = sprite.texture

func _on_next_pressed() -> void:
	sprite.call_new_sprite()
	dialog_box.clear_text()
	character = sprite.current_char
	await get_tree().create_timer(1).timeout
	dialog_box.change_text(character, "Default")

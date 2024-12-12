extends Node2D

@onready var sprite = $Sprite
@onready var dialog_box = $dialog_box/DialogUI
@onready var info_box = $CharInfo

@onready var scanner = preload("res://scenes/buttons/scan_button.tscn")

@onready var lie_detecter = $LieDetector
@onready var day_text = preload("res://scenes/day_text.tscn")

var character

func _ready() -> void:
	# Play Day text, then destroy
	add_child(day_text.instantiate())
	info_box.visible = false

func _on_next_pressed() -> void:
	dialog_box.visible = false
	sprite.call_new_sprite()
	dialog_box.clear_text()
	await get_tree().create_timer(1).timeout
	character = sprite.current_char
	dialog_box.change_text(character, "Default")
	sprite.visible = true
	dialog_box.visible = true

func _on_thumbprint_pressed() -> void:
	print("AAAAAA")
	add_child(scanner.instantiate())

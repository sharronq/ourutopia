extends Node2D

@onready var dialog_box = $dialog_box/DialogUI
@onready var scanner = $scan_anim
@onready var sprite = $sprite
@onready var day_text = $DayText/day_text
@onready var info_box = $CharInfo
@onready var cover = $DayText/cover

var character

func _ready() -> void:
	info_box.visible = false
	scanner.visible = false
	sprite.visible = false
	dialog_box.visible = false
	
	day_text.scroll_text("Day 1", 0.5)
	await get_tree().create_timer(3).timeout
	cover.visible = false
	character = sprite.texture

func _on_next_pressed() -> void:
	dialog_box.visible = false
	sprite.call_new_sprite()
	dialog_box.clear_text()
	character = sprite.current_char
	await get_tree().create_timer(1).timeout
	sprite.visible = true
	dialog_box.visible = true
	dialog_box.change_text(character, "Default")

func _on_thumbprint_pressed() -> void:
	pass # Replace with function body.

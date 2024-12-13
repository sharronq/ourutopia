extends Node2D

@onready var sprite = $Sprite
@onready var dialog_box = $dialog_box/DialogUI
@onready var lie_detecter = $LieDetector

@onready var scanner = preload("res://scenes/buttons/scan_button.tscn")
@onready var day_text = preload("res://scenes/day_text.tscn")
@onready var char_info_box = preload("res://scenes/char_info.tscn")

var context
var character
var character_info
var text

func _ready() -> void:
	# Play Day text, then destroy
	add_child(day_text.instantiate())

func _on_next_pressed() -> void:
	dialog_box.visible = false
	dialog_box.clear_text()
	
	sprite.call_new_sprite()
	character = sprite.current_char
	character_info = sprite.characters[character]
	dialog_box.change_text(character, "Greeting")
	
	await get_tree().create_timer(1).timeout
	sprite.visible = true
	dialog_box.visible = true

func _on_scan_button_scan_complete() -> void:
	add_child(scanner.instantiate())
	
	var char_info_box_instance = char_info_box.instantiate()
	var counter = 1
	for child in char_info_box_instance.get_children():
		if child is Label:
			child.text = character_info[counter]
			counter += 1
	char_info_box_instance.get_node("Name").text = character
	add_child(char_info_box_instance)

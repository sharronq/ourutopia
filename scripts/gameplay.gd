extends Node2D

@onready var sprite = $Sprite
@onready var dialog_box = $dialog_box/DialogUI
@onready var lie_detecter = $LieDetector
@onready var interrogate_why = $why
@onready var interrogate_why_q = $why/text
@onready var interrogate_suspicious = $suspicious
@onready var interrogate_suspicious_q = $suspicious/text
@onready var interrogate_suspicious2 = $suspicious2
@onready var interrogate_suspicious2_q = $suspicious2/text

@onready var day_text = preload("res://scenes/day_text.tscn")

var sus1_context
var sus2_context
var character
var character_info
var char_info_box_instance
var day_text_instance
var text

var scanned = false
var why_asked = false
var why_lie = false
var sus1_lie = false
var sus2_lie = false
var suspicious_asked = false
var lying_asked = false
var suspicious2_asked = false

func _ready() -> void:
	interrogate_why.visible = false
	interrogate_suspicious.visible = false
	interrogate_suspicious2.visible = false
	# Play Day text, then destroy
	day_text_instance = day_text.instantiate()
	add_child(day_text_instance)

func initialize_interrogate():
	why_lie = false
	why_asked = false
	interrogate_why.visible = false
	
	scanned = false
	
	sus1_lie = false
	suspicious_asked = false
	interrogate_suspicious.visible = false
	
	sus2_lie = false
	suspicious2_asked = false
	interrogate_suspicious2.visible = false
	
	lie_detecter.stop_animation()
	dialog_box.visible = false
	dialog_box.clear_text()
	interrogate_why_q.text = "Why do you want to live here?"

func _on_next_pressed() -> void:
	if sprite.visible == true:
		return
	initialize_interrogate()
	dialog_box.visible = false
	dialog_box.clear_text()
	
	sprite.call_new_sprite()
	await get_tree().create_timer(1).timeout
	character = sprite.current_char
	character_info = sprite.characters[character]
	dialog_box.change_text(character, "Greeting")
	
	sprite.visible = true
	dialog_box.visible = true

func _on_scan_button_scan_complete() -> void:
	var char_info_box = preload("res://scenes/char_info.tscn")
	
	if sprite.visible == false:
		return
	
	char_info_box_instance = char_info_box.instantiate()
	var counter = 1
	for child in char_info_box_instance.get_children():
		if child is Label:
			child.text = character_info[counter]
			counter += 1
	char_info_box_instance.get_node("Name").text = character
	char_info_box_instance.close_menu.connect(charmenu_close)
	
	interrogate_why.visible = false
	interrogate_suspicious.visible = false
	interrogate_suspicious2.visible = false
	
	add_child(char_info_box_instance)
	scanned = true

func charmenu_close():
	remove_child(char_info_box_instance)

func _on_interrogate_pressed() -> void:
	if not why_asked and not interrogate_why.visible and sprite.visible:
		interrogate_why.visible = true
	elif why_asked and why_lie:
		interrogate_why_q.text = "I detect that you are lying."
		interrogate_why.visible = true
	else:
		interrogate_why.visible = false
		
	if scanned == true:
		match character:
			"Daniel Grimes":
				interrogate_suspicious_q.text = "Can you explain your crime record?"
				sus1_context = "Interrogate_Crime"
				sus2_context = ""
			"David Winters":
				interrogate_suspicious_q.text = "Can you explain your low morality?"
				sus1_context = "Interrogate_Evil"
				interrogate_suspicious2_q.text = "Are you not well?"
				sus2_context = "Interrogate_Health"
			"Oliver Grant":
				interrogate_suspicious_q.text = "Can you explain your crime record?"
				sus1_context = "Interrogate_Crime"
				sus2_context = ""
		
		if sus1_context != "":
			if not suspicious_asked and not interrogate_suspicious.visible and sprite.visible:
				interrogate_suspicious.visible = true
			elif suspicious_asked and sus1_lie:
				interrogate_suspicious_q.text = "I detect that you are lying."
				interrogate_suspicious.visible = true
			else:
				interrogate_suspicious.visible = false
		
		if sus2_context != "":
			if not suspicious2_asked and not interrogate_suspicious2.visible and sprite.visible:
				interrogate_suspicious2.visible = true
			elif suspicious2_asked and sus2_lie:
				interrogate_suspicious2_q.text = "I detect that you are lying."
				interrogate_suspicious2.visible = true
			else:
				interrogate_suspicious2.visible = false

func _on_accept_reject_accept() -> void:
	sprite.fade_out(sprite)
	await get_tree().create_timer(1).timeout
	sprite.visible = false
	initialize_interrogate()
	if character == "Oliver Grant":
		day_text_instance.end_day()

func _on_accept_reject_reject() -> void:
	sprite.fade_out(sprite)
	sprite.visible = false
	initialize_interrogate()
	if character == "Oliver Grant":
		day_text_instance.end_day()

func _on_why_pressed() -> void:
	if not why_asked:
		why_asked = true
		dialog_box.change_text(character, "Interrogate_Why")
	elif why_asked and why_lie:
		dialog_box.change_text(character, "Lie_Detected")
		lie_detecter.stop_animation()
		why_lie = false
	interrogate_why.visible = false
	interrogate_suspicious.visible = false
	interrogate_suspicious2.visible = false
	
func _on_suspicious_pressed() -> void:
	if not suspicious_asked:
		suspicious_asked = true
		dialog_box.change_text(character, sus1_context)
	elif suspicious_asked and sus1_lie:
		dialog_box.change_text(character, "Lie_Detected")
		lie_detecter.stop_animation()
		sus1_lie = false
	interrogate_why.visible = false
	interrogate_suspicious.visible = false
	interrogate_suspicious2.visible = false

func _on_suspicious_2_pressed() -> void:
	if not suspicious2_asked:
		suspicious2_asked = true
		dialog_box.change_text(character, sus2_context)
	elif suspicious2_asked and sus2_lie:
		dialog_box.change_text(character, "Lie_Detected")
		lie_detecter.stop_animation()
		sus2_lie = false
	interrogate_why.visible = false
	interrogate_suspicious.visible = false
	interrogate_suspicious2.visible = false

func _on_dialog_ui_sus_1_lie() -> void:
	lie_detecter.lie_detected()
	sus1_lie = true

func _on_dialog_ui_sus_2_lie() -> void:
	lie_detecter.lie_detected()
	sus2_lie = true

func _on_dialog_ui_why_lie() -> void:
	lie_detecter.lie_detected()
	why_lie = true

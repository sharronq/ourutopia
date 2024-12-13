extends Control
@onready var protocol_list = $"Protocol(1)"
@onready var open = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	protocol_list.visible = false
	
func _on_protocols_pressed() -> void:
	if open == false:
		protocol_list.visible = true
		open = true
	else:
		protocol_list.visible = false
		open = false

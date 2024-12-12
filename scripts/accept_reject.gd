extends Control

@onready var animation = $AnimationPlayer

signal accept
signal reject

var mouse_inside_area = false
var open = false
var mouse_inside_button = false

func _on_accept_pressed() -> void:
	accept.emit()
	print("accept")

func _on_reject_pressed() -> void:
	reject.emit()
	print("reject")
	
func _ready():
	position.x = 1064
	position.y = 359
	
func _process(delta):
	if Input.is_action_pressed("ui_touch") and mouse_inside_area and not mouse_inside_button:
		if open == false:
			animation.play("open")
			await get_tree().create_timer(1).timeout
			open = true
		else:
			animation.play("close")
			await get_tree().create_timer(1).timeout
			open = false
	
func _on_mouse_entered() -> void:
	mouse_inside_area = true

func _on_mouse_exited() -> void:
	mouse_inside_area = false

func _on_accept_mouse_entered() -> void:
	mouse_inside_button = true

func _on_reject_mouse_entered() -> void:
	mouse_inside_button = true

func _on_reject_mouse_exited() -> void:
	mouse_inside_button = false

func _on_accept_mouse_exited() -> void:
	mouse_inside_button = false

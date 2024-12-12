extends Node2D
@onready var scanner = $scan_anim
@onready var scan_anim = $scan_anim/AnimationPlayer
signal scan_complete

func _ready() -> void:
	scanner.visible = false

func _on_thumbprint_pressed() -> void:
	scanner.visible = true
	scan_anim.play("scan")
	await get_tree().create_timer(2).timeout
	scan_complete.emit()
	scanner.visible = false
	

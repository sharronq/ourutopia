extends Node2D
@onready var main_menu = preload("res://scenes/mainmenu.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	get_tree().change_scene_to_packed(main_menu)

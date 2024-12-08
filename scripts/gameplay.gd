extends Node2D

@onready var sprite = $"char1"
@onready var textures = [preload("res://resources/elfgirl1.tres"), preload("res://resources/elfgirl3.tres")]

var fade_duration = 0.5

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	sprite.texture = textures.pop_at(0)
	for filePath in DirAccess.get_files_at("res://resources/"):
		textures.append( load(filePath) )

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_button_pressed() -> void:
	call_new_sprite()

func call_new_sprite():
	fade_out(sprite)
	await get_tree().create_timer(2).timeout
	sprite.texture = textures.pop_at(0)
	fade_in(sprite)

func fade_in(node):
	var tween = get_tree().create_tween()
	tween.tween_property(node, "modulate:a", 1, fade_duration)
	tween.play()
	await tween.finished
	tween.kill()

func fade_out(node):
	var tween = get_tree().create_tween()
	tween.tween_property(node, "modulate:a", 0, fade_duration)
	tween.play()
	await tween.finished
	tween.kill()

func _on_dialog_ui_mouse_clicked() -> void:
	print("input!")

extends Sprite2D
signal sprite_exited
signal new_sprite_called

@onready var characters = {
	"Lyra Solis": [preload("res://resources/elfgirl1.tres"), ""],
	"Elysia Dorn": [preload("res://resources/human4.tres")],
	"Daniel Grimes": [preload("res://resources/human2.tres")],
	"David Winters": [preload("res://resources/elfboy1.tres")],
	"Novah Tyndall": [preload("res://resources/elfgirl2.tres")],
	"Zayden Korr": [preload("res://resources/elfgirl3.tres")],
	"Oliver Grant": [preload("res://resources/human3.tres")],
	"Kael Voss": [preload("res://resources/human1.tres")]}
var current_char
var char_list
var fade_duration = 0.5

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	char_list = characters.keys()
	current_char = char_list.pop_at(0)
	self.texture = characters[current_char][0]

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_next_pressed() -> void:
	call_new_sprite()
	new_sprite_called.emit()

func call_new_sprite():
	fade_out(self)
	sprite_exited.emit()
	await get_tree().create_timer(2).timeout
	current_char = char_list.pop_at(0)
	self.texture = characters[current_char][0]
	fade_in(self)

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

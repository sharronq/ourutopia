extends Control
@onready var day_text = $day_text
@onready var cover = $cover
var text

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	text = "[wave]Day 1[/wave]"
	day_text.scroll_text(text, 0.5)
	await get_tree().create_timer(1).timeout
	
func _on_day_text_text_scroll_done() -> void:
	var tween = get_tree().create_tween()
	tween.tween_property(self, "modulate:a", 0, 1)
	tween.play()
	await tween.finished
	tween.kill()
	queue_free()
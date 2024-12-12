extends RichTextLabel
signal text_scroll_done

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func scroll_text(input_text:String, speed:float):
	visible_characters = 0
	text = input_text
	
	for i in get_parsed_text():
		visible_characters += 1
		await get_tree().create_timer(speed).timeout
	
	text_scroll_done.emit()

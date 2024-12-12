extends Control

@onready var dialog = $DialogBox/RichTextLabel
var dialog_map = {
	"Daniel Grimes": 
		{
			"Default": "Good day."
		},
		
	"Lyra Solis":
		{
			"Default": "Hello!"
		},
	"Elysia Dorn":
		{
			"Default": "Yo."
		}
	}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func change_text(character, context):
	dialog.text = dialog_map[character][context]

func clear_text():
	dialog.text = ""

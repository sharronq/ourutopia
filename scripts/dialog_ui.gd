extends Control

@onready var dialog = $DialogBox/dialog
var dialog_map = {
	"Daniel Grimes": 
		{
			"Default": "Hey there."
		},
		
	"Lyra Solis":
		{
			"Default": "Hello!"
		},
	"Elysia Dorn":
		{
			"Default": "."
		}
	}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	visible = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func change_text(character, context):
	dialog.text = dialog_map[character][context]
	dialog.scroll_text(dialog.text, 0.05)

func clear_text():
	dialog.text = ""

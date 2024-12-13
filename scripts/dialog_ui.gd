extends Control

@onready var dialog = $dialog
@onready var speaker = $speaker

var dialog_map = {
	"Daniel Grimes": 
		{
			"Greeting": "Hey there.",
			"Interrogate_Crime": "Nothing serious, just some misunderstandings with the law.",
			"Interrogate_Why": "I want to help create a better future.",
			"Lie_Detected": "Alright, fine. I just want to get out of paying my debt. I heard Utopia doesn't even have those kinds of problems."
		},
		
	"Lyra Solis":
		{
			"Greeting": "Hello!"
		},
	"Elysia Dorn":
		{
			"Greeting": "Greetings."
		},
	"David Winters":
		{
			"Greeting": "Hello.",
			"Interrogate_Health": "Crohn's Disease. It's not spreadable but it's been getting bad recently. 
								  I'm guessing the medicine Utopia has is probably better than anything we have out here.",
			"Interrogate_Evil": "...I suppose my only evil deed is putting animals to sleep. It's one of the more unfortunate parts of my job.",
			"Interrogate_Evil2": "I honestly don't know what else it could be referring to. I'm sorry."
		},
	"Oliver Grant":
		{
			"Greeting": "Hi there.",
			"Interrogate_Crime": "Ah. I may have committed a little petty thievery. But it was for a good cause, I swear!",
			"Interrogate_Crime2": "I do feel guilty about it, I do. Maybe someone else could have used that food. But my family, we're poor, and my siblings were starving. What else was I to do?",
			"Interrogate_Why": "I know what it feels like to go hungry. Utopia, you guys probably don't have to worry about that, right? But food brings people together. I want to help make the community here stronger."
		}
	}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	visible = false

func change_text(character, context):
	speaker.text = character
	dialog.text = dialog_map[character][context]
	dialog.scroll_text(dialog.text, 0.05)

func clear_text():
	dialog.text = ""

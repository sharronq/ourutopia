extends Control

@onready var dialog = $dialog
@onready var speaker = $speaker
signal why_lie
signal sus1_lie
signal sus2_lie

var dialog_map = {
	"Daniel Grimes": 
		{
			"Greeting": ["Hey there.", 0],
			"Interrogate_Crime": ["Nothing serious, just some misunderstandings with the law.", 0],
			"Interrogate_Why": ["I want to help create a better future.", 1],
			"Lie_Detected": ["Alright, fine. I just want to get out of paying my debt. I heard Utopia doesn't even have those kinds of problems.", 0]
		},
		
	"David Winters":
		{
			"Greeting": ["Hello.", 0],
			"Interrogate_Why": ["To be honest, I could really use some medical help.", 0],
			"Interrogate_Health": ["I have Crohn's Disease. It's not spreadable but it's been getting bad recently. I'm guessing the medicine Utopia has is probably better than anything we have out here.", 0],
			"Interrogate_Evil": ["...I suppose my only evil deed is putting animals to sleep. It's one of the more unfortunate parts of my job.", 1],
			"Lie_Detected": ["I honestly don't know what else could have affected it. I'm sorry.", 0]
		},
		
	"Oliver Grant":
		{
			"Greeting": ["Hi there.", 0],
			"Interrogate_Crime": ["Ah. I may have committed a little petty thievery. But it was for a good cause, I swear!", 1],
			"Lie_Detected": ["I do feel guilty about it, I do. Maybe someone else could have used that food. But my family, we're poor, and my siblings were starving. What else was I to do?", 0],
			"Interrogate_Why": ["I know what it feels like to go hungry. Utopia, you guys probably don't have to worry about that, right? But food brings people together. I want to help make the community here stronger.", 0]
		}
		#
	#"Lyra Solis":
		#{
			#"Greeting": "Hello!"
		#},
	#"Elysia Dorn":
		#{
			#"Greeting": "Greetings."
		#}
	}

func _ready() -> void:
	visible = false

func change_text(character, context):
	speaker.text = character
	
	# update text box
	var temp = dialog_map[character][context]
	dialog.text = temp[0]
	
	# 1 = character lying; emit signal
	if temp[1] == 1:
		match context: 
			"Interrogate_Why":
				why_lie.emit()
			"Interrogate_Crime", "Interrogate_Evil":
				sus1_lie.emit()
			"Interrogate_Health":
				sus2_lie.emit()
		
	dialog.scroll_text(dialog.text, 0.025)

func clear_text():
	dialog.text = ""

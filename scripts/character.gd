extends Sprite2D

@onready var characters = {
	"Daniel Grimes": [preload("res://resources/human2.tres"), 
							"Occupation: Construction Worker",
							"Age: 38",
							"Morality: 55",
							"IQ: 98",
							"Wealth: $28,000",
							"Health: Healthy",
							"Skill: Building",
							"2 Crime Cases",
							"0 Hospital Visits"],
	"Lyra Solis": [preload("res://resources/elfgirl1.tres"),
							"Occupation: Farmer",
							"Age: 29",
							"Morality: 82",
							"IQ: 105",
							"Wealth: $35,000",
							"Health: Healthy",
							"Skill: Sustainable Agriculture",
							"0 Crime Cases",
							"0 Hospital Visits"],
	"Elysia Dorn": [preload("res://resources/human4.tres"),
							"Occupation: Architect",
							"Age: 60",
							"Kindness: 90",
							"Narcissism: 10",
							"IQ: 120",
							"Wealth: $60,000",
							"Health: Healthy",
							"0 Crime Cases",
							"0 Hospital Visits"],
	"David Winters": [preload("res://resources/elfboy1.tres"),
							"Occupation: Veterinarian",
							"Age: 33",
							"Morality: 78",
							"IQ: 149",
							"Wealth: $70,000",
							"Health: Sick",
							"Skill: Drawing",
							"0 Crime Cases",
							"4 Hospital Visits"],
	"Novah Tyndall": [preload("res://resources/elfgirl2.tres"),
							"Occupation: Doctor",
							"Age: 39",
							"Morality: 25",
							"IQ: 160",
							"Wealth: $120,000",
							"Health: Healthy",
							"Skill: Advanced Medicine",
							"0 Crime Cases",
							"0 Hospital Visits"],
	"Zayden Korr": [preload("res://resources/elfgirl3.tres"),
							"Occupation: Delivery Driver",
							"Age: 35",
							"Morality: 65",
							"IQ: 110",
							"Wealth: $20,000",
							"Health: Healthy",
							"Skill: Driving",
							"1 Crime Case",
							"0 Hospital Visits"],
	"Oliver Grant": [preload("res://resources/human3.tres"),
	 						"Occupation: Chef",
							"Age: 50",
							"Kindness: 88",
							"Narcissism: 20",
							"IQ: 95",
							"Wealth: $40,000",
							"Health: Healthy",
							"1 Crime Case",
							"0 Hospital Visits"],
	"Kael Voss": [preload("res://resources/human1.tres"),
							"Occupation: Teacher",
							"Age: 72",
							"Morality: 85",
							"IQ: 180",
							"Wealth: $100,000",
							"Health: Healthy",
							"Skill: Education",
							"0 Crime Cases",
							"1 Hospital Visit"]
							}

var current_char
var char_list
var fade_duration = 0.5

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	visible = false
	char_list = characters.keys()
	texture = characters["Daniel Grimes"][0]
	current_char = "Daniel Grimes"
	
func call_new_sprite():
	fade_out(self)
	await get_tree().create_timer(1).timeout
	current_char = char_list.pop_at(0)
	print(current_char)
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

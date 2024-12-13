extends Control
@onready var char_name = $Name.text
@onready var age = $Age.text
@onready var occupation = $Occupation.text
@onready var morality = $Morality.text
@onready var iq = $IQ.text
@onready var health = $Health.text
@onready var wealth = $Wealth.text
@onready var crime_cases = $"Crime Cases".text
@onready var hospital_visits = $"Hospital Visits".text
signal close_menu

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	visible = true

func _on_x_pressed() -> void:
	emit_signal("close_menu")

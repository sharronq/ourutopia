extends Node2D
@onready var anim_player = $AnimationPlayer

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func lie_detected():
	anim_player.play("lie detected")
	
func stop_animation():
	anim_player.play("RESET")

extends Node2D

var stress_level = 0

func _on_spooking_finished(animation_name):
	react()

func react():
	match stress_level:
		0:
			$AnimatedSprite.play("surprised")
		1:
			pass
		2:
			pass


func _on_reaction_finished():
	match stress_level:
		0:
			$AnimatedSprite.play("idle")
		1:
			pass
		2:
			pass

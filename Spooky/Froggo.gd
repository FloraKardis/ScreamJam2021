extends Node2D

const REACTIONS = ["surprised", "blanketing", "hiding"]
const STRESS_THRESHOLD = 3

var already_happened = []
var stress_level = 0


func _on_spooking_finished(animation_name):
	if not animation_name in already_happened:
		already_happened.append(animation_name)
		stress_level += 1
	react()

func react():
	if stress_level < STRESS_THRESHOLD:
		$AnimatedSprite.play("surprised")
	elif stress_level == STRESS_THRESHOLD and $AnimatedSprite.animation != "blanketed":
		$AnimatedSprite.play("blanketing")
		$SoundBlanketing.play()
	else:
		$AnimatedSprite.play("hiding")
		$SoundHiding.play()

func _on_reaction_finished():
	if $AnimatedSprite.animation in REACTIONS:
		if stress_level < STRESS_THRESHOLD - 1:
			$AnimatedSprite.play("idle")
		elif stress_level < STRESS_THRESHOLD:
			$AnimatedSprite.play("this is fine")
		else:
			$AnimatedSprite.play("blanketed")
		Global.haunting_in_progress = false

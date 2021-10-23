extends Node2D

const REACTIONS = ["surprised", "blanketing", "hiding"]
#const NOT_VERY_SPOOKY = ["lamp blinking", "picture kiss", "wardrobe spooking", "moon turning"]
#const VERY_SPOOKY = ["books flying", "armchair levitating"]
const STRESS_THRESHOLD = 3

var already_happened = []
var stress_level = 0

#func stressed():
#	return stress_level >= STRESS_THRESHOLD

func _on_spooking_finished(animation_name):
	print(animation_name)
#	if animation_name in NOT_VERY_SPOOKY:
	if not animation_name in already_happened:
		already_happened.append(animation_name)
		stress_level += 1
#	elif animation_name in VERY_SPOOKY:
#		stress_level += 2
	print(stress_level)
	react()

func react():
	if stress_level < STRESS_THRESHOLD:
		$AnimatedSprite.play("surprised")
#		$SoundLookingAround.play()
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

extends Node2D

const SCORING_SYSTEM = {
	0: 0,
	1: 20,
	2: 23,
	3: 25,
	4: 28,
	5: 30,
}

func _ready():
	$Node2D/ColorRect.visible = true
	$AnimationPlayer.play("fade in")
	$BackgroundMusic.play()
	set_score(SCORING_SYSTEM[Global.points])	

func set_score(score):
	if score == 0:
		$Jury/Cards.visible = false
		$Congratulations.visible = false
		$Encouragement.visible = true
	else:
		$Jury/Cards.visible = true
		$Congratulations.visible = true
		$Encouragement.visible = false
		var possible_individual_scores = [6, 7, 8, 9]
		if score >= SCORING_SYSTEM[4]:
			possible_individual_scores.append(10)
		var scores = [0, 0, 0]
		while scores[0] + scores[1] + scores[2] != score:
			for i in range(scores.size()):
				scores[i] = possible_individual_scores[randi() % possible_individual_scores.size()]
		for i in range(scores.size()):
			set_texture(i, scores[i])
		$Applause.play()

func set_texture(index, score):
	find_node("Card" + str(index + 1)).play(str(score))

func try_again():
	$AnimationPlayer.play("fade out")
	$TextureButton/ClickSound.play()

func _on_animation_finished(animation_name):
	if animation_name == "fade out":
		get_tree().change_scene("res://Main.tscn")

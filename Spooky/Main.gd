extends Node2D

var time = 57

func _ready():
	Global.haunting_in_progress = false
	$Node2D/ColorRect.visible = true
	$AnimationPlayer.play("fade in")
	$BackgroundMusic.play()

func _process(_delta):
	if $Timer.finished:
		$AnimationPlayer.play("fade out")
	if Input.is_action_just_released("ui_select"):
		if not Global.haunting_in_progress:
			var object = $Room.current_object()
			if object != null:
				$Ghost.to_spook = object

func _on_animation_finished(animation_name):
	if animation_name == "fade in":
		$Timer.start(time)
	elif animation_name == "fade out":
		Global.points = $Room/Froggo.stress_level
		get_tree().change_scene("res://GameOver.tscn")


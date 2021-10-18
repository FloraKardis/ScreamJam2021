extends Node2D

var time = 60 # 50

func _ready():
	Global.haunting_in_progress = false
	$AnimationPlayer.play("fade in")


func _process(delta):
	if $Timer.finished:
		$AnimationPlayer.play("fade out")
	if Input.is_action_just_released("ui_select"):
		if not Global.haunting_in_progress:
#		if not $Room.currently_selected in $Ghost.to_spook:
			var object = $Room.current_object()
			if object != null and not object in $Ghost.to_spook:
				$Ghost.to_spook.append(object)
				Global.haunting_in_progress = true

func _on_animation_finished(animation_name):
	if animation_name == "fade in":
		$Timer.start(time)
		$Ghost.spooking = false
	if animation_name == "fade out":
		Global.points = $Room/Froggo.stress_level
		get_tree().change_scene("res://GameOver.tscn")


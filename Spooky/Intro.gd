extends Node2D

func _ready():
	$AnimationPlayer.play("fade in")

func get_spookin():
	$AnimationPlayer.play("fade out")

func _on_animation_finished(animation_name):
	if animation_name == "fade out":
		get_tree().change_scene("res://Main.tscn")


extends Node2D

func _ready():
	$Node2D/ColorRect.visible = true
	$AnimationPlayer.play("fade in")
	$AudioStreamPlayer.play()

func get_spookin():
	$AnimationPlayer.play("fade out")
	$TextureButton/ClickSound.play()

func _on_animation_finished(animation_name):
	if animation_name == "fade out":
		get_tree().change_scene("res://Main.tscn")

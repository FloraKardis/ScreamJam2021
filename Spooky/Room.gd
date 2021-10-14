extends Node2D

var currently_selected = null

func current_object():
	if currently_selected != null:
		return self.find_node(currently_selected)
	else:
		return null

func _on_mouse_entered(object):
	currently_selected = object

func _on_mouse_exited():
	currently_selected = null

func interact(object):
	if object == null:
		pass
	if object == $Lamp:
		$AnimationPlayer.play("lamp blinking")
	if object == $Wardrobe:
		$AnimationPlayer.play("wardrobe spooking")

extends Node2D

var currently_selected = null
var stress_level 

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
		$SpookPlayer.play("lamp blinking")
	if object == $Wardrobe:
		$SpookPlayer.play("wardrobe spooking")
	if object == $Picture:
		$SpookPlayer.play("picture kiss")


extends Node2D

#const ALLOWED_AT_FIRST = ["Lamp", "Wardrobe", "Picture", "Window"]
#const NOT_ALLOWED_AT_FIRST = ["Books", "Armchair"]

#var allowed = ALLOWED_AT_FIRST
var currently_selected = null

func current_object():
#	if $Froggo.stressed() and not NOT_ALLOWED_AT_FIRST[0] in allowed:
#		allowed += NOT_ALLOWED_AT_FIRST
	if currently_selected != null:
#		if currently_selected in allowed:
		return self.find_node(currently_selected)
	return null

func _on_mouse_entered(object):
	currently_selected = object

func _on_mouse_exited():
	currently_selected = null

func interact(object):
	if object == null:
		pass
	else:
		if object == $Lamp:
			$SpookPlayer.play("lamp blinking")
		if object == $Wardrobe:
			$SpookPlayer.play("wardrobe spooking")
		if object == $Picture:
			$SpookPlayer.play("picture kiss")
		if object == $Books:
			$SpookPlayer.play("books flying")
		if object == $Window:
			$SpookPlayer.play("moon turning")

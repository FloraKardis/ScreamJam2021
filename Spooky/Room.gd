extends Node2D


var currently_selected = null

func current_object():
	return currently_selected

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
		object.find_node("SoundEffect").play()

func frog_clicked():
	$FrogHeart.set_frame(0)
	$FrogHeart.play("love")

func _on_TextureButton_button_up(object_name):
	currently_selected = self.find_node(object_name)

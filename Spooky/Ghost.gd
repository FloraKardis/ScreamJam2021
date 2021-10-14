extends Node2D

class_name Ghost

const SPEED = 300
const MIN_DISTANCE_FROM_OBJECT = 250

var to_spook = []
var spooking = false

func _process(delta):
	if spooking:
		pass
	else:
		if to_spook.empty():
			move(get_global_mouse_position(), delta)
		else:
			move(to_spook[0].get_global_position(), delta)
	

func move(position: Vector2, delta):
	var direction = position - self.position
	$AnimatedSprite.flip_h = (direction.x > 0)
	if direction.length() > MIN_DISTANCE_FROM_OBJECT:
		self.position += direction.normalized() * SPEED * delta
	elif not to_spook.empty():
		$AnimatedSprite.play("spooking")
		spooking = true


func _animation_finished():
	if $AnimatedSprite.animation == "spooking":
		$AnimatedSprite.play("idle")
		to_spook[0].get_parent().interact(to_spook[0])
		to_spook.remove(0)
		spooking = false

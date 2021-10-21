extends Node2D

class_name Ghost

const SPEED = 200
const MIN_DISTANCE_FROM_OBJECT = 200
const REST = 0.5

var to_spook = []
var spooking = true
var caught_on = REST + 1

func _process(delta):
	caught_on += delta
	if spooking:
		pass
	else:
		if to_spook.empty():
			if caught_on > REST and not Global.haunting_in_progress:
				move(get_global_mouse_position(), delta)
		else:
			move(to_spook[0].find_node("Shape").get_global_position(), delta)

func move(position: Vector2, delta):
	var direction = position - self.position
	$AnimatedSprite.flip_h = (direction.x > 0)
	if direction.length() > MIN_DISTANCE_FROM_OBJECT:
		$AnimatedSprite.play("moving")
		self.position += direction.normalized() * SPEED * delta
	else:
		if to_spook.empty():
			$AnimatedSprite.play("idle")
			caught_on = 0
		else:
			$AnimatedSprite.play("spooking")
			$HauntingSounds.play()
			spooking = true

func _animation_finished():
	if $AnimatedSprite.animation == "spooking":
		$AnimatedSprite.play("idle")
		to_spook[0].get_parent().interact(to_spook[0])
		to_spook.remove(0)
		spooking = false

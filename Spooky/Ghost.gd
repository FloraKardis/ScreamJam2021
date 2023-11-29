extends Node2D

class_name Ghost

const SPEED = 200
const MIN_DISTANCE_FROM_OBJECT = 200
const REST = 0.5

var to_spook = null


func _process(delta):
	if not Global.haunting_in_progress:
		if to_spook == null:
			move(get_global_mouse_position(), delta)
		else:
			move(to_spook.find_node("Shape").get_global_position(), delta)

func move(position: Vector2, delta):
	var direction = position - self.position
	$AnimatedSprite.flip_h = (direction.x > 0)
	if direction.length() > MIN_DISTANCE_FROM_OBJECT:
		$AnimatedSprite.play("moving")
		self.position += direction.normalized() * SPEED * delta
	else:
		if to_spook == null:
			$AnimatedSprite.play("idle")
		else:
			$AnimatedSprite.play("spooking")
			$HauntingSounds.play()
			Global.haunting_in_progress = true

func _animation_finished():
	if $AnimatedSprite.animation == "spooking":
		$AnimatedSprite.play("idle")
		to_spook.get_parent().interact(to_spook)
		to_spook = null

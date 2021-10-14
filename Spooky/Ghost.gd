extends Node2D

const SPEED = 500
const MIN_DISTANCE_FROM_CURSOR = 200


func _process(delta):
	var mouse_position: Vector2 = get_global_mouse_position()
	var position_difference: Vector2 = mouse_position - self.position
	move(position_difference, delta)

func move(direction: Vector2, delta):
	$AnimatedSprite.flip_h = (direction.x > 0)
	if direction.length() > MIN_DISTANCE_FROM_CURSOR:
		self.position += direction.normalized() * SPEED * delta
	

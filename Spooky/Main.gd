extends Node2D

const TIME = 50

func _ready():
	$Timer.start(TIME)

func _process(delta):
	if Input.is_action_just_released("ui_select"):
		if not Global.haunting_in_progress:
#		if not $Room.currently_selected in $Ghost.to_spook:
			var object = $Room.current_object()
			if object != null and not object in $Ghost.to_spook:
				$Ghost.to_spook.append(object)
				Global.haunting_in_progress = true

extends Node2D


const TIME = 10

func _ready():
	$Timer.start(TIME)

func _process(delta):
	if Input.is_action_just_released("ui_select"):
		if not $Room.currently_selected in $Ghost.to_spook:
			var object = $Room.current_object()
			if object != null:
				$Ghost.to_spook.append(object)
		

extends Node2D


onready var POSITION_START = $Bar.frames.get_frame("default", 0).get_size().x / 2
onready var POSITION_FINISH = -$Bar.frames.get_frame("default", 0).get_size().x / 2
onready var BAR_LENGTH = $Bar.frames.get_frame("default", 0).get_size().x

#func _ready():
#	$Pointer.position.x = POSITION_START

var time_full = 1
var time_passed = 0
var counting = false

func start(seconds):
	$Pointer.position.x = POSITION_START
	time_full = seconds
	time_passed = 0
	counting = true

func _process(delta):
	if counting:
		time_passed += delta
		$Pointer.position.x = POSITION_START - BAR_LENGTH * (time_passed / time_full)


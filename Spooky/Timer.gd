extends Node2D

onready var POSITION_START = $Bar.frames.get_frame("default", 0).get_size().x / 2
onready var POSITION_FINISH = -$Bar.frames.get_frame("default", 0).get_size().x / 2
onready var BAR_LENGTH = $Bar.frames.get_frame("default", 0).get_size().x

var time_full
var time_passed
var started = false
var finished = false

func _ready():
	$Pointer.position.x = POSITION_START

func start(seconds):
	$Pointer.position.x = POSITION_START
	time_full = seconds
	time_passed = 0
	started = true
	finished = false

func _process(delta):
	if started and not finished:
		time_passed += delta
		if time_passed >= time_full:
			time_passed = time_full
			finished = true
			started = false
		$Pointer.position.x = POSITION_START - BAR_LENGTH * (time_passed / time_full)


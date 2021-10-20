extends Node

var close_to_present = false
var ready_to_light_text = false
var disable_controls = false
var finished_reading = false

var timer = 0
var time_threshold = 660

func _physics_process(delta):
	if finished_reading:
		timer += 1
	if timer > time_threshold:
		finished_reading = false
		disable_controls = false
		ready_to_light_text = true

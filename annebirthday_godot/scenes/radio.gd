extends Spatial

var timer = 0
var timer_threshold = 1200
var playing = false

func _physics_process(delta):
	timer += 1
	
	if timer > timer_threshold and not playing:
		$AudioStreamPlayer3D.play()
		playing = true

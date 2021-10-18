extends SpotLight

var light_up = false

func _physics_process(delta):
	if Input.is_action_just_pressed("open"):
		light_up = true
	
	if light_up:
		light_energy += .01
		if light_energy > 10:
			light_up = false

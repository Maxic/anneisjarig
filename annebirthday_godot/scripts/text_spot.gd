extends SpotLight

var light_up = false

func _ready():
	light_energy = 0

func _physics_process(delta):
	if Input.is_action_just_pressed("open") and GameState.ready_to_light_text:
		light_up = true
	
	if light_up:
		light_energy += .001
		if light_energy > 10:
			light_up = false

extends SpotLight

var light_up = false

func _ready():
	light_energy = 0


func _physics_process(delta):
	if GameState.ready_to_light_text:
		light_up = true
	
	if light_up:
		$"../anne_text/lieve_anne".get_active_material(0).emission_energy += .01
		light_energy += .001
		if light_energy > 10:
			light_up = false

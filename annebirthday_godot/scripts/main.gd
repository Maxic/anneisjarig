extends Node

var star_amount = 200
var grass_amount = 6000

var star_scene = preload("res://scenes/ster.tscn")
var grass_1_scene = preload("res://scenes/grass_1.tscn")
var grass_2_scene = preload("res://scenes/grass_2.tscn")

func _ready():
	var rng = RandomNumberGenerator.new()
	var grass_arr = [grass_2_scene, grass_1_scene, grass_1_scene, grass_1_scene]
	
	# spawn stars in the sky
	for _index in range(0, star_amount):
		var star = star_scene.instance()
		star.translation = Vector3(normal(0.0, 70.0), rand_range(60, 80), normal(0.0, 70.0))
		add_child(star)
	
	# spawn grass on ground
	for _index in range(0, grass_amount):
		grass_arr.shuffle()
		var grass = grass_arr[0].instance()
		# add some randomness on the scale and rotation
		var scale_factor = rng.randf_range(.1, .5)
		grass.rotate_y(rng.randf_range(0, 2*PI))
		grass.scale = Vector3(scale_factor, scale_factor, scale_factor)
		grass.translation = Vector3(normal(-14, 20.0), -.1, normal(-17, 20.0))		
		add_child(grass)

func normal(avg : float = 0.0, sd : float = 1.0) -> float:
	return avg+sd*sqrt(-2*(ln(randf())))*cos(2*PI*randf())
	
# natural logarithm
func ln(arg : float) -> float:
	return log(arg)/log(exp(1))

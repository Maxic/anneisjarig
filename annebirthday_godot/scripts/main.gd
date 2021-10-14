extends Node

var star_amount = 200

var star_scene = preload("res://scenes/ster.tscn")

func _ready():
	for i in range(0, star_amount):
		var star = star_scene.instance()
		star.translation = Vector3(normal(0.0, 80.0), 70, normal(0.0, 80.0))
		add_child(star)


func normal(avg : float = 0.0, sd : float = 1.0) -> float:
	return avg+sd*sqrt(-2*(ln(randf())))*cos(2*PI*randf())
	
#Natural logarithm
func ln(arg : float) -> float:
	return log(arg)/log(exp(1))

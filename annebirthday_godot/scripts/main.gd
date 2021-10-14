extends Node

var star_amount = 100

var star_scene = preload("res://scenes/ster.tscn")

func _ready():
	for i in range(0, star_amount):
		var star = star_scene.instance()
		star.translation = Vector3(rand_range(-300, 300), 70, rand_range(-300, 300))
		add_child(star)

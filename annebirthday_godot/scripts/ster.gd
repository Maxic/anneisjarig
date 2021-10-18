extends Spatial

var time

# Called when the node enters the scene tree for the first time.
func _ready():
	time = randi()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	time += delta
	
	var scale_factor = (sin(time/2) + 1) /8
	scale = Vector3(scale_factor, scale_factor, scale_factor)

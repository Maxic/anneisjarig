extends KinematicBody

var speed = 3
var acceleration = 10
var gravity = 0.09
var jump = 10

var mouse_sensitivity = 0.06

var direction = Vector3()
var velocity = Vector3()
var fall = Vector3() 

var camera_speed = .18

onready var head = $Camera

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	
func _input(event):	
	if event is InputEventMouseMotion:
		rotate_y(deg2rad(-event.relative.x * mouse_sensitivity)) 
		head.rotate_x(deg2rad(-event.relative.y * mouse_sensitivity)) 
		head.rotation.x = clamp(head.rotation.x, deg2rad(-90), deg2rad(90))

func _physics_process(delta):	
	if GameState.finished_reading:
		var T =global_transform.looking_at(get_node("/root/main/text/anne_text").global_transform.origin, Vector3(0,1,0))
		global_transform.basis.y=lerp(global_transform.basis.y, T.basis.y, delta*camera_speed)
		global_transform.basis.x=lerp(global_transform.basis.x, T.basis.x, delta*camera_speed)
		global_transform.basis.z=lerp(global_transform.basis.z, T.basis.z, delta*camera_speed)
	
	# toggle cursor from visible to captured
	if Input.is_action_just_released("toggle_cursor"):
		if Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		else:
			Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	
	if Input.is_action_pressed("open"):
		if GameState.close_to_present:
			get_node("/root/main/kado_scene/kado").open()
	
	direction = Vector3()
	
	move_and_slide(fall, Vector3.UP)
	
	if not is_on_floor():
		fall.y -= gravity
	
	if not GameState.disable_controls:
		if Input.is_action_pressed("move_forward"):
		
			direction -= transform.basis.z
		
		elif Input.is_action_pressed("move_backward"):
			
			direction += transform.basis.z
			
		if Input.is_action_pressed("move_left"):
			
			direction -= transform.basis.x			
			
		elif Input.is_action_pressed("move_right"):
			direction += transform.basis.x
	
	direction = direction.normalized()
	velocity = velocity.linear_interpolate(direction * speed, acceleration * delta) 
	velocity = move_and_slide(velocity, Vector3.UP) 

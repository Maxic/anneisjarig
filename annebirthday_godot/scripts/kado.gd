extends Spatial

func open():
	$AnimationPlayer.play("open")


func _on_Area_body_entered(body):
	print(body.name)

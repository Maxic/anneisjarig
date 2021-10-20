extends Spatial

func open():
	$AnimationPlayer.play("open")
	$open_present.visible = false
	GameState.disable_controls = true

func _on_Area_body_entered(body):
	if body.name == "player":
		GameState.close_to_present = true
		$open_present.visible = true

func _on_Area_body_exited(body):
	if body.name == "player":
		GameState.close_to_present = false
		$open_present.visible = false

func _on_AnimationPlayer_animation_finished(anim_name):
	$kado_player.play("brief")

func _on_kado_player_animation_finished(anim_name):
	GameState.finished_reading = true

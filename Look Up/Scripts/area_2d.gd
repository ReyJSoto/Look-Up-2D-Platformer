extends Area2D


#Called when player enters this zone when falling out the map
func _on_body_entered(body):
	if body.name == "Player":
		await get_tree().create_timer(0.065).timeout
		body.die()
		await get_tree().create_timer(1.5).timeout
		body.respawn()

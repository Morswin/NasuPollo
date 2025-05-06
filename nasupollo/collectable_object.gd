class_name CollectableObject
extends Area3D


const FALL_SPEED = 3.0


func _physics_process(delta):
	position.y -= FALL_SPEED * delta

func _on_body_entered(body):
	if body.is_in_group("Player"):
		print_debug("Gain points!")
		queue_free()
	elif body.is_in_group("Environment"):
		print_debug("Damage player!")
		queue_free()

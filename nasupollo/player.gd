extends CharacterBody3D


const SPEED = 450.0
const SPEED_MAX = 4.5
const SPEED_AIR = 100.0
const GRAVITY = 50.0
const FRICTION = 0.1
const FRICTION_AIR = 0.005
const JUMP = 10.0


func _physics_process(delta):
	var input_direction = Input.get_axis("MoveLeft", "MoveRight")
	if input_direction != 0.0:
		if is_on_floor():
			velocity.x += input_direction * SPEED * delta
		else:
			velocity.x += input_direction * SPEED_AIR * delta
		velocity.x = clamp(velocity.x, -SPEED_MAX, SPEED_MAX)
	else:
		if is_on_floor():
			velocity.x = lerp(velocity.x, 0.0, FRICTION)
		else:
			velocity.x = lerp(velocity.x, 0.0, FRICTION_AIR)
	if is_on_floor() and Input.is_action_just_pressed("Jump"):
		velocity.y += JUMP
	velocity.y -= GRAVITY * delta
	move_and_slide()

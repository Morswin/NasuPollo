class_name Player
extends CharacterBody3D


const SPEED = 450.0
const SPEED_MAX = 4.5
const SPEED_AIR = 100.0
const GRAVITY = 50.0
const FRICTION = 0.1
const FRICTION_AIR = 0.005
const JUMP = 10.0


func _physics_process(delta):
	if !GameState.game_paused:
		var input_direction = Input.get_axis("MoveLeft", "MoveRight")
		if input_direction != 0.0:
			if is_on_floor():
				velocity.x += input_direction * self.SPEED * delta
			else:
				velocity.x += input_direction * self.SPEED_AIR * delta
			velocity.x = clamp(velocity.x, -self.SPEED_MAX, self.SPEED_MAX)
		else:
			if is_on_floor():
				velocity.x = lerp(velocity.x, 0.0, self.FRICTION)
			else:
				velocity.x = lerp(velocity.x, 0.0, self.FRICTION_AIR)
		if is_on_floor() and Input.is_action_just_pressed("Jump"):
			velocity.y += self.JUMP
		velocity.y -= self.GRAVITY * delta
		move_and_slide()

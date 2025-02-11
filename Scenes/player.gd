extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

var firing = false

func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("fire") and not firing:
		firing = true
		print("disparo")
		$AnimatedSprite2D.stop()
		$AnimatedSprite2D.play("fire", true)
	elif Input.is_action_just_released("fire"):
		firing = false
	
	var direction := Input.get_axis("move_left", "move_right")
	if direction != 0:
		velocity.x = direction * SPEED
		if not $AnimatedSprite2D.is_playing() or $AnimatedSprite2D.animation != "walk":
			$AnimatedSprite2D.play("walk")
		$AnimatedSprite2D.flip_h = velocity.x > 0
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		if not $AnimatedSprite2D.is_playing() or $AnimatedSprite2D.animation != "Idle":
			$AnimatedSprite2D.play("Idle")

	move_and_slide()

extends CharacterBody2D

const SPEED = 300.0
const SHOOT = preload("res://Scenes/shoot.tscn")

var can_shoot = true

func _physics_process(delta: float) -> void:
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
	
	if Input.is_action_just_pressed("fire") and can_shoot:
		$AnimatedSprite2D.play("fire")
		$AudioStreamPlayer2D.play()		
		fire()

	move_and_slide()

func fire():
	can_shoot = false
	
	var shoot = SHOOT.instantiate()
	shoot.position = position - Vector2(0, 120)
	get_parent().add_child(shoot)

	
	shoot.bullet_freed.connect(Callable(self, "_on_bullet_free"))

func _on_bullet_free():
	can_shoot = true

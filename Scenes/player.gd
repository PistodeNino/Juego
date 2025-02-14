extends CharacterBody2D

const SPEED = 300.0
const SHOOT = preload("res://Scenes/shoot.tscn")

var can_shoot = true
var animated_sprite: AnimatedSprite2D
var audio_player: AudioStreamPlayer2D

func _ready() -> void:
	animated_sprite = $AnimatedSprite2D
	audio_player = $AudioStreamPlayer2D

func _physics_process(delta: float) -> void:
	var direction := Input.get_axis("move_left", "move_right")
	velocity.x = direction * SPEED
	
	if direction != 0:
		update_animation("walk")
		animated_sprite.flip_h = velocity.x > 0
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		update_animation("Idle")
	
	if Input.is_action_just_pressed("fire") and can_shoot:
		update_animation("fire")
		audio_player.play()
		fire()

	move_and_slide()

func update_animation(anim: String) -> void:
	if not animated_sprite.is_playing() or animated_sprite.animation != anim:
		animated_sprite.play(anim)

func fire() -> void:
	can_shoot = false
	var shoot = SHOOT.instantiate()
	shoot.position = position - Vector2(0, 120)
	get_parent().add_child(shoot)
	shoot.bullet_freed.connect(Callable(self, "_on_bullet_free"))

func _on_bullet_free() -> void:
	can_shoot = true

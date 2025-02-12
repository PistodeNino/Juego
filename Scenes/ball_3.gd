extends RigidBody2D

@export var bounciness: float = 1  
@export var lateral_force: float = 500

@onready var audio_player = $AudioStreamPlayer2D

func _ready():
	physics_material_override = PhysicsMaterial.new()
	physics_material_override.bounce = bounciness 
	physics_material_override.friction = 0
	linear_velocity = Vector2(lateral_force, 0)
	
	
	self.body_entered.connect(_on_body_entered)

func _on_body_entered(body: Node) -> void:
	if body is Area2D and body.has_method("queue_free"):
		print("Impacto con", body.name)
		$AudioStreamPlayer2D.play()  # Reproducir sonido
		queue_free()  # Destruir la bola

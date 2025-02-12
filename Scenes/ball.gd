extends RigidBody2D

@export var bounciness: float = 0.8  # Cuánto rebota la bola (0 = sin rebote, 1 = rebote completo)

func _ready():
	# Configurar la física
	physics_material_override = PhysicsMaterial.new()
	physics_material_override.bounce = bounciness  # Ajusta el rebote
	physics_material_override.friction = 0.2  # Fricción para que no se deslice demasiado

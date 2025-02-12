extends RigidBody2D

@export var bounciness: float = 1  

func _ready():
	# Configurar la física
	physics_material_override = PhysicsMaterial.new()
	physics_material_override.bounce = bounciness 
	physics_material_override.friction = 0

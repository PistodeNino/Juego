extends RigidBody2D

@export var bounciness: float = 1  
@export var lateral_force: float = 200  

func _ready():
	add_to_group("big")
	physics_material_override = PhysicsMaterial.new()
	physics_material_override.bounce = bounciness 
	physics_material_override.friction = 0
	
	
	linear_velocity = Vector2(lateral_force, 0)  
	
	

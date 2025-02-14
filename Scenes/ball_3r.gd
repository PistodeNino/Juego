extends RigidBody2D

@export var bounciness: float = 1  
@export var lateral_force: float = - 500  

func _ready():
	add_to_group("small")
	print("Bola añadida al nivel.")
	physics_material_override = PhysicsMaterial.new()
	physics_material_override.bounce = bounciness 
	physics_material_override.friction = 0
	
	
	linear_velocity = Vector2(lateral_force, 0)
	
func _exit_tree():
	print("Bola eliminada.")
	if get_parent():  
		get_parent().eliminar_bola()

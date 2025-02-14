extends Node2D

var bolas_restantes = 8

func _ready():
	print("Nivel 3 iniciado con ", bolas_restantes, " bolas.")

# Función para restar bolas cuando se eliminan
func eliminar_bola():
	bolas_restantes -= 1
	print("Bola eliminada. Restantes: ", bolas_restantes)
	
	if bolas_restantes == 0:
		print("Todas las bolas eliminadas. Cambiando de nivel...")
		get_tree().change_scene_to_file("res://Scenes/nivel_1.tscn")

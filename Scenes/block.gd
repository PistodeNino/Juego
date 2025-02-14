extends StaticBody2D

func _ready():
	add_to_group("block")
	
func remove():
	queue_free()

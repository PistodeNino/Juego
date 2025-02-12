extends Area2D

var pixelsPerSecond : int = 180


# 
func _ready() -> void:
	$Sprite.play("shoot")



func _process(delta: float) -> void:
	position.y -= pixelsPerSecond * delta
	
	if position.y < 0:
		queue_free()

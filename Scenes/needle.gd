extends Node2D

var projectileHealth
# Called when the node enters the scene tree for the first time.
func _ready():
	projectileHealth = 100.0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	global_position.y += 8 * delta
	

func _on_area_2d_area_entered(area):
	queue_free()

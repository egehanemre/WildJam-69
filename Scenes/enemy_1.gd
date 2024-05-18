extends Node2D

@export var projectile: PackedScene

# Called when the node enters the scene tree for the first time.
func _ready():
	$Timer.timeout.connect(on_timer_timeout)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func on_timer_timeout():
	var iprojectile = projectile.instantiate()
	

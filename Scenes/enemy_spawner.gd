extends Node2D

@export var projectile_scene:PackedScene
@export var radius: int = 100
@export var big_enemy: bool

# Called when the node enters the scene tree for the first time.
func _ready():
	$SmallEnemy.timeout.connect(on_small_timer_timeout)
	$BigEnemy.timeout.connect(on_big_timer_timeout)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func on_small_timer_timeout():
	if big_enemy == true:
		return
		
	var random_direction = Vector2.LEFT.rotated(randf_range(0, PI))
	var spawn_position = global_position + (random_direction * radius)
	
	var projectile = projectile_scene.instantiate() as Node2D
	get_parent().add_child(projectile)
	projectile.global_position = spawn_position
	
func on_big_timer_timeout():
	if big_enemy == false:
		return
	
	var random_direction = Vector2.LEFT.rotated(randf_range(0, PI))
	var spawn_position = global_position + (random_direction * radius)
	
	var projectile = projectile_scene.instantiate() as Node2D
	get_parent().add_child(projectile)
	projectile.global_position = spawn_position

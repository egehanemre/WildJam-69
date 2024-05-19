extends Node2D

@export var projectile:PackedScene

# Called when the node enters the scene tree for the first time.
func _ready():
	$Timer.timeout.connect(on_timer_timeout)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func on_timer_timeout():
	$Golem/Point/GPUParticles2D.emitting = false
	$Golem.play("default")
	var tween = create_tween()
	tween.tween_property($Golem, "position", Vector2(-78, -9), 2)
	await get_tree().create_timer(3).timeout
	$Golem.play("attack")
	await get_tree().create_timer(1.5).timeout
	var arm = projectile.instantiate() as Node2D
	get_parent().add_child(arm)
	$AudioStreamPlayer2D.play()
	arm.global_position = $Golem/Point.global_position
	$Golem/Point/GPUParticles2D.emitting = true
	await get_tree().create_timer(0.2).timeout
	$Golem/Point/GPUParticles2D.emitting = false
	await get_tree().create_timer(1.8).timeout
	
	$Golem.play("default")
	await get_tree().create_timer(2).timeout
	tween = create_tween()
	tween.tween_property($Golem, "position", Vector2(168, -9), 3)
	

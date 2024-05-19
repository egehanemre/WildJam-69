extends Node2D

var bugHealth : int = 100
var laser_inside = false
var damage_timer = 0.0
var damage_interval = 0.1  # Apply damage every 0.1 seconds
var currentLaser = 3 # Default value, should be set via signal

func _process(delta):
	global_position.y += 10 * delta
	
	if laser_inside:
		damage_timer += delta
		if damage_timer >= damage_interval:
			apply_damage(5 * currentLaser)
			$GPUParticles2D.emitting = true
			damage_timer = 0.0
	else:
		$GPUParticles2D.emitting = false

func _on_area_2d_area_entered(area):
	if area.is_in_group("laser"):
		laser_inside = true
	if area.is_in_group("shiptop"):
		get_tree().change_scene_to_file("res://Scenes/game_over.tscn")
		

func _on_area_2d_area_exited(area):
	if area.is_in_group("laser"):
		laser_inside = false
		damage_timer = 0.0

func apply_damage(amount):
	bugHealth -= amount
	if bugHealth <= 0:
		die()

func die():
	queue_free()  
	
	get_tree().change_scene_to_file("res://Scenes/game_over.tscn")

func _on_energy_system_current_laser(value):
	currentLaser = value


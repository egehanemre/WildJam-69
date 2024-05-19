extends CharacterBody2D

signal scoreChange(value)

@onready var main = get_tree().get_root().get_node("Game")

var mousePosition
var currentArea

var laserPower : int

func _physics_process(delta):
	
	var vel : Vector2 = get_global_mouse_position() 
	if currentArea == 3:
		if position.x < vel.x:
				position.x += 1
		if position.x > vel.x:	
				position.x -= 1	
		if Input.is_action_pressed("use_laser"):
			#$Laser.visible = true
			$Laser/StaticBody2D/CollisionShape2D.disabled = false
			#laser power setup
			if laserPower == 3:
				var tween = get_tree().create_tween()
				tween.tween_property($Laser, "scale", Vector2(2, 1), 0.2)
			if laserPower == 2:
				var tween = get_tree().create_tween()
				tween.tween_property($Laser, "scale", Vector2(1, 1), 0.2)
			if laserPower == 1:
				var tween = get_tree().create_tween()
				tween.tween_property($Laser, "scale", Vector2(0.2, 1), 0.2)
			if laserPower == 0:
				$Laser/StaticBody2D/CollisionShape2D.disabled = true
		else:
			#$Laser.visible = false
			$Laser/StaticBody2D/CollisionShape2D.disabled = true
			var tween = get_tree().create_tween()			
			tween.tween_property($Laser, "scale", Vector2(0, 1), 0.1)
	else:
		$Laser/StaticBody2D/CollisionShape2D.disabled = true
		var tween = get_tree().create_tween()			
		tween.tween_property($Laser, "scale", Vector2(0, 1), 0.1)
	move_and_slide()
	
	#refing player.currentArea from "value" and assigning it to gun.currentArea
func _on_player_current_area_signal(value):
	currentArea = value

func _on_energy_system_current_laser(value):
	laserPower = value

func _on_static_body_2d_area_entered(area):
	if area.is_in_group("projectile"):
		emit_signal("scoreChange", 5)	

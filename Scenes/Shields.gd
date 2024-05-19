extends Node2D

signal currentHealth(value)

var currentArea : int
var shieldPower : int
var health : int = 100

func _ready():
	var tween = create_tween()
	tween.set_ease(Tween.EASE_IN_OUT)
	tween.tween_property($ShieldSprite, "scale", Vector2(0, 0), 0.1)


func _physics_process(delta):
	if currentArea == 1:
		$ShieldSprite/ShieldBody/CollisionShape2D.disabled = false
		if shieldPower == 3:
			var tween = create_tween()
			tween.set_ease(Tween.EASE_IN_OUT)
			tween.tween_property($ShieldSprite, "scale", Vector2(1.5, 1.3), 0.2)
			
		if shieldPower == 2:
			var tween = create_tween()
			tween.set_ease(Tween.EASE_IN_OUT)
			tween.tween_property($ShieldSprite, "scale", Vector2(0.8, 0.8), 0.15)

		if shieldPower == 1:
			var tween = create_tween()
			tween.set_ease(Tween.EASE_IN_OUT)
			tween.tween_property($ShieldSprite, "scale", Vector2(0.5, 0.7), 0.1)

		if shieldPower == 0:
			var tween = create_tween()
			tween.set_ease(Tween.EASE_IN_OUT)
			tween.tween_property($ShieldSprite, "scale", Vector2(0, 0), 0.1)
	else:
		$ShieldSprite/ShieldBody/CollisionShape2D.disabled = true
		var tween = create_tween()
		tween.set_ease(Tween.EASE_IN_OUT)
		tween.tween_property($ShieldSprite, "scale", Vector2(0, 0), 0.1)

func _on_player_current_area_signal(value):
	currentArea = value

func _on_energy_system_current_shield(value):
	shieldPower = value

func _on_shield_body_area_entered(area):
	if area.is_in_group("golem") and currentArea == 1:
		area.queue_free()
		do_damage(30)
		
func _on_area_2d_area_entered(area):
	if area.is_in_group("golem"):
		area.queue_free()
		do_damage(30)

func do_damage(dmg : int):
	if shieldPower != 0:
		health -= dmg / shieldPower
		emit_signal("currentHealth",health)
	if shieldPower == 3:
		health -= dmg / shieldPower
		emit_signal("currentHealth",health)	
	else:
		health -= 40	
		emit_signal("currentHealth",health)

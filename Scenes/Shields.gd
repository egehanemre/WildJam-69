extends Node2D

var currentArea : int
var shieldPower : int

func _ready():
	var tween = create_tween()
	tween.set_ease(Tween.EASE_IN_OUT)
	tween.tween_property($ShieldSprite, "scale", Vector2(0, 0), 0.1)
	

func _physics_process(delta):
	if currentArea == 1:
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
			tween.tween_property($ShieldSprite, "scale", Vector2(0.5, 0.), 0.1)

		if shieldPower == 0:
			var tween = create_tween()
			tween.set_ease(Tween.EASE_IN_OUT)
			tween.tween_property($ShieldSprite, "scale", Vector2(0, 0), 0.1)
	else:
		var tween = create_tween()
		tween.set_ease(Tween.EASE_IN_OUT)
		tween.tween_property($ShieldSprite, "scale", Vector2(0, 0), 0.1)

func _on_player_current_area_signal(value):
	currentArea = value

func _on_energy_system_current_shield(value):
	shieldPower = value

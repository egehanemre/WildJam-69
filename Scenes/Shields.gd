extends Node2D

var currentArea : int
var shieldPower : int

func _ready():
	$ShieldSprite.visible = false

func _physics_process(delta):
	print(shieldPower)
	print(currentArea)
	if currentArea == 1:
		if shieldPower == 3:
			$ShieldSprite.visible = true
			
		if shieldPower == 2:
			$ShieldSprite.visible = true

		if shieldPower == 1:
			$ShieldSprite.visible = true

		if shieldPower == 0:
			$ShieldSprite.visible = false
	else:
		$ShieldSprite.visible = false		

func _on_player_current_area_signal(value):
	currentArea = value

func _on_energy_system_current_shield(value):
	shieldPower = value

extends Node2D

signal currentShield(value)
signal currentLaser(value)

var currentArea : int 
var shieldPower : int = 0
var laserPower : int = 3

func _ready():
	shieldPower = 0
	laserPower = 3

func _physics_process(delta):
	if currentArea == 1:
		EnergyManager()


func _on_player_current_area_signal(value):
		currentArea = value

func EnergyManager():
	if Input.is_action_just_pressed("energy_up"):
		if shieldPower < 3:
			shieldPower += 1
			laserPower -= 1
			print(shieldPower)
			print(laserPower)
			emit_signal("currentShield", shieldPower)	
			emit_signal("currentLaser", laserPower)
	
	if Input.is_action_just_pressed("energy_down"):
		if laserPower < 3:
			shieldPower-= 1
			laserPower+= 1
			emit_signal("currentShield", shieldPower)	
			emit_signal("currentLaser", laserPower)	
	

	

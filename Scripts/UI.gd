extends Control

var shieldPower : int
var laserPower : int
var healthPower : int = 100

@onready var label = $Label
@onready var label_2 = $Label2
@onready var label_3 = $Label3


func _ready():
	laserPower = 3
	shieldPower = 0
	
func _process(delta):
	label.text = "ShieldPower: " + str(shieldPower)
	label_2.text = "Laser Power:" + str(laserPower)
	label_3.text = "Health: " + str(healthPower)

func _on_energy_system_current_laser(value):
	laserPower = value

func _on_energy_system_current_shield(value):
	shieldPower = value

func _on_shields_current_health(value):
	healthPower = value
	if healthPower < 1:
		healthPower = 0
		print("gameover")

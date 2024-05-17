extends Control

var shieldPower : int
var laserPower : int

@onready var label = $Label
@onready var label_2 = $Label2

func _ready():
	laserPower = 3
	shieldPower = 0
	
func _process(delta):
	label.text = "ShieldPower: " + str(shieldPower)
	label_2.text = "Laser Power:" + str(laserPower)

func _on_energy_system_current_laser(value):
	laserPower = value

func _on_energy_system_current_shield(value):
	shieldPower = value

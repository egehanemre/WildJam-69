extends Control

signal scoreSend(value)

var shieldPower : int
var laserPower : int
var healthPower : int = 100
var score: int = 0

@onready var label = $Label
@onready var label_2 = $Label2
@onready var label_3 = $Label3
@onready var label_4 = $Label4

func _ready():
	laserPower = 3
	shieldPower = 0
	
func _process(delta):
	label.text = "ShieldPower: " + str(shieldPower)
	label_2.text = "Laser Power: " + str(laserPower)
	label_3.text = "Health: " + str(healthPower)
	label_4.text = "Score: " + str(score)
	
	Global.HighScore = score

func _on_energy_system_current_laser(value):
	laserPower = value

func _on_energy_system_current_shield(value):
	shieldPower = value

func _on_shields_current_health(value):
	healthPower = value
	if healthPower < 1:
		healthPower = 0
		
		Global.HighScore = score
		
		get_tree().change_scene_to_file("res://Scenes/game_over.tscn")


func _on_gun_score_change(value):
	score += value

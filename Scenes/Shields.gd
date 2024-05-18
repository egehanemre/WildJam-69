extends Node2D

var currentArea : int
var shieldPower : int

func _ready():
	$LeftShields/ShieldLeft.visible = false
	$LeftShields/ShieldLeft2.visible = false
	$LeftShields/ShieldLeft3.visible = false
	$RightShields/ShieldRight.visible = false
	$RightShields/ShieldRight2.visible = false
	$RightShields/ShieldRight3.visible = false

func _physics_process(delta):
	
	# Set the visibility based on shieldPower
	if shieldPower == 3:
		$LeftShields/ShieldLeft3.visible = true
		$RightShields/ShieldRight3.visible = true
	if shieldPower == 2:
		$LeftShields/ShieldLeft2.visible = true
		$RightShields/ShieldRight2.visible = true
		
		$LeftShields/ShieldLeft3.visible = false
		$RightShields/ShieldRight3.visible = false
	if shieldPower == 1:
		$LeftShields/ShieldLeft.visible = true
		$RightShields/ShieldRight.visible = true
		
		$LeftShields/ShieldLeft2.visible = false
		$RightShields/ShieldRight2.visible = false
	if shieldPower == 0:
		$LeftShields/ShieldLeft.visible = false
		$RightShields/ShieldRight.visible = false

func _on_player_current_area_signal(value):
	currentArea = value

func _on_energy_system_current_shield(value):
	shieldPower = value

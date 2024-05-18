extends Node2D

var currentArea : int 

func _physics_process(delta):
	if currentArea == 1:
		$Sprite2D.visible = true
		$Sprite2D2.visible = true
	else:
		$Sprite2D.visible = false
		$Sprite2D2.visible = false	
		
func _on_player_current_area_signal(value):
	currentArea = value


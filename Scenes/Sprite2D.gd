extends Sprite2D

var currentArea : int 

func _physics_process(delta):
	
	if currentArea == 2:
		$ShieldLeft/CollisionShape2D.disabled = false
		$"../Sprite2D2/ShieldRight/CollisionShape2D".disabled = false
	else:
		$ShieldLeft/CollisionShape2D.disabled = true
		$"../Sprite2D2/ShieldRight/CollisionShape2D".disabled = true	
		
func _on_player_current_area_signal(value):
	currentArea = value

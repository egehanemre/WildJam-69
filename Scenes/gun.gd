extends CharacterBody2D

@onready var main = get_tree().get_root().get_node("Game")

var mousePosition
var currentArea

func _physics_process(delta):
	
	var vel : Vector2 = get_global_mouse_position() 
	
	if currentArea == 3:
		if position.x < vel.x:
				position.x += 1
		if position.x > vel.x:	
				position.x -= 1	
		
		if Input.is_action_pressed("use_laser"):
			$AnimatedSprite2D/Sprite2D.visible = true
			$AnimatedSprite2D/Sprite2D/StaticBody2D/CollisionShape2D.disabled = false
		else:
			$AnimatedSprite2D/Sprite2D.visible = false
			$AnimatedSprite2D/Sprite2D/StaticBody2D/CollisionShape2D.disabled = true
		
	move_and_slide()
	
	#refing player.currentArea from "value" and assigning it to gun.currentArea
func _on_player_current_area_signal(value):
	currentArea = value

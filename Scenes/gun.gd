extends CharacterBody2D

var mousePosition

func _physics_process(delta):
	
	var vel : Vector2 = get_global_mouse_position() 
	if position.x < vel.x:
		position.x += 1
	if position.x > vel.x:	
		position.x -= 1
	
	move_and_slide()
	

extends CharacterBody2D

signal currentAreaSignal(value)

const SPEED : int = 100
const GRAVITY : int = 900
const JUMP_FORCE : int = 400

@export var currentArea : int = 0

@onready var animated_sprite_2d = $AnimatedSprite2D

func _physics_process(delta):
	
	var direction = Input.get_axis("move_left","move_right")
		
	#movement
	if direction:
		velocity.x = direction * SPEED 
		if is_on_floor():
			animated_sprite_2d.play("move")
	else:
		velocity.x = 0
		if is_on_floor():
			animated_sprite_2d.play("idle")
	
	#apply gravity
	if not is_on_floor():
		velocity.y += GRAVITY * delta
	
	#rotations
	if direction > 0:
		animated_sprite_2d.flip_h = false
	elif direction < 0:
		animated_sprite_2d.flip_h = true
		
	move_and_slide()


func _on_area_1_body_entered(body):
		currentArea = 1
		emit_signal("currentAreaSignal",currentArea)

func _on_area_2_body_entered(body):
		currentArea = 2
		emit_signal("currentAreaSignal",currentArea)
	
func _on_area_3_body_entered(body):
		currentArea = 3	
		emit_signal("currentAreaSignal",currentArea)
	
	
func _on_area_3_body_exited(body):
	currentArea = 0
	emit_signal("currentAreaSignal",currentArea)
	
func _on_area_2_body_exited(body):
	currentArea = 0
	emit_signal("currentAreaSignal",currentArea)
	
func _on_area_1_body_exited(body):
	currentArea = 0
	emit_signal("currentAreaSignal",currentArea)


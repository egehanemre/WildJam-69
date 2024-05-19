extends Control

func _physics_process(delta):
	var score = Global.HighScore
	$Score.text = "SCORE: " + str(score)

func _on_button_pressed():
	get_tree().change_scene_to_file("res://menu.tscn")

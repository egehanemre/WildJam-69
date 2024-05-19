extends Control
var options
var menu
var video
var audio

# Called when the node enters the scene tree for the first time.
func _ready():
	menu = $Main
	options = $Options
	video = $Video
	audio = $Audio

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_start_pressed():
	get_tree().change_scene_to_file("res://Scenes/game.tscn")


func _on_quit_pressed():
	get_tree().quit()


func _on_options_pressed():
	show_and_hide(options, menu)

func show_and_hide(first, second):
	first.show()
	second.hide()


func _on_video_pressed():
	show_and_hide(video, options)


func _on_audio_pressed():
	show_and_hide(audio, options)


func _on_back_from_options_pressed():
	show_and_hide(menu, options)


func _on_full_screen_toggled(toggled_on):
	if toggled_on:	
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)


func _on_vsync_toggled(toggled_on):
	if toggled_on:
		DisplayServer.window_set_vsync_mode(DisplayServer.VSYNC_ENABLED)
	else:
		DisplayServer.window_set_vsync_mode(DisplayServer.VSYNC_DISABLED)



func _on_back_from_videos_pressed():
	show_and_hide(options, video)


func _on_master_value_changed(value):
	volume(0, value)

func volume(bus_index, value):
	AudioServer.set_bus_volume_db(bus_index, value)


func _on_back_from_audio_pressed():
	show_and_hide(options, audio)


func _on_tutorial_pressed():
	get_tree().change_scene_to_file("res://Scenes/tutorial.tscn")

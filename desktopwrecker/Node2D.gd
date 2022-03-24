extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	get_tree().get_root().set_transparent_background(true)
	OS.set_window_maximized(true)
	OS.set_borderless_window(true)
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	

func _process(delta):
	
	if Input.is_action_pressed("exit"):
		get_tree().quit()
	if Input.is_action_just_pressed("restart"):
		get_tree().reload_current_scene()


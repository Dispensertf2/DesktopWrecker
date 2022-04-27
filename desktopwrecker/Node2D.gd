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
	
	$Node2D/Panel/RichTextLabel.text = "Current Tool: " + str($Cursor.mode) + " | " + "Current Entity: " + str($Cursor.entitytype)
	
	



func _on_Button1_pressed():
	$Cursor.mode += 1


func _on_Button2_pressed():
	$Cursor.mode -= 1


func _on_Button3_pressed():
	$Cursor.entitytype += 1


func _on_Button4_pressed():
	$Cursor.entitytype -= 1

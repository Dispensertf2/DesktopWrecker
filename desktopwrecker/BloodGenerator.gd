extends Node2D

const Blood = preload("res://Blood.tscn")


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_BloodStopTimer_timeout():
	$BloodTimer.stop()
	self.queue_free()


func _on_BloodTimer_timeout():
	var blood = Blood.instance()
	get_parent().add_child(blood)
	blood.position = self.global_position

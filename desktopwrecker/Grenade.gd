extends RigidBody2D

const Explosion = preload("res://Explosion.tscn")


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Timer_timeout():
	var explosion = Explosion.instance()
	get_parent().add_child(explosion)
	explosion.position = $Sprite.global_position
	self.queue_free()

extends PathFollow2D


const Grenade = preload("res://Grenade.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


func _process(delta):
	offset += 15


func _on_Timer_timeout():
	self.queue_free()


func _on_Timer2_timeout():
	var grenade = Grenade.instance()
	get_parent().add_child(grenade)
	grenade.position = $Position2D.global_position

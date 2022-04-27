extends Node2D

var rng = RandomNumberGenerator.new()


# Called when the node enters the scene tree for the first time.
func _ready():
	rng.randomize()
	
	var rotation = rng.randi_range(1,180)
	
	$Sprite.rotation = rotation

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass





func _on_Timer_timeout():
	self.queue_free()


func _on_Area2D_area_entered(area):
	if area.is_in_group("button"):
		print("lol")

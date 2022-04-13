extends Node2D

var rng = RandomNumberGenerator.new()


# Called when the node enters the scene tree for the first time.

	
	
func _ready():
	$Explosion/AnimationPlayer.play("Explosion")
	$AudioStreamPlayer2D.stream = load("res://Assets/Audio/explosion.wav")
	$AudioStreamPlayer2D.play()
	
	rng.randomize()
	
	var rotation = rng.randi_range(1,180)
	
	$Burn.rotation = rotation



func _on_ExplosionTimer_timeout():
	$Explosion.queue_free()

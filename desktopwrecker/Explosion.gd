extends Node2D



func _ready():
	$Explosion/AnimationPlayer.play("Explosion")
	$AudioStreamPlayer2D.stream = load("res://Assets/Audio/explosion.wav")
	$AudioStreamPlayer2D.play()



func _on_ExplosionTimer_timeout():
	$Explosion.queue_free()

extends KinematicBody2D


var movement = Vector2()

var rng = RandomNumberGenerator.new()

var dead = false

var status = 0

var movespeed = 300

# Called when the node enters the scene tree for the first time.
func _ready():
	rng.randomize()


func _physics_process(delta):
	if dead == false:
		if status == 0:
			movement.x = movespeed
			movement.y = movespeed
		if status == 1:
			movement.x = -movespeed
			movement.y = -movespeed
		if status == 2:
			movement.x = movespeed
			movement.y = -movespeed
		if status == 3:
			movement.x = -movespeed
			movement.y = movespeed
		if status == 3:
			movement.x = -movespeed
			movement.y = 0
			
		move_and_slide(movement)
	if dead == true:
		movement.x = 0
		movement.y += 75
		move_and_slide(movement)
		


func _on_Timer_timeout():
	status = rng.randi_range(0,4)


func _on_Area2D_area_entered(area):
	if area.is_in_group("Hit") or area.is_in_group("deathzone"):
		dead = true

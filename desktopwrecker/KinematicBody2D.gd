extends KinematicBody2D

var up = Vector2(0,-1)

const BloodGenerator = preload("res://BloodGenerator.tscn")

var rng = RandomNumberGenerator.new()
var status = 0
var flipped = false
var dead = false

var bleeding = false

var maxfall = 1700
var gravity = 50
var walkspeed = 20

var motion = Vector2()

func _ready():
	rng.randomize()

func _physics_process(delta):
	motion.y += gravity
	
	clamp(motion.x, -walkspeed, walkspeed)
	
	if motion.y > maxfall:
		motion.y = maxfall

	if motion.y < maxfall and is_on_floor():
		motion.y = 0
	
	if motion.y == maxfall and is_on_floor():
		dead = true
	
	
	if dead == false:
		if status == 0:
			$AnimationPlayer.play("Idle")
			motion.x = 0
		if status == 1:
			$AnimationPlayer.play("Walking")
			motion.x = walkspeed
		if status == 2:
			$AnimationPlayer.play("WalkReverse")
			motion.x = -walkspeed
	if dead == true:
		
		$Timer.stop()
		$AnimationPlayer.play("Dead")
		
		if bleeding == false:
				bleeding = true
				for x in range(30):
					bleed()
		if bleeding == true:
			pass
			
		
		
		motion.x = 0
		
		
			
			
	
	move_and_slide(motion, up)

			


func _on_Timer_timeout():
	status = rng.randi_range(0,2)
	
func bleed():
	var bg = BloodGenerator.instance()
	get_parent().add_child(bg)
	bg.position = $Sprite.global_position

func _on_Area2D_area_entered(area):

	if area.is_in_group("explosion") or area.is_in_group("Bullet") or area.is_in_group("Hit") or area.is_in_group("deathzone"):
		dead = true
	
	
			
		

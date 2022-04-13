extends RigidBody2D

var exploder= false
var exploded = false

var motion = Vector2()

const Explosion = preload("res://Explosion.tscn")

func _ready():
	pass

func _process(delta):
	
	if exploded == true:
		pass
	else:
		if exploder == true:
			var explosion = Explosion.instance()
			get_parent().add_child(explosion)
			explosion.position = $Sprite.global_position
			exploded = true
		else:
			pass
	
func _physics_process(delta):
	move_local_x(motion.x)


func _on_ExplosionZone_area_entered(area):
	if area.is_in_group("explosion") or area.is_in_group("Bullet"):
		exploder = true
		$AnimationPlayer.play("Exploded")
	if area.is_in_group("Hit"):
		if exploded == false:
			motion.x = -5

extends Node2D

var mode = 0

var entitytype = 0

#Impact sprites
const Hit = preload("res://Hit.tscn")
const Bullet = preload("res://Bullet.tscn")
const Foam = preload("res://Foam.tscn")
const Explosion = preload("res://Explosion.tscn")
const Car = preload("res://Car.tscn")


#Entitys
const Grenade = preload("res://Grenade.tscn")
const StickGuys = preload("res://KinematicBody2D.tscn")
const Water = preload("res://Water.tscn")
const GrenadeAirstrike = preload("res://GrenadeAirstrike.tscn")

#Audio
onready var player = $AudioStreamPlayer2D

var firing = true

func _ready():
	pass

func _process(delta):
	$AnimationPlayer.seek(0)
	var direction = get_global_mouse_position()
	
	self.position.x = direction.x
	self.position.y = direction.y
	
	if Input.is_action_just_pressed("leftclick"):
		if mode == 0:
			$AnimationPlayer.play("Click")
		if mode == 1:
			$AnimationPlayer.play("HammerSmash")
			var hit = Hit.instance()
			get_parent().add_child(hit)
			hit.position = $Cursor.global_position
			player.stream = load("res://Assets/Audio/hammer.wav")
			player.play()
		elif mode == 2:
			player.stream = load("res://Assets/Audio/machinegun.wav")
			player.play()
		elif mode == 4:
			$AnimationPlayer.play("CannonFire")
			var cannon = Explosion.instance()
			get_parent().add_child(cannon)
			cannon.position.x = $Cursor.global_position.x - 64
			cannon.position.y = $Cursor.global_position.y - 64
		elif mode == 5:
			var grenade = Grenade.instance()
			get_parent().add_child(grenade)
			grenade.position = $Cursor.global_position
		elif mode == 6:
			if entitytype == 0:
				var stick = StickGuys.instance()
				get_parent().add_child(stick)
				stick.position = $Cursor.global_position
			elif entitytype == 1:
				pass
			elif entitytype == 2:
				var car = Car.instance()
				get_parent().add_child(car)
				car.position = $Cursor.global_position
			else:
				entitytype = 0
		elif mode == 7:
			var gn = GrenadeAirstrike.instance()
			get_parent().add_child(gn)
			
			
		
	
	if Input.is_action_pressed("leftclick"):
		if mode == 2:
			
			firing = true
			var bullet = Bullet.instance()
			get_parent().add_child(bullet)
			bullet.position.x = $Cursor.global_position.x - 64
			bullet.position.y = $Cursor.global_position.y - 64
			$AnimationPlayer.play("GunShoot")
			
		elif mode == 3:
			var foam = Foam.instance()
			get_parent().add_child(foam)
			foam.position.x = $Cursor.global_position.x - 64
			foam.position.y = $Cursor.global_position.y - 64
		elif mode == 6:
			if entitytype == 1:
				var water = Water.instance()
				get_parent().add_child(water)
				water.position = $Cursor.global_position
			elif entitytype == 2:
				pass
			
				
			
	else:
		
		if mode == 0:
			$AnimationPlayer.play("Default")
		elif mode == 1:
			$AnimationPlayer.play("Hammer")
		elif mode == 2:
			$AnimationPlayer.play("Gun")
			player.stop()
		elif mode == 3:
			$AnimationPlayer.play("FireExtingisher")
			player.stop()
		elif mode == 4:
			$AnimationPlayer.play("Cannon")
		elif mode == 5:
			$AnimationPlayer.play("Grenade")
		elif mode == 6:
			$AnimationPlayer.play("Add")
		elif mode == 7:
			$AnimationPlayer.play("Airstrike")
			
		else:
			mode = 0
	
	if Input.is_action_just_pressed("scrollwheelup"):
		mode += 1
	if Input.is_action_just_pressed("enttype"):
		entitytype += 1







 extends KinematicBody2D

var eating = false
var walking = false

var xdir = 1 #1 right, -1 left
var ydir = 1 #1 down, -1 up
var speed = 5

var motion = Vector2()

var moving_verticle_horizontal = 1 #1 = hor, 2 = vert

func _ready():
	walking = true
	randomize()
	
func _physics_process(delta):
	var wait_time = 1
	if walking == false:
		var x = rand_range(1, 2)
		if x > 1.5:
			moving_verticle_horizontal = 1
		else:
			moving_verticle_horizontal = 2
	
	if walking == true:
		$AnimatedSprite.play("walking")
		if moving_verticle_horizontal == 1:
			if xdir == -1:
				$AnimatedSprite.flip_h = true
			if xdir == 1:
				$AnimatedSprite.flip_h = false
			motion.x = speed * xdir
			motion.y = 0
		elif moving_verticle_horizontal == 2:
			motion.y = speed * ydir
			motion.x = 0	
			
	if eating == true:
		$AnimatedSprite.play("eating")
		motion.x = 0
		motion.y = 0
		
	move_and_slide(motion)
			

func _on_change_state_timer_timeout():
	var wait_time = 1
	if walking == true:
		eating = true
		walking = false
		wait_time = rand_range(1, 5)
	elif eating == true:
		walking = true
		eating = false
		wait_time = rand_range(2, 6)
	$change_state_timer.wait_time = wait_time
	$change_state_timer.start()


func _on_walking_timer_timeout():
	var x = rand_range(1, 2)
	var y = rand_range(1, 2)
	var wait_time = rand_range(1, 4)
	
	if x > 1.5:
		xdir = 1 #right
	else:
		xdir = -1 #left
	if y > 1.5:
		ydir = 1 #down
	else:
		ydir = -1 #left
	$walking_timer.wait_time = wait_time
	$walking_timer.start()

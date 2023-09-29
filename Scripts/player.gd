extends KinematicBody2D

var speed = 50
var motion = Vector2.ZERO

func _physics_process(delta):
	if Input.is_action_pressed("ui_right"):
		motion.x = speed
		motion.y = 0
		$AnimatedSprite.play("sidewalk")	
		$AnimatedSprite.flip_h = true
	elif Input.is_action_pressed("ui_left"):
		motion.x = -speed
		motion.y = 0
		$AnimatedSprite.flip_h = false
		$AnimatedSprite.play("sidewalk")		
	elif Input.is_action_pressed("ui_down"):
		motion.y = speed
		motion.x = 0
		$AnimatedSprite.play("downwalk")		
	elif Input.is_action_pressed("ui_up"):
		motion.y = -speed
		motion.x = 0
		$AnimatedSprite.play("upwalk")		
	else:
		$AnimatedSprite.play("idle")
		motion.x = 0
		motion.y = 0
		
	if self.position.x < 20:
		Global.camera_pos = 2
	else:
		Global.camera_pos = 1
		
	move_and_slide(motion)
	
func player():
	pass
	
func player_sell_method():
	pass
	
func player_shop_method():
	pass
	


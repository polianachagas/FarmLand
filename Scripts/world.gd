extends Node2D

const camera_position1x = 160
const camera_position1y = 89

const camera_position2x = -62
const camera_position2y = 89

func _ready():
	$area2/ColorRect.rect_size.x = 143

func _physics_process(delta):
	$overlay/carrot_text.text = ("= " + str(Global.number_carrots))
	$overlay/onion_text.text = ("= " + str(Global.number_onions))
	$overlay/berry_text.text = ("= " + str(Global.number_berries))
	$overlay/coin_text.text = str("= " + str(Global.coins))
	
	if Global.camera_pos == 1:
		$Camera2D.position.x = camera_position1x
		$Camera2D.position.y = camera_position1y
	elif Global.camera_pos == 2:
		$Camera2D.position.x = camera_position2x
		$Camera2D.position.y = camera_position2y

func _on_open_farming_zone2_body_entered(body):
	if body.has_method("player"):
		if $area2/open_farming_zone2/CollisionShape2D.disabled == false:
			Global.camera_pos = 2
			$area2/AnimationPlayer.play("build_field")
			$area2/open_farming_zone2/CollisionShape2D.disabled = true

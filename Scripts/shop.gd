extends StaticBody2D

func _ready():
	$shop_menu.visible = false
	
func _process(delta):
	if Global.weather == "rain":
		$worker.visible = false
	elif Global.weather == "none":
		$worker.visible = true
		
	if $shop_menu.item1_owned == true:
		$berry_seedpack.visible = true
	if $shop_menu.item2_owned == true:
	#	$random_seedpack.visible = true
		print("random")

func _on_Area2D_body_entered(body):
	if body.has_method("player_shop_method"):\
		$shop_menu.visible = true

func _on_Area2D_body_exited(body):
	$shop_menu.visible = false

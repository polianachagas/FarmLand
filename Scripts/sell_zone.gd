extends StaticBody2D

func _on_Area2D_body_entered(body):
	if body.has_method("player_sell_method"):
		var carrots = Global.number_carrots
		var onions = Global.number_onions
		var berries = Global.number_berries
		var coins = Global.coins
		
		coins += carrots * 5
		coins += onions * 8
		coins += berries * 10
		
		carrots = 0
		onions = 0
		berries = 0
		
		Global.coins = coins
		Global.number_carrots = carrots
		Global.number_onions = onions
		Global.number_berries = berries
		

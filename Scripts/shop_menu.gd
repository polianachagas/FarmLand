extends StaticBody2D

#item 1 = berry
#item 2 = random

var item = 1

var item1_price = 100
var item2_price = 250

var item1_owned = false
var item2_owned = false

var price

func _ready():
	$icon.play("berry_seed")
	item = 1
	
func _physics_process(delta):
	if self.visible == true:
		if item == 1:
			$icon.play("berry_seed")
		if item == 2:
			$icon.play("random_seed")
		
func _on_button_left_pressed():
	swap_item_back()

func _on_button_right_pressed():
	swap_item_forward()
	
func _on_buy_button_pressed():
	if item == 1:
		price = item1_price
		if Global.coins >= price:
			if item1_owned == false:
				buy()
	elif item == 2:
		price = item2_price
		if Global.coins >= price:
			if item2_owned == false:
				buy()
	
func swap_item_back():
	if item == 1:
		item = 2
	elif item == 2:
		item = 1
		
func swap_item_forward():
	if item == 1:
		item = 2
	elif item == 2:
		item = 1
		
func buy():
	Global.coins -= price
	if item == 1:
		item1_owned = true
	if item == 2:
		item2_owned = true

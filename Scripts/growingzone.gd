extends StaticBody2D

var plant = Global.plant_selected
var plant_growing = false
var plant_grown = false

func _physics_process(delta):
	if plant_growing == false:
		plant = Global.plant_selected
		
func _on_Area2D_area_entered(area):
	if not plant_growing:
		if plant == 1:
			plant_growing = true
			$carrot_grow_timer.start()
			$plant.play("carrot_growing")
		if plant == 2:
			plant_growing = true
			$onion_grow_timer.start()
			$plant.play("onion_growing")
		if plant == 3:
			plant_growing = true
			$berry_grow_timer.start()
			$plant.play("berry_growing")
	else:
		print("plant is already growing here")
		
		
func _on_onion_grow_timer_timeout():
	var onion_plant = $plant
	if onion_plant.frame == 0:
		onion_plant.frame = 1
		$onion_grow_timer.start()
	elif onion_plant.frame == 1:
		onion_plant.frame = 2
		plant_grown = true
		

func _on_carrot_grow_timer_timeout():
	var carrot_plant = $plant
	if carrot_plant.frame == 0:
		carrot_plant.frame = 1
		$carrot_grow_timer.start()
	elif carrot_plant.frame == 1:
		carrot_plant.frame = 2
		plant_grown = true


func _on_Area2D_input_event(viewport, event, shape_idx):
	if Input.is_action_just_pressed("click"):
		if plant_grown:
			if plant == 1:
				Global.number_carrots += 1
				plant_growing = false
				plant_grown = false
				$plant.play("none")
			if plant == 2:
				Global.number_onions += 1
				plant_growing = false
				plant_grown = false
				$plant.play("none")
			if plant == 3:
				Global.number_berries += 1
				plant_growing = false
				plant_grown = false
				$plant.play("none")
			else:
				pass

func _on_berry_grow_timer_timeout():
	var berry_plant = $plant
	if berry_plant.frame == 0:
		berry_plant.frame = 1
		$berry_grow_timer.start()
	elif berry_plant.frame == 1:
		berry_plant.frame = 2
		plant_grown = true

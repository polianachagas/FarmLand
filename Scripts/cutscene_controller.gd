extends Node2D

var current_cutscene = "none" #none, newfarmingzone, etc

func _process(delta):
	Global.current_cutscene = current_cutscene
	
	if Global.new_farming_zone == true:
		if current_cutscene == "none":
			current_cutscene = "new_farming_zone"

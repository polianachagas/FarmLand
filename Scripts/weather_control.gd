extends StaticBody2D

var current_weather = "none" #none, rain, snow, wind etc

func _ready():
	if current_weather == "none":
		$rain.visible = false
		$rain_color.visible = false
	if current_weather == "rain":
		$rain.visible = true
		$rain_color.visible = true

func _on_Timer_timeout():
	if current_weather == "none":
		current_weather = "rain"
		$Timer.wait_time = rand_range(10, 30)
		$Timer.start()
	elif current_weather == "rain":
		current_weather = "none"
		$Timer.wait_time = rand_range(20, 60)
		$Timer.start()
		
func _process(delta):
	Global.weather = current_weather
	if current_weather == "none":
		$rain.visible = false
		$rain_color.visible = false
	if current_weather == "rain":
		$rain.visible = true
		$rain_color.visible = true
	
	
		

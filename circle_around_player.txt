func _ready():
	randomize() # randomizes the seed each time

func get_position():
	var kill_circle_centre = Vector2(player.global_position) # the centre to circle (player)
	var radius = 40 # circle radius
	var angle = randf() * PI * 2
	var x = kill_circle_centre.x + cos(angle) * radius
	var y = kill_circle_centre.y + sin(angle) * radius

	return Vector2(x,y)
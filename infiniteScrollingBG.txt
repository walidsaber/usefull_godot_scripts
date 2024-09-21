extends ParallaxBackground

# for 2 pictures

@onready var sprite_2d: Sprite2D = $ParallaxLayer/Sprite2D
@onready var sprite_2d_2: Sprite2D = $ParallaxLayer/Sprite2D2



var texture_width

func _ready():
	texture_width = 2083
	# Position the second sprite next to the first one
	sprite_2d_2.position.x = sprite_2d.position.x + texture_width

func _process(delta):
	# Move both sprites to the left
	sprite_2d.position.x -= 50 * delta
	sprite_2d_2.position.x -= 50 * delta

	# Reposition sprites when they move off-screen
	if sprite_2d.position.x <= -texture_width + 200:
		sprite_2d.position.x = sprite_2d_2.position.x + texture_width
	if sprite_2d_2.position.x <= -texture_width + 200:
		sprite_2d_2.position.x = sprite_2d.position.x + texture_width

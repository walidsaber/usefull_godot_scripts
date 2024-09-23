
var direction
var moving: bool = false
func _process(delta):
    pass
    # movement logic here apply it to direction
    direction = Vector2(0,0)
    move()

func move():
    if direction and moving == false:
        moving = true
        var tween = create_tween()
        tween.tween_property(self,"position", position + direction*tile_size, 0.35 )# 0,35 = speed
        tween.tween_callback(cant_move)
func cant_move():
    moving = false
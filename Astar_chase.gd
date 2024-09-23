func scatter(d,speed_scatter):
	if target_reached == false:
		var start_pos = tile_map.local_to_map(global_position)
		var target_pos = tile_map.local_to_map(nowa.global_position)
		var id_path = tile_map.astar.get_id_path(start_pos, target_pos).slice(1)
		if not id_path.is_empty():
			current_id_path = id_path
		if current_id_path.is_empty():
			return
		target_tilemap_position = current_id_path.front()
		target_global_position = tile_map.map_to_local(target_tilemap_position)
		if global_position.distance_to(target_global_position) < 0.5:
			global_position = target_global_position
			current_id_path.pop_front()

	if global_position != target_global_position and not target_reached:
		global_position = global_position.move_toward(target_global_position, speed_scatter/2 * d)

#ready : astar = tile_map.astar

#(tile map code)
func assigning_astar(P):
	if P == null:
		return
	astar = AStarGrid2D.new()
	astar.diagonal_mode = AStarGrid2D.DIAGONAL_MODE_NEVER
	astar.region = get_used_rect()
	astar.cell_size = tile_set.tile_size
	astar.update()
	
	var used_rect = get_used_rect()  # Get used rectangle from the tilemap
	for x in range(used_rect.size.x):
		for y in range(used_rect.size.y):
			var tile_position = Vector2i(x + used_rect.position.x, 
						y + used_rect.position.y)
			var tile_data = get_cell_tile_data(tile_position)
			if tile_data == null or tile_data.get_custom_data("walkable") == false:
				astar.set_point_solid(tile_position)

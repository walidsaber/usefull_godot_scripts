
# Update the object velocity with vel += steering( position, target_position, vel, delta )
# adjust MAX_VEL and MAX_FORCE values to control how the motion looks like

func steering( cur_pos, target_pos, cur_vel, delta ):
	var distance_to_target = target_pos - cur_pos
	var desired_vel = distance_to_target.normalized() * MAX_VEL
	steering_force = ( desired_vel - cur_vel ) / delta
	steering_force = steering_force.clamped( MAX_FORCE )
	return steering_force * delta
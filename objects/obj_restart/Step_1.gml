if mouse_check_button(mb_left) && collision_point(mouse_x,mouse_y,id,0,0) {
	with obj_hair_point
		instance_destroy()
	with obj_control
		event_user(0)
		
	mouse_clear(mb_any)
}
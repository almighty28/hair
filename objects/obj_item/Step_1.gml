if mouse_check_button(mb_left) && collision_point(mouse_x,mouse_y,id,0,0) {
	with obj_control {
		mode = other.type	
	}
	with obj_hair_point {
		drag = false
	}
	mouse_clear(mb_any)
}
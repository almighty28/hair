//surface_set_target(hair_surf)
//draw_clear_alpha(c_white,0)

//var dep = 0;
//var wdth = 5
//repeat(20) {
	
	//with obj_hair_point {
	//	if dep>array_length(points_x)-2 continue;

	//	shader_set(shd_vertex_texture2)
	//	shader_set_uniform_f(u_width,wdth)
	//	shader_set_uniform_i(u_index,dep)
	//	shader_set_uniform_f_array(u_tex_pos,h_arr_tex_pos)
	//	shader_set_uniform_f_array(u_point_x_arr,points_x)
	//	shader_set_uniform_f_array(u_point_y_arr,points_y)
	//	vertex_submit(global.h_buff,pr_trianglestrip,h_tex)
	//	shader_reset()
	
	//}
	//dep++;
//}


//gpu_set_texfilter(false)
//gpu_set_ztestenable(true)
//with obj_hair_point {
//	var p_l = array_length(points_x)
//	if p_l>1 {
//		shader_set(shd_vertex_texture)
//		shader_set_uniform_f(u_tex_pos,h_arr_tex_pos[0],h_arr_tex_pos[1],h_arr_tex_pos[2],h_arr_tex_pos[3])
//		shader_set_uniform_f(u_width,strt_scale/4)
//		shader_set_uniform_f(u_length,array_length(points_x)-1)
//		shader_set_uniform_f_array(u_point_x_arr,points_x)
//		shader_set_uniform_f_array(u_point_y_arr,points_y)
//		vertex_submit(global.h_buff,pr_trianglestrip,h_tex)
//		shader_reset()
//	}
//}
//gpu_set_ztestenable(false)
//gpu_set_texfilter(true)

//surface_reset_target()
//draw_surface(hair_surf,0,0)













draw_text(20,120,string(fps_real))
draw_text(20,140,string(fps))

//for (var i=0; i<array_length(hpos); i++) {
//	draw_circle(hpos[i][0],hpos[i][1],4,0)
//}
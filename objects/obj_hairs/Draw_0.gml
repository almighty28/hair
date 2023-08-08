surface_set_target(hair_surf)
draw_clear_alpha(c_white,0)

var dep = 0;
var wdth = strt_scale/4

for(var dep = 0;dep<array_length(hairs_arr)-1;dep++) {
	for (var k = 0;k<array_length(hairs_arr[dep]);k++) {
		
		shader_set(shd_vertex_texture2)
		shader_set_uniform_f(u_width,wdth)
		//shader_set_uniform_i(u_index,dep)
		shader_set_uniform_f_array(u_tex_pos,h_arr_tex_pos)
		shader_set_uniform_f_array(u_point_x_arr,hairs_arr[dep][k][0])
		shader_set_uniform_f_array(u_point_y_arr,hairs_arr[dep][k][1])
		shader_set_uniform_f_array(u_point_x_arr_next,hairs_arr[dep+1][k][0])
		shader_set_uniform_f_array(u_point_y_arr_next,hairs_arr[dep+1][k][1])
		vertex_submit(global.h_buff,pr_trianglestrip,h_tex)
		shader_reset()
	
	
	}
}



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


surface_reset_target()
draw_surface(hair_surf,0,0)
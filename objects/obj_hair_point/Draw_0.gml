//var p_l = array_length(points_x)
//if p_l>1 {
//	shader_set(shd_vertex_texture)
//	shader_set_uniform_f(u_tex_pos,h_arr_tex_pos[0],h_arr_tex_pos[1],h_arr_tex_pos[2],h_arr_tex_pos[3])
//	shader_set_uniform_f(u_width,5)
//	shader_set_uniform_f(u_length,array_length(points_x)-1)
//	shader_set_uniform_f_array(u_point_x_arr,points_x)
//	shader_set_uniform_f_array(u_point_y_arr,points_y)
//	vertex_submit(global.h_buff,pr_trianglestrip,h_tex)
//	shader_reset()
//}
	
//for (var i=0; i<array_length(points_x); i++)
//	draw_circle_color(points_x[i],points_y[i],2,c_aqua,c_aqua,false)
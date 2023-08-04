surface_set_target(hair_surf)
gpu_set_texfilter(false)
gpu_set_ztestenable(true)
draw_clear_alpha(c_white,0)

var dep = 0;
var rad = 5;
var col = make_color_rgb(254,106,0);
repeat(20) {
	
	with obj_hair_point {
		if dep>array_length(points_x)-2 continue;
		var dir = point_direction(points_x[dep],points_y[dep],points_x[dep+1],points_y[dep+1]);
		var start_y = 0;
		if dep > 0 {
			start_y = 0.33
		}
		if dep = array_length(points_x)-2 start_y = 0.67;
		else draw_circle_color(points_x[dep+1],points_y[dep+1],rad,col,col,false);
		draw_primitive_begin_texture(pr_trianglestrip,sprite_get_texture(spr_00,0));
		
			draw_vertex_texture(points_x[dep] + lengthdir_x(rad,dir-90),points_y[dep] + lengthdir_y(rad,dir-90),0,start_y);
			draw_vertex_texture(points_x[dep] + lengthdir_x(rad,dir+90),points_y[dep] + lengthdir_y(rad,dir+90),1,start_y);
			draw_vertex_texture(points_x[dep+1] + lengthdir_x(rad,dir-90),points_y[dep+1] + lengthdir_y(rad,dir-90),0,start_y+0.33);
			draw_vertex_texture(points_x[dep+1] + lengthdir_x(rad,dir+90),points_y[dep+1] + lengthdir_y(rad,dir+90),1,start_y+0.33);
		
		draw_primitive_end()
	
	
	}
	dep++;
}


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
gpu_set_ztestenable(false)
surface_reset_target()
gpu_set_texfilter(true)

draw_surface(hair_surf,0,0)













draw_text(20,120,string(fps_real))
draw_text(20,140,string(fps))

//for (var i=0; i<array_length(hpos); i++) {
//	draw_circle(hpos[i][0],hpos[i][1],4,0)
//}
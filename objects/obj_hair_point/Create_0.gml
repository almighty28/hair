drag = false
root_x = x
root_y = y
h_tex = sprite_get_texture(spr_00,0)
h_arr_tex_pos = sprite_get_uvs(spr_00,0)
array_resize(h_arr_tex_pos,4)
h_arr_tex_pos[3] = (h_arr_tex_pos[3]-h_arr_tex_pos[1])/3

//u_width = shader_get_uniform(shd_vertex_texture,"u_fWidth")
//u_length = shader_get_uniform(shd_vertex_texture,"u_fLength")
//u_tex_pos = shader_get_uniform(shd_vertex_texture,"u_vTex_pos")
//u_point_x_arr = shader_get_uniform(shd_vertex_texture,"u_fPoints_x")
//u_point_y_arr = shader_get_uniform(shd_vertex_texture,"u_fPoints_y")
u_width = shader_get_uniform(shd_vertex_texture2,"u_fWidth")
u_length = shader_get_uniform(shd_vertex_texture2,"u_fLength")
u_index = shader_get_uniform(shd_vertex_texture2,"u_iIndex")
u_tex_pos = shader_get_uniform(shd_vertex_texture2,"u_fTex_pos")
u_point_x_arr = shader_get_uniform(shd_vertex_texture2,"u_fPoints_x")
u_point_y_arr = shader_get_uniform(shd_vertex_texture2,"u_fPoints_y")

strt_scale = 20
p_scale = strt_scale

points_x = []
points_y = []
for (var i=0; i<10; i++) {
	array_push(points_x,x)
	array_push(points_y,y-i*p_scale)
}

time = random(10)
pr_x = x
pr_y = y



//function hair_update(num) {
//	var in, dist, scl, dx, dy
	
//	for (var i=num; i>0; i--) { //тянем на себя все точки с рута
//		in = i-1
//		dx = points_x[in]-points_x[i]
//		dy = points_y[in]-points_y[i]
//		dist = point_distance(0,0,dx,dy)
//		scl = p_scale/dist
//		points_x[in] = points_x[i]+dx*scl
//		points_y[in] = points_y[i]+dy*scl
//	}
//	if points_x[0]!=root_x || points_y[0]!=root_y { //тянем от рута точки обратно
//		points_x[0]=root_x
//		points_y[0]=root_y
//		for (var i=0; i<num; i++) {
//			in = i+1
//			dx = points_x[in]-points_x[i]
//			dy = points_y[in]-points_y[i]
//			dist = point_distance(0,0,dx,dy)
//			scl = p_scale/dist
//			points_x[in] = points_x[i]+dx*scl
//			points_y[in] = points_y[i]+dy*scl
//		}	
//	}
//	var a_l = array_length(points_x)-1 //тянем на себя все точки с конца
//	for (var i=num; i<a_l; i++) {
//		in = i+1
//		dx = points_x[in]-points_x[i]
//		dy = points_y[in]-points_y[i]
//		dist = point_distance(0,0,dx,dy)
//		scl = p_scale/dist
//		points_x[in] = points_x[i]+dx*scl
//		points_y[in] = points_y[i]+dy*scl
//	}
//}
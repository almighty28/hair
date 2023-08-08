drag = false
root_x = x
root_y = y
h_tex = sprite_get_texture(spr_00,0)
h_arr_tex_pos = sprite_get_uvs(spr_00,0)
array_resize(h_arr_tex_pos,4)
h_arr_tex_pos[3] = (h_arr_tex_pos[3]-h_arr_tex_pos[1])/3

surface_depth_disable(false)
hair_surf = surface_create(room_width,room_height)
surface_depth_disable(true)

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
u_point_x_arr_next = shader_get_uniform(shd_vertex_texture2,"u_fPoints_x_next")
u_point_y_arr_next = shader_get_uniform(shd_vertex_texture2,"u_fPoints_y_next")

strt_scale = 40

//hpos =[[436,378],[573,375],[434,375],[574,371],[431,371],[575,366],[428,365],[575,362],[427,360],[579,356],[426,355],[580,352],[426,351],[579,348],[425,347],[580,344],[425,342],[431,342],[575,340],[582,339],[426,336],[433,336],[439,336],[569,335],[575,335],[582,335],[424,331],[431,330],[438,330],[445,330],[561,330],[569,330],[576,330],[582,329],[425,324],[431,323],[439,323],[448,324],[454,324],[462,324],[468,323],[477,324],[484,325],[492,325],[498,325],[506,326],[514,326],[523,327],[531,327],[540,327],[548,325],[557,325],[565,326],[571,324],[578,324],[429,318],[437,316],[445,318],[454,318],[462,319],[471,318],[479,319],[487,318],[492,318],[500,320],[508,320],[515,321],[523,322],[531,320],[540,321],[548,320],[555,320],[565,320],[572,318],[580,319],[434,312],[442,312],[449,311],[456,311],[462,313],[470,313],[478,312],[485,314],[492,313],[500,313],[507,314],[514,314],[519,315],[527,315],[536,314],[544,315],[552,315],[561,315],[568,313],[575,313],[441,307],[450,304],[458,305],[466,306],[475,307],[484,307],[495,307],[502,307],[510,308],[520,308],[528,309],[536,309],[544,308],[553,309],[562,308],[570,307],[453,298],[461,298],[471,298],[481,300],[493,301],[504,300],[511,302],[524,303],[533,303],[540,303],[552,303],[563,303],[467,291],[477,292],[487,295],[496,294],[505,295],[517,294],[530,296],[539,298],[550,298],[560,298],[485,288],[497,288],[510,288],[520,288],[532,289],[541,289],[549,292],[492,284],[506,286],[515,284],[526,284]]
hpos = [[436,378],[573,375],[434,375],[574,371],[431,371],[575,366],[428,365],[575,362],[427,360],[579,356],[426,355],[580,352],[426,351],[579,348],[425,347],[580,344],[425,342],[431,342],[575,340],[582,339],[426,336],[433,336],[439,336],[569,335],[575,335],[582,335],[424,331],[431,330],[438,330],[445,330],[561,330],[569,330],[576,330],[582,329],[425,324],[431,323],[439,323],[448,324],[454,324],[462,324],[468,323],[477,324],[484,325],[492,325]];
hairs_arr = [];

hairs_len = [];
p_scale = array_create(array_length(hpos),strt_scale);


var k,p,xx,yy,hp_l = array_length(hpos);
for(var i=0; i<10; i++) {
	for(var j = 0;j<hp_l;j++) {
		
		p = j div 30
		k = j mod 30
		
		if i==0  {
			
			xx = hpos[j][0];
			yy = hpos[j][1];
		} else {
			xx = hairs_arr[i-1][p][0][k];
			yy = hairs_arr[i-1][p][1][k] - p_scale[j];
		}
		
		hairs_arr[i][p][0][k] = xx;	
		hairs_arr[i][p][1][k] = yy;
		hairs_len[j]=10;
		
	}


}


time = random(10)
pr_x = x
pr_y = y




function hair_update_len(hair_num) {
	p = hair_num div 30;
	k = hair_num mod 30;
	var len = 0;
	for(var i = 0;i<array_length(hairs_arr);i++){
		if hairs_arr[i][p][0][k] == 0 || hairs_arr[i][p][1][k] == 0 break;
		len++;
	}
	hairs_len[hair_num] = len;
	
}
function hair_update(pnt_num,hair_num) {
	var in, dist, scl, dx, dy
	p = hair_num div 30;
	k = hair_num mod 30;
	for (var i=pnt_num; i>0; i--) { //тянем на себя все точки с рута
		if hairs_arr[i][p][0][k] == 0 || hairs_arr[i][p][1][k] == 0 continue;
		in = i-1
		if hairs_arr[in][p][0][k] == 0 || hairs_arr[in][p][1][k] == 0 continue;
		
		dx = hairs_arr[in][p][0][k] - hairs_arr[i][p][0][k];
		dy = hairs_arr[in][p][1][k] - hairs_arr[i][p][1][k];

		dist = point_distance(0,0,dx,dy);
		scl = p_scale[hair_num]/dist;
		
		hairs_arr[in][p][0][k] = hairs_arr[i][p][0][k] + dx*scl;
		hairs_arr[in][p][1][k] = hairs_arr[i][p][1][k] + dy*scl;
	}
	if  hairs_arr[0][p][0][k]!=hpos[hair_num][0] || hairs_arr[0][p][1][k]!=hpos[hair_num][1] { //тянем от рута точки обратно
		
		hairs_arr[0][p][0][k]=hpos[hair_num][0];
		hairs_arr[0][p][1][k]=hpos[hair_num][1];
		
		for (var i=0; i<pnt_num; i++) {
			if hairs_arr[i][p][0][k] == 0 || hairs_arr[i][p][1][k] == 0 continue;
			in = i+1
			if hairs_arr[in][p][0][k] == 0 || hairs_arr[in][p][1][k] == 0 continue;
			dx = hairs_arr[in][p][0][k] - hairs_arr[i][p][0][k];
			dy = hairs_arr[in][p][1][k] - hairs_arr[i][p][1][k];
			dist = point_distance(0,0,dx,dy)
			scl = p_scale[hair_num]/dist
			hairs_arr[in][p][0][k] = hairs_arr[i][p][0][k] + dx*scl;
			hairs_arr[in][p][1][k] = hairs_arr[i][p][1][k] + dy*scl;
		}	
	}
	var a_l = array_length(hairs_arr)-1 //тянем на себя все точки с конца
	for (var i=pnt_num; i<a_l; i++) {
		if hairs_arr[i][p][0][k] == 0 || hairs_arr[i][p][1][k] == 0 break;
		in = i+1;
		if hairs_arr[in][p][0][k] == 0 || hairs_arr[in][p][1][k] == 0 break;

		dx = hairs_arr[in][p][0][k] - hairs_arr[i][p][0][k];
		dy = hairs_arr[in][p][1][k] - hairs_arr[i][p][1][k];
		dist = point_distance(0,0,dx,dy)
		scl = p_scale[hair_num]/dist
		hairs_arr[in][p][0][k] = hairs_arr[i][p][0][k] + dx*scl;
		hairs_arr[in][p][1][k] = hairs_arr[i][p][1][k] + dy*scl;
	}
	hair_update_len(hair_num);
}
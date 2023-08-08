if drag {
	switch obj_control.mode {
		case 0:
			var drag_dist_x = (mouse_x-pr_x)*1.7
			var drag_dist_y = (mouse_y-pr_y)*1.7
			var last_point = -1
			var min_dist = 40
			var h_l = array_length(hairs_arr)-1;
			var a_l = array_length(hpos);
			var p,k;
			for(var j = 0; j<a_l; j++){
				
				p = j div 30;
				k = j mod 30;
				for(var i = h_l; i>0; i--){
					if hairs_arr[i][p][0][k] == 0 || hairs_arr[i][p][1][k] == 0 continue;
					var p_d = point_distance(mouse_x,mouse_y,hairs_arr[i][p][0][k],hairs_arr[i][p][1][k])
					var dist_to_center = clamp(1-(p_d-min_dist)/40,0,0.7)
					if dist_to_center>0 {
						if last_point<0 
							last_point = i
						hairs_arr[i][p][0][k] += drag_dist_x*dist_to_center
						hairs_arr[i][p][1][k] += drag_dist_y*dist_to_center
					}
				}
				if last_point>=0 
				hair_update(last_point,j);
			}
		break
		//case 1:
		//	var drag_dist_x = (mouse_x-pr_x)*1.7
		//	var drag_dist_y = (mouse_y-pr_y)*1.7
		//	var min_dist = 60
			
		//	var h_l = array_length(hairs_arr)-1;
		//	var a_l = array_length(hpos);
		//	var p,k;
		//	for(var j = 0; j<a_l; j++){
				
		//		p = j div 30;
		//		k = j mod 30;
				
		//		var p_d = point_distance(mouse_x,mouse_y,hairs_arr[h_l][p][0][k],hairs_arr[h_l][p][1][k]);
		//		var dist_to_center = clamp(1-(p_d-min_dist)/min_dist,0,0.7)
		//		if dist_to_center>0 {
		//			hairs_arr[h_l][p][0][k] += drag_dist_x*dist_to_center
		//			hairs_arr[h_l][p][1][k] += drag_dist_y*dist_to_center
		//			hair_update(h_l,j);
		//		}
		//	}	
	
		//break
		case 2:
		
			var h_l = array_length(hairs_arr);
			var a_l = array_length(hpos);
			var p,k;
			for(var j = 0; j<a_l; j++){
				
				p = j div 30;
				k = j mod 30;
				for(var i = 1; i<h_l; i++){
					if hairs_arr[i][p][0][k] == 0 || hairs_arr[i][p][1][k] == 0 continue;
					var pr_i = i-1
					var cp = scr_line_cross(hairs_arr[pr_i][p][0][k],hairs_arr[pr_i][p][1][k],hairs_arr[i][p][0][k],hairs_arr[i][p][1][k],mouse_x,mouse_y,pr_x,pr_y)
					if is_array(cp){
						var dst = max(pr_i*p_scale[j]+point_distance(hairs_arr[pr_i][p][0][k],hairs_arr[pr_i][p][1][k],cp[0],cp[1]),strt_scale)
						var n_l = ceil(dst/strt_scale)
						
						for(var l = n_l+1;l<h_l;l++){
							hairs_arr[l][p][0][k] = 0;
							hairs_arr[l][p][1][k] = 0;
						}
						p_scale[j] = dst/n_l
						hair_update(0,j)
						break
					}
				}
			}
		break
		case 3:
			var h_l = array_length(hairs_arr)-1;
			var a_l = array_length(hpos);
			var p,k;
			for(var j = 0; j<a_l; j++){
				
				p = j div 30;
				k = j mod 30;
				for(var i = h_l; i>0; i--){
					if hairs_arr[i][p][0][k] == 0 || hairs_arr[i][p][1][k] == 0 continue;
					var blow_dir = point_direction(mouse_x,mouse_y,hairs_arr[i][p][0][k],hairs_arr[i][p][1][k])
					hairs_arr[i][p][0][k] += lengthdir_x(20,blow_dir+cos(time-i)*(1+i/2))
					hairs_arr[i][p][1][k] += lengthdir_y(20,blow_dir+cos(time-i)*(1+i/2))
				}
				time+=0.6;
				hair_update(0,j);
			}
			
			
		break
		case 4:
		
			var h_l;
			var a_l = array_length(hpos);
			var p,k;
			for(var j = 0; j<a_l; j++){
				p = j div 30;
				k = j mod 30;
				if point_distance(mouse_x,mouse_y,hairs_arr[0][p][0][k],hairs_arr[0][p][1][k])<40 {
					var h_l = hairs_len[j]-1;
					if h_l>=9 continue;
					
					
					var dst = h_l*p_scale[j]+1
					var n_l = ceil(dst/strt_scale)
					
			
					p_scale[j]=dst/n_l
					
					var dir = 90;	
					if h_l>0 dir = point_direction(hairs_arr[h_l-1][p][0][k],hairs_arr[h_l-1][p][1][k],hairs_arr[h_l][p][0][k],hairs_arr[h_l][p][1][k])//+irandom_range(-30,30)
					if n_l>h_l || h_l == 0{
						hairs_arr[n_l][p][0][k] = hairs_arr[n_l-1][p][0][k] + lengthdir_x(strt_scale,dir);
						hairs_arr[n_l][p][1][k] = hairs_arr[n_l-1][p][1][k] + lengthdir_y(strt_scale,dir);
						
						
					} else {
						hairs_arr[n_l-1][p][0][k] += lengthdir_x(1,dir)
						hairs_arr[n_l-1][p][1][k] += lengthdir_y(1,dir)
					}
					hair_update(0,j)
				}	
			}
		break
	}
	pr_x = mouse_x
	pr_y = mouse_y
}
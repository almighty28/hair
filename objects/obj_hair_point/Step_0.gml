if drag {
	switch obj_control.mode {
		case 0:
			var drag_dist_x = (mouse_x-pr_x)*1.7
			var drag_dist_y = (mouse_y-pr_y)*1.7
			var last_point = -1
			var min_dist = 40
			var a_l = array_length(points_x)-1
			for (var i=a_l; i>0; i--) {
				var p_d = point_distance(mouse_x,mouse_y,points_x[i],points_y[i])
				var dist_to_center = clamp(1-(p_d-min_dist)/40,0,0.7)
				if dist_to_center>0 {
					if last_point<0 
						last_point = i
					points_x[i] += drag_dist_x*dist_to_center
					points_y[i] += drag_dist_y*dist_to_center
				}
			}
			if last_point>=0 
				hair_update(last_point)
		break
		case 1:
			var drag_dist_x = (mouse_x-pr_x)*1.7
			var drag_dist_y = (mouse_y-pr_y)*1.7
			var min_dist = 60
			var a_l = array_length(points_x)-1
			var p_d = point_distance(mouse_x,mouse_y,points_x[a_l],points_y[a_l])
			var dist_to_center = clamp(1-(p_d-min_dist)/min_dist,0,0.7)
			if dist_to_center>0 {
				points_x[a_l] += drag_dist_x*dist_to_center
				points_y[a_l] += drag_dist_y*dist_to_center
				hair_update(a_l)
			}	
		break
		case 2:
			var a_l = array_length(points_x)
			for (var i=1; i<a_l; i++) {
				var pr_i = i-1
				var cp = scr_line_cross(points_x[pr_i],points_y[pr_i],points_x[i],points_y[i],mouse_x,mouse_y,pr_x,pr_y)
				if is_array(cp){
					var dst = max(pr_i*p_scale+point_distance(points_x[pr_i],points_y[pr_i],cp[0],cp[1]),strt_scale)
					var n_l = ceil(dst/strt_scale)
					array_resize(points_x,n_l+1)
					array_resize(points_y,n_l+1)
					p_scale = dst/n_l
					hair_update(0)
					break
				}
			}
		break
		case 3:
			var a_l = array_length(points_x)
			for (var i=1; i<a_l; i++) {
				var blow_dir = point_direction(mouse_x,mouse_y,points_x[i],points_y[i])
				{
					points_x[i] += lengthdir_x(20,blow_dir+cos(time-i)*(1+i/2))
					points_y[i] += lengthdir_y(20,blow_dir+cos(time-i)*(1+i/2))
				}
			}
			time+=0.6
			hair_update(0)
		break
		case 4:
			if point_distance(mouse_x,mouse_y,points_x[0],points_y[0])<40 {
				var a_l = array_length(points_x)-1
				var dst = a_l*p_scale+2
				var n_l = ceil(dst/strt_scale)
				if n_l>a_l {
					array_insert(points_x,1,points_x[0])
					array_insert(points_y,1,points_y[0])
				}
			
				p_scale=dst/n_l
				var dir = point_direction(points_x[n_l-1],points_y[n_l-1],points_x[n_l],points_y[n_l]+7)+irandom_range(-30,30)
				points_x[n_l] += lengthdir_x(4,dir)
				points_y[n_l] += lengthdir_y(4,dir)
				hair_update(n_l)
			}
		break
	}
	pr_x = mouse_x
	pr_y = mouse_y
}
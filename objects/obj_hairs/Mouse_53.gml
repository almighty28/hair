drag = true
pr_x = mouse_x-2
pr_y = mouse_y-2
time = irandom(10)

////if obj_control.mode ==1 {
////	var a_l = array_length(points_x)
////	for (var i=0; i<a_l; i++) {
////		if point_distance(points_x[i],points_y[i],mouse_x,mouse_y)<7 {
////			array_delete(points_x,i,a_l+1-i)
////			array_delete(points_y,i,a_l+1-i)
////			break
////		}
////	}
////}
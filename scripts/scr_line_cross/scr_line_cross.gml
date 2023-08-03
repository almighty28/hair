///проверяет пересечение 2 отрезков
//function scr_line_cross(Ax, Ay, Bx, By, Cx, Cy, Dx, Dy) {
//	var xN = (Dx - Cx) * (Ay - Cy) - (Dy - Cy) * (Ax - Cx);
//	var yN = (Bx - Ax) * (Ay - Cy) - (By - Ay) * (Ax - Cx);
//	var d  = (Dy - Cy) * (Bx - Ax) - (Dx - Cx) * (By - Ay);
//	if (max(min(Ax, Bx), min(Cx, Dx)) > min(max(Ax, Bx), max(Cx, Dx)) || 
//		max(min(Ay, By), min(Cy, Dy)) > min(max(Ay, By), max(Cy, Dy)))
//		return false;
//	else if (d == 0)
//		return xN == 0;
//	else if (d < 0) { xN = - xN; yN = - yN; d = -d; }
//		return xN >= 0 and xN <= d and yN >= 0 and yN <= d;
//}

///находит точку перемесения 2 отрезков (иначе 0)
function scr_line_cross(x1, y1, x2, y2, x3, y3, x4, y4) {
    var d = (y4-y3)*(x1-x2)-(x4-x3)*(y1-y2)
    if (d!=0) {
		var n_a=(x4-x2)*(y4-y3)-(x4-x3)*(y4-y2);
		var n_b=(x1-x2)*(y4-y2)-(x4-x2)*(y1-y2);
		var u_a=n_a/d;
		var u_b=n_b/d;

        if (u_a >=0 && u_a <=1 && u_b >=0 && u_b <=1) {
			var c_p = [x1*u_a + x2*(1-u_a),y1*u_a + y2*(1-u_a)]
			return c_p
		}
	}
    return 0;
}
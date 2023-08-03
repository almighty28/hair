vertex_format_begin()
vertex_format_add_position()
global.h_form = vertex_format_end()
global.h_buff = vertex_create_buffer()
vertex_begin(global.h_buff,global.h_form)
for (var i=0; i<100; i++) {
	vertex_position(global.h_buff, i, 0)
	vertex_position(global.h_buff, i, 1)
}
vertex_end(global.h_buff)
vertex_freeze(global.h_buff)

surface_depth_disable(false)
hair_surf = surface_create(room_width,room_height)
surface_depth_disable(true)



mode = 0
for(var i=0; i<5; i++) {
	with instance_create_depth(50+i*80,50,-10,obj_item) {
		type = i
	}
}
instance_create_depth(950,50,-10,obj_restart)

instance_create_depth(500,400,2,obj_char)

hpos =[[436,378],[573,375],[434,375],[574,371],[431,371],[575,366],[428,365],[575,362],[427,360],[579,356],[426,355],[580,352],[426,351],[579,348],[425,347],[580,344],[425,342],[431,342],[575,340],[582,339],[426,336],[433,336],[439,336],[569,335],[575,335],[582,335],[424,331],[431,330],[438,330],[445,330],[561,330],[569,330],[576,330],[582,329],[425,324],[431,323],[439,323],[448,324],[454,324],[462,324],[468,323],[477,324],[484,325],[492,325],[498,325],[506,326],[514,326],[523,327],[531,327],[540,327],[548,325],[557,325],[565,326],[571,324],[578,324],[429,318],[437,316],[445,318],[454,318],[462,319],[471,318],[479,319],[487,318],[492,318],[500,320],[508,320],[515,321],[523,322],[531,320],[540,321],[548,320],[555,320],[565,320],[572,318],[580,319],[434,312],[442,312],[449,311],[456,311],[462,313],[470,313],[478,312],[485,314],[492,313],[500,313],[507,314],[514,314],[519,315],[527,315],[536,314],[544,315],[552,315],[561,315],[568,313],[575,313],[441,307],[450,304],[458,305],[466,306],[475,307],[484,307],[495,307],[502,307],[510,308],[520,308],[528,309],[536,309],[544,308],[553,309],[562,308],[570,307],[453,298],[461,298],[471,298],[481,300],[493,301],[504,300],[511,302],[524,303],[533,303],[540,303],[552,303],[563,303],[467,291],[477,292],[487,295],[496,294],[505,295],[517,294],[530,296],[539,298],[550,298],[560,298],[485,288],[497,288],[510,288],[520,288],[532,289],[541,289],[549,292],[492,284],[506,286],[515,284],[526,284]]
//hpos = []

event_user(0)

/*
var sss=0
var a1 = 0
var a2 = 0
var p_scale=500
var ar=[]
for (var i=0; i<50000; i++) {
	ar[i]=[random_range(-500,2000),random_range(-500,2000)]
}

repeat(5) {
	var t1 = get_timer()
	for (var i=1; i<50000; i++) {
		var in = i-1
		var dist = point_distance(ar[i][0],ar[i][1],ar[in][0],ar[in][1])
		if dist>p_scale {
			var dir = point_direction(ar[i][0],ar[i][1],ar[in][0],ar[in][1])
			a1 = ar[i][0]+lengthdir_x(p_scale,dir)
			a2 = ar[i][1]+lengthdir_y(p_scale,dir)
		}
	}
	t1 = get_timer() - t1 
	show_debug_message(string(t1))

	var frс =0
	var d1 = 0
	var d2 = 0
	var t1 = get_timer()
	for (var i=1; i<50000; i++) {
		var in = i-1
		d1 = ar[i][0]-ar[in][0]
		d2 = ar[i][1]-ar[in][1]
		var dist = point_distance(0,0,d1,d2)
		var frс += 1-p_scale/dist
		frс *= 0.5
		cur_f = 1+frс
		if scl<1 {
			a1 = ar[i][0]+d1*cur_f
			a2 = ar[i][1]+d2*cur_f
		} 
		else {
			scl*=1.2
			if scl>1 {
				a1 = ar[i][0]+d1*scl
				a2 = ar[i][1]+d2*scl
			}
		}
	}
	t1 = get_timer() - t1 
	show_debug_message(string(t1))
}
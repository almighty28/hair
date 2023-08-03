
//for (var i=0; i<15; i++) {
//for (var i=0; i<50; i++) {
//	instance_create_depth(400+i*3,450+(i mod 3)*8,0,obj_hair_point)
//}

for (var i=0; i<array_length(hpos); i++) {
	instance_create_depth(hpos[i][0],hpos[i][1],0,obj_hair_point)
}
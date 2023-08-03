with obj_hair_point
	instance_destroy()

event_user(0)

var str="["
for (var i=0; i<array_length(hpos); i++) {
	str+="["+string(hpos[i][0])+","+string(hpos[i][1])+"],"
}
str+="]"
show_debug_message(str)
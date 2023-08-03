/// @description Insert description here
// You can write your code in this editor
draw_set_color(c_aqua);
for (var i = 0;i<array_length(hairs);i++) {
	for(var j = 0;j<array_length(hairs[i]);j++) {
		draw_circle(hairs[i][j][0],hairs[i][j][1],2,false);
		
	}

}
draw_set_color(c_white);


//draw_primitive_begin_texture(pr_trianglestrip,sprite_get_texture(spr_00,0));
	//draw_vertex_texture(100,100,0,0)
	//draw_vertex_texture(200,100,1,0)
	//draw_vertex_texture(100,200,0,0.33)
	//draw_vertex_texture(200,200,1,0.33)

	//draw_vertex_texture(100,200,0,0.33)
	//draw_vertex_texture(200,200,1,0.33)
	//draw_vertex_texture(100,300,0,0.66)
	//draw_vertex_texture(200,300,1,0.66)

	//draw_vertex_texture(100,300,0,0.66)
	//draw_vertex_texture(200,300,1,0.66)
	//draw_vertex_texture(100,400,0,1)
	//draw_vertex_texture(200,400,1,1)



//draw_primitive_end()
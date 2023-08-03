draw_self()
draw_set_color(c_black)
draw_text(x,y,"RST")
draw_set_color(c_white)


repeat(1000) {
draw_primitive_begin_texture(pr_trianglestrip,sprite_get_texture(spr_00,0));
draw_vertex_texture(100,100,0,0)
draw_vertex_texture(200,100,1,0)
draw_vertex_texture(100,200,0,0.33)
draw_vertex_texture(200,200,1,0.33)

draw_vertex_texture(100,200,0,0.33)
draw_vertex_texture(200,200,1,0.33)
draw_vertex_texture(100,300,0,0.66)
draw_vertex_texture(200,300,1,0.66)

draw_vertex_texture(100,300,0,0.66)
draw_vertex_texture(200,300,1,0.66)
draw_vertex_texture(100,400,0,1)
draw_vertex_texture(200,400,1,1)



draw_primitive_end()
}
attribute vec3 in_Position;                 // (x,y,z)
attribute vec4 in_Colour;					// (r,g,b,a)

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float u_fPoints_x[30];
uniform float u_fPoints_y[30];
uniform float u_fPoints_x_next[30];
uniform float u_fPoints_y_next[30];
uniform float u_fWidth;
uniform float u_fTex_pos[4];

#define pi 3.1415926535898

void main()
{
	vec2 pos = vec2(0.0,0.0);
	float ang = 0.0;
	float d_x;
	float d_y;
	
	int ind = int(floor(in_Position.x/2.0));
	float root = mod(float(in_Position.x),2.0);
	d_x = u_fPoints_x_next[ind]-u_fPoints_x[ind];
	d_y = u_fPoints_y_next[ind]-u_fPoints_y[ind];
	ang = atan(d_y,d_x);
	pos = vec2(u_fPoints_x_next[ind]*root+(1.0-root)*u_fPoints_x[ind]+cos(ang+(0.5-in_Position.y)*pi)*u_fWidth,
				u_fPoints_y_next[ind]*root+(1.0-root)*u_fPoints_y[ind]+sin(ang+(0.5-in_Position.y)*pi)*u_fWidth);
	
	
	vec2 tex_p = vec2(u_fTex_pos[0]+(u_fTex_pos[2]-u_fTex_pos[0])*in_Position.y,u_fTex_pos[1]);
	//float p_type = ceil(ceil(ind_tex/2.0)/((u_fLength*2.0-1.0)/2.0))*2.0;
	//float shift = p_type-mod(ind_tex,2.0);
	tex_p.y += u_fTex_pos[3];
	
    vec4 object_space_pos = vec4(pos.x, pos.y, in_Position.z, 1.0);
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;
	
	v_vColour = in_Colour;
    v_vColour.a =  v_vColour.a*sign(u_fPoints_x_next[ind]*u_fPoints_y_next[ind]);
    v_vTexcoord = tex_p;
}

attribute vec3 in_Position;                  // (x,y,z)

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float u_fPoints_x[100];
uniform float u_fPoints_y[100];
uniform float u_fWidth;
uniform float u_fLength;
uniform vec4 u_vTex_pos;

#define pi 3.1415926535898

void main()
{
	vec2 pos = vec2(0.0,0.0);
	float ang = 0.0;
	float d_x;
	float d_y;

	float ind_tex = clamp(in_Position.x,0.0,u_fLength*2.0-1.0);
	float ind = floor(ind_tex/2.0);
	//if (mod(ind_tex,2.0)==0.0)
	//{
		d_y = u_fPoints_y[int(ind+1.0)]-u_fPoints_y[int(ind)];
		d_x = u_fPoints_x[int(ind+1.0)]-u_fPoints_x[int(ind)];
		ang = atan(d_y,d_x);
	
		//if (ind>0.0)
		//{
		//	d_y = u_fPoints_y[int(ind)]-u_fPoints_y[int(ind-1.0)];
		//	d_x = u_fPoints_x[int(ind)]-u_fPoints_x[int(ind-1.0)];
		//	float ang2 = atan(d_y,d_x);
		//	ang = (ang+ang2)/2.0-pi*floor(abs(ang-ang2)/pi);
		//}
		pos = vec2(u_fPoints_x[int(ind)]+cos(ang+(0.5-in_Position.y)*pi)*u_fWidth,
					u_fPoints_y[int(ind)]+sin(ang+(0.5-in_Position.y)*pi)*u_fWidth);
	//}
	//else
	//{
	//	vec2 new_p = vec2((u_fPoints_x[int(ind+1.0)]+u_fPoints_x[int(ind)])/2.0,
	//						(u_fPoints_y[int(ind+1.0)]+u_fPoints_y[int(ind)])/2.0);
	//	d_y = u_fPoints_y[int(ind+1.0)]-u_fPoints_y[int(ind)];
	//	d_x = u_fPoints_x[int(ind+1.0)]-u_fPoints_x[int(ind)];
	//	ang = atan(d_y,d_x);
	//	d_y = u_fPoints_y[int(ind-1.0)]-u_fPoints_y[int(ind)];
	//	d_x = u_fPoints_x[int(ind-1.0)]-u_fPoints_x[int(ind)];
	//	float ang_p = ang-atan(d_y,d_x);
	//	ang_p = mod(ang_p+pi*2.0,pi*2.0);
	//	d_y = u_fPoints_y[int(ind+1.0)]-u_fPoints_y[int(ind+2.0)];
	//	d_x = u_fPoints_x[int(ind+1.0)]-u_fPoints_x[int(ind+2.0)];
	//	float ang_n = ang-atan(d_y,d_x);
	//	ang_n = mod(ang_n+pi*2.0,pi*2.0);
	//	float dist = (sin(ang_n)*sign(u_fLength-ceil(ind_tex/2.0))-sin(ang_p)*sign(ind))*3.0;
	//	new_p = vec2(new_p.x+cos(ang-0.5*pi)*dist,
	//				new_p.y+sin(ang-0.5*pi)*dist);
	//	pos = vec2(new_p.x+cos(ang+(0.5-in_Position.y)*pi)*u_fWidth,
	//				new_p.y+sin(ang+(0.5-in_Position.y)*pi)*u_fWidth);
	//}
	
	
	vec2 tex_p = vec2(u_vTex_pos.x+(u_vTex_pos.z-u_vTex_pos.x)*in_Position.y,u_vTex_pos.y);
	float p_type = ceil(ceil(ind_tex/2.0)/((u_fLength*2.0-1.0)/2.0))*2.0;
	float shift = p_type-mod(ind_tex,2.0);
	tex_p.y += shift*u_vTex_pos.w;
	
    vec4 object_space_pos = vec4(pos.x, pos.y, 200.0-in_Position.x, 1.0);
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;
    
	v_vColour = vec4(1.0,1.0,1.0,1.0);
    v_vTexcoord = tex_p;
}

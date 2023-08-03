varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
	vec4 clr = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
    if (clr.a<=0.3) discard;
	gl_FragColor = clr;
	
}

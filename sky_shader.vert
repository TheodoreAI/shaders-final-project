#version 330 compatibility

out vec2	vST;
uniform float scale;

void
main( )
{
	vST = gl_MultiTexCoord0.st;
    vec4 pos = gl_Vertex;

    pos.y *= scale;
    pos.x *= scale;
    pos.x *= scale;
	gl_Position = gl_ModelViewProjectionMatrix * pos;
}



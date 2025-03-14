uniform float shiftX;
uniform float shiftZ;

out vec2  vST;

void main() {

    vST  = gl_MultiTexCoord0.st;
    
    vec4 pos = gl_Vertex;
    pos.x += shiftX;
    pos.z += shiftZ;
    gl_Position = gl_ModelViewProjectionMatrix * pos;
}

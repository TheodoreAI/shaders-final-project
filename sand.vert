uniform float shiftX;
uniform float shiftZ;
uniform float shiftY;
uniform float scale;

out vec2  vST;

void main() {

    vST  = gl_MultiTexCoord0.st;
    
    vec4 pos = gl_Vertex;
    pos.x += shiftX;
    pos.z += shiftZ;
    pos.y += shiftY;

    pos.x *= scale;
    pos.y *= scale;
    pos.z *= scale;

    gl_Position = gl_ModelViewProjectionMatrix * pos;
}

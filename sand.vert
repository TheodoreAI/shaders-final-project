uniform float shiftX;
uniform float shiftZ;

void main() {
    vec4 pos = gl_Vertex;
    pos.x += shiftX;
    pos.z += shiftZ;
    gl_Position = gl_ModelViewProjectionMatrix * pos;
}

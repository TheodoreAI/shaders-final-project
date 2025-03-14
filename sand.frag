#version 330 core

in vec2 vST;

vec3 randomColor = vec3(0.4, 0.7, 0.3);
uniform sampler2D uColorUnit;

void main() {
     vec3 texColor = texture(uColorUnit, vST).rgb;
    gl_FragColor = vec4(texColor, 1.);
}

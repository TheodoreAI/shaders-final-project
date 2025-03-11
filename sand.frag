#version 330 core


vec3 randomColor = vec3(0.4, 0.7, 0.3);

void main() {
    gl_FragColor = vec4(randomColor, 1.);
}

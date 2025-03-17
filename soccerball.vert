#version 330 compatibility

uniform float Timer, uTimeScale;
uniform float uKm0, uGamma0, uAm0;
uniform float uKm1, uGamma1, uAm1, uPhiM1;
uniform float scale, shiftY;

uniform vec3 uObjectXZPos;

in vec3 aVertexPosition;
out vec3 vMC;
out vec2 vST;



const float G = 1.0;

// Exactly matches ocean shader calculation
float getWaveHeight(vec2 positionXZ) {
    float newy = 0.0;

    float wm0 = sqrt(G * uKm0);
    float theta0 = positionXZ.x * uKm0 * cos(uGamma0) + positionXZ.y * uKm0 * sin(uGamma0)
                    - wm0 * Timer * uTimeScale;
    newy += uAm0 * cos(theta0);

    float wm1 = sqrt(G * uKm1);
    float theta1 = positionXZ.x * uKm1 * cos(uGamma1) + positionXZ.y * uKm1 * sin(uGamma1)
                    - wm1 * Timer * uTimeScale - uPhiM1;
    newy += uAm1 * cos(theta1);

    return newy * scale + shiftY;
}

void main() {
    vST = gl_MultiTexCoord0.st;
    
    
    //*Wave height at object's position matches the ocean precisely
    float waveHeight = getWaveHeight(uObjectXZPos.xz);

    vec3 worldPosition = vec3(uObjectXZPos.x, waveHeight, uObjectXZPos.z) + aVertexPosition;
    vMC = aVertexPosition; 

    gl_Position = gl_ModelViewProjectionMatrix * vec4(worldPosition, 1.0);
}

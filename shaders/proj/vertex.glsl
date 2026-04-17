varying vec2 vUv;
varying float vUvTime;
uniform float uTime;

void main(){
    vUv = uv;
    vUvTime = uTime;

    gl_Position = projectionMatrix * modelViewMatrix * vec4(position,1.0);  
}
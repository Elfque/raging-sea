uniform vec3 uTopColor;
uniform vec3 uBottomColor;

uniform float uOffset;
uniform float uMultiplier;

varying float vElevation;

void main(){
    float mixValue = (vElevation + uOffset) *  uMultiplier;
    vec3 color = mix(uTopColor, uBottomColor, mixValue);
    gl_FragColor = vec4(color,1.0);
}   

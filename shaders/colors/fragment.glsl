precision mediump float;
uniform vec2 uMousePosition;

vec3 hsl2rgb(vec3 c) {
    vec3 rgb = clamp(abs(mod(c.x * 6.0 + vec3(0.0, 4.0, 2.0), 6.0) - 3.0) - 1.0, 0.0, 1.0);
    return c.z + c.y * (rgb - 0.5) * (1.0 - abs(2.0 * c.z - 1.0));
}

void main(){
    float hue = uMousePosition.x+0.2;
    float saturation = 0.8;
    float lightness = uMousePosition.y+0.2;

    vec3 color = hsl2rgb(vec3(hue, saturation, lightness));
    gl_FragColor = vec4(color,1.0);    
}   
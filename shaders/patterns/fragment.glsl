precision mediump float;

varying vec2 vUv ;

float random (vec2 st) {
    return fract(sin(dot(st.xy,
                         vec2(12.9898,78.233)))*
                 43758.5453123);
}

void main(){
    // float barX  =step(0.3, mod(vUv.y *10.0 -0.2 ,1.0));
    // barX  *= step(0.8,mod(vUv.x *10.0 ,1.0));

    // float barY  = step(0.8, mod(vUv.y *10.0 ,1.0));
    // barY *= step(0.3,mod(vUv.x *10.0 -0.2 ,1.0));
    // float strength = barX + barY;
    // float strength = min(abs(vUv.x - 0.5), abs(vUv.y-0.5));
    // float strength = max(abs(vUv.x - 0.5), abs(vUv.y-0.5));
    // float strength = step(0.5, pow(abs(vUv.x - 0.5), abs(vUv.y-0.5)));
    // float strength = step(0.2, max(abs(vUv.x - 0.5), abs(vUv.y-0.5)));
    // strength *=1.0- step(0.25, max(abs(vUv.x - 0.5), abs(vUv.y-0.5)));

    // PATTERN 21
    // float strength = floor(vUv.x * 10.0) / 10.0;
    // PATTERN 22
    // float strength = floor(vUv.x * 10.0) / 10.0 * floor(vUv.y * 10.0) / 10.0;
    // PATTERN 23
    // float strength = random(vUv);
    // PATTERN 24
    // vec2 gridUv = vec2(floor(vUv.x * 10.0) / 10.0, floor(vUv.y * 10.0) / 10.0);
    // float strength = random(gridUv);
    // PATTERN 25
    // vec2 gridUv = vec2(floor(vUv.x * 10.0) / 10.0, floor((vUv.y + vUv.x) * 10.0) / 10.0);
    // float strength = random(gridUv);
    // PATTERN 26
    // float strength = length(vUv);

    // PATTERN 27
    // float strength = length(vUv-0.5);
    // float strength = 1.0-distance(vUv , vec2(0.5));
    // PATTERN 29
    // float strength = 0.02/distance(vUv , vec2(0.5));

    // PATTERN 33
    // float strength = step(0.25,distance(vUv , vec2(0.5)));

    // PATTERN 37
    // vec2 waveUv = vec2(vUv.x, vUv.y + sin(vUv.x *30.0)*0.1);
    // float strength = 1.0- step(0.01,abs(distance(waveUv, vec2(0.5))-0.25));
    
    // PATTERN 38
    vec2 waveUv = vec2(vUv.x +sin(vUv.y *30.0)*0.1, vUv.y + sin(vUv.x *30.0)*0.1);
    float strength = 1.0- step(0.01,abs(distance(waveUv, vec2(0.5))-0.25));
      

    gl_FragColor = vec4(strength,strength,strength,1.0);

    // gl_FragColor = vec4(0.0,vUv,1.0);
    // gl_FragColor = vec4(1.0,vUv.y,vUv.x,1.0);
    // gl_FragColor = vec4(sin(vUv.y-1.0),cos(vUv.x-1.0),0.9,1.0);
}   

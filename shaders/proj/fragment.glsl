varying vec2 vUv;
varying float vUvTime;

void main(){
    vec2 newVUv = vec2(vUv.x,vUv.y);


    // STRIPE
    float stripe = mod(newVUv.y * 10.0, 0.5);
    stripe = step(0.2, stripe);

    gl_FragColor = vec4(vec3(stripe), 1.0); 

    // // SQUARE SHAPE
    // // 1. Find distance from center on both X and Y axes
    // vec2 squareDist = abs(newVUv - 0.5);
    // // 2. A square is defined by the maximum distance on either axis being within a limit.
    // float square =  step(0.35, max(squareDist.x, squareDist.y));
    
    // gl_FragColor = vec4(vec3(square), 1.0); 

    // // CIRCLE SHAPE
    // // 1. Find the distance from the center (0.5, 0.5)
    // float circleDist = distance(newVUv, vec2(0.5));
    // // 2. Create the circle using either step() for hard edges or smoothstep() for soft edges
    // // float circle = step(circleDist, 0.25); // 1.0 if inside, 0.0 if outside
    // float circle = 1.0 - smoothstep(0.24, 0.25, circleDist); // smooth edges
    // // gl_FragColor = vec4(vec3(circle), 1.0); 

    // PULSING COLOR ANIMATION
    // gl_FragColor = vec4(sin(vUvTime)+0.2,cos(vUvTime)+ 0.2,tan(vUvTime)+0.1,1.0); 
      
    // GRADIENT
    // gl_FragColor = vec4(sin(newVUv.x + newVUv.y),sin(newVUv.x  * newVUv.y) + 0.5,0.3,1.0); 

    // TEAL AND BROWN
    // vec3 teal = vec3(0.0, 0.5, 0.5);
    // vec3 brown = vec3(0.6, 0.3, 0.1);
    // vec3 color = teal * (sin(newVUv.x * 20.0) + 0.5) + brown * (cos(newVUv.y * 20.0) + 0.2);
    // gl_FragColor = vec4(color, 1.0); 

    //   ONE BACKGROUND
    // gl_FragColor = vec4(1.0,0.0,0.0,1.0);
}
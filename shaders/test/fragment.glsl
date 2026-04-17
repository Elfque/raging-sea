precision mediump float;

// varying float vRandom;
uniform sampler2D uTexture;
varying vec2 vUv;
varying float vCamCloseness;

void main(){
    vec4 textureColor = texture2D(uTexture,vUv);
    textureColor.rgb *= vCamCloseness * 2.0 +  0.5;
    gl_FragColor = textureColor;
// gl_FragColor = vec4(vRandom*1.5,vRandom,0.9,0.4);
}   
// precision mediump float;

// // varying float vRandom;
// uniform sampler2D uTexture;
// varying vec2 vUv;
// varying float vCamCloseness;

// void main(){
//     vec4 textureColor = texture2D(uTexture,vUv);
//     textureColor.rgb *= vCamCloseness * 2.0 +  0.5;
//     gl_FragColor = textureColor;
// // gl_FragColor = vec4(vRandom*1.5,vRandom,0.9,0.4);
// }   
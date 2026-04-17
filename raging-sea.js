import * as three from "three";
import vertexShader from "./shaders/raging-sea/vertex.glsl";
import fragmentShader from "./shaders/raging-sea/fragment.glsl";
import { OrbitControls } from "three/examples/jsm/controls/OrbitControls.js";
import GUI from "lil-gui";

const gui = new GUI();
const debugObject = {};
debugObject.topColor = "#80f9db";
debugObject.bottomColor = "#2a9d12";

const canvas = document.querySelector(".webgl");

// SCENE
const scene = new three.Scene();

// CAMERA
const camera = new three.PerspectiveCamera(
  75,
  window.innerWidth / window.innerHeight,
  0.1,
  1000,
);
camera.position.set(0, 3, 2);

// CONTROL
const controls = new OrbitControls(camera, canvas);
controls.enableDamping = true;

const geometry = new three.PlaneGeometry(4, 4, 512, 512);
const material = new three.ShaderMaterial({
  vertexShader: vertexShader,
  fragmentShader: fragmentShader,
  side: three.DoubleSide,
  uniforms: {
    uTime: { value: 0 },

    uSpeed: { value: 1 },
    uWaveElevation: { value: 0.2 },
    uWaveFrequency: { value: new three.Vector2(2, 2) },

    uTopColor: { value: new three.Color(debugObject.topColor) },
    uBottomColor: { value: new three.Color(debugObject.bottomColor) },

    uOffset: { value: 0.4 },
    uMultiplier: { value: 2 },
  },
});

const mesh = new three.Mesh(geometry, material);
mesh.rotation.x = -Math.PI * 0.5;
scene.add(mesh);

// GUI
gui
  .add(material.uniforms.uWaveElevation, "value", 0, 1, 0.01)
  .name("Wave Elevation");
gui
  .add(material.uniforms.uWaveFrequency.value, "x", 1, 10, 1)
  .name("Wave Frequency X");
gui
  .add(material.uniforms.uWaveFrequency.value, "y", 1, 10, 1)
  .name("Wave Frequency Y");
gui.add(material.uniforms.uSpeed, "value", 0, 10, 0.1).name("Speed");
gui.addColor(debugObject, "topColor").onChange(() => {
  material.uniforms.uTopColor.value = new three.Color(debugObject.topColor);
});
gui.addColor(debugObject, "bottomColor").onChange(() => {
  mesh.material.uniforms.uBottomColor.value = new three.Color(
    debugObject.bottomColor,
  );
});
gui.add(material.uniforms.uOffset, "value", 0, 1, 0.01).name("Offset");
gui.add(material.uniforms.uMultiplier, "value", 0, 10, 0.1).name("Multiplier");

const renderer = new three.WebGLRenderer({ canvas: canvas });
renderer.setSize(window.innerWidth, window.innerHeight);

const clock = new three.Clock();

function animate() {
  // controls.update();
  const elapsedTime = clock.getElapsedTime();
  mesh.material.uniforms.uTime.value = elapsedTime;
  renderer.render(scene, camera);
  requestAnimationFrame(animate);
}
animate();

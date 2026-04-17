import * as THREE from "three";
import vertexShader from "./shaders/colors/vertex.glsl";
import fragmentShader from "./shaders/colors/fragment.glsl";

const sizes = {
  width: window.innerWidth,
  height: window.innerHeight,
};
const canvas = document.querySelector(".webgl");
const scene = new THREE.Scene();

const mouseUniform = {
  value: new THREE.Vector2(0, 0),
};

// POINTS
const particleCount = 2500;
const particleGeo = new THREE.BufferGeometry();
const particlePositions = new Float32Array(particleCount * 3);
// Distribute particles in a spherical cloud around radius 1.2 to 2.2
for (let i = 0; i < particleCount; i++) {
  const radius = 1.2 + Math.random() * 1.3;
  const theta = Math.random() * Math.PI * 2;
  const phi = Math.acos(2 * Math.random() - 1);
  particlePositions[i * 3] = radius * Math.sin(phi) * Math.cos(theta);
  particlePositions[i * 3 + 1] = radius * Math.sin(phi) * Math.sin(theta);
  particlePositions[i * 3 + 2] = radius * Math.cos(phi);
}
particleGeo.setAttribute(
  "position",
  new THREE.BufferAttribute(particlePositions, 3),
);

// Particle material that also changes color based on time + mouse influence (simple additive)
const particleMat = new THREE.PointsMaterial({
  color: 0xaa88ff,
  size: 0.022,
  transparent: true,
  blending: THREE.AdditiveBlending,
  opacity: 0.6,
});
const particles = new THREE.Points(particleGeo, particleMat);
scene.add(particles);

const geometry = new THREE.PlaneGeometry(1, 1);
const material = new THREE.RawShaderMaterial({
  vertexShader: vertexShader,
  fragmentShader: fragmentShader,
  uniforms: {
    uMousePosition: mouseUniform,
  },
});
const mesh = new THREE.Mesh(geometry, material);
scene.add(mesh);

const camera = new THREE.PerspectiveCamera(75, sizes.width / sizes.height);
camera.position.z = 3;
scene.add(camera);

const renderer = new THREE.WebGLRenderer({
  canvas: canvas,
});
renderer.setSize(sizes.width, sizes.height);
renderer.render(scene, camera);

const mouse = { x: 0, y: 0 };

window.addEventListener("mousemove", (event) => {
  mouse.x = event.clientX / sizes.width;
  mouse.y = event.clientY / sizes.height;

  mouseUniform.value.x = mouse.x;
  mouseUniform.value.y = mouse.y;
});

const tick = () => {
  particles.material.color.setHSL(
    mouse.x * 2,
    mouse.y * 2,
    mouse.x * mouse.y + 0.4,
  );
  renderer.render(scene, camera);
  window.requestAnimationFrame(tick);
};

tick();

window.addEventListener("resize", () => {
  sizes.width = window.innerWidth;
  sizes.height = window.innerHeight;
  camera.aspect = sizes.width / sizes.height;
  camera.updateProjectionMatrix();
  renderer.setSize(sizes.width, sizes.height);
  renderer.setPixelRatio(Math.min(window.devicePixelRatio, 2));
});

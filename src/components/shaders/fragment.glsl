precision mediump float;


// get our varyings
varying vec3 vPosition;
varying vec2 vUv;

// the uniform we declared inside our javascript
uniform float uTime;

// our texture sampler (default name, to use a different name please refer to the documentation)
uniform sampler2D uSampler0;
uniform sampler2D uSampler1;

void main() {

vec2 newUV = vUv;

// displace our pixels along the X axis based on our time uniform
// textures coords are ranging from 0.0 to 1.0 on both axis
newUV.y += sin(newUV.x * newUV.y + uTime/25.0)/8.0 * cos(5.0);

// map our texture with the texture matrix coords
gl_FragColor = texture2D(uSampler0, newUV);
}
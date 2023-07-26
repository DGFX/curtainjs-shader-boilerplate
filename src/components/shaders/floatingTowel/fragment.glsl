precision mediump float;


// get our varyings
varying vec3 vVertexPosition;
varying vec2 vTextureCoord;

// the uniform we declared inside our javascript
uniform float uTime;

// our texture sampler (default name, to use a different name please refer to the documentation)
uniform sampler2D uSampler0;
uniform sampler2D uSampler1;

void main() {
// get our texture coords from our varying
vec2 textureCoord = vTextureCoord;

// displace our pixels along the Y axis based on our time uniform
textureCoord.y += sin(textureCoord.x * textureCoord.y + uTime/25.0)/8.0 * .5;

// map our texture with the texture matrix coords
gl_FragColor = texture2D(uSampler0, textureCoord);
}
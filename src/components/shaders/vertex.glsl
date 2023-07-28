#ifdef GL_ES
precision mediump float;
#endif

// those are the mandatory attributes that the lib sets
attribute vec3 aVertexPosition;
attribute vec2 aTextureCoord;
// those are mandatory uniforms that the lib sets and that contain our model view and projection matrix
uniform mat4 uMVMatrix;
uniform mat4 uPMatrix;
// our texture matrix that will handle image cover
uniform mat4 uTextureMatrix0;
uniform mat4 uTextureMatrix1; // texture matrix of my-image-1.jpg
// pass your vertex and texture coords to the fragment shader
varying vec3 vVertexPosition;
varying vec2 vTextureCoord;

uniform float uTime;

void main(){
    vec3 vertexPosition=aVertexPosition;

    // Displace X axis with sin
    vertexPosition.z += sin(vertexPosition.x * 3.141592 + uTime * 0.0375) * 0.05;
    
    // Displace Y axis with cos
    vertexPosition.z += cos(vertexPosition.y  + uTime * 0.0375) * 0.05;
    
    gl_Position=uPMatrix*uMVMatrix*vec4(vertexPosition,1.);
    
    // set the varyings
    // here we use our texture matrix to calculate the accurate texture coords
    vTextureCoord=(uTextureMatrix0*vec4(aTextureCoord,0.,1.)).xy;
    vVertexPosition=vertexPosition;
}
import { Curtains, Plane } from "curtainsjs";
import vertex from './shaders/vertex.glsl'
import fragment from './shaders/fragment.glsl'

export function Scene() {
    // wait for everything to be ready
    window.onload = () => {
        // set up our WebGL context and append the canvas to our wrapper
        const curtains = new Curtains({
            container: "canvas",
            alpha: true,
            pixelRatio: Math.min(1.5, window.devicePixelRatio), // limit pixel ratio for performance
        });
        // get our plane element
        const planeElement = document.getElementsByClassName("plane")[0];
        // set our initial parameters (basic uniforms)
        const params = {
            vertexShader: vertex, // our vertex shader ID
            fragmentShader: fragment, // our fragment shader ID
            widthSegments: 16,
            heightSegments: 16,
            uniforms: {
                time: {
                    name: "uTime", // uniform name that will be passed to our shaders
                    type: "1f", // this means our uniform is a float
                    value: 0,
                },
            },
        };
        // create our plane using our curtains object, the HTML element and the parameters
        const plane = new Plane(curtains, planeElement, params);

        // Toggle class when plane is ready
        plane.onReady(() => {
            document.body.classList.add("curtains-ready");
        })

        plane.onRender(() => {
            // use the onRender method of our plane fired at each requestAnimationFrame call
            plane.uniforms.time.value++; // update our time uniform value
        });

        plane.createTexture({
            sampler: "activeTex",
            fromTexture: plane.textures[0]
        });
        plane.createTexture({
            sampler: "nextTex",
            fromTexture: plane.textures[1]
        });



        // listen to the scroll event
        // could be your virtual scroll library custom scroll event
        window.addEventListener("scroll", () => {
            // get our scroll values
            var scrollValues = {
                x: window.scrollX,
                y: window.scrollY,
            };
            // pass those values to the lib
            curtains.updateScrollValues(scrollValues.x, scrollValues.y);
        });
    }
} 
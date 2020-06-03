#version 300 es

out vec3 wPosition;
uniform vec3 cameraP;

void main() {


	wPosition = vec3(modelMatrix * vec4(position, 1.0));
	gl_Position = projectionMatrix * viewMatrix  * vec4(wPosition+cameraP, 1.0);
}



// Q3 (HINT) : The cube that the texture is mapped to is centered at the origin, using this information
// calculate the correct direction vector in the world coordinate system
// which is used to sample a color from the cubemap

// Q3 : Offset your pixel vertex position by the cameraPostion (given to you in world space)
// so that the cube is always in front of the camera even with zoom

// write here the required lighting calculations for blinn phong
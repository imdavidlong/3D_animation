#version 300 es

in vec3 vcsNormal;
in vec3 vcsPosition;

out vec4 out_FragColor;

uniform samplerCube skybox;
uniform mat4 CameraMatrixWorld;



vec3 reflect(vec3 w, vec3 n){
	return n*(dot(w,n)*2.0) - w; // bounce vector
}

void main( void ) {

  // Q4 : Calculate the vector that can be used to sample from the cubemap
  	vec3 normal = normalize(vcsNormal);
    //    --reflected coordinate(vec3):  V is in eye coordinate

//	vec3 I = normalize(cameraP-wPosition);
//	//vec3 I = normalize(vec3(CameraMatrixWorld-vec4(wPosition,0.0)));
	vec3 reflected = reflect(normalize(-vcsPosition),normal);

  	vec4 texColor0 = texture(skybox, vec3(CameraMatrixWorld * vec4(reflected,0.0)));
    out_FragColor = vec4(texColor0.xyz, 1.0);

}

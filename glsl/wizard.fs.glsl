#version 300 es

out vec4 out_FragColor;

in vec3 vcsNormal;
in vec3 vcsPosition;

uniform vec3 lightColor;
uniform float kDiffuse;
uniform float kSpecular;
uniform float kAmbient;
uniform float shininess;

uniform vec3 lightDirection;
uniform vec3 ambientColor;


uniform sampler2D colorMap;
uniform sampler2D normalMap;
in vec2 texCoord;

// List textures are passed in as uniforms

void main() {
	//Q2 Answer:
	vec3 N = normalize(vcsNormal);
	vec3 L = normalize(vec3(viewMatrix * vec4(lightDirection, 0.0)));

	//AMBIENT
	vec3 light_AMB =kAmbient * ambientColor;

	//DIFFUSE
	vec3 diffuse = kDiffuse * lightColor;
	vec3 light_DFF = diffuse * max(0.0, dot(N, L));

	//SPECULAR

	vec3 Nn = normalize(vcsNormal);
	vec3 V = -normalize(vcsPosition);
	vec3 halfway = normalize(V + L);
	vec3 light_SPC = kSpecular * pow(max(0.0,dot(halfway,N)),shininess) *lightColor;


	//Q2 Answer:
	//sample the color from colorMap and then assgined to diffuse color
	vec4 colorTexture = texture(colorMap, texCoord);
	light_DFF = light_DFF * vec3(colorTexture);

	//TOTAL
	vec3 TOTAL = light_AMB + light_DFF + light_SPC;

	out_FragColor = vec4(TOTAL, 1.0);
}

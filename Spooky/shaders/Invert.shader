shader_type canvas_item;
render_mode unshaded;

void fragment() {
	
	vec4 background_color = textureLod(SCREEN_TEXTURE, SCREEN_UV, 0.0).rgba;
	vec4 color = texture(TEXTURE, UV, 0.0).rgba;
	
	if (color.r == 0.0 && color.g == 0.0) {
		color.r = 1.0 - background_color.r;
		color.g = 1.0 - background_color.g;
		color.b = 1.0 - background_color.b;
		color.a = 1.0;
	}
	else if (color.r == 1.0 && color.g == 1.0) {
		color = background_color;
	}
	
	if (background_color.r == 1.0 && background_color.g == 0.0) {
		color.r = 0.0;
		color.g = 0.0;
		color.b = 0.0;
	}
	
	if (background_color.b == 1.0 && background_color.g == 0.0) {
		color.r = 1.0;
		color.g = 1.0;
		color.b = 1.0;
	}
	
	COLOR.rgba = color;
}
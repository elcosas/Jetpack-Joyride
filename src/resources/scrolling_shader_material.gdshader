shader_type canvas_item;

void fragment() {
	COLOR = texture(TEXTURE, vec2(UV.x + TIME, UV.y));
}

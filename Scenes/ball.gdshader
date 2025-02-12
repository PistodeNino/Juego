shader_type canvas_item;

void fragment() {
    vec4 tex_color = texture(TEXTURE, UV);
    
    vec3 target_color = vec3(132.0 / 255.0, 4.0 / 255.0, 252.0 / 255.0);  // RGB(132, 4, 252)
    float threshold = 0.3;

    float diff = distance(tex_color.rgb, target_color);
    if (diff < threshold) {
        tex_color.a = 0.0;
    }

    COLOR = tex_color;
}
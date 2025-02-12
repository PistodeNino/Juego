shader_type canvas_item;

void fragment() {
    vec4 tex_color = texture(TEXTURE, UV);


    vec3 target_color = vec3(0.0, 1.0, 0.0);
    float threshold = 0.3;

    float diff = distance(tex_color.rgb, target_color);
    if (diff < threshold) {
        tex_color.a = 0.0;
    }

    COLOR = tex_color;
}

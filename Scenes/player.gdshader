shader_type canvas_item;

void fragment() {
    vec4 tex_color = texture(TEXTURE, UV);
    
    // Color rosa aproximado a eliminar
    vec3 target_color = vec3(1.0, 0.0, 1.0); // RGB(255, 0, 255)
    float threshold = 0.3; // Ajusta este valor según el tono exacto del rosa

    float diff = distance(tex_color.rgb, target_color);
    if (diff < threshold) {
        tex_color.a = 0.0; // Hace transparente el color rosa
    }

    COLOR = tex_color;
}

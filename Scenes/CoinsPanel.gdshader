shader_type canvas_item;

uniform float pixel_size : hint_range(1.0, 10.0) = 4.0; // Tamaño de los píxeles

void fragment() {
    vec2 uv = SCREEN_UV; // Coordenadas de la textura
    uv = floor(uv * pixel_size) / pixel_size; // Redondear a la cuadrícula
    vec4 color = texture(TEXTURE, uv); // Obtener el color de la textura
    COLOR = color;
}
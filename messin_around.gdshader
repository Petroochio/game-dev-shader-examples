shader_type canvas_item;

uniform float scale: hint_range(0.0, 2.0, 0.1) = 1.0;
uniform vec4 mod_color : source_color;

uniform float flash : hint_range(0.0, 1.0) = 0.0;

uniform sampler2D screen_texture : hint_screen_texture;
uniform sampler2D noise_texture : repeat_enable;

void fragment() {
    // UV Intro
    // vec2 distortedUV = UV;
    // distortedUV.x -= UV.y * 0.2;
    // vec4 pixelColor = texture(TEXTURE, distortedUV);
    
    // Modulate example
    //vec4 pixelColor = texture(TEXTURE, UV);
    //float value = (pixelColor.b + pixelColor.b + pixelColor.b) / 3.0;
    ////COLOR = vec4(value, value, value, pixelColor.a);
    //COLOR = pixelColor * mod_color;
    
    // Flash effect
    //vec4 pixelColor = texture(TEXTURE, UV);
    //COLOR = mix(pixelColor, vec4(1), flash);
    //COLOR.a = pixelColor.a;
    
    //vec4 pixelColor = texture(TEXTURE, UV);
    //COLOR = pixelColor;
    
    // Basic screen distortion
    //vec2 distortedUV = SCREEN_UV + texture(TEXTURE, UV).r * 0.1;
    //vec4 pixelColor = texture(screen_texture, distortedUV);
    //COLOR = pixelColor;
    // Noise distortion
    vec2 distortedUV = SCREEN_UV + texture(noise_texture, UV + TIME / 2.0).r * 0.1;
    vec4 pixelColor = texture(screen_texture, distortedUV);
    COLOR = pixelColor;
}


void main() {
    // ======= CONST ========
    vec2 uv = v_tex_coord;
    lowp float dx = u_step / u_sprite_size.x;
    lowp float dy = u_step / u_sprite_size.y;
    
    // ======= MAIN =========
    lowp vec4 color = vec4(0.0);
    
    for (lowp float i=-u_radius; i<=u_radius; i+=1.0) {
        for (lowp float j=-u_radius; j<=u_radius; j+=1.0) {
            lowp vec2 xy = vec2(uv.x + i*dx, uv.y + j*dy);
            color += texture2D(u_texture, xy);
        }
    }
    lowp float norm = 2.0 * u_radius + 1;
    norm = norm * norm;
    gl_FragColor = color / norm;
}

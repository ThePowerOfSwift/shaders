void main() {
    // ======== Trick ========
    if (u_radius <= 1.0)
    {
        gl_FragColor = texture2D(u_texture, v_tex_coord);
    }
    
    // ======== CONST ========
    lowp float i_pi = 0.3183098861837907; // (1 / pi)
    lowp float u_sigma = float(int(u_radius)) / 3.0 + 0.24;
    lowp float s2_2 = 2 * u_sigma * u_sigma + 0.001;
    vec2 uv = v_tex_coord;
    lowp float dx = u_step / u_sprite_size.x;
    lowp float dy = u_step / u_sprite_size.y;
    
    // ======== MAIN =========
    lowp vec4 color = vec4(0.0);
    
    for (lowp float i=-u_radius; i<=u_radius; i+=1.0) {
        for (lowp float j=-u_radius; j<=u_radius; j+=1.0) {
            
            lowp float exp_ = exp(-(i*i + j*j) / s2_2);
            lowp vec2 xy = vec2(uv.x + i*dx, uv.y + j*dy);
            color += exp_ * texture2D(u_texture, xy);
        }
    }
    lowp float norm = i_pi / s2_2;
    gl_FragColor = color * norm;
}

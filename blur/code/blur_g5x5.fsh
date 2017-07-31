//[ 2,  4,  5,  4,  2],
//[ 4,  7,  9,  7,  4],
//[ 5,  9, 10,  9,  5],
//[ 4,  7,  9,  7,  4],
//[ 2,  4,  5,  4,  2]
void main() {
    lowp vec4 K0 = vec4(2,  4,  5,  4);
    lowp vec4 K1 = vec4(4,  7,  9,  7);
    lowp vec4 K2 = vec4(5,  9, 10,  9);
    
    // main stuff
    vec2 uv = v_tex_coord;
    float dx = u_step / u_sprite_size.x;
    float dy = u_step / u_sprite_size.y;
    vec4 color = vec4(0, 0, 0, 0);
    
    // row 0 col 0 1 2 3
    color += lowp mat4(texture2D(u_texture, vec2(uv.x - 2.0*dx, uv.y + 2.0*dy)),
                       texture2D(u_texture, vec2(uv.x - 1.0*dx, uv.y + 2.0*dy)),
                       texture2D(u_texture, vec2(uv.x         , uv.y + 2.0*dy)),
                       texture2D(u_texture, vec2(uv.x + 1.0*dx, uv.y + 2.0*dy))) * K0;
    
    // row 1 col 0 1 2 3
    color += lowp mat4(texture2D(u_texture, vec2(uv.x - 2.0*dx, uv.y + 1.0*dy)),
                       texture2D(u_texture, vec2(uv.x - 1.0*dx, uv.y + 1.0*dy)),
                       texture2D(u_texture, vec2(uv.x         , uv.y + 1.0*dy)),
                       texture2D(u_texture, vec2(uv.x + 1.0*dx, uv.y + 1.0*dy))) * K1;
    
    // row 2 col 0 1 2 3
    color += lowp mat4(texture2D(u_texture, vec2(uv.x - 2.0*dx, uv.y)),
                       texture2D(u_texture, vec2(uv.x - 1.0*dx, uv.y)),
                       texture2D(u_texture, vec2(uv.x         , uv.y)),
                       texture2D(u_texture, vec2(uv.x + 1.0*dx, uv.y))) * K2;
    
    // row 3 col 0 1 2 3
    color += lowp mat4(texture2D(u_texture, vec2(uv.x - 2.0*dx, uv.y - 1.0*dy)),
                       texture2D(u_texture, vec2(uv.x - 1.0*dx, uv.y - 1.0*dy)),
                       texture2D(u_texture, vec2(uv.x         , uv.y - 1.0*dy)),
                       texture2D(u_texture, vec2(uv.x + 1.0*dx, uv.y - 1.0*dy))) * K1;

    // row 4 col 0 1 2 3
    color += lowp mat4(texture2D(u_texture, vec2(uv.x - 2.0*dx, uv.y - 2.0*dy)),
                       texture2D(u_texture, vec2(uv.x - 1.0*dx, uv.y - 2.0*dy)),
                       texture2D(u_texture, vec2(uv.x         , uv.y - 2.0*dy)),
                       texture2D(u_texture, vec2(uv.x + 1.0*dx, uv.y - 2.0*dy))) * K0;
    
    // row 0 1 2 3 col 4
    color += lowp mat4(texture2D(u_texture, vec2(uv.x + 2.0*dx, uv.y + 2.0*dy)),
                       texture2D(u_texture, vec2(uv.x + 2.0*dx, uv.y + 1.0*dy)),
                       texture2D(u_texture, vec2(uv.x + 2.0*dx, uv.y         )),
                       texture2D(u_texture, vec2(uv.x + 2.0*dx, uv.y - 1.0*dy))) * vec4(K0.a, K1.a, K2.a, K1.a);
    
    // row 4 col 4
    color += texture2D(u_texture, vec2(uv.x + 2.0*dx, uv.y - 2.0*dy)) * K0.a;

    gl_FragColor = color / 150.0;
}



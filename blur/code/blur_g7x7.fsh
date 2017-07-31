//[ 1,  3,  4,  5,  4,  3,  1],
//[ 3,  6, 10, 11, 10,  6,  3],
//[ 4, 10, 15, 17, 15, 10,  4],
//[ 5, 11, 17, 20, 17, 11,  5],
//[ 4, 10, 15, 17, 15, 10,  4],
//[ 3,  6, 10, 11, 10,  6,  3],
//[ 1,  3,  4,  5,  4,  3,  1]
void main() {
    lowp vec4 K0 = vec4(1,  3,  4, 5);
    lowp vec4 K1 = vec4(3,  6, 10, 11);
    lowp vec4 K2 = vec4(4, 10, 15, 17);
    lowp vec4 K3 = vec4(5, 11, 17, 20);
    
    // main stuff
    vec2 uv = v_tex_coord;
    float dx = u_step / u_sprite_size.x;
    float dy = u_step / u_sprite_size.y;
    vec4 color = vec4(0, 0, 0, 0);
    
    // row 0 col 0 1 2 3
    color += lowp mat4(texture2D(u_texture, vec2(uv.x - 3.0*dx, uv.y + 3.0*dy)),
                       texture2D(u_texture, vec2(uv.x - 2.0*dx, uv.y + 3.0*dy)),
                       texture2D(u_texture, vec2(uv.x - 1.0*dx, uv.y + 3.0*dy)),
                       texture2D(u_texture, vec2(uv.x         , uv.y + 3.0*dy))) * K0;
    
    // row 1 col 0 1 2 3
    color += lowp mat4(texture2D(u_texture, vec2(uv.x - 3.0*dx, uv.y + 2.0*dy)),
                       texture2D(u_texture, vec2(uv.x - 2.0*dx, uv.y + 2.0*dy)),
                       texture2D(u_texture, vec2(uv.x - 1.0*dx, uv.y + 2.0*dy)),
                       texture2D(u_texture, vec2(uv.x         , uv.y + 2.0*dy))) * K1;
    
    // row 2 col 0 1 2 3
    color += lowp mat4(texture2D(u_texture, vec2(uv.x - 3.0*dx, uv.y + 1.0*dy)),
                       texture2D(u_texture, vec2(uv.x - 2.0*dx, uv.y + 1.0*dy)),
                       texture2D(u_texture, vec2(uv.x - 1.0*dx, uv.y + 1.0*dy)),
                       texture2D(u_texture, vec2(uv.x         , uv.y + 1.0*dy))) * K2;
    
    // row 3 col 0 1 2 3
    color += lowp mat4(texture2D(u_texture, vec2(uv.x - 3.0*dx, uv.y)),
                       texture2D(u_texture, vec2(uv.x - 2.0*dx, uv.y)),
                       texture2D(u_texture, vec2(uv.x - 1.0*dx, uv.y)),
                       texture2D(u_texture, vec2(uv.x         , uv.y))) * K3;
    
    // row 4 col 0 1 2 3
    color += lowp mat4(texture2D(u_texture, vec2(uv.x - 3.0*dx, uv.y - 1.0*dy)),
                       texture2D(u_texture, vec2(uv.x - 2.0*dx, uv.y - 1.0*dy)),
                       texture2D(u_texture, vec2(uv.x - 1.0*dx, uv.y - 1.0*dy)),
                       texture2D(u_texture, vec2(uv.x         , uv.y - 1.0*dy))) * K2;
    
    // row 5 col 0 1 2 3
    color += lowp mat4(texture2D(u_texture, vec2(uv.x - 3.0*dx, uv.y - 2.0*dy)),
                       texture2D(u_texture, vec2(uv.x - 2.0*dx, uv.y - 2.0*dy)),
                       texture2D(u_texture, vec2(uv.x - 1.0*dx, uv.y - 2.0*dy)),
                       texture2D(u_texture, vec2(uv.x         , uv.y - 2.0*dy))) * K1;
    
    // row 6 col 0 1 2 3
    color += lowp mat4(texture2D(u_texture, vec2(uv.x - 3.0*dx, uv.y - 3.0*dy)),
                       texture2D(u_texture, vec2(uv.x - 2.0*dx, uv.y - 3.0*dy)),
                       texture2D(u_texture, vec2(uv.x - 1.0*dx, uv.y - 3.0*dy)),
                       texture2D(u_texture, vec2(uv.x         , uv.y - 3.0*dy))) * K0;
    
    // row 0 col 4 5 6
    color += lowp mat4(texture2D(u_texture, vec2(uv.x + 1.0*dx, uv.y + 3.0*dy)),
                       texture2D(u_texture, vec2(uv.x + 2.0*dx, uv.y + 3.0*dy)),
                       texture2D(u_texture, vec2(uv.x + 3.0*dx, uv.y + 3.0*dy)),
                       vec4(0.0)) * K0.bgra;
    
    // row 1 col 4 5 6
    color += lowp mat4(texture2D(u_texture, vec2(uv.x + 1.0*dx, uv.y + 2.0*dy)),
                       texture2D(u_texture, vec2(uv.x + 2.0*dx, uv.y + 2.0*dy)),
                       texture2D(u_texture, vec2(uv.x + 3.0*dx, uv.y + 2.0*dy)),
                       vec4(0.0)) * K1.bgra;

    // row 2 col 4 5 6
    color += lowp mat4(texture2D(u_texture, vec2(uv.x + 1.0*dx, uv.y + 1.0*dy)),
                       texture2D(u_texture, vec2(uv.x + 2.0*dx, uv.y + 1.0*dy)),
                       texture2D(u_texture, vec2(uv.x + 3.0*dx, uv.y + 1.0*dy)),
                       vec4(0.0)) * K2.bgra;

    // row 3 col 4 5 6
    color += lowp mat4(texture2D(u_texture, vec2(uv.x + 1.0*dx, uv.y)),
                       texture2D(u_texture, vec2(uv.x + 2.0*dx, uv.y)),
                       texture2D(u_texture, vec2(uv.x + 3.0*dx, uv.y)),
                       vec4(0.0)) * K3.bgra;

    // row 4 col 4 5 6
    color += lowp mat4(texture2D(u_texture, vec2(uv.x + 1.0*dx, uv.y - 1.0*dy)),
                       texture2D(u_texture, vec2(uv.x + 2.0*dx, uv.y - 1.0*dy)),
                       texture2D(u_texture, vec2(uv.x + 3.0*dx, uv.y - 1.0*dy)),
                       vec4(0.0)) * K2.bgra;
    
    // row 5 col 4 5 6
    color += lowp mat4(texture2D(u_texture, vec2(uv.x + 1.0*dx, uv.y - 2.0*dy)),
                       texture2D(u_texture, vec2(uv.x + 2.0*dx, uv.y - 2.0*dy)),
                       texture2D(u_texture, vec2(uv.x + 3.0*dx, uv.y - 2.0*dy)),
                       vec4(0.0)) * K1.bgra;
    
    // row 6 col 4 5 6
    color += lowp mat4(texture2D(u_texture, vec2(uv.x + 1.0*dx, uv.y - 3.0*dy)),
                       texture2D(u_texture, vec2(uv.x + 2.0*dx, uv.y - 3.0*dy)),
                       texture2D(u_texture, vec2(uv.x + 3.0*dx, uv.y - 3.0*dy)),
                       vec4(0.0)) * K0.bgra;
    
    gl_FragColor = color / 400.0;
}






# Blur Shaders

## Sprite Kit and Blur
**SpriteKit** provides developers with `SKEffectNode` which could be used with `CIFilter`. This combination allows one to blur the child nodes. However, it would be extremely slow for the case of dynamic objects. 
Another way of blurring is `SKShader`. It process the texture with GPU power, that's why it is fast. Moreover, custom blur could be faster than the build-ins because of some hits and tricks for the certain needs.

## Uniforms
 
- `float u_radius` - blur radius
- `float u_step` - the multiplier of the radius
- `float u_sigma` - sigma in Normal Distribution (default `u_radius  / 3.0`)
- `vec2 u_sprite_size` - size of a sprite

## How to use
In order to make the fast Gaussian Blur with effective radius of 9 pixels, we choose `u_radius=3.0` and `u_step=3.0`.

```swift
let node = self.childNode(withName: "node") as! SKSpriteNode
let shader = SKShader(fileNamed: "blur_gauss.fsh")
let sizeVec = vector_float2(Float(node.frame.size.width),
                            Float(node.frame.size.height))
shader.uniforms = [
    SKUniform(name: "u_step", float: 3.0),
    SKUniform(name: "u_radius", float: 3.0),
    SKUniform(name: "u_sprite_size", vectorFloat2: sizeVec)
]
node.shader = shader
```

## Shaders

| Shader | Image  |
|:------:|:------:|
|[blur_box.fsh](Box blur). `u_radius=10.0; u_step=1.0`|![](src/box_10.png)|
|[blur_box.fsh](Box blur). `u_radius=5.0; u_step=2.0`|![](src/box_5_st2.png)|
|[blur_gauss.fsh](Box blur). `u_radius=10.0; u_step=1.0`|![](src/gauss_10.png)|
|[blur_gauss.fsh](Box blur). `u_radius=5.0; u_step=2.0`|![](src/gauss_5_st2.png)|
|[blur_g5x5.fsh](Box blur). `u_radius=5.0; u_step=2.0`|![](src/g5x5_st2.png)|
|[blur_g7x7.fsh](Box blur). `u_radius=7.0; u_step=10.0/7.0`|![](src/g7x7_st1.4.png)|







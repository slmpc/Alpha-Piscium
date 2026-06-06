#include "/Base.glsl"
#include "/base/TextOptions.glsl"
#include "/util/Dither.glsl"
#include "/util/Rand.glsl"

layout(location = 0) out vec4 rt_out;

vec4 final_hermiteWeights(float t) {
    float t2 = t * t;
    float t3 = t2 * t;
    float s = SETTING_RENDER_SCALE_SHARPNESS;
    return vec4(
        -s * t3 + 2.0 * s * t2 - s * t,
        (2.0 - s) * t3 + (s - 3.0) * t2 + 1.0,
        (s - 2.0) * t3 + (3.0 - 2.0 * s) * t2 + s * t,
        s * t3 - s * t2
    );
}

vec4 final_sampleMainUpscaled(vec2 screenUV) {
    vec2 texelPos = screenUV * uval_mainImageSize;
    vec2 centerPixel = texelPos - 0.5;
    ivec2 baseTexel = ivec2(floor(centerPixel)) - 1;
    vec2 f = fract(centerPixel);

    vec4 weightsX = final_hermiteWeights(f.x);
    vec4 weightsY = final_hermiteWeights(f.y);
    vec4 result = vec4(0.0);
    float weightSum = 0.0;
    for (int y = 0; y < 4; ++y) {
        for (int x = 0; x < 4; ++x) {
            float weight = weightsX[x] * weightsY[y];
            ivec2 sampleTexel = clamp(baseTexel + ivec2(x, y), ivec2(0), uval_mainImageSizeI - 1);
            result += texelFetch(usam_main, sampleTexel, 0) * weight;
            weightSum += weight;
        }
    }
    return result / weightSum;
}

void main() {
    ivec2 texelPos = ivec2(gl_FragCoord.xy);
    float ditherNoise = rand_IGN(texelPos, frameCounter);
    if (SETTING_RENDER_SCALE < 0.999) {
        vec2 screenUV = (vec2(texelPos) + 0.5) * uval_viewImageSizeRcp;
        rt_out = final_sampleMainUpscaled(screenUV);
    } else {
        rt_out = texelFetch(usam_main, texelPos, 0);
    }
    rt_out = dither_u8(rt_out, ditherNoise);
}

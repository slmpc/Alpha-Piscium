#ifndef INCLUDE_util_RenderScale_glsl
#define INCLUDE_util_RenderScale_glsl a

void renderScale_applyGBufferScale(inout vec4 position) {
    position.xy /= position.w;
    position.xy = position.xy * uval_mainImageScale + uval_mainImageScale - 1.0;
    position.xy *= position.w;
}

bool renderScale_isOutsideMainViewport(vec2 fragCoord) {
    return any(greaterThanEqual(fragCoord, uval_mainImageSize));
}

#endif

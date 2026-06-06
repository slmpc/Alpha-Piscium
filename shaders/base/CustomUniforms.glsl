#ifndef SKIP_UNIFORMS
uniform vec2 uval_rtwsmMin;

uniform vec3 uval_sunDirView;
uniform vec3 uval_sunDirWorld;

uniform vec3 uval_moonDirView;
uniform vec3 uval_moonDirWorld;

uniform vec3 uval_shadowLightDirView;
uniform vec3 uval_shadowLightDirWorld;

uniform vec3 uval_upDirView;

uniform bool uval_sunVisible;
uniform vec2 uval_sunNdcPos;
uniform bool uval_moonVisible;
uniform vec2 uval_moonNdcPos;

uniform float uval_dayNightTransition;

uniform vec3 uval_cuDetailWind;

uniform vec2 uval_viewImageSize;
uniform vec2 uval_viewImageSizeRcp;
uniform int uval_viewImageSizeIX;
uniform int uval_viewImageSizeIY;

uniform vec2 uval_mainImageSize;
uniform vec2 uval_mainImageSizeRcp;
uniform int uval_mainImageSizeIX;
uniform int uval_mainImageSizeIY;
uniform vec2 uval_mainImageScale;

uniform vec3 uval_cameraDelta;

uniform vec2 uval_taaJitter;
uniform vec2 uval_prevTaaJitter;
uniform vec2 uval_taaJitterUV;
uniform vec2 uval_r2Frame;
uniform int uval_restirSpatialTileOffsetX;
uniform int uval_restirSpatialTileOffsety;
ivec2 uval_restirSpatialTileOffset = ivec2(uval_restirSpatialTileOffsetX, uval_restirSpatialTileOffsety);
#endif

ivec2 uval_viewImageSizeI = ivec2(uval_viewImageSizeIX, uval_viewImageSizeIY);
ivec2 uval_mainImageSizeI = ivec2(uval_mainImageSizeIX, uval_mainImageSizeIY);

#if SETTING_RENDER_SCALE == 0
const float RENDER_SCALE_FACTOR = 0.5;
#elif SETTING_RENDER_SCALE == 1
const float RENDER_SCALE_FACTOR = 0.55;
#elif SETTING_RENDER_SCALE == 2
const float RENDER_SCALE_FACTOR = 0.6;
#elif SETTING_RENDER_SCALE == 3
const float RENDER_SCALE_FACTOR = 0.65;
#elif SETTING_RENDER_SCALE == 4
const float RENDER_SCALE_FACTOR = 0.7;
#elif SETTING_RENDER_SCALE == 5
const float RENDER_SCALE_FACTOR = 0.75;
#elif SETTING_RENDER_SCALE == 6
const float RENDER_SCALE_FACTOR = 0.8;
#elif SETTING_RENDER_SCALE == 7
const float RENDER_SCALE_FACTOR = 0.85;
#elif SETTING_RENDER_SCALE == 8
const float RENDER_SCALE_FACTOR = 0.9;
#elif SETTING_RENDER_SCALE == 9
const float RENDER_SCALE_FACTOR = 0.95;
#else
const float RENDER_SCALE_FACTOR = 1.0;
#endif

const vec2 RENDER_SCALE_WORKGROUPS = vec2(RENDER_SCALE_FACTOR, RENDER_SCALE_FACTOR);

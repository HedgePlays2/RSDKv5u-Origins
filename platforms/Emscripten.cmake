# Emscripten / browser build for RSDKv5U Origins.
# SDL2 is supplied by Emscripten's ports system.
add_executable(RetroEngine ${RETRO_FILES})

set(RETRO_SUBSYSTEM "SDL2")
set(DEP_PATH android)

set(COMPILE_OGG TRUE)
set(COMPILE_THEORA TRUE)

target_compile_options(RetroEngine PRIVATE
    -Wno-microsoft-cast
    -Wno-microsoft-exception-spec
)

target_compile_definitions(RetroEngine PRIVATE
    RSDK_USE_SDL2=1
    RETRO_AUDIODEVICE_SDL2=1
    RETRO_INPUTDEVICE_SDL2=1
)

target_compile_options(RetroEngine PRIVATE
    -sUSE_SDL=2
)

target_link_options(RetroEngine PRIVATE
    -sUSE_SDL=2
    -sALLOW_MEMORY_GROWTH=1
    -sASYNCIFY
    -sEXIT_RUNTIME=0
    -sFORCE_FILESYSTEM=1
)

set_target_properties(RetroEngine PROPERTIES
    OUTPUT_NAME "index"
    SUFFIX ".html"
)

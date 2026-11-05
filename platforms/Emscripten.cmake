# Emscripten / browser build for RSDKv5U Origins.
# SDL2 is supplied by Emscripten's ports system.

# The Origins fork's main.cpp, Patches.cpp, SigScan.cpp and related files are
# Windows process-injection/patch-loader code, not a portable engine launcher.
# The browser build uses a small native entry point instead.
list(REMOVE_ITEM RETRO_FILES
    RSDKv5/main.cpp
    RSDKv5/Patches.cpp
    RSDKv5/S3K.cpp
    RSDKv5/S3KFunctions.cpp
    RSDKv5/SigScan.cpp
    RSDKv5/Symbols.cpp
)
list(APPEND RETRO_FILES RSDKv5/wasm_main.cpp)

add_executable(RetroEngine ${RETRO_FILES})

set(RETRO_SUBSYSTEM "SDL2")
set(DEP_PATH android)

set(COMPILE_OGG TRUE)
set(COMPILE_THEORA TRUE)

target_compile_options(RetroEngine PRIVATE
    -Wno-microsoft-cast
    -Wno-microsoft-exception-spec
    -sUSE_SDL=2
)

target_compile_definitions(RetroEngine PRIVATE
    RSDK_USE_SDL2=1
    RETRO_AUDIODEVICE_SDL2=1
    RETRO_INPUTDEVICE_SDL2=1
)

target_link_options(RetroEngine PRIVATE
    -sUSE_SDL=2
    -sALLOW_MEMORY_GROWTH=1
    -sASYNCIFY
    -sEXIT_RUNTIME=0
    -sFORCE_FILESYSTEM=1
)

set(RETRO_OUTPUT_NAME "index" CACHE STRING "The exported name of the executable." FORCE)

set_target_properties(RetroEngine PROPERTIES
    SUFFIX ".html"
)

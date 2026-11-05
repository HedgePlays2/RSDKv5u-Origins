#include "RSDK/Core/RetroEngine.hpp"

// Browser entry point. The browser build is a standalone engine executable;
// game logic and game data must be provided separately.
int main(int argc, char **argv)
{
    RSDK::InitCoreAPI();
    int32 result = RSDK::RunRetroEngine(argc, argv);
    RSDK::ReleaseCoreAPI();
    return result;
}

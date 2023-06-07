/*
Steam: "BlueCode-Win64-Shipping.exe"+4913EB0
Epic: "BlueCode-Win64-Shipping.exe"+4AA0C30
Offsets: 0x118, 0x348

points at

enum class EGameState : uint8_t
{
    None           = 0,
    IIS            = 1,
    Intro          = 2,
    Playing        = 3,
    Inspecting     = 4,
    PuzzleMode     = 5,
    Journal        = 6,
    OneiricJournal = 7,
    Paused         = 8,
    Loading        = 9,
    Message        = 10,
    ReadyToPlay    = 11
};
*/


state("BlueCode-Win64-Shipping", "Steam 1.5.3.0")
{
    int GameState: 0x4AA0C30, 0x118, 0x348;
}
state("BlueCode-Win64-Shipping", "Epic Games 1.5.4.10")
{
    int GameState: 0x4913EB0, 0x118, 0x348;
}

start
{
    if (old.GameState == 2 && current.GameState == 0) {
        return true;
    } else if (old.GameState == 2 && current.GameState == 9) {
        return true;
    } else {
        return false;
    }
}

reset
{
    if (old.GameState == 8 && current.GameState == 2) {
        return true;
    } else {
        return false;
    }
}

isLoading
{
    return (current.GameState == 9 || current.GameState == 0);
}
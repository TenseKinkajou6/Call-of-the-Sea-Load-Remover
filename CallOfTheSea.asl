/*
GWorld Addresses:
Steam: "BlueCode-Win64-Shipping.exe"+4913EB0
Epic: "BlueCode-Win64-Shipping.exe"+4AA0C30

GameState values:
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


Level values:
Main Menu        = 1
Intro            = 2
White Beach      = 3
Base Camp        = 4
Sleep            = 5
Black Beach      = 6
Peak             = 7
Desert           = 8
Town             = 9
Temple           = 10
Ending           = 11
Alternate Ending = 12

The only reason this was even remotely possible was due to Ero's extensive help.

*/


state("BlueCode-Win64-Shipping", "Epic 1.5.4.10")
{
    int GameState: 0x4AA0C30, 0x118, 0x348;
    int level: 0x4AA0C30, 0x180, 0x8A2;
}
state("BlueCode-Win64-Shipping", "Steam 1.5.3.0")
{
    int GameState: 0x4913EB0, 0x118, 0x348;
    int level: 0x4913EB0, 0x180, 0x88A;
}

start
{
    if ((old.GameState == 9 || old.GameState == 0) && current.GameState == 3 && current.level == 2) {
        return true;
    }
    return false;
}

split
{
    return old.level != current.level;
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

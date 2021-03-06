// By commy2
#include "script_component.hpp"

// Unmute unit if that player disconnects
if (isServer) then {
    addMissionEventHandler ["HandleDisconnect", {
        [_this select 0, "isPlayer"] call EFUNC(common,unmuteUnit);
    }];
};

if (!hasInterface) exitWith {};

// Handle early CBA_fnc_addPlayerEventHandler
if (!isNull ace_player) then {
    [ace_player, "isPlayer"] call EFUNC(common,muteUnit);
};

// Mutes/unmutes units when the player changes
["unit", {
    params ["_newPlayer", "_oldPlayer"];

    // Mute the new player
    [_newPlayer, "isPlayer"] call EFUNC(common,muteUnit);

    // Unmute the old player
    if (alive _oldPlayer) then {
        [_oldPlayer, "isPlayer"] call EFUNC(common,unmuteUnit);
    };
}] call CBA_fnc_addPlayerEventHandler;

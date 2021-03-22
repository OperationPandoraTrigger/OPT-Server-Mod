/**
* Description:
* Flggenwahl Dialog
*
* Author:
* Lord-MDB
*
* Arguments:
* None
*
* Return Value:
* None
*
* Server only:
* No
*
* Public:
* No 
* 
* Global:
* No
* 
* API:
* No
*
* Example:
* [] call FUNC(chooseflag);
*/
#include "macros.hpp"

openMap [true, false];

 // instructions for player
private _txt = MLOC(SECTORCONTROL_INSTRUCTION);
private _header = MLOC(SECTORCONTROL_INSTRUCTION_HEADER);
hint format ["%1\n\n%2", _header, _txt];

// Memory for markers which are deleted on map-close
GVAR(waffenruheFlagMarkers) = [];

// create local marker for each flag pole and restore selected flagmarkers
{
    // only process opt flags
    if (_x getVariable ["opt_flag", false]) then
    {
        // only show attack flags
        switch OPT_GELDZEIT_Fraktionauswahl do 
        {
            case "AAFvsCSAT":
            {
                switch (playerSide) do 
                {
                    case east: 
                    {
                        // Flaggenpunkte die zur Auswahl stehen
                        if (_x getVariable ["start_owner", sideUnknown] == independent) then 
                        {
                            private _markerName = format["OptionMarkerCSAT_%1_%2", _forEachIndex, _x];
                            private _marker = createMarkerLocal [_markerName, getPos _x];
                            _marker setMarkerTypeLocal "hd_objective";
                            GVAR(waffenruheFlagMarkers) pushBackUnique _marker;
                        };

                        // Gewählte Ziele
                        if (_x in GVAR(aaf_flags)) then 
                        {
                            private _markerName = format["ActiveMarkerCSAT_%1", _x];
                            private _marker = createMarkerLocal [_markerName, getPos _x];
                            _marker setMarkerTypeLocal "selector_selectedMission";
                            _marker setMarkerSizeLocal [2,2];
                            _marker setMarkerColorLocal "ColorOPFOR";
                            GVAR(waffenruheFlagMarkers) pushBackUnique _marker;
                        };
                    };

                    case independent: 
                    {
                        // Flaggenpunkte die zur Auswahl stehen
                        if (_x getVariable ["start_owner", sideUnknown] == east) then 
                        {
                            private _markerName = format["OptionMarkerGUER_%1_%2", _forEachIndex, _x];
                            private _marker = createMarkerLocal [_markerName, getPos _x];
                            _marker setMarkerTypeLocal "hd_objective";
                            GVAR(waffenruheFlagMarkers) pushBackUnique _marker;
                        };

                        // Gewählte Ziele
                        if (_x in GVAR(csat_flags)) then 
                        {
                            private _markerName = format["ActiveMarkerGUER_%1", _x];
                            private _marker = createMarkerLocal [_markerName, getPos _x];
                            _marker setMarkerTypeLocal "selector_selectedMission";
                            _marker setMarkerSizeLocal [2,2];
                            _marker setMarkerColorLocal "ColorIndependent";
                            GVAR(waffenruheFlagMarkers) pushBackUnique _marker;
                        };
                    };    
                };          
            };

            case "NATOvsCSAT":
            {
                switch (playerSide) do 
                {
                    case west: 
                    {
                        // Flaggenpunkte die zur Auswahl stehen
                        if (_x getVariable ["start_owner", sideUnknown] == east) then 
                        {
                            private _markerName = format["OptionMarkerNATO_%1_%2", _forEachIndex, _x];
                            private _marker = createMarkerLocal [_markerName, getPos _x];
                            _marker setMarkerTypeLocal "hd_objective";
                            GVAR(waffenruheFlagMarkers) pushBackUnique _marker;
                        };

                        // Gewählte Ziele
                        if (_x in GVAR(csat_flags)) then 
                        {
                            private _markerName = format["ActiveMarkerNATO_%1", _x];
                            private _marker = createMarkerLocal [_markerName, getPos _x];
                            _marker setMarkerTypeLocal "selector_selectedMission";
                            _marker setMarkerSizeLocal [2,2];
                            _marker setMarkerColorLocal "ColorBLUFOR";
                            GVAR(waffenruheFlagMarkers) pushBackUnique _marker;
                        };
                    };

                    case east: 
                    {
                        // Flaggenpunkte die zur Auswahl stehen
                        if (_x getVariable ["start_owner", sideUnknown] == west) then 
                        {
                            private _markerName = format["OptionMarkerCSAT_%1_%2", _forEachIndex, _x];
                            private _marker = createMarkerLocal [_markerName, getPos _x];
                            _marker setMarkerTypeLocal "hd_objective";
                            GVAR(waffenruheFlagMarkers) pushBackUnique _marker;
                        };

                        // Gewählte Ziele
                        if (_x in GVAR(nato_flags)) then 
                        {
                            private _markerName = format["ActiveMarkerCSAT_%1", _x];
                            private _marker = createMarkerLocal [_markerName, getPos _x];
                            _marker setMarkerTypeLocal "selector_selectedMission";
                            _marker setMarkerSizeLocal [2,2];
                            _marker setMarkerColorLocal "ColorOPFOR";
                            GVAR(waffenruheFlagMarkers) pushBackUnique _marker;
                        };
                    };
                };    
            };

            case "NATOvsAAF":
            {
                switch (playerSide) do 
                {
                    case west: 
                    {
                        // Flaggenpunkte die zur Auswahl stehen
                        if (_x getVariable ["start_owner", sideUnknown] == east) then 
                        {
                            private _markerName = format["OptionMarkerNATO_%1_%2", _forEachIndex, _x];
                            private _marker = createMarkerLocal [_markerName, getPos _x];
                            _marker setMarkerTypeLocal "hd_objective";
                            GVAR(waffenruheFlagMarkers) pushBackUnique _marker;
                        };

                        // Gewählte Ziele
                        if (_x in GVAR(csat_flags)) then 
                        {
                            private _markerName = format["ActiveMarkerNATO_%1", _x];
                            private _marker = createMarkerLocal [_markerName, getPos _x];
                            _marker setMarkerTypeLocal "selector_selectedMission";
                            _marker setMarkerSizeLocal [2,2];
                            _marker setMarkerColorLocal "ColorBLUFOR";
                            GVAR(waffenruheFlagMarkers) pushBackUnique _marker;
                        };
                    };

                    case independent: 
                    {
                        // Flaggenpunkte die zur Auswahl stehen
                        if (_x getVariable ["start_owner", sideUnknown] == east) then 
                        {
                            private _markerName = format["OptionMarkerGUER_%1_%2", _forEachIndex, _x];
                            private _marker = createMarkerLocal [_markerName, getPos _x];
                            _marker setMarkerTypeLocal "hd_objective";
                            GVAR(waffenruheFlagMarkers) pushBackUnique _marker;
                        };

                        // Gewählte Ziele
                        if (_x in GVAR(nato_flags)) then {
                            private _markerName = format["ActiveMarkerGUER_%1", _x];
                            private _marker = createMarkerLocal [_markerName, getPos _x];
                            _marker setMarkerTypeLocal "selector_selectedMission";
                            _marker setMarkerSizeLocal [2,2];
                            _marker setMarkerColorLocal "ColorIndependent";
                            GVAR(waffenruheFlagMarkers) pushBackUnique _marker;
                        };
                    };
                };     
            };

            default
            {
                ERROR_LOG("chooseflag: Fehlehalte Datenübergabe keine Fraktionauswahl erkannt");
                private _side = sideUnknown;
            };
        };
    };
} forEach allMissionObjects "FlagPole_F";

// add EH for mouse action
/* _this ([<units>,<pos>,<alt>,<shift>]) and in special variables _units, _pos, _alt, _shift */
["sectorMap", "onMapSingleClick", {
    private _flag = nearestObjects [_pos, ["FlagPole_F"], 100];
    private _txtplayer = "STR_OPT_SECTORCONTROL_FLAG_CONFIRM" call CLib_fnc_readLocalisation;

    if (count _flag > 0) then 
    {
        _flag = _flag select 0;

        // bugfix if enemy flag was chosen
        if ((_flag getVariable ["start_owner", sideUnknown]) == PLAYERSIDE) exitWith{};

        switch OPT_GELDZEIT_Fraktionauswahl do 
        {
            case "AAFvsCSAT":
            {
                switch (playerside) do
                {
                    case east:
                    {
                        private _index = GVAR(aaf_flags) find _flag;

                        // flagge schon aktiv gewesen? -> löschen
                        if (_index >= 0) then
                        {
                            allMapMarkers apply
                            {
                                if (getMarkerType _x isEqualTo "selector_selectedMission" and _flag distance2D getMarkerPos _x < 1) then
                                {
                                    deleteMarkerLocal _x;
                                };
                            };
                            GVAR(aaf_flags) deleteAt _index;
                            publicVariable QGVAR(aaf_flags);
                            GVAR(waffenruheFlagMarkers) deleteAt (GVAR(waffenruheFlagMarkers) find _flag);
                        }

                        // neue flagge? -> hinzufügen
                        else
                        { 
                            // noch genügend flaggen erlaubt?
                            if (count GVAR(aaf_flags) < round GVAR(flagCountAAF)) then
                            {
                                private _markerName = format["ActiveMarker_%1", _flag];
                                private _marker = createMarkerLocal [_markerName, getPos _flag];
                                GVAR(waffenruheFlagMarkers) pushBackUnique _marker;
                                _marker setMarkerTypeLocal "selector_selectedMission";
                                _marker setMarkerSizeLocal [2,2];
                                _marker setMarkerColorLocal "ColorOPFOR";
                                GVAR(aaf_flags) pushBack _flag;
                                publicVariable QGVAR(aaf_flags);
                            };
                        };
                        systemChat format [_txtplayer, count GVAR(aaf_flags), round GVAR(flagCountAAF)];
                    };            
    
                    case independent:
                    {
                        private _index = GVAR(csat_flags) find _flag;

                        // flagge schon aktiv gewesen? -> löschen
                        if (_index >= 0) then
                        {
                            allMapMarkers apply
                            {
                                if (getMarkerType _x isEqualTo "selector_selectedMission" and _flag distance2D getMarkerPos _x < 1) then
                                {
                                    deleteMarkerLocal _x;
                                };
                            };
                            GVAR(csat_flags) deleteAt _index;
                            publicVariable QGVAR(csat_flags);
                            GVAR(waffenruheFlagMarkers) deleteAt (GVAR(waffenruheFlagMarkers) find _flag);
                        }

                        // neue flagge? -> hinzufügen
                        else
                        { 
                            // noch genügend flaggen erlaubt?
                            if (count GVAR(csat_flags) < round GVAR(flagCountCSAT)) then
                            {
                                private _markerName = format["ActiveMarker_%1", _flag];
                                private _marker = createMarkerLocal [_markerName, getPos _flag];
                                GVAR(waffenruheFlagMarkers) pushBackUnique _marker;
                                _marker setMarkerTypeLocal "selector_selectedMission";
                                _marker setMarkerSizeLocal [2,2];
                                _marker setMarkerColorLocal "ColorIndependent";
                                GVAR(csat_flags) pushBack _flag;
                                publicVariable QGVAR(csat_flags);
                            };
                        };
                        systemChat format [_txtplayer, count GVAR(csat_flags), round GVAR(flagCountCSAT)];
                    };
                };   
            };

            case "NATOvsCSAT":
            {
                switch (playerside) do
                {
                    case west:
                    {
                        private _index = GVAR(csat_flags) find _flag;

                        // flagge schon aktiv gewesen? -> löschen
                        if (_index >= 0) then
                        {
                            allMapMarkers apply
                            {
                                if (getMarkerType _x isEqualTo "selector_selectedMission" and _flag distance2D getMarkerPos _x < 1) then
                                {
                                    deleteMarkerLocal _x;
                                };
                            };
                            GVAR(csat_flags) deleteAt _index;
                            publicVariable QGVAR(csat_flags);
                            GVAR(waffenruheFlagMarkers) deleteAt (GVAR(waffenruheFlagMarkers) find _flag);
                        }

                        // neue flagge? -> hinzufügen
                        else
                        { 
                            // noch genügend flaggen erlaubt?
                            if (count GVAR(csat_flags) < round GVAR(flagCountCSAT)) then
                            {
                                private _markerName = format["ActiveMarker_%1", _flag];
                                private _marker = createMarkerLocal [_markerName, getPos _flag];
                                GVAR(waffenruheFlagMarkers) pushBackUnique _marker;
                                _marker setMarkerTypeLocal "selector_selectedMission";
                                _marker setMarkerSizeLocal [2,2];
                                _marker setMarkerColorLocal "ColorBLUFOR";
                                GVAR(csat_flags) pushBack _flag;
                                publicVariable QGVAR(csat_flags);
                            };
                        };
                        systemChat format [_txtplayer, count GVAR(csat_flags), round GVAR(flagCountCSAT)];
                    };

                    case east:
                    {
                        private _index = GVAR(nato_flags) find _flag;

                        // flagge schon aktiv gewesen? -> löschen
                        if (_index >= 0) then
                        {
                            allMapMarkers apply
                            {
                                if (getMarkerType _x isEqualTo "selector_selectedMission" and _flag distance2D getMarkerPos _x < 1) then
                                {
                                    deleteMarkerLocal _x;
                                };
                            };
                            GVAR(nato_flags) deleteAt _index;
                            publicVariable QGVAR(nato_flags);
                            GVAR(waffenruheFlagMarkers) deleteAt (GVAR(waffenruheFlagMarkers) find _flag);
                        }

                        // neue flagge? -> hinzufügen
                        else
                        { 
                            // noch genügend flaggen erlaubt?
                            if (count GVAR(nato_flags) < round GVAR(flagCountNATO)) then
                            {
                                private _markerName = format["ActiveMarker_%1", _flag];
                                private _marker = createMarkerLocal [_markerName, getPos _flag];
                                GVAR(waffenruheFlagMarkers) pushBackUnique _marker;
                                _marker setMarkerTypeLocal "selector_selectedMission";
                                _marker setMarkerSizeLocal [2,2];
                                _marker setMarkerColorLocal "ColorOPFOR";
                                GVAR(nato_flags) pushBack _flag;
                                publicVariable QGVAR(nato_flags);
                            };
                        };
                        systemChat format [_txtplayer, count GVAR(nato_flags), round GVAR(flagCountNATO)];
                    };
                };                 
            };

            case "NATOvsAAF":
            {
                switch (playerside) do
                {
                    case west:
                    {
                        private _index = GVAR(aaf_flags) find _flag;

                        // flagge schon aktiv gewesen? -> löschen
                        if (_index >= 0) then
                        {
                            allMapMarkers apply
                            {
                                if (getMarkerType _x isEqualTo "selector_selectedMission" and _flag distance2D getMarkerPos _x < 1) then
                                {
                                    deleteMarkerLocal _x;
                                };
                            };
                            GVAR(aaf_flags) deleteAt _index;
                            publicVariable QGVAR(aaf_flags);
                            GVAR(waffenruheFlagMarkers) deleteAt (GVAR(waffenruheFlagMarkers) find _flag);
                        }

                        // neue flagge? -> hinzufügen
                        else
                        { 
                            // noch genügend flaggen erlaubt?
                            if (count GVAR(aaf_flags) < round GVAR(flagCountAAF)) then
                            {
                                private _markerName = format["ActiveMarker_%1", _flag];
                                private _marker = createMarkerLocal [_markerName, getPos _flag];
                                GVAR(waffenruheFlagMarkers) pushBackUnique _marker;
                                _marker setMarkerTypeLocal "selector_selectedMission";
                                _marker setMarkerSizeLocal [2,2];
                                _marker setMarkerColorLocal "ColorBLUFOR";
                                GVAR(csat_flags) pushBack _flag;
                                publicVariable QGVAR(csat_flags);
                            };
                        };
                        systemChat format [_txtplayer, count GVAR(csat_flags), round GVAR(flagCountCSAT)];
                    };

                    case independent:
                    {
                        private _index = GVAR(nato_flags) find _flag;

                        // flagge schon aktiv gewesen? -> löschen
                        if (_index >= 0) then
                        {
                            allMapMarkers apply
                            {
                                if (getMarkerType _x isEqualTo "selector_selectedMission" and _flag distance2D getMarkerPos _x < 1) then
                                {
                                    deleteMarkerLocal _x;
                                };
                            };
                            GVAR(nato_flags) deleteAt _index;
                            publicVariable QGVAR(nato_flags);
                            GVAR(waffenruheFlagMarkers) deleteAt (GVAR(waffenruheFlagMarkers) find _flag);
                        }

                        // neue flagge? -> hinzufügen
                        else
                        { 
                            // noch genügend flaggen erlaubt?
                            if (count GVAR(nato_flags) < round GVAR(flagCountNATO)) then
                            {
                                private _markerName = format["ActiveMarker_%1", _flag];
                                private _marker = createMarkerLocal [_markerName, getPos _flag];
                                GVAR(waffenruheFlagMarkers) pushBackUnique _marker;
                                _marker setMarkerTypeLocal "selector_selectedMission";
                                _marker setMarkerSizeLocal [2,2];
                                _marker setMarkerColorLocal "ColorIndependent";
                                GVAR(nato_flags) pushBack _flag;
                                publicVariable QGVAR(nato_flags);
                            };
                        };
                        systemChat format [_txtplayer, count GVAR(nato_flags), round GVAR(flagCountNATO)];
                    };
                };                          
            };

            default 
            {
                ERROR_LOG("chooseflag: Fehlehalte Datenübergabe keine Fraktionauswahl erkannt");
                private _side = sideUnknown;
            };
        };    
    }; 
}] call BIS_fnc_addStackedEventHandler;

DFUNC(REH) = 
{
    ["sectorMap", "onMapSingleClick"] call BIS_fnc_removeStackedEventHandler;

    // Alle Marker beim Schließen der Karte entfernen und Array löschen
    GVAR(waffenruheFlagMarkers) apply { deleteMarkerLocal _x; };
    GVAR(waffenruheFlagMarkers) = nil;
};

[FUNC(REH), {!visibleMap}, "Awesome Delay"] call CLib_fnc_waitUntil;

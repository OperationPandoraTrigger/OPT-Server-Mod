/**
* Description:
* Add a uniticon for a unit to be shown on mapControls
* 
* Author:
* Senshi
*
* Arguments:
* 0: <OBJECT>       _unit       Unit to add
*
* Return Value:
*
* Server Only:
* No
* 
* Global:
* No
* 
* API:
* No
* 
* Example:
* [player] call FUNC(addUnitToGPS);
*/

#include "macros.hpp"



[{
    params ["_newUnit"];
    DUMP("UNIT ICON ADDED");
    DUMP(_newUnit);

    if (!([_newUnit] call FUNC(isUnitVisible))) exitWith {
        DUMP(format ["Unit %1 is not visible", _newUnit]);
    };
    private _iconID = _newUnit call FUNC(getUnitIconID);
    // Decide on the right color
    private _color = if (CLib_Player isEqualTo _newUnit) then {
        COLOR_PLAYER_UNIT
        } else {
            if (group CLib_Player isEqualTo group _newUnit) then {
                COLOR_OWN_GROUP
            } else {
                COLOR_SIDE
            }
        };

    // Icon is pulled from opt_characters client mod.
    private _specialTexture = getText (configFile >> "CfgVehicles" >> typeOf _newUnit >> "icon");
    private _texture = format ["\A3\ui_f\data\map\vehicleicons\%1_ca.paa", if (_specialTexture == "") then {"iconMan"} else {_specialTexture}];
    private _text = [_newUnit] call CFUNC(name);
    // Default format
    private _width = 20;
    private _height = 20;
    private _angle = _newUnit;

    if (_newUnit getVariable ["FAR_isUnconscious", 0] == 1) then {
        _texture = "\A3\ui_f\data\igui\cfg\revive\overlayicons\u100_ca.paa";
        // If unit is wounded or stabilized, we simply append a string. TODO: Move to stringtable.xml
        if (_newUnit getVariable ["FAR_IsStabilized", 0] == 1) then {
            _text = format ["%1 (%2)", _text, "Stabilisiert" ];
            _color = COLOR_ORANGE;
        } else {
            _color = COLOR_RED;
            _text = format ["%1 (%2)", _text, "Verwundet"];
        };
        _width = 30;
        _height = 30;
        _angle = 0;
    };






    // Define the icon shown on the map.
    private _unitIcon = ["ICON", 
        _texture, // 1: Texture <String>
        _color, // 2: Color <Array> [r,g,b,a]
        _newUnit, // 3: Position <MapGraphicsPosition> // We place the object itself here. This allows us hacky access later to retrieve variables of it for conditional onEachFrame styling.
        _width, // 4: Width <Number>
        _height, // 5: Height <Number>
        _newUnit, // 6: Angle <Number>
        "", // 7: Text <String>
        1, // 8: Shadow <Boolean/Number>
        0.08, // 9: Text Size <Number>
        "RobotoCondensed", // 10: Font <String>
        "right" // 11: Align <String>
        // 12: Code executed onEachFrame <{}> 
    ];

    // Define the description that is only shown when the cursor hovers above the mapicon
    // Show Revive status if downed
    private _unitDescription = ["ICON", 
        "a3\ui_f\data\Map\Markers\System\dummy_ca.paa", 
        [1, 1, 1, 1], 
        _newUnit, 
        22, 
        22, 
        0, 
        _text, 
        2, 
        0.08, 
        "RobotoCondensed", 
        "right"
    ];


    // Always draw names depending on settings
    if (GVAR(namesVisible)) then {
        [_iconId, [_unitIcon, _unitDescription]] call CFUNC(addMapGraphicsGroup);
    } else {
        [_iconId, [_unitIcon]] call CFUNC(addMapGraphicsGroup);
        [_iconId, [_unitIcon, _unitDescription], "hover"] call CFUNC(addMapGraphicsGroup);
    };
}, _this] call CLib_fnc_execNextFrame;

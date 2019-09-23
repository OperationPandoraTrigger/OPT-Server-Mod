#include "macros.hpp"


params ["_newUnit", "_iconId"];

private _sideColor = [0,0.3,0.6,1]; // [west, false] call BIS_fnc_sideColor;
private _groupColor = [0.13, 0.54, 0.21, 1];

private "_color";

// Different colors if own group
if (group CLib_player isEqualTo group _newUnit) then {
	_color = _groupColor;
} else {
	_color = _sideColor;
};

// Highlight own marker
if (CLib_Player == _newUnit) then {
    _color = [1, 0.4, 0, 1];
};


// Icon is pulled from opt_characters client mod.
private _specialicon = getText (configFile >> "CfgVehicles" >> typeOf _newUnit >> "icon");
private _icon = format ["\A3\ui_f\data\map\vehicleicons\%1_ca.paa", if (_specialicon == "") then {"iconMan"} else {_specialicon}];

// Default format
private _width = 20;
private _height = 20;
private _angle = _newUnit;


// Define the icon shown on the map.
private _unitIcon = ["ICON", 
    _icon, // 1: Texture <String>
    _color, // 2: Color <Array> [r,g,b,a]
    _newUnit, // 3: Position <MapGraphicsPosition> // We place the object itself here. This allows us hacky access later to retrieve variables of it for conditional onEachFrame styling.
    _width, // 4: Width <Number>
    _height, // 5: Height <Number>
	_newUnit, // 6: Angle <Number>
    "", // 7: Text <String>
    1, // 8: Shadow <Boolean/Number>
    0.08, // 9: Text Size <Number>
    "RobotoCondensed", // 10: Font <String>
    "right", // 11: Align <String>
    {
        // Only show if medic?
        //if ((typeof CLib_Player == "OPT_NATO_Sanitaeter" || typeof CLib_Player == "OPT_CSAT_Sanitaeter") && {_newUnit getVariable ["FAR_isUnconscious", 0] == 1}) then {
        //Show wounded marker if downed
        if (_position getVariable ["FAR_isUnconscious", 0] == 1) then {
            _texture = "\A3\ui_f\data\igui\cfg\revive\overlayicons\u100_ca.paa";
            _color = [1, 0, 0, 1];
            _width = 40;
            _height = 40;
            _angle = 0;
        };
    } // 12: Code executed onEachFrame <{}> 
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
    name _newUnit, 
    2, 
    0.08, 
    "RobotoCondensed", 
    "right "
    // {
    //     if (_position getVariable ["FAR_isUnconscious", 0] == 1) then {
    //         if (_position getVariable ["FAR_IsStabilized", 0] == 1) then {
    //             _text = format ["%1 (%2)", name _position, "Stabilized" ];
    //         } else {
    //             _text = format ["%1 (%2)", name _position, "(str _position getVariable ["FAR_bleedTime", "?"])]";
    //         };
    //     };
    // }
];

[_iconId, [_unitIcon]] call CFUNC(addMapGraphicsGroup);
[_iconId, [_unitIcon, _unitDescription], "hover"] call CFUNC(addMapGraphicsGroup);

_iconId;

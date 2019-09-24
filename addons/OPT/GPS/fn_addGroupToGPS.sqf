#include "macros.hpp"
#include "\opt\opt_client\addons\core\dialogs\OPTDef.hpp"

/*
    Arma At War - AAW

    Author: BadGuy, joko // Jonas

    Description:
    Add or Update Group in Tracker

    Parameter(s):
    0: group <Group>

    Returns:
    0: Return Id <STRING>
*/
params ["_group", "_groupIconId", ["_attachTo", [0, -20]]];

private _sideColor = [0, 0.4, 0.8, 1];
private _groupColor = [0.13, 0.54, 0.21, 1];

private _color = [_sideColor, _groupColor] select (group CLib_Player isEqualTo _group);

private _groupMapIcon = "\A3\ui_f\data\map\markers\nato\b_unknown.paa";

private _iconPos = [vehicle leader _group, _attachTo];

// Show the icon and squadname
[
    _groupIconId,
    [
        ["ICON", _groupMapIcon, _color, _iconPos, 25, 25],
        ["ICON", "a3\ui_f\data\Map\Markers\System\dummy_ca.paa", [1, 1, 1, 1], _iconPos, 25, 25, 0, (groupId _group), 2]
    ]
] call CFUNC(addMapGraphicsGroup);

// Show full details on mouseover
[
    _groupIconId,
    "hoverin",
    {
        (_this select 0) params ["_map", "_xPos", "_yPos"];
        (_this select 1) params ["_group", "_attachTo"];

        if (_group isEqualTo GVAR(currentHoverGroup)) exitWith {};
        GVAR(currentHoverGroup) = _group;

        private _pos = _map ctrlMapWorldToScreen getPosVisual (vehicle leader _group);
        _pos set [0, (_pos select 0) + 15 / 640];
        _pos set [1, (_pos select 1) + (((_attachTo) select 1) + 5) / 480];

        "opt_gps_groupinfo" cutRsc ["opt_gps_grouphover", "PLAIN"];
        private _display = uiNamespace getVariable ["opt_ui_gps_grouphover", displayNull];
        DUMP(_display);

        private _ctrlGrp = _display displayCtrl IDC_GPS_SQUADGROUP;
        // private _ctrlSquadName = _display displayCtrl IDC_GPS_SQUADNAME;
        // private _ctrlSquadType = _display displayCtrl IDC_GPS_SQUADTYPE;
        // private _ctrlSquadDesc = _display displayCtrl IDC_GPS_SQUADDESC;
        // private _ctrlSquadCount = _display displayCtrl IDC_GPS_SQUADCOUNT;
        private _ctrlBg = _display displayCtrl IDC_GPS_BACKGROUND;
        private _ctrlMembers = _display displayCtrl IDC_GPS_SQUADMEMBERS;
        private _textSize = PY(1.8) / (((((safeZoneW / safeZoneH) min 1.2) / 1.2) / 25) * 1);
        _ctrlGrp ctrlSetPosition [_pos select 0, _pos select 1, PX(25), PY(50)];
        _ctrlGrp ctrlShow true;

        // _ctrlSquadName ctrlSetText toUpper groupId _group;

        private _units = ([_group] call CFUNC(groupPlayers));


        //_ctrlSquadDesc ctrlSetText (_group getVariable [QEGVAR(Squad,Description), "Fighting the good fight"]);
        // _ctrlSquadCount ctrlSetStructuredText parseText format ["<t size=""%1"" align=""right"">%2</t>", _textSize, count _units];

        private _squadUnits = "";
        private _unitCount = {
            // private _selectedKit = _x getVariable [QEGVAR(kit,kit), ""];
            
            private _kitIcon = switch (typeOf _x) do {
                    case "OPT_NATO_Sanitaeter";
                    case "OPT_CSAT_Sanitaeter" : { "\a3\ui_f\data\map\vehicleicons\pictureheal_ca.paa" };
                    case "OPT_NATO_Gruppenfuehrer";
                    case "OPT_CSAT_Gruppenfuehrer": { "\A3\Ui_f\data\GUI\Cfg\Ranks\sergeant_gs.paa" };
                    case "OPT_NATO_Luftabwehrspezialist";
                    case "OPT_CSAT_Luftabwehrspezialist" : { "\a3\ui_f\data\IGUI\Cfg\WeaponIcons\aa_ca.paa" };
                    default { "\A3\ui_f\data\gui\rsc\rscdisplayarsenal\primaryweapon_ca.paa" };

                };
            // private _kitIcon = ([_selectedKit, side group _x, [["UIIcon", "\a3\ui_f\data\IGUI\Cfg\Actions\clear_empty_ca.paa"]]] call EFUNC(Kit,getKitDetails)) select 0;
            _squadUnits = _squadUnits + format ["<img size='0.7' color='#ffffff' image='%1'/> %2<br />", _kitIcon, [_x] call CFUNC(name)];
            true;
        } count _units;

        _ctrlMembers ctrlSetStructuredText parseText format ["<t size=""%1"">%2</t>", _textSize, _squadUnits];

        _ctrlBg ctrlSetPosition [0, 0, PX(25), _unitCount * PY(1.8) + PY(0.4)];

        _ctrlMembers ctrlSetPosition [0, PY(0.2), PX(25), _unitCount * PY(1.8)];

        {
            _x ctrlCommit 0;
            nil;
        } count [_ctrlGrp, _ctrlBg, _ctrlMembers];

        if (GVAR(groupInfoPFH) != -1) then {
            GVAR(groupInfoPFH) call CFUNC(removePerFrameHandler);
        };

        // This updates the marker every frame. This must be as efficient as possible!
        GVAR(groupInfoPFH) = [{
            params ["_params", "_id"];
            _params params ["_group", "_map", "_attachTo"];

            private _pos = _map ctrlMapWorldToScreen getPosVisual (vehicle leader _group);
            _pos set [0, (_pos select 0) + 15 / 640];
            _pos set [1, (_pos select 1) + ((_attachTo select 1) + 5) / 480];
            private _display = uiNamespace getVariable ["opt_ui_gps_grouphover", displayNull];

            if (_display == displayNull || (_map == ((findDisplay 12) displayCtrl 51) && !visibleMap) || isNull _map) exitWith {
                _id call CFUNC(removePerFrameHandler);
                _display closeDisplay 0;
            };
            
            private _grp = _display displayCtrl IDC_GPS_SQUADGROUP;
            _grp ctrlSetPosition _pos;
            _grp ctrlCommit 0;
        }, 0, [_group, _map, _attachTo]] call CFUNC(addPerFrameHandler);
    },
    [_group, _attachTo]
] call CFUNC(addMapGraphicsEventHandler);

[
    _groupIconId,
    "hoverout",
    {
        (_this select 0) params ["_map", "_xPos", "_yPos"];
        (_this select 1) params ["_group"];

        if (GVAR(currentHoverGroup) isEqualTo _group) then {
            GVAR(currentHoverGroup) = grpNull;
        };

        private _display = uiNamespace getVariable ["opt_ui_gps_grouphover", displayNull];
        if (_display != displayNull) then {
            _display closeDisplay 0;
        };

        if (GVAR(groupInfoPFH) != -1) then {
            GVAR(groupInfoPFH) call CFUNC(removePerFrameHandler);
        };

    },
    _group
] call CFUNC(addMapGraphicsEventHandler);
_groupIconId;

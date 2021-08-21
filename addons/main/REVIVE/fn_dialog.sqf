/**
* Description:
* Dialogsteuerung
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
* [] call FUNC(dialog);
*/
#include "macros.hpp"

if (!(isNull (findDisplay 5000 displayCtrl 5001))) exitWith{};

//Dialog erstellen
private _success = createDialog "opt_revive_blackscreen";

//Dialog definieren
#define IDD_REVIVE_BLACKSCREEN 5000
#define IDC_REVIVE_BUTTON 5011
#define IDC_REVIVE_MEDICNEARLABEL 5012
#define IDC_REVIVE_MEDICNEARLABEL_METER 5013
#define IDC_REVIVE_BLEEDOUTBAR 5014
#define IDC_REVIVE_BLEEDOUTBAR_TEXT 5015

private _display = findDisplay IDD_REVIVE_BLACKSCREEN;
private _BleedoutBar = _display displayCtrl IDC_REVIVE_BLEEDOUTBAR;
private _Respawn_button = _display displayCtrl IDC_REVIVE_BUTTON;
private _MedicNearLabel_Meter = _display displayCtrl IDC_REVIVE_MEDICNEARLABEL_METER;
private _BleedoutBar_Text = _display displayCtrl IDC_REVIVE_BLEEDOUTBAR_TEXT;

//Grundstellung
_BleedoutBar progressSetPosition 1.0;
_MedicNearLabel_Meter ctrlSetText "";
GVAR(ausblutzeit) = 300;
_BleedoutBar_Text ctrlSetText format ["%1 sec",GVAR(ausblutzeit)];

//Chat abschalten
1 enableChannel false;

// Respwan Button
_Respawn_button ctrlAddEventHandler [ "ButtonClick",
{
    OPT_REVIVE_respawnedHandler = true;
    ["Health", "Respawn", [getPlayerUID player, name player, side player, "RespawnClick"]] remoteExecCall [QEFUNC(LOGGING,writelog), 2, false];
    player setDamage 1;
    1 enableChannel true;
    player allowDamage true;
}];

GVAR(startzeit) = time;

//Anzeigen Steuerung im Dialog
[{
    params ["_args", "_handle"];

    private _display = findDisplay IDD_REVIVE_BLACKSCREEN;
    private _BleedoutBar = _display displayCtrl IDC_REVIVE_BLEEDOUTBAR;
    private _Respawn_button = _display displayCtrl IDC_REVIVE_BUTTON;
    private _MedicNearLabel_Meter = _display displayCtrl IDC_REVIVE_MEDICNEARLABEL_METER;
    private _BleedoutBar_Text = _display displayCtrl IDC_REVIVE_BLEEDOUTBAR_TEXT;

    private _sideplayer = getnumber (configFile >> "CfgVehicles" >> (typeof player) >> "side");
    private _nextGuyName = "";
    private _nextGuyDistance = 0;

    // Spieler im Bereich finden
    private _units = nearestObjects [getpos player, ["CAManBase"], GVAR(playerdist)] - [player];
    if (count _units > 0) then
    {
        {
            private _sidesoldat = getnumber (configFile >> "CfgVehicles" >> (typeof _x) >> "side");

            if (getDammage _x < GVAR(MAX_DAMAGE) && _sidesoldat == _sideplayer) then
            {
                // Zeige nur Sanis an
                if (GVAR(onlysani)) then
                {
                    if (typeOf _x in EGVAR(RULES,medic)) then
                    {
                        _nextGuyName = name _x;
                        _nextGuyDistance = round (_x distance player);
                    };
                }
                // Zeige alle Spieler an
                else
                {
                    _nextGuyName = name _x;
                    _nextGuyDistance = round (_x distance player);
                };
            };
            if (_nextGuyName != "") then {break};
        } forEach _units;
    };

    private _hintMsg = "";
    if (_nextGuyName != "") then
    {
        _hintMsg = format[MLOC(MEDIC_DISTANCE), _nextGuyName, _nextGuyDistance];
    }
    else
    {
        _hintMsg = MLOC(NO_MEDIC);
    };

    // Textausgabe über Medic entfernung
    _MedicNearLabel_Meter ctrlSetText format ["%1", _hintMsg];

    //Auto Respwan nach Ablauf der Ausblutzeit
    if (((GVAR(ausblutzeit) - (time - GVAR(startzeit))) < 0)) then
    {
        OPT_REVIVE_respawnedHandler = true;
        ["Health", "Respawn", [getPlayerUID player, name player, side player, "RespawnTimeout"]] remoteExecCall [QEFUNC(LOGGING,writelog), 2, false];
        player setDamage 1;
    };

    // Zeitausgabe bis Auto Respwan
    _BleedoutBar_Text ctrlSetText format ["%1 sec",floor (GVAR(ausblutzeit) - (time - GVAR(startzeit)))];
    _BleedoutBar progressSetPosition ((floor (GVAR(ausblutzeit) - (time - GVAR(startzeit)))) / GVAR(ausblutzeit));
    _BleedoutBar_Text ctrlSetTextColor [1, 0, 0, 1];
    _BleedoutBar ctrlSetTextColor [1, 0, 0, 1];

    // Check Dialog offen
    if (isNull (_display displayCtrl 5001)) then
    {
        createDialog "opt_revive_blackscreen";
    };

    // Dialog und PFH Löschung
    if ((getDammage player) == 1)  then
    {
        closeDialog 5000;
        closeDialog 0;
        1 enableChannel true;
        player allowDamage true;
        player setVariable ["OPT_isUnconscious", 0, true];
        OPT_REVIVE_unconsciousHandler = nil;
        player setVariable ["tf_unable_to_use_radio", false];

        //Schaden Freigeben
        player allowDamage true;

        _handle call CFUNC(removePerframeHandler);
    };

    // Dialog und PFH Löschung
    if (!(lifeState player isEqualTo "INCAPACITATED"))  then
    {
        closeDialog 5000;
        closeDialog 0;
        1 enableChannel true;
        player allowDamage true;
        player setVariable ["OPT_isUnconscious", 0, true];
        OPT_REVIVE_unconsciousHandler = nil;
        player setVariable ["tf_unable_to_use_radio", false];

        //Schaden Freigeben
        player allowDamage true;

        // Nicht nach dem Respawnen ausführen
        if (isNil "OPT_REVIVE_respawnedHandler") then
        {
            // Für alle zum Schluss anwesenden (25 m) Kameraden einen Revive-Punkt loggen
            _units = nearestObjects [getpos player, ["CAManBase"], 25] - [player];
            if (count _units > 0) then
            {
                {
                    _sidesoldat = getnumber (configFile >> "CfgVehicles" >> (typeof _x) >> "side");
                    _sideplayer = getnumber (configFile >> "CfgVehicles" >> (typeof player) >> "side");

                    if (_sidesoldat isEqualTo _sideplayer and !(lifeState _x isEqualTo "INCAPACITATED")) then
                    {
                        [player, _x, 1] remoteExecCall ["OPT_REVIVE_fnc_revivelog", 2, false];
                    };
                } forEach _units;
            };
        };

        _handle call CFUNC(removePerframeHandler);
    };

}, 1, _this] call CFUNC(addPerFrameHandler);

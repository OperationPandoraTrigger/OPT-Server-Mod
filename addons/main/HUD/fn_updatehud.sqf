/**
* Author: James, form
* script for updating HUD information each forEachMember
*
* Arguments:
* None
*
* Return Value:
* None
*
* Example:
* [] call func(updateHUD);
*
*/
#include "macros.hpp"

disableSerialization;

// avoid CBA_fnc_formatElapsedTime because it shows "60" seconds from time to time...
TimeToString =
{
    params ["_seconds"];
    private _hours = floor (_seconds / 3600);
    _seconds = _seconds - (_hours * 3600);
    private _minutes = floor (_seconds / 60);
    _seconds = _seconds - (_minutes * 60);
    format ["%1:%2:%3", _hours, [_minutes, 2] call CBA_fnc_formatNumber, [floor _seconds , 2] call CBA_fnc_formatNumber];
};

//Anzeigen Steuerung im Dialog
[{
    private _currentCutDisplay = uiNamespace getVariable "opt_hud_anzeige";
    //--------------------- update players ------------------------------------------
    private _control = _currentCutDisplay displayCtrl 6101;
    private _playersStr = format [MLOC(PLAYERS), EGVAR(SECTORCONTROL,nato_faction), playersNumber west, playersNumber east, EGVAR(SECTORCONTROL,csat_faction)];

    // Anzeige updaten
    _control ctrlSetText _playersStr;
    _control ctrlShow true;

    //--------------------- update Budget ------------------------------------------
    _control = _currentCutDisplay displayCtrl 6103;

    [_control] call OPT_GELDZEIT_fnc_renderbudget;

    _control ctrlShow true;

    //----------------------- update score --------------------------------------------
    _control = _currentCutDisplay displayCtrl 6104;
    private _scoreStr = format [MLOC(POINTS), EGVAR(SECTORCONTROL,nato_faction), EGVAR(SECTORCONTROL,nato_points), EGVAR(SECTORCONTROL,csat_points), EGVAR(SECTORCONTROL,csat_faction)];

    // Anzeige updaten
    // Update Text
    _control ctrlSetText _scoreStr;
    _control ctrlShow true;

    //--------------------- update clock ---------------------------------------
    _control = _currentCutDisplay displayCtrl 6105;

    private _timeStr = "";
    private _timeElapsed = serverTime - OPT_GELDZEIT_startTime;

    if (OPT_GELDZEIT_GAMESTAGE >= GAMESTAGE_WAR) then
    {
        // Mission gestartet - Zeige verbleibende Spielzeit
        private _playTime = OPT_GELDZEIT_PLAYTIME - _timeElapsed;

        if (_playTime > 0) then
        {
            _timeStr = format [MLOC(TIME_LEFT), [_playTime] call TimeToString];
            _control ctrlSetTextColor [0.7, 0.7, 0.7, 1];
        }
        else
        {
            _timeStr = MLOC(TIME_END);
        };

        // Färbe Uhr in den letzten 5 Minuten rot
        if (_playTime < 300) then
        {
            _control ctrlSetTextColor [0.9, 0.2, 0.2, 1];
        };
    }
    else
    {
        // Mission noch nicht gestartet - Zeige verbleibende Zeit der Waffenruhe
        private _truceTime = OPT_GELDZEIT_TRUCETIME + OPT_GELDZEIT_FREEZETIME - _timeElapsed;
        if (_truceTime > 0) then
        {
            _timeStr = format [MLOC(TIME_CEASEFIRE), [_truceTime] call TimeToString];
            _control ctrlSetTextColor [0.6, 0.1, 0, 1];
        }
        else
        {
            _timeStr = MLOC(TIME_CEASEFIRE_END);
            _control ctrlSetTextColor [0.7, 0.7, 0.7, 1];
        }
    };

    // Anzeige updaten
    _control ctrlSetText _timeStr;
    _control ctrlShow true;
}, 1, _this] call CFUNC(addPerFrameHandler);

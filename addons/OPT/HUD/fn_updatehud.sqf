/**
* Author: James
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

//Anzeigen Steuerung im Dialog
[{

    private _currentCutDisplay = uiNamespace getVariable "opt_hud_anzeige";      
    //--------------------- update players ------------------------------------------
    private _control = _currentCutDisplay displayCtrl 5101;
    private _playersStr = "";

    switch OPT_GELDZEIT_Fraktionauswahl do 
    {
        case "AAFvsCSAT":
        {
            _playersStr = format [MLOC(AAFvCSAT), playersNumber independent, playersNumber east];
        };

        case "NATOvsCSAT":
        {
            _playersStr = format [MLOC(NATOvCSAT), playersNumber west, playersNumber east];
        };

        case "NATOvsAAF":
        {
            _playersStr = format [MLOC(NATOvAAF), playersNumber west, playersNumber independent];         
        };

        default 
        {
            ERROR_LOG("Updatehud: Fehlehalte Datenübergabe keine Fraktionauswahl erkannt");
        };
    };

    // Anzeige updaten
    _control ctrlSetText _playersStr;  
    _control ctrlShow true;  

    //--------------------- update Budget ------------------------------------------
    _control = _currentCutDisplay displayCtrl 5103;

    [_control] call OPT_GELDZEIT_fnc_renderbudget;
        
    _control ctrlShow true;

    //----------------------- update score --------------------------------------------
    _control = _currentCutDisplay displayCtrl 5104;
    private _scoreStr = "";

    switch OPT_GELDZEIT_Fraktionauswahl do 
    {
        case "AAFvsCSAT":
        {
            _scoreStr = format [MLOC(AAFvCSAT_POINT),  OPT_SECTORCONTROL_aaf_points, OPT_SECTORCONTROL_csat_points];
        };

        case "NATOvsCSAT":
        {
            _scoreStr = format [MLOC(NATOvCSAT_POINT), OPT_SECTORCONTROL_nato_points, OPT_SECTORCONTROL_csat_points];
        };

        case "NATOvsAAF":
        {
            _scoreStr = format [MLOC(NATOvAAF_POINT), OPT_SECTORCONTROL_nato_points, OPT_SECTORCONTROL_aaf_points];          
        };

        default 
        {
            ERROR_LOG("Updatehud: Fehlehalte Datenübergabe keine Fraktionauswahl erkannt");
        };
    };

    // Anzeige updaten
    // Update Text
    _control ctrlSetText _scoreStr; 
    _control ctrlShow true;   

    //--------------------- update clock ---------------------------------------
    _control = _currentCutDisplay displayCtrl 5105;

    private "_timeStr";
    private _timeElapsed = (serverTime - OPT_GELDZEIT_startTime);
    private _playTime = OPT_GELDZEIT_PLAYTIME - _timeElapsed;
    private _truceTime = (OPT_GELDZEIT_TRUCETIME + OPT_GELDZEIT_FREEZETIME) - _timeElapsed;

    if (OPT_GELDZEIT_Spielzeitstart) then 
    {
        // Mission gestartet - Zeige verbleibende Spielzeit
        _timeLeft = [_playTime] call CBA_fnc_formatElapsedTime;

        if (_playTime > 0) then 
        {
            _timeStr = format [MLOC(TIME_LEFT), _timeLeft];
            _control ctrlSetTextColor [0.7, 0.7, 0.7, 1];
        } 
        else
        {
            _timeStr = MLOC(TIME_END);
            _control ctrlSetTextColor [1, 0, 0, 0.9];
        };
    } 
    else 
    {
        // Mission noch nicht gestartet - Zeige verbleibende Zeit der Waffenruhe
        _timeLeft = [_truceTime] call CBA_fnc_formatElapsedTime;

        if (_truceTime > 0) then 
        {
            _timeStr = format [MLOC(TIME_CEASEFIRE), _timeLeft];
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

    // Färbe Uhr in den letzten 5 Minuten rot
    if (_playTime < 300) then 
    {
        _control ctrlSetTextColor [0.9, 0.2, 0.2, 1];
    };

    _control ctrlShow true;
}, 1, _this] call CFUNC(addPerFrameHandler);

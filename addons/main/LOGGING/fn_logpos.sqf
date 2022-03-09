/**
* Description:
* Logs player position to logfile
*
* Author:
* form
*
* Arguments:
* no
*
* Return Value:
* None
*
* Server only:
* no
*
* Public:
* yes
*
* Global:
* no
*
* Sideeffects:
* no
*
* Example:
* [] call FUNC(logpos);
*/
#include "macros.hpp"

createDialog "DialogLogPosition";

#define DIALOG_LOGPOS_IDD 8000
#define DIALOG_LOGPOS_TB_IDC 8002
#define DIALOG_LOGPOS_BU_IDC 8004

private _display = findDisplay DIALOG_LOGPOS_IDD;
private _button = _display displayCtrl DIALOG_LOGPOS_BU_IDC;

// Logging of position and comment
_button ctrlAddEventHandler [ "ButtonClick",
{
    private _display = findDisplay DIALOG_LOGPOS_IDD;
    private _textbox = _display displayCtrl DIALOG_LOGPOS_TB_IDC;
    private _comment = ctrlText _textbox;
    ["Player", "PositionReport", [getPlayerUID player, name player, side player, position vehicle player, getDir vehicle player, _comment]] remoteExec [QEFUNC(LOGGING,writelog), 2];
    closeDialog 0;
}];

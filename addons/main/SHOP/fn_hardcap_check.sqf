/**
* Author: Lord-MDB
* Bewerte die Anfragen der Clienten und gibt die Freigaben an die clienten.
*
* Arguments:
* 0 <Number> clientOwner Zahl von der Anfrage
* 1 <String> Classename des Objekts
* 2 <String> Typ des Objekts
* 3 <Side> Seite der Orderanfrage
*
* Return Value:
* None
*
* Example:
* [] call Func(hardcap_check);
*
*/
#include "macros.hpp"

params
[
    ["_user", 0],
    ["_class", ""],
    ["_vehicleType", ""],
    ["_side", sideUnknown]
];

private _Hardcaparray = [];
private _hardcapobj = "";
private _hardcapleft = -1;
private _hardcaptotal = -1;

//Objekt suchen in Array
if (_class in GVAR(Hardcap_pool)) then
{
    private _hardcaparray = GVAR(Hardcap_pool) get _class;
    _hardcapleft = _hardcaparray select 0;
    _hardcaptotal = _hardcaparray select 1;
};

if (_hardcapleft > 0) then
{
    // eins abziehen und erlauben
    GVAR(Hardcap_pool) set [_class, [_hardcapleft - 1, _hardcaptotal]];
    publicVariable QGVAR(Hardcap_pool);
    [1] remoteExecCall [QFUNC(create), _user, false];
}
else
{
    if (_hardcapleft == -1) then
    {
        // unbegrenzt erlauben
        [1] remoteExecCall [QFUNC(create), _user, false];
    }
    else
    {
        // verbraucht verweigern
        [0] remoteExecCall [QFUNC(create), _user, false];
    };
};

// Log Hardcap Info
private _unitName = (getText(configFile >> 'CfgVehicles' >> _class >> 'displayName'));
["Hardcap", "Info", [_unitName, _hardcapleft, _hardcaptotal]] call EFUNC(LOGGING,writelog);

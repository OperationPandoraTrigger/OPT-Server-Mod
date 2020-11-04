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
private _Hardcap_pool = [];
private _hardcapobj = "";
private _hardcapinfo = 999;
private _orderStatus = 0;
private _cat = "Shop";
private _message = "";

// Auswahl Hardcap Array
switch (_vehicleType) do 
{
	case "choppers" : 
	{
        switch (_side) do 
        {
            case west : 
            {    
                _Hardcap_pool = GVAR(Hardcap_nato_choppers);
            };
            case east : 
            {    
                 _Hardcap_pool = GVAR(Hardcap_csat_choppers);
            };
            case independent : 
            {    
                _Hardcap_pool = GVAR(Hardcap_aaf_choppers);
            };
            default 
            {
            };        
        };     
    };
	case "vehicles" : 
	{
        switch (_side) do 
        {
            case west : 
            {    
                _Hardcap_pool = GVAR(Hardcap_nato_vehicles);
            };
            case east : 
            {    
                _Hardcap_pool = GVAR(Hardcap_csat_vehicles);
            };
            case independent : 
            {    
                _Hardcap_pool = GVAR(Hardcap_aaf_vehicles);
            };
            default 
            {
            };        
        };     
    };
	case "supplies" : 
	{
        switch (_side) do 
        {
            case west : 
            {    
                _Hardcap_pool = GVAR(Hardcap_nato_supplies);
            };
            case east : 
            {    
                _Hardcap_pool = GVAR(Hardcap_csat_supplies);
            };
            case independent : 
            {    
                _Hardcap_pool = GVAR(Hardcap_aaf_supplies);
            };
            default 
            {
            };        
        };      
    };
	case "sea" : 
	{
        switch (_side) do 
        {
            case west : 
            {    
                _Hardcap_pool = GVAR(Hardcap_nato_sea);
            };
            case east : 
            {    
                _Hardcap_pool = GVAR(Hardcap_csat_sea);
            };
            case independent : 
            {    
                _Hardcap_pool = GVAR(Hardcap_aaf_sea);
            };
            default 
            {
            };        
        };    
    };
    default 
    {
    };
};

//Objekt suchen in Array
_Hardcap_pool apply
{
	_hardcapobj = _x select 0;
	if (_class isEqualTo _hardcapobj) then 
	{
		_hardcapinfo = _x select 1;
		_Hardcaparray = _x;       
	}; 
};
	
if (_hardcapinfo > 0) then 
{
    // Hardcap Erneuerung in Datensatz
    _Hardcap_pool deleteAt (_Hardcap_pool find _Hardcaparray);
    _Hardcaparray set [1, (_hardcapinfo-1)];
    _Hardcap_pool pushBack _Hardcaparray;

    switch (_vehicleType) do 
    {
            case "choppers" : 
            {
                switch (_side) do 
                {
                    case west : 
                    {    
                        GVAR(Hardcap_nato_choppers) = _Hardcap_pool;
                        publicVariable QGVAR(Hardcap_nato_choppers);
                    };
                    case east : 
                    {    
                        GVAR(Hardcap_csat_choppers) = _Hardcap_pool;
                        publicVariable QGVAR(Hardcap_csat_choppers);
                    };
                    case independent : 
                    {    
                        GVAR(Hardcap_aaf_choppers) = _Hardcap_pool;
                        publicVariable QGVAR(Hardcap_aaf_choppers);
                    };
                    default 
                    {
                    };        
                };  
            };
            case "vehicles" : 
            {
                switch (_side) do 
                {
                    case west : 
                    {    
                        GVAR(Hardcap_nato_vehicles) = _Hardcap_pool;
                        publicVariable QGVAR(Hardcap_nato_vehicles);
                    };
                    case east : 
                    {    
                        GVAR(Hardcap_csat_vehicles) = _Hardcap_pool;
                        publicVariable QGVAR(Hardcap_csat_vehicles);
                    };
                    case independent : 
                    {    
                        GVAR(Hardcap_aaf_vehicles) = _Hardcap_pool;
                        publicVariable QGVAR(Hardcap_aaf_vehicles);
                    };
                    default 
                    {
                    };        
                };     
            };
            case "supplies" : 
            {
                switch (_side) do 
                {
                    case west : 
                    {    
                        GVAR(Hardcap_nato_supplies) = _Hardcap_pool;
                        publicVariable QGVAR(Hardcap_nato_supplies);
                    };
                    case east : 
                    {    
                        GVAR(Hardcap_csat_supplies) = _Hardcap_pool;
                        publicVariable QGVAR(Hardcap_csat_supplies);
                    };
                    case independent : 
                    {    
                        GVAR(Hardcap_aaf_supplies) = _Hardcap_pool;
                        publicVariable QGVAR(Hardcap_aaf_supplies);
                    };
                    default 
                    {
                    };        
                };     
            };
            case "sea" : 
            {
                switch (_side) do 
                {
                    case west : 
                    {    
                        GVAR(Hardcap_nato_sea) = _Hardcap_pool;
                        publicVariable QGVAR(Hardcap_nato_sea);
                    };
                    case east : 
                    {    
                        GVAR(Hardcap_csat_sea) = _Hardcap_pool;
                        publicVariable QGVAR(Hardcap_csat_sea);
                    };
                    case independent : 
                    {    
                        GVAR(Hardcap_aaf_sea) = _Hardcap_pool;
                        publicVariable QGVAR(Hardcap_aaf_sea);
                    };
                    default 
                    {
                    };        
                };     
            };
            default 
            {
            };
    };

    //Statusfreigabe
    _orderStatus = 1;

    //Name Fahrzeug
    private _unitName = (getText(configFile >> 'CfgVehicles' >> _class >> 'displayName'));

    //Log Hardcap
    _message = format["Freigabe Type: %1 Hardcap: %2",_unitName, (_hardcapinfo-1)];

    private _timestamp = [serverTime - OPT_GELDZEIT_startTime] call CBA_fnc_formatElapsedTime;
    diag_log format["[%1] (%2) Log: %3 --- %4","OPT",_cat,_timestamp,_message];

    [_orderStatus,_classSend,GVAR(vehicleType)] remoteExecCall [QFUNC(create), _user, false];
}
else
{
    _orderStatus = 0;
    [_orderStatus,_classSend,GVAR(vehicleType)] remoteExecCall [QFUNC(create), _user, false];
};


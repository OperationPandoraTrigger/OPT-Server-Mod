/**
* Description:Kauf ausführen und Fahrzeug erstellen.
* 
* 
* Author:
* [GNC]Lord-MDB
*
* Arguments:
* 0 <Array> Datensatz mit Bewaffnung
* 1 <Objekt> Aufstellort des Fahrzeugs
* 2 <Bool> Spieler in Fahrzeug setzen
* 3 <Number> Fahrzeugkosten ohne Bewaffnung
*
* Return value:
* 0 <Number> Gesamtkosten des Fahrzeugs 
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
* 
*/

#include "macros.hpp"

params 
[
    ["_Datensatz", []], 
    ["_box", objNull],
    ["_moveInVeh", nil],
	["_unitCost", 0]
];

GVAR(order_Datensatz) = _Datensatz;
GVAR(order_box) = _box;
GVAR(order_moveInVeh) = _moveInVeh;
GVAR(order_unitCost) = _unitCost;

GVAR(order_kosten) = 0;

DFUNC(ordercheck) = 
{

    //Hardcap Send Auslösung Zurücksetzen

    private _hardcapobj = "";
    private _hardcapinfo = 999;

    //Init Vars
    private _airRaketenmagazin = [];
    private _airRaketenweapon = [];
    private _airGunmagazin = [];
    private _airGunweapon = [];
    private _vehMagazin = [];
    private _vehWeapon = [];
    private _pylon = [];
    private _raketencontrol = [];
    private _zusatz = [];
    private _waffenkosten = 0;
    private _weaponold = [];
    private _magazinold = [];

    //Datensatz aufschüsseln
    private _class = GVAR(order_Datensatz) select 0;
    _airRaketenweapon = GVAR(order_Datensatz) select 1;
    _airRaketenmagazin = GVAR(order_Datensatz) select 2;
    _airGunweapon = GVAR(order_Datensatz) select 3;
    _airGunmagazin = GVAR(order_Datensatz) select 4;
    _vehWeapon = GVAR(order_Datensatz) select 5;
    _vehMagazin = GVAR(order_Datensatz) select 6;
    _pylon = GVAR(order_Datensatz) select 7;
    _raketencontrol = GVAR(order_Datensatz) select 8;
    _zusatz = GVAR(order_Datensatz) select 9;
    _waffenkosten = GVAR(order_Datensatz) select 10;

    //Konstanten für Fahrzeugerstellung
    #define HEIGHT_OFFSET_GROUND 0.1
    #define HEIGHT_OFFSET_WATER 0.2

    private _Hardcaparray = [];

    GVAR(Hardcap_pool) apply
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
        GVAR(Hardcap_pool) deleteAt (GVAR(Hardcap_pool) find _Hardcaparray);
        _Hardcaparray set [1, (_hardcapinfo-1)];
        GVAR(Hardcap_pool) pushBack _Hardcaparray;

        switch (GVAR(vehicleType)) do 
        {
            case "choppers" : 
            {
                switch (playerside) do 
                {
                    case west : 
                    {    
                        GVAR(Hardcap_nato_choppers) = GVAR(Hardcap_pool);
                        publicVariable QGVAR(Hardcap_nato_choppers);
                    };
                    case east : 
                    {    
                        GVAR(Hardcap_csat_choppers) = GVAR(Hardcap_pool);
                        publicVariable QGVAR(Hardcap_csat_choppers);
                    };
                    case independent : 
                    {    
                        GVAR(Hardcap_aaf_choppers) = GVAR(Hardcap_pool);
                        publicVariable QGVAR(Hardcap_aaf_choppers);
                    };
                    default 
                    {
                    };        
                };  
            };
            case "vehicles" : 
            {
                switch (playerside) do 
                {
                    case west : 
                    {    
                        GVAR(Hardcap_nato_vehicles) = GVAR(Hardcap_pool);
                        publicVariable QGVAR(Hardcap_nato_vehicles);
                    };
                    case east : 
                    {    
                        GVAR(Hardcap_csat_vehicles) = GVAR(Hardcap_pool);
                        publicVariable QGVAR(Hardcap_csat_vehicles);
                    };
                    case independent : 
                    {    
                        GVAR(Hardcap_aaf_vehicles) = GVAR(Hardcap_pool);
                        publicVariable QGVAR(Hardcap_aaf_vehicles);
                    };
                    default 
                    {
                    };        
                };     
            };
            case "supplies" : 
            {
                switch (playerside) do 
                {
                    case west : 
                    {    
                        GVAR(Hardcap_nato_supplies) = GVAR(Hardcap_pool);
                        publicVariable QGVAR(Hardcap_nato_supplies);
                    };
                    case east : 
                    {    
                        GVAR(Hardcap_csat_supplies) = GVAR(Hardcap_pool);
                        publicVariable QGVAR(Hardcap_csat_supplies);
                    };
                    case independent : 
                    {    
                        GVAR(Hardcap_aaf_supplies) = GVAR(Hardcap_pool);
                        publicVariable QGVAR(Hardcap_aaf_supplies);
                    };
                    default 
                    {
                    };        
                };     
            };
            case "sea" : 
            {
                switch (playerside) do 
                {
                    case west : 
                    {    
                        GVAR(Hardcap_nato_sea) = GVAR(Hardcap_pool);
                        publicVariable QGVAR(Hardcap_nato_sea);
                    };
                    case east : 
                    {    
                        GVAR(Hardcap_csat_sea) = GVAR(Hardcap_pool);
                        publicVariable QGVAR(Hardcap_csat_sea);
                    };
                    case independent : 
                    {    
                        GVAR(Hardcap_aaf_sea) = GVAR(Hardcap_pool);
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

        //Objekt Erstellung 
        private _veh = createVehicle [_class, (position GVAR(order_box)), [], 0, "NONE"];
        private _posi = getPosASL GVAR(order_box) vectorAdd [0, 0, HEIGHT_OFFSET_GROUND];
        _veh setdir getdir GVAR(order_box);
        _veh setPosASL _posi;

        //check Box liegt im Wasser
        if ((surfaceIsWater (position GVAR(order_box))) and (_veh isKindOf "Ship")) then 
        {
            _veh setPos [(position GVAR(order_box) select 0),(position GVAR(order_box) select 1), HEIGHT_OFFSET_WATER]; 
        };

        _veh setDamage 0;

        //Fahrzeug bewaffnen
        if (((count _airRaketenmagazin) > 0) or 
            ((count _airGunmagazin) > 0) or 
            ((count _vehMagazin) > 0)) then 
        {
            [_veh,
            _airRaketenweapon,
            _airRaketenmagazin,
            _airGunweapon,
            _airGunmagazin,
            _vehWeapon,
            _vehMagazin,
            _pylon,
            _raketencontrol,
            _zusatz,
            _weaponold,
            _magazinold] call FUNC(arm);
        };    

        // Spieler in Fahrzeug setzen
        if (GVAR(order_moveInVeh)) then 
        {
            Player moveInDriver _veh;

        };

        // Erzeugt Crew für Drohnen
        private _uavs = [
            "OPT_B_UGV_01_F",
            "OPT_B_UGV_01_rcws_F",
            "OPT_O_UGV_01_F",
            "OPT_O_UGV_01_rcws_F",
            "B_UCSV_01",
            "OPT_B_UAV_02_light_F",
            "OPT_B_UAV_02_CAS_F",
            "OPT_B_UAV_02_CAS_F",
            "OPT_B_UAV_02_F",
            "OPT_B_UAV_01_F",
            "OPT_O_UAV_01_F",
            "OPT_O_UAV_02_light_F",
            "OPT_O_UAV_02_CAS_F",
            "OPT_O_UAV_02_F",
            "OPT_B_Static_Designator_01_F",
            "OPT_O_Static_Designator_02_F",
            "OPT_I_Static_Designator_01_F",
            "OPT_B_UGV_01_ghex_F",
            "OPT_O_T_UGV_01_ghex_F",
            "OPT_I_UAV_02_light_F",
            "OPT_I_UGV_01_F"
            ];

        if (_class in (_uavs)) then 
        {
            createVehicleCrew (_veh);
            _veh setSkill 1.0;
                    
        };

        //Sonderausrüstung CSAT Arty
        if ((OPT_GELDZEIT_csat_sonderausobjektanzahl > 0) and (_veh isKindOf "O_MBT_02_arty_F")) then 
        {
            for "_i" from 1 to (OPT_GELDZEIT_csat_sonderausobjektanzahl)  do 
		    {
                _veh addMagazine "OPT_2Rnd_155mm_Mo_Cluster";    
		    }; 

        };

        GVAR(order_kosten) = GVAR(order_unitCost) + _waffenkosten;

        [getPlayerUID player, Name Player, playerSide, typeOf _veh, GVAR(order_kosten), "-"] remoteExecCall ["OPT_GELDZEIT_fnc_updateBudget", 2, false];
    }
    else 
    {
        private _txt = MLOC(HARDCAP_TEXT);
        private _header = MLOC(HARDCAP);
        hint Format ["%1 \n\n %2",_header,_txt];
    };    
};

//Hardcap Check
[] Call FUNC(ordercheck);

GVAR(order_kosten)
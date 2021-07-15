/**
* Description:Kauf ausführen nach Order Status und Fahrzeug erstellen.
* 
* 
* Author:
* [GNC]Lord-MDB
*
* Arguments:
* 0 <Number> Status der Orderanfrage
*
* Return value:
* no
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
* [] call Func(create);
*/
#include "macros.hpp"

params 
[
    ["_status", 0]
];

GVAR(idPadCheckCreate) =
[{
    // freie Pads suchen
    private _freiePads = [GVAR(pads), GVAR(Checkbereich)] call FUNC(checkpad);

    // erstes Freies Pad zuordnen
    if ((count _freiePads) > 0) then 
    {
        GVAR(order_box) = _freiePads select 0;
    }
    else 
    {
        GVAR(order_box) = player;
    };
}, 0] call CFUNC(addPerFrameHandler);

DFUNC(createOrder) = 
{
    //Hardcap Send Auslösung Zurücksetzen
    GVAR(Daten_send) = false;

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

    // Defaulthöhe für Spawn
    private _offset = 0.2;

    // CSAT Choppers
    if (_class == "OPT_CUP_O_SA330_Puma_HC1_BAF") then { _offset = 0; };
    if (_class == "OPT_CUP_O_Ka60_Grey_RU") then { _offset = 0.2; };
    if (_class == "OPT_CUP_O_Merlin_HC3_GB") then { _offset = 0; };
    if (_class == "OPT_CUP_O_Mi24_V_Dynamic_RU") then { _offset = 0.1; };

    // CSAT Planes
    if (_class == "OPT_CUP_O_AN2_TK") then { _offset = 0.7; };
    if (_class == "OPT_CUP_O_C47_SLA") then { _offset = 0.9; };
    if (_class == "OPT_CUP_O_C130J_TKA") then { _offset = 0.1; };
    if (_class == "OPT_CUP_O_Su25_Dyn_RU") then { _offset = 0.2; };

    // NATO Choppers
    if (_class == "OPT_CUP_MH60S_Unarmed_USN") then { _offset = 0.1; };
    if (_class == "OPT_CUP_B_UH1D_armed_GER_KSK") then { _offset = 0.1; };
    if (_class == "OPT_CUP_B_CH53E_USMC") then { _offset = 0.1; };
    if (_class == "OPT_CUP_B_AH64D_DL_USA") then { _offset = 0; };

    // NATO Planes
    if (_class == "OPT_CUP_C_AN2_CIV") then { _offset = 0.7; };
    if (_class == "OPT_CUP_C_DC3_ChernAvia_CIV") then { _offset = 0.8; };
    if (_class == "OPT_CUP_B_C130J_USMC") then { _offset = 0.1; };
    if (_class == "OPT_CUP_B_L39_CZ_GREY") then { _offset = 0.1; };

    //Objekt Erstellung 
    private _posi = getPosASL GVAR(order_box) vectorAdd [0, 0, 1000];
    private _veh = createVehicle [_class, _posi, [], 0, "NONE"];
    _veh enableDynamicSimulation true;
    _veh setdir getdir GVAR(order_box);
    _veh setVectorUp vectorUp GVAR(order_box);
    _posi = getPosASL GVAR(order_box) vectorAdd [0, 0, _offset];
    _veh setPosASL _posi;

    //check Box liegt im Wasser
    if ((surfaceIsWater (position GVAR(order_box))) and (_veh isKindOf "Ship")) then 
    {
        _veh setPos [(position GVAR(order_box) select 0), (position GVAR(order_box) select 1), _offset]; 
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
    private _uavs =
    [
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

    private _order_kosten = GVAR(order_unitCost) + _waffenkosten;
    [getPlayerUID player, name player, playerSide, netId _veh, typeOf _veh, _order_kosten, "-"] remoteExecCall ["OPT_GELDZEIT_fnc_updateBudget", 2, false];

    // Kauf-Informationen speichern für die spätere Möglichkeit einer Gutschrift
    GVAR(RECENT_ORDERS) set [netId _veh, [serverTime, getPlayerUID player, name player, playerSide, typeOf _veh, _order_kosten]];

    // cleanup old entries
    {
        private _age = serverTime - (_y select 0);
        if (_age > 5) then
        {
            GVAR(RECENT_ORDERS) deleteAt _x;
        };
    } forEach +GVAR(RECENT_ORDERS);
    publicVariable QGVAR(RECENT_ORDERS);
};

//Hardcap Check und Padbox check
if (_status isEqualTo 1) then 
{
    if (GVAR(order_box) != Player) then 
    {
        [] Call FUNC(createOrder);
    }                 
    else 
    {
        private _txt = MLOC(BOX_CHECK_Empty);
        private _header = MLOC(BOX_CHECK);
        hint format["%1\n\n%2", _header, _txt];    
    };        
}                   
else 
{
    private _txt = MLOC(HARDCAP_TEXT);
    private _header = MLOC(HARDCAP);
    hint format["%1\n\n%2", _header, _txt];
};

GVAR(idPadCheckCreate) call CFUNC(removePerframeHandler);

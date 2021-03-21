/**
* Description:
* Funktion Neue Kosten berechung nach änderung der Auswahl
* 
* Author: 
* [GNC]Lord-MDB
*
* Arguments:
* 0 <side> Seite des Ausführeres
* 1 <Objekt> Fahrzeug behandelt wird
* 2 <Array> Datensatz aus der Listbox
* 3 <Array> Plyondaten bei Luftfahrzeuge 
*
* Return Value:
* 0 <Array> Gesammelter Datensatz aus Auswertung für Weiterverarbeitung
* 
* Server only:
* no
*
* Public:
* no
* 
* Global:
* no
* 
* Sideeffects:
* no
* 
* Example:
*
*/

#include "macros.hpp"

params 
[
    ["_side", nil],
    ["_veh", nil],
    ["_boxArry", []],
    ["_pylon", []]
];

#define IDD_DLG_KONFIG 22000
private _display = findDisplay IDD_DLG_KONFIG;

private _IDD_box1 = _display displayCtrl 22011;
private _IDD_box2 = _display displayCtrl 22012;
private _IDD_box3 = _display displayCtrl 22013;
private _IDD_box4 = _display displayCtrl 22014;
private _IDD_box5 = _display displayCtrl 22015;
private _IDD_box6 = _display displayCtrl 22016;
private _IDD_box7 = _display displayCtrl 22017;

//Dynamische Kostenanzeige    
private _boxindex = 0;
private _wert = 0;    
private _magazin = "";
private _weapon = "";
private _kontrolle = 0;
private _buyrakmagazine = [];
private _buyrakweapon = [];
private _buygunmagazine = [];
private _buygunweapon = [];
private _airRaktenmagazin = [];
private _airRaktenweapon = [];
private _airGunmagazin = [];
private _airGunweapon = [];
private _vehMagazin = [];
private _vehWeapon = [];
private _Zusatz = [0,0,0];
private _buykontrolle = [];
private _waffenauswahlarry1 = "";
private _waffenauswahlarry2 = "";
private _Datensatz = [];

if (_side isEqualTo civilian) then 
{
    if ((lbCurSel _IDD_box7) > -1) then 
	{    
        if (lbCurSel _IDD_box7  == 0) then 
		{
             _wert = _wert + GVAR(preisDatalink);
            _Zusatz set [2,1];
        };

    };    

} 
else 
{         
    if (_veh isKindOf "Air") then 
	{
        switch (_side) do 
        {
            case west : 
            {    
                _waffenauswahlarry1 = GVAR(Gunheliwest);
                _waffenauswahlarry2 = GVAR(Raktenheliwest);
            };
            case east : 
            {    
                _waffenauswahlarry1 = GVAR(Gunhelieast);
                _waffenauswahlarry2 = GVAR(Raktenhelieast);
            };
            case independent : 
            {    
                _waffenauswahlarry1 = GVAR(Gunheliindependent);
                _waffenauswahlarry2 = GVAR(Raktenheliindependent);
            };
            default 
            {
            };        
        };

                if ((lbCurSel _IDD_box1) > -1) then 
                {    
                    if ((lbCurSel _IDD_box1) < (count (_boxArry select 1))) then 
                    {
                        _boxindex = (_boxArry select 1) select lbCurSel _IDD_box1;
                        _wert = _wert +((_waffenauswahlarry1 select _boxindex) select 3);
                        _magazin = ((_waffenauswahlarry1 select _boxindex) select 0);
                        _weapon = ((_waffenauswahlarry1 select _boxindex) select 1);
                    
                        _buygunmagazine pushBack _magazin;

                        if (!(_weapon in _buygunweapon)) then 
                        {
                            _buygunweapon pushBack _weapon;
                        };

                    };

                };    

                if ((lbCurSel _IDD_box2) > -1) then 
                {    
                    if ((lbCurSel _IDD_box2) < (count (_boxArry select 1))) then 
                    {
                        _boxindex = (_boxArry select 1) select lbCurSel _IDD_box2;
                        _wert = _wert + ((_waffenauswahlarry1 select _boxindex) select 3);
                        _magazin = ((_waffenauswahlarry1 select _boxindex) select 0);
                        _weapon = ((_waffenauswahlarry1 select _boxindex) select 1);
                    
                        _buygunmagazine pushBack _magazin;

                        if (!(_weapon in _buygunweapon)) then 
                        {
                            _buygunweapon pushBack _weapon;
                        };

                    };

                };    

                if ((lbCurSel _IDD_box3) > -1) then 
                {    
                    if ((lbCurSel _IDD_box3) < (count (_boxArry select 0))) then 
                    {
                        _boxindex = (_boxArry select 0) select lbCurSel _IDD_box3;
                        _wert = _wert + ((_waffenauswahlarry2 select _boxindex) select 3);
                        _magazin = ((_waffenauswahlarry2 select _boxindex) select 0);
                        _weapon = ((_waffenauswahlarry2 select _boxindex) select 1);
                        _kontrolle = ((_waffenauswahlarry2 select _boxindex) select 5);
                    
                        _buyrakmagazine pushBack _magazin;
                        _buyrakweapon pushBack _weapon;
                        _buykontrolle pushBack _kontrolle;                                    
                    };

                };    

                if ((lbCurSel _IDD_box4) > -1) then 
                {    
                    if ((lbCurSel _IDD_box4) < (count (_boxArry select 0))) then 
                    {
                        _boxindex = (_boxArry select 0) select lbCurSel _IDD_box4;
                        _wert = _wert + ((_waffenauswahlarry2 select _boxindex) select 3);
                        _magazin = ((_waffenauswahlarry2 select _boxindex) select 0);
                        _weapon = ((_waffenauswahlarry2 select _boxindex) select 1);
                        _kontrolle = ((_waffenauswahlarry2 select _boxindex) select 5);
                                                
                        _buyrakmagazine pushBack _magazin;
                        _buyrakweapon pushBack _weapon;
                        _buykontrolle pushBack _kontrolle;    
                    };

                };

                if ((lbCurSel _IDD_box5) > -1) then 
                {    
                    if ((lbCurSel _IDD_box5) < (count (_boxArry select 0))) then 
                    {
                        _boxindex = (_boxArry select 0) select lbCurSel _IDD_box5;
                        _wert = _wert + ((_waffenauswahlarry2 select _boxindex) select 3);
                        _magazin = ((_waffenauswahlarry2 select _boxindex) select 0);
                        _weapon = ((_waffenauswahlarry2 select _boxindex) select 1);
                        _kontrolle = ((_waffenauswahlarry2 select _boxindex) select 5);
                                                
                        _buyrakmagazine pushBack _magazin;
                        _buyrakweapon pushBack _weapon;
                        _buykontrolle pushBack _kontrolle;    
                    };
                        
                };    

                if ((lbCurSel _IDD_box6) > -1) then 
                {
                    if ((lbCurSel _IDD_box6) < (count (_boxArry select 0))) then 
                    {
                        _boxindex = (_boxArry select 0) select lbCurSel _IDD_box6;
                        _wert = _wert + ((_waffenauswahlarry2 select _boxindex) select 3);
                        _magazin = ((_waffenauswahlarry2 select _boxindex) select 0);
                        _weapon = ((_waffenauswahlarry2 select _boxindex) select 1);
                        _kontrolle = ((_waffenauswahlarry2 select _boxindex) select 5);
                                                        
                        _buyrakmagazine pushBack _magazin;
                        _buyrakweapon pushBack _weapon;
                        _buykontrolle pushBack _kontrolle;    

                    };

                };

                if ((lbCurSel _IDD_box7) > -1) then  
                {    
                    if (lbCurSel _IDD_box7 == 0) then 
                    {
                        _wert = _wert + GVAR(preisDatalink);
                        _Zusatz set [2,1];
                    };

                };
    } 
	else 
	{
        switch (_side) do 
        {
            case west : 
            {    
                _waffenauswahlarry1 = GVAR(Gunvehwest);
            };
            case east : 
            {    
                _waffenauswahlarry1 = GVAR(Gunveheast);
            };
            case independent : 
            {    
                _waffenauswahlarry1 = GVAR(Gunvehindependent);
            };
            default 
            {
            };        
        };
  
        if ((lbCurSel _IDD_box1) > -1) then 
		{    
            if ((lbCurSel _IDD_box1) < (count (_boxArry select 1))) then 
			{
                _boxindex = (_boxArry select 1) select lbCurSel _IDD_box1;
                _wert = _wert + ((_waffenauswahlarry1 select _boxindex) select 3);
                _magazin = ((_waffenauswahlarry1 select _boxindex) select 0);
                _weapon = ((_waffenauswahlarry1 select _boxindex) select 1);
            
                _buygunmagazine pushBack _magazin;

                if (!(_weapon in _buygunweapon)) then 
				{
                    _buygunweapon pushBack _weapon;
                };

            };

        };    

        if ((lbCurSel _IDD_box2) > -1) then 
		{    
            if ((lbCurSel _IDD_box2) < (count (_boxArry select 1))) then 
			{
                _boxindex = (_boxArry select 1) select lbCurSel _IDD_box2;
                _wert = _wert + ((_waffenauswahlarry1 select _boxindex) select 3);
                _magazin = ((_waffenauswahlarry1 select _boxindex) select 0);
                _weapon = ((_waffenauswahlarry1 select _boxindex) select 1);
            
                _buygunmagazine pushBack _magazin;

                if (!(_weapon in _buygunweapon)) then 
				{
                    _buygunweapon pushBack _weapon;
                };

            };

        };    

        if ((lbCurSel _IDD_box3) > -1) then 
		{    
            if ((lbCurSel _IDD_box3) < (count (_boxArry select 1))) then 
			{
                _boxindex = (_boxArry select 1)select lbCurSel _IDD_box3;
                _wert = _wert + ((_waffenauswahlarry1 select _boxindex) select 3);
                _magazin = ((_waffenauswahlarry1 select _boxindex) select 0);
                _weapon = ((_waffenauswahlarry1 select _boxindex) select 1);
            
                _buygunmagazine pushBack _magazin;

                if (!(_weapon in _buygunweapon)) then 
				{
                    _buygunweapon pushBack _weapon;
                };

            };

        };    

        if ((lbCurSel _IDD_box4) > -1) then 
		{    
            if ((lbCurSel _IDD_box4) < (count (_boxArry select 1))) then 
			{
                _boxindex = (_boxArry select 1)select lbCurSel _IDD_box4;
                _wert = _wert + ((_waffenauswahlarry1 select _boxindex) select 3);
                _magazin = ((_waffenauswahlarry1 select _boxindex) select 0);
                _weapon = ((_waffenauswahlarry1 select _boxindex) select 1);
            
                _buygunmagazine pushBack _magazin;

                if (!(_weapon in _buygunweapon)) then 
				{
                    _buygunweapon pushBack _weapon;
                };

            };

        };

        if ((lbCurSel _IDD_box5) > -1) then 
		{    
            if ((lbCurSel _IDD_box5) == 0) then 
			{
                _wert = _wert + GVAR(preisDrahtkafig);
                _Zusatz set [0,1];
            };

        };    

        if ((lbCurSel _IDD_box6) > -1) then 
		{    
            if ((lbCurSel _IDD_box6) == 0) then 
			{
                _wert = _wert + GVAR(preisTarnung);
                _Zusatz set [1,1];
            };

        };

        if ((lbCurSel _IDD_box7) > -1) then 
		{    
            if (lbCurSel _IDD_box7 == 0) then 
			{
                _wert = _wert + GVAR(preisDatalink);                            
                _Zusatz set [2,1];
            };

        };            
    };
};  

if (_veh isKindOf "Air") then 
{
    _vehWeapon = [];
    _vehMagazin = [];

}
else
{
    _vehWeapon = _buygunweapon;
    _vehMagazin = _buygunmagazine;
    _buygunweapon = [];
    _buygunmagazine = [];
    _buyrakweapon = [];
    _buyrakmagazine = [];

};

_Datensatz append [_veh];
_Datensatz pushBack _buyrakweapon;
_Datensatz pushBack _buyrakmagazine;
_Datensatz pushBack _buygunweapon;
_Datensatz pushBack _buygunmagazine;
_Datensatz pushBack _vehWeapon;
_Datensatz pushBack _vehMagazin;
_Datensatz pushBack _pylon;
_Datensatz pushBack _buykontrolle;
_Datensatz pushBack _Zusatz; 
_Datensatz append [_wert];  

_Datensatz                               
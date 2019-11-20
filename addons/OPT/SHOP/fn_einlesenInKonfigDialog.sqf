/**
* Description:Einlesen der Daten beim Öffnen des Dialogs durch den Spieler
* 
* 
* Author:
* [GNC]Lord-MDB
*
* Arguments:
* 
*
* Return value:
* 
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

//Dateneinlesen
#include "fn_config.sqf";

//Typ einlesen
params [
    ["_type", ""],
    ["_modus", ""],
	["_unitCost", 0]
];

//Dialog Initalisieren
createDialog "Dialogshopkonfig"; 

//dialog
#define IDD_DLG_KONFIG 22000
private _display = findDisplay IDD_DLG_KONFIG;

//Bilder Flächen
private _IDD_muniBild1 = _display displayCtrl 22005;
private _IDD_muniBild2 = _display displayCtrl 22006;
private _IDD_muniBild3 = _display displayCtrl 22007;
private _IDD_muniBild4 = _display displayCtrl 22008;
private _IDD_muniBild5 = _display displayCtrl 22009;
private _IDD_muniBild6 = _display displayCtrl 22010;

//Textflächen
private _IDD_muniText1 = _display displayCtrl 22031;
private _IDD_muniText2 = _display displayCtrl 22032;
private _IDD_muniText3 = _display displayCtrl 22033;
private _IDD_muniText4 = _display displayCtrl 22034;
private _IDD_muniText5 = _display displayCtrl 22035;
private _IDD_muniText6 = _display displayCtrl 22036;

//Preis Fläche
private _kosten = _display displayCtrl 22003;

//Auswahl Boxen
private _IDD_box1 = _display displayCtrl 22011;
private _IDD_box2 = _display displayCtrl 22012;
private _IDD_box3 = _display displayCtrl 22013;
private _IDD_box4 = _display displayCtrl 22014;
private _IDD_box5 = _display displayCtrl 22015;
private _IDD_box6 = _display displayCtrl 22016;
private _IDD_box7 = _display displayCtrl 22017;

//Padbox Fläche
private _padBox = _display displayCtrl 22018;

//Box Kenntzeichnungs text
private _IDD_box_text1 = _display displayCtrl 22037;
private _IDD_box_text2 = _display displayCtrl 22038;
private _IDD_box_text3 = _display displayCtrl 22039;
private _IDD_box_text4 = _display displayCtrl 22040;
private _IDD_box_text5 = _display displayCtrl 22041;
private _IDD_box_text6 = _display displayCtrl 22042;
private _IDD_box_text7 = _display displayCtrl 22043;

//Namen und Bild Flächen
private _IDD_vehDisplayName = _display displayCtrl 22002;
private _IDD_vehDisplayIcon = _display displayCtrl 22004;

//Konfig bestehtigen und ausführen
private _IDD_vehKonfigOrder = _display displayCtrl 22020;

_MuniBild1 ctrlEnable false;
_MuniBild2 ctrlEnable false;
_MuniBild3 ctrlEnable false;
_MuniBild4 ctrlEnable false;
_MuniBild5 ctrlEnable false;
_MuniBild6 ctrlEnable false;

_Munitext1 ctrlEnable false;
_Munitext2 ctrlEnable false;
_Munitext3 ctrlEnable false;
_Munitext4 ctrlEnable false;
_Munitext5 ctrlEnable false;
_Munitext6 ctrlEnable false;

_kosten ctrlSetText "$:0";

GVAR(veh) = "";

//Fahrzeugfeststellung
if (_modus == "New") then 
{
    GVAR(vehType) = _type;
    GVAR(Modus) = "New";
    GVAR(unitCost) = _unitCost;
}
else
{
    GVAR(veh) = vehicle player;
    GVAR(vehType) = typeOf GVAR(veh);
    GVAR(Modus) = "old";
	GVAR(unitCost) = 0;
};

//Nanen und Bild ermittlung
private _vehDisplayName = getText (configFile >> "CfgVehicles" >> GVAR(vehType) >> "displayName");

private _vehDisplayIcon = "";
if (getText(configFile >> "cfgVehicles" >> GVAR(vehType) >> "picture") find ".paa" != -1) then 
{
    _vehDisplayIcon = getText (configFile >> "cfgVehicles" >> GVAR(vehType) >> "picture");
} 
else 
{
    _vehDisplayIcon = getText (configFile >> "cfgVehicles" >> GVAR(vehType) >> "editorPreview");
};

//Loadout Daten einlesen
GVAR(boxArry) = [];
GVAR(side) = civilian;
GVAR(pylon) = [];
private _boxNames = [];
private _loadouts = [];

if (GVAR(vehType) in (GVAR(vehclasswestWW) + GVAR(vehclasseastWW))) then 
{
    switch (GVAR(vehType)) do 
	{
        // WEST
        case "OPT4_B_Heli_Light_01_armed_F": 
		{
            GVAR(boxArry) = GVAR(Pawnee);
            GVAR(side) = west;
            GVAR(pylon) = ["pylonleft1", "pylonright1"];
			_loadouts = GVAR(Pawneeloadout);
        };
        case "OPT4_B_Heli_light_03_green_F": 
		{
            GVAR(boxArry) = GVAR(hellcat1);
            GVAR(side) = west;
            GVAR(pylon) = ["pylonleft1", "pylonright1"];
			_loadouts = GVAR(hellcat1loadout);
        }; 
        case "OPT4_B_Heli_Attack_01_F": 
		{
            GVAR(boxArry) = GVAR(Blackfoot);
            GVAR(side) = west;
            GVAR(pylon) = ["pylonleft1","pylonleft3","pylonright1","pylonright3"];
			_loadouts = GVAR(Blackfootloadout);
        };
        case "OPT4_B_MRAP_01_hmg_F": 
		{
            GVAR(boxArry) = GVAR(HunterHMG);
            GVAR(side) = west;
            GVAR(pylon) = [];
			_loadouts = GVAR(HunterHMGloadout);
        };
        case "OPT4_B_MRAP_01_gmg_F": 
		{
            GVAR(boxArry) = GVAR(HunterGMG);
            GVAR(side) = west;
            GVAR(pylon) = [];
			_loadouts = GVAR(HunterGMGloadout);
        };
        case "OPT4_B_MRAP_03_gmg_F": 
		{
            GVAR(boxArry) = GVAR(StriderGMG);
            GVAR(side) = west;
            GVAR(pylon) = [];
			_loadouts = GVAR(StriderGMGloadout);
        };
        case "OPT_B_T_LSV_01_armed_F": 
		{
            GVAR(boxArry) = GVAR(ProwlerHMG);
            GVAR(side) = west;
            GVAR(pylon) = [];
			_loadouts = GVAR(ProwlerHMGloadout);
        };
        case "OPT4_B_LSV_01_AT_F": 
		{
            GVAR(boxArry) = GVAR(ProwlerAT);
            GVAR(side) = west;
            GVAR(pylon) = [];
			_loadouts = GVAR(ProwlerATloadout);
        };
        case "OPT4_B_APC_Tracked_01_rcws_F": 
		{
            GVAR(boxArry) = GVAR(Panther);
            GVAR(side) = west;
            GVAR(pylon) = [];
			_loadouts = GVAR(Pantherloadout);
        };
        case "OPT4_B_APC_Wheeled_01_cannon_F": 
		{
            GVAR(boxArry) = GVAR(Marshall);
            GVAR(side) = west;
            GVAR(pylon) = [];
			_loadouts = GVAR(Marshallloadout);
        };
        case "OPT4_B_APC_tracked_03_cannon_F": 
		{
            GVAR(boxArry) = GVAR(Mora);
            GVAR(side) = west;
            GVAR(pylon) = [];
			_loadouts = GVAR(Moraloadout);
        };
        case "OPT4_B_APC_Tracked_01_AA_F": 
		{
            GVAR(boxArry) = GVAR(Cheetah);
            GVAR(side) = west;
            GVAR(pylon) = [];
			_loadouts = GVAR(Cheetahloadout);
        };
        case "OPT4_B_MBT_01_TUSK_F": 
		{
            GVAR(boxArry) = GVAR(SlammerUp);
            GVAR(side) = west;
            GVAR(pylon) = [];
			_loadouts = GVAR(SlammerUploadout);
        };    
        case "OPT4_B_MBT_01_arty_F": 
		{
            GVAR(boxArry) = GVAR(Scorcher);
            GVAR(side) = west;
            GVAR(pylon) = [];
			_loadouts = GVAR(Scorcherloadout);
        }; 
        
        // EAST
        case "OPT4_O_Heli_Light_02_F": 
		{
            GVAR(boxArry) = GVAR(Orca);
            GVAR(side) = east;
            GVAR(pylon) = ["pylonleft1", "pylonright1"];
			_loadouts = GVAR(Orcaloadout);
        };
        case "OPT4_O_Heli_Attack_02_F": 
		{
            GVAR(boxArry) = GVAR(Kajman);
            GVAR(side) = east;
            GVAR(pylon) = ["pylonleft1","pylonleft2","pylonright1","pylonright2"];
			_loadouts = GVAR(Kajmanloadout);
        };  
        case "OPT4_O_Heli_light_03_green_F": 
		{
            GVAR(boxArry) = GVAR(hellcat);
            GVAR(side) = east;
            GVAR(pylon) = ["pylonleft1","pylonright1"];
			_loadouts = GVAR(hellcatloadout);
        }; 			
        case "OPT4_O_MRAP_02_hmg_F": 
		{
            GVAR(boxArry) = GVAR(irifHMG);
            GVAR(side) = east;
            GVAR(pylon) = [];
			_loadouts = GVAR(irifHMGloadout);
        };
        case "OPT4_O_MRAP_02_gmg_F": 
		{
            GVAR(boxArry) = GVAR(irifGMG);
            GVAR(side) = east;
            GVAR(pylon) = [];
			_loadouts = GVAR(irifGMGloadout);
        };
        case "OPT_O_T_LSV_02_armed_F": 
		{
            GVAR(boxArry) = GVAR(QuilinHMG);
            GVAR(side) = east;
            GVAR(pylon) = [];
			_loadouts = GVAR(QuilinHMGloadout);
        };
        case "OPT4_O_LSV_02_AT_F": 
		{
            GVAR(boxArry) = GVAR(QuilinAT);
            GVAR(side) = east;
            GVAR(pylon) = [];
			_loadouts = GVAR(QuilinATloadout);
        };
        case "OPT4_O_APC_Wheeled_02_rcws_F": 
		{
            GVAR(boxArry) = GVAR(Marid);
            GVAR(side) = east;
            GVAR(pylon) = [];
			_loadouts = GVAR(Maridloadout);
        };
        case "OPT4_O_APC_Wheeled_03_cannon_F": 
		{
            GVAR(boxArry) = GVAR(Gorgon);
            GVAR(side) = east;
            GVAR(pylon) = [];
			_loadouts = GVAR(Gorgonloadout);
        };
        case "OPT4_O_APC_Tracked_02_cannon_F": 
		{
            GVAR(boxArry) = GVAR(Kamysh);
            GVAR(side) = east;
            GVAR(pylon) = [];
			_loadouts = GVAR(Kamyshloadout);
        };
        case "OPT4_O_APC_Tracked_02_AA_F": 
		{
            GVAR(boxArry) = GVAR(Tigris);
            GVAR(side) = east;
            GVAR(pylon) = [];
			_loadouts = GVAR(Tigrisloadout);
        };    
        case "OPT4_O_MBT_02_cannon_F": 
		{
            GVAR(boxArry) = GVAR(Varsuk);
            GVAR(side) = east;
            GVAR(pylon) = [];
			_loadouts = GVAR(Varsukloadout);
        };
        case "OPT4_O_MBT_02_arty_F": 
		{
            GVAR(boxArry) = GVAR(Sochor);
            GVAR(side) = east;
            GVAR(pylon) = [];
			_loadouts = GVAR(Sochorloadout);
        }; 
        case "OPT4_O_T_MBT_02_arty_ghex_F": 
		{
            GVAR(boxArry) = GVAR(Sochor);
            GVAR(side) = east;
            GVAR(pylon) = [];
			_loadouts = GVAR(Sochorloadout);
        }; 
        
        default 
		{
            GVAR(boxArry) = [];
            GVAR(side) = civilian;
			GVAR(pylon) = [];
			_loadouts = [];
        };
    };
};

private _waffenMagazinArry  = [];
GVAR(weaponsVeh) =[];
GVAR(magazineVeh) =[];
private _magazineVehArryNew=[];
		
//auslesen und filtern bei alt Fahrzeug

if (GVAR(Modus) == "old") then 
{
    // Boxanzeige ausblenden
    _padBox ctrlShow false;

    // Vorhandenen Bewaffnung Filtern
    _waffenMagazinArry = [GVAR(veh)] call FUNC(filter);	

    //Festellung Bewaffnung
    GVAR(weaponsVeh) =_waffenMagazinArry select 0;
    GVAR(magazineVeh) = _waffenMagazinArry select 1;      
    _magazineVehArryNew = [GVAR(veh)] call FUNC(auslesenMagazine);
        
    // Darstellung Magazine im Dialog
    private _magazineVehCount = count _magazineVehArryNew; 

    if (_magazineVehCount > 0) then 
    {
    private _anzeige = [];
    private _MuniKugel = "\A3\Weapons_F\Data\UI\m_200rnd_65x39_yellow_ca.paa";
    private _MuniRakete = "\A3\Weapons_F_beta\Launchers\titan\Data\UI\gear_titan_missile_atl_CA.paa";

        if (GVAR(veh) isKindOf "Air") then 
        {
            {
                if (getNumber (configFile >> "cfgMagazines" >> (_x select 0) >> "count") > 30) then 
                {
                    _anzeige pushBack _MuniKugel;

                } 
                else 
                {
                    _anzeige pushBack _MuniRakete;

                };

            } forEach _magazineVehArryNew;

        } 
        else 
        {
            _magazineVehArryNew apply 
            {
            _anzeige pushBack _MuniKugel;  
            };  
        };
        
        private _Munitext1 = "";
        private _Munitext2 = "";
        private _Munitext3 = "";
        private _Munitext4 = "";
        private _Munitext5 = "";
        private _Munitext6 = "";
        
        private _MuniBild1 = "";
        private _MuniBild2 = "";
        private _MuniBild3 = "";
        private _MuniBild4 = "";
        private _MuniBild5 = "";
        private _MuniBild6 = "";

        for "_i" from 1 to _magazineVehCount do 
        {
            //Bild
            call compile format["_MuniBild%1 = _anzeige select (_i - 1);", _i];
            call compile format["_IDD_muniBild%1 ctrlSetText  _MuniBild%1;", _i];
            call compile format["_IDD_muniBild%1 ctrlShow  true;", _i];

            //Text    
            call compile format["_Munitext%1 = getText (configFile >> 'cfgMagazines' >> ((_magazineVehArryNew select (_i - 1)) select 0) >> 'displayName')", _i];
            call compile format["_IDD_muniText%1 ctrlSetText _Munitext%1;", _i];
            call compile format["_IDD_muniText%1 ctrlShow true;", _i];      
        };        
    };
};    

_IDD_vehDisplayName ctrlSetText _vehDisplayName;
_IDD_vehDisplayIcon ctrlSetText _vehDisplayIcon;

//Preis vorhandene Bewaffnung
GVAR(VorhandeneBewaffnunggeld) = 0;

if (GVAR(side) isEqualTo civilian) then 
{
    //Box7 füllen
    private _index =_IDD_box7 lbAdd format ["Datalink $%1", GVAR(preisDatalink)];    
    _index =_IDD_box7 lbAdd "Leer";    

    _IDD_box_text7 ctrlSetText "Datalink";

} 
else 
{

    GVAR(VorhandeneBewaffnunggeld) = [GVAR(side), _magazineVehArryNew] call FUNC(geldVorhandeneBewaffnung);
    
    //Boxen füllen
    private _Rakmag  = GVAR(boxArry) select 4 select 0;
    private _gunmag = GVAR(boxArry) select 4 select 1;
    private _draht = GVAR(boxArry) select 2 select 0;
    private _tarnung = GVAR(boxArry) select 2 select 1;
    private _datalink = GVAR(boxArry) select 3 select 0;

    if (GVAR(vehType) isKindOf "Air") then 
	{
        //Box1+2
        private _heli = [];
        if (GVAR(side) isEqualTo west) then 
		{    
            _heli = GVAR(Gunheliwest);         

        } 
		else 
		{
            _heli = GVAR(Gunhelieast);

        };

        {
            _index =_IDD_box1 lbAdd 	
            format["%1 $%2", _heli select _x select 4, _heli select _x select 3];

            _index =_IDD_box2 lbAdd 
            format["%1 $%2", _heli select _x select 4, _heli select _x select 3];

        } forEach (GVAR(boxArry) select 1);     

        _index =_IDD_box1 lbAdd "Leer";    
        _index =_IDD_box2 lbAdd "Leer";    

        _IDD_box_text1 ctrlSetText "Magazin Gun";
        _IDD_box_text2 ctrlSetText "Magazin Gun";
        
        //Box3+4
        _heli = [];
        if (GVAR(side) isEqualTo west) then 
		{    
            _heli = GVAR(Raktenheliwest);
               
        } 
		else 
		{
            _heli = GVAR(Raktenhelieast);

        };    

        {
            _index =_IDD_box3 lbAdd 
            format["%1 $%2", _heli select _x select 4, _heli select _x select 3];

            _index =_IDD_box4 lbAdd 
            format["%1 $%2", _heli select _x select 4, _heli select _x select 3];

        } forEach (GVAR(boxArry) select 0);

        _index =_IDD_box3 lbAdd "Leer";    
        _index =_IDD_box4 lbAdd "Leer";

        _IDD_box_text3 ctrlSetText "Magazin Raketen";
        _IDD_box_text4 ctrlSetText "Magazin Raketen";
                    
        //Box5+6
        if (_Rakmag > 2) then  
		{
            {
                _index =_IDD_box5 lbAdd 
                format["%1 $%2", _heli select _x select 4, _heli select _x select 3];

                _index =_IDD_box6 lbAdd 
                format["%1 $%2", _heli select _x select 4, _heli select _x select 3];

            } forEach (GVAR(boxArry) select 0);

            _index =_IDD_box5 lbAdd "Leer";    
            _index =_IDD_box6 lbAdd "Leer";

            _IDD_box_text5 ctrlSetText "Magazin Raketen";
            _IDD_box_text6 ctrlSetText "Magazin Raketen";

        };    
    } 
    else 
    {
        //Box1+2
        private _vehSelect = [];
        if (GVAR(side) isEqualTo west) then 
		{    
            _vehSelect = GVAR(Gunvehwest);

        } 
		else 
		{
            _vehSelect = GVAR(Gunveheast);
                    
        };

        {
            _index =_IDD_box1 lbAdd 
            format["%1 $%2", _vehSelect select _x select 4,_vehSelect select _x select 3];

            _index =_IDD_box2 lbAdd 
            format["%1 $%2", _vehSelect select _x select 4, _vehSelect select _x select 3];

        } forEach (GVAR(boxArry) select 1);
        

        _index =_IDD_box1 lbAdd "Leer";    
        _index =_IDD_box2 lbAdd "Leer";

        _IDD_box_text1 ctrlSetText "Magazin Gun";
        _IDD_box_text2 ctrlSetText "Magazin Gun";

        //Box3+4
        _vehSelect = []; 
        if (GVAR(side) == west) then 
		{    
            _vehSelect = GVAR(Gunvehwest);

        } 
		else 
		{
            _vehSelect = GVAR(Gunveheast);

        };

        {
            _index =_IDD_box3 lbAdd 
            format["%1 $%2", _vehSelect select _x select 4, _vehSelect select _x select 3];

            _index =_IDD_box4 lbAdd 
            format["%1 $%2", _vehSelect select _x select 4, _vehSelect select _x select 3];

        } forEach (GVAR(boxArry) select 1);

        _index =_IDD_box3 lbAdd "Leer";    
        _index =_IDD_box4 lbAdd "Leer";

        _IDD_box_text3 ctrlSetText "Magazin Gun";
        _IDD_box_text4 ctrlSetText "Magazin Gun";

        //Box5            
        if (_draht > 0) then 
		{    
            _index =_IDD_box5 lbAdd  
            format ["Drahtkäfig $%1", GVAR(preisDrahtkafig)];

            _index =_IDD_box5 lbAdd "Leer";

            _IDD_box_text5 ctrlSetText "Drahtkäfig";    
        };

        //Box6            
        if (_tarnung > 0) then 
		{
            _index =_IDD_box6 lbAdd 
			format ["Tarnung $%1", GVAR(preisTarnung)];

            _index =_IDD_box6 lbAdd "Leer";    

            _IDD_box_text6 ctrlSetText "Tranung";
        };        
    };
    
    //Box7            
    if (_datalink > 0) then  
	{
        _index =_IDD_box7 lbAdd 
        format ["Datalink $%1", GVAR(preisDatalink)];  

        _index =_IDD_box7 lbAdd "Leer"; 
           
        _IDD_box_text7 ctrlSetText "Datalink";
    };
	
    _kosten ctrlSetText format["$:%1", GVAR(VorhandeneBewaffnunggeld)];	
};   

//InfoBox Erneuern bei änderung
_IDD_box1 ctrlAddEventHandler [ "LBSelChanged", 
{
    private _display = findDisplay IDD_DLG_KONFIG;
    private _kosten = _display displayCtrl 22003;

    private _Datensatz = [];

    _Datensatz = [GVAR(side),GVAR(vehType),GVAR(boxArry),GVAR(pylon)] call FUNC(dynamischerDatensatz);
    
    _kosten ctrlSetText format["$:%1", (GVAR(VorhandeneBewaffnunggeld) - (_Datensatz select 10))];  

}];

_IDD_box2 ctrlAddEventHandler [ "LBSelChanged", 
{
    private _display = findDisplay IDD_DLG_KONFIG;
    private _kosten = _display displayCtrl 22003;

    private _Datensatz = [];

    _Datensatz = [GVAR(side),GVAR(vehType),GVAR(boxArry),GVAR(pylon)] call FUNC(dynamischerDatensatz);
    
    _kosten ctrlSetText format["$:%1", (GVAR(VorhandeneBewaffnunggeld) - (_Datensatz select 10))]; 

}];

_IDD_box3 ctrlAddEventHandler [ "LBSelChanged", 
{
    private _display = findDisplay IDD_DLG_KONFIG;
    private _kosten = _display displayCtrl 22003;

    private _Datensatz = [];

    _Datensatz = [GVAR(side),GVAR(vehType),GVAR(boxArry),GVAR(pylon)] call FUNC(dynamischerDatensatz);
    
    _kosten ctrlSetText format["$:%1", (GVAR(VorhandeneBewaffnunggeld) - (_Datensatz select 10))]; 

}];

_IDD_box4 ctrlAddEventHandler [ "LBSelChanged", 
{
    private _display = findDisplay IDD_DLG_KONFIG;
    private _kosten = _display displayCtrl 22003;

    private _Datensatz = [];

    _Datensatz = [GVAR(side),GVAR(vehType),GVAR(boxArry),GVAR(pylon)] call FUNC(dynamischerDatensatz);
    
    _kosten ctrlSetText format["$:%1", (GVAR(VorhandeneBewaffnunggeld) - (_Datensatz select 10))];  

}];

_IDD_box5 ctrlAddEventHandler [ "LBSelChanged", 
{
    private _display = findDisplay IDD_DLG_KONFIG;
    private _kosten = _display displayCtrl 22003;

    private _Datensatz = [];

    _Datensatz = [GVAR(side),GVAR(vehType),GVAR(boxArry),GVAR(pylon)] call FUNC(dynamischerDatensatz);
    
    _kosten ctrlSetText format["$:%1", (GVAR(VorhandeneBewaffnunggeld) - (_Datensatz select 10))]; 

}];

_IDD_box6 ctrlAddEventHandler [ "LBSelChanged", 
{
    private _display = findDisplay IDD_DLG_KONFIG;
    private _kosten = _display displayCtrl 22003;

    private _Datensatz = [];

    _Datensatz = [GVAR(side),GVAR(vehType),GVAR(boxArry),GVAR(pylon)] call FUNC(dynamischerDatensatz);
    
    _kosten ctrlSetText format["$:%1", (GVAR(VorhandeneBewaffnunggeld) - (_Datensatz select 10))];  

}];

_IDD_box7 ctrlAddEventHandler [ "LBSelChanged", 
{
    private _display = findDisplay IDD_DLG_KONFIG;
    private _kosten = _display displayCtrl 22003;

    private _Datensatz = [];

    _Datensatz = [GVAR(side),GVAR(vehType),GVAR(boxArry),GVAR(pylon)] call FUNC(dynamischerDatensatz);
    
    _kosten ctrlSetText format["$:%1", (GVAR(VorhandeneBewaffnunggeld) - (_Datensatz select 10))];  
    
}];

// Kauf Konfig ausführen  
_IDD_vehKonfigOrder ctrlAddEventHandler [ "ButtonClick", 
{
    private _display = findDisplay IDD_DLG_KONFIG;

    private _Datensatz = [];
    private _Gesamtkosten = 0;

    _Datensatz = [GVAR(side),GVAR(vehType),GVAR(boxArry),GVAR(pylon)] call FUNC(dynamischerDatensatz);
       
    if (GVAR(Modus) == "New") then  
	{
        _Gesamtkosten = [_Datensatz,GVAR(orderPAD),GVAR(moveInVeh),GVAR(unitCost)] call FUNC(order);
		
    }
	else
	{
        private _class = _Datensatz select 0;
        private _airGunweapon = [];
        private _airGunmagazin = [];
        private _airRaktenweapon = [];
        private _airRaktenmagazin = [];
        private _vehWeapon = [];
        private _vehMagazin = [];

        if (GVAR(veh) isKindOf "Air") then 
	    {
            _airGunweapon = _Datensatz select 1;
            _airGunmagazin = _Datensatz select 2;
            _airRaktenweapon = _Datensatz select 3;
            _airRaktenmagazin = _Datensatz select 4;
            _vehWeapon = [];
            _vehMagazin = [];
        }
        else
        {
            _airGunweapon = [];
            _airGunmagazin = [];
            _airRaktenweapon = [];
            _airRaktenmagazin = [];
            _vehWeapon = _Datensatz select 5;
            _vehMagazin = _Datensatz select 6;

        };

        private _pylon = _Datensatz select 7;
        private _raketencontrol = _Datensatz select 8;
        private _zusatz = _Datensatz select 9;
        private _waffenkosten = _Datensatz select 10;

		[GVAR(veh),
		_airRaktenweapon,
		_airRaktenmagazin,
		_airGunweapon,
		_airGunmagazin,
		_vehWeapon,
		_vehMagazin,
		_pylon,
		_raketencontrol,
		_zusatz,
		GVAR(weaponsVeh),
		GVAR(magazineVeh)] call FUNC(arm);			
		
		if ((GVAR(VorhandeneBewaffnunggeld) - _waffenkosten) > 0) then 
		{                
			[Name Player, playerSide, GVAR(vehType), (GVAR(VorhandeneBewaffnunggeld) - _waffenkosten), "+", "weapons"] call opt_common_fnc_updateBudget;
        } 
		else 
		{
			[Name Player, playerSide, GVAR(vehType), ((GVAR(VorhandeneBewaffnunggeld) - _waffenkosten) * (-1)), "-", "weapons"] call opt_common_fnc_updateBudget;
		};
		
	};
	
    systemChat format ["Konfig OK: D:%1 K:%2",_Datensatz,(GVAR(VorhandeneBewaffnunggeld) - _waffenkosten)];
	
    closeDialog 0;
}];

//Kaufbutton Aktivschlaten bei Freiem Pad
GVAR(idPadCheckKonfig) = [{

    private _freiePads = [];
    private _display = findDisplay IDD_DLG_KONFIG;
    private _IDD_vehKonfigOrder = _display displayCtrl 22020;
    private _padBox = _display displayCtrl 22018;
   
    // check der Pads ob belegt
    {
	    private _ob = nearestObjects [_x, ["AllVehicles", "Thing"], 5];
            
        if (count _ob == 0) then 
        {
            _freiePads append [_x]; 
        };       

    } foreach GVAR(pads);  

    // Kaufbuttuon Freischalten und erstes Pad zuordnen
    if ((count _freiePads) > 0) then 
        {
            _IDD_vehKonfigOrder ctrlEnable true;
            GVAR(orderPAD) = _freiePads select 0;
            _padBox ctrlSetText format ["BOX:%1",GVAR(orderPAD)];
        }
    else 
        {
            _IDD_vehKonfigOrder ctrlEnable false;
            GVAR(orderPAD) = [];
            _padBox ctrlSetText format ["BOX:%1",GVAR(orderPAD)];
        };

}, 1] call CFUNC(addPerFrameHandler);


/**
* Description:
* Initialisierung Geld Zeit System 
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
* [] call FUNC(clientInit);
*/
#include "macros.hpp"

//Event Bildschirmanzeige
[
	EVENT_SPIELUHR_ENDBILDSCHIRM, 
	{
		[] call FUNC(ende);
	},
	[]
	
] call CFUNC(addEventHandler);

[] call FUNC(playerinit);

["missionStarted", {

[getPlayerUID player, profileName, playerSide] remoteExecCall [QFUNC(updatePlayerList), 2, false]; 

player action ["WeaponOnBack", player];

	// TEAM BALANCE - end mission for player if side is full
	// nicht in onPlayerRespawn, da nur zu Missionsbeginn prüfen
	if (isMultiplayer && hasInterface) then 
	{
		if (GVAR(TEAMBALANCE) > 0) then 
		{
			switch GVAR(Fraktionauswahl) do 
			{
				case "AAFvsCSAT" : 
				{
					private _en_pa = if (playerSide == independent) then {playersNumber opfor} else {playersNumber independent};

					if ((playersNumber playerSide) > (_en_pa + GVAR(TEAMBALANCE))) then 
					{
						endMission (switch (playerSide) do 
						{
							case (independent) : {"balanceindependent"};
							case (opfor) : {"balanceOPFOR"};
							default {"LOSER"};
						});
					};

				};

				case "NATOvsCSAT" : 
				{	
					private _en_pa = if (playerSide == blufor) then {playersNumber opfor} else {playersNumber blufor};

					if ((playersNumber playerSide) > (_en_pa + GVAR(TEAMBALANCE))) then 
					{
						endMission (switch (playerSide) do 
						{
							case (blufor) : {"balanceBLUFOR"};
							case (opfor) : {"balanceOPFOR"};
							default {"LOSER"};
						});
					};
				};

				case "NATOvsAAF" : 
				{
					private _en_pa = if (playerSide == blufor) then {playersNumber independent} else {playersNumber blufor};

					if ((playersNumber playerSide) > (_en_pa + GVAR(TEAMBALANCE))) then 
					{
						endMission (switch (playerSide) do 
						{
							case (blufor) : {"balanceBLUFOR"};
							case (independent) : {"balanceindependent"};
							default {"LOSER"};
						});
					};				

				};

				default 
				{
					ERROR_LOG("clientinit: Fehlehalte Datenübergabe keine Fraktionauswahl erkannt");	
				};
			};

		};
	};

	// friere Spieler, falls freezeTime aktiv
	[] call FUNC(frezztime);

//Beam ausführen zur zweiten Basis
GVAR(beam_trigger) = [];

switch GVAR(Fraktionauswahl) do 
{
	case "AAFvsCSAT" : 
	{
		GVAR(beam_trigger) = 
		[
			AAF_trigger_beam_basis1,
    		AAF_trigger_beam_basis2,
    		csat_trigger_beam_basis1,
    		csat_trigger_beam_basis2
		];
	};

	case "NATOvsCSAT" : 
	{
		GVAR(beam_trigger) = 
		[
			nato_trigger_beam_basis1,
    		nato_trigger_beam_basis2,
    		csat_trigger_beam_basis1,
    		csat_trigger_beam_basis2
		];	
	};

	case "NATOvsAAF" : 
	{
		GVAR(beam_trigger) = 
		[
			AAF_trigger_beam_basis1,
    		AAF_trigger_beam_basis2,
    		nato_trigger_beam_basis1,
    		nato_trigger_beam_basis2
		];			
	};

	default 
	{
		ERROR_LOG("clientinit: Fehlehalte Datenübergabe keine Fraktionauswahl erkannt");	
	};
};

[
    "OPT", 
    QGVAR(cba_addKeybind_beam_dialog), 
    ["Beam-Funktion", "Beamen im Teleportbereich zur anderen Basis."], 
    {
        if ( ({vehicle player in list _x} count GVAR(beam_trigger)) > 0 ) then 
        {
            [] call FUNC(beam);
        };
        
    }, 
    {}, 
    [
        DIK_F2, 
        [false, false, false] // [shift, ctrl, alt]
    ]
] call CBA_fnc_addKeybind;


}] call CFUNC(addEventhandler);
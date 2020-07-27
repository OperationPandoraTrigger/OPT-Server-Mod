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


}] call CFUNC(addEventhandler);
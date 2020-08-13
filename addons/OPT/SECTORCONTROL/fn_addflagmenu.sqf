/**
* Author: James
* fügt allen Offizieren (HL und PL) einen addAction Eintrag für die Flaggenwahl
* zu Missionsbeginn hinzu. Ruft das Skript chooseFlag auf. Wird ausgeblendet,
* sobald die Mission begonnen hat.     
*
* Arguments:
* None
*
* Return Value:
* None
*
* Example:
* [] call FUNC(addflagmenu);
*
*/
#include "macros.hpp"

if (OPT_GELDZEIT_Spielzeitstart) exitWith{};

GVAR(officer) =  
[
    "OPT_NATO_Offizier_T",
    "OPT_CSAT_Offizier_T",
	"OPT_NATO_Offizier",
	"OPT_CSAT_Offizier",
    "I_officer_F"
];


// Mausradmenüeinträge für HL und PL
if (typeOf player in GVAR(officer)) then 
{
    player addAction [
        format["<t size=""1.5"" color=""#ffffff"">%1</t>", localize "STR_ATTACK_FLAG"], 
        {[] call FUNC(chooseFlag);}, 
        [], 
        6, 
        true, 
        true, 
        "", 
        "!OPT_GELDZEIT_Spielzeitstart"
    ];

    // inform player
    private _txt = localize "STR_FLAG_INST";
    private _header = parseText localize "STR_FLAG_CHOOSE";
    hint Format ["%1 \n\n %2",_header,_txt];
};
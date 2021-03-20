/**
* Description:
* Infos im Briefing erstellen
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
* [] call FUNC(briefing);
*/
#include "macros.hpp"

player createDiarySubject ["keys", "OPT Eigenschaften"];
player createDiaryRecord ["keys", ["Tastenbelegung","OPT Flagge ziehen - F3 (konfigurierbare Tastenbelegung unter OPT)<br/><br/>"]];
player createDiaryRecord ["keys", ["Tastenbelegung", "OPT Shop aufrufen in der Basis in Kaufbereich - F6 (konfigurierbare Tastenbelegung unter OPT)<br/><br/>"]];
player createDiaryRecord ["keys", ["Tastenbelegung", "OPT Konfig aufrufen in der Basis in Kaufbereich - F7 (konfigurierbare Tastenbelegung unter OPT)<br/><br/>"]];
player createDiaryRecord ["keys", ["Feldreperatur", "Realistisches Feldreperatur script von Zealot: <br/>Das Script erlaubt es jedem Spieler, beschädigte Fahrzeuge einmalig mit Ersatzteilen zu reparieren. <br/>- Die Reparatur dauert je nach Schweregrad des Schadens zwischen 30 und 240 Sekunden. Die Reparatur kann abgebrochen und an der gleichen Stelle wieder aufgenommen werden. <br/>- Jedes Fahrzeug kann einmalig mit vorhandenen Ersatzteilen repariert werden. Danach benötigt man eine Werkzeugbox im Rucksack (nur Pio-Slots). <br/>- Reparaturen stellen das Fahrzeug nicht immer wieder komplett her (manche Teile bleiben gelb).<br/>- Ein Rep-LKW kann 10 mal für Reparaturen genutzt werden, danach sind die Ersatzteile in ihm erschöpft.<br/>- Um den Rep-LKW zu nutzen, einfach auf den Fahrersitz setzen und mit Blick auf das beschädigte Fahrzeug und Komplettreparatur auswählen!"]];
player createDiaryRecord ["keys", ["Fahrzeug Nutzung", 
    "Spezielle Fahrzeuge können nur mit der entsprechenden Ausbildung bewegt werden.<br/><br/>" +
    "D.h. nur die spezifische Spielerklasse kann bestimmte Fahrzeuge bedienen. Beispielsweise nur Piloten können fliegen und nur Besatzungsmitglieder können schwere Fahrzeuge deren geschütze verwenden."
]];

if (OPT_SECTORCONTROL_trainingon) then 
{
    player createDiarySubject ["Training", "Training"];
    player createDiaryRecord ["Training", ["Flaggen verschieben",
        "Im Trainingsmodus kann jeder Spieler die Flaggen verschieben. Dazu einfach auf der Karte mit ALT + Linksklick auf die Flaggenmarkierung klicken.<br/>" +
        "Unten links erscheint ein Text, wenn die Aktion erfolgreich war. Wurde die Flagge ausgewählt, so kann mit erneutem ALT + Linksklick die neue Position gewählt werden."
    ]];
    player createDiaryRecord ["Training", ["Zeus", "Im Trainingsmodus hat jeder Zugriff auf Zeus."]];
    player createDiaryRecord ["Training", ["Teleport", "Im Trainingsmodus kann jeder Spieler den Teleport benutzen. Dieser findet sich im Mausradmenü unter Teleport.<br/>" +
        "Einfach auf der Karte den gewünschten Zielort auswählen. Innerhalb von Fahrzeugen wird auch das Fahrzeug teleportiert."
    ]];
};

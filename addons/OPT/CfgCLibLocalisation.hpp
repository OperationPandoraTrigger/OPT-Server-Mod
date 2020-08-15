class CfgCLibLocalisation {

	supportedLanguages[] = {"English", "German"};
	class OPT{

		class SECTORCONTROL{
			
			class ATTACK_FLAG {
				English = "Attack flag";
				German = "Angriffsflagge";
			};
			class FLAG_INST {
				English = "Please select a flag via the mousewheel menu. This must be done during the ceasefire!";
				German = "Bitte eine Flagge über das Mausradmenü wählen. Dies muss während der Waffenruhe geschehen!";
			};
			class FLAG_CHOOSE {
				English = "Choice of the attack flag";
				German = "Wahl der Angriffsflagge";
			};
			class SECTORCONTROL_INSTRUCTION {
				English = "All possible attack flags are marked with a black circle. The selected flag is highlighted in blue, green or red, depending on the side. It can be selected as often as you like.";
				German = "Alle möglichen Angriffsflaggen sind mit einem schwarzen Kreis markiert. Die gewählte Flagge wird je nach Seite blau,grün oder rot hervorgehoben. Es kann beliebig oft neu gewählt werden.";
			};
			class SECTORCONTROL_INSTRUCTION_HEADER {
				English = "Instructions";
				German = "Instruktionen";
			};
			class FLAG_CONFIRM {
				English = "%1 of %2 allowed flags selected.";
				German = "%1 von %2 erlaubten Flaggen gewählt.";
			};
			class MINE_VIOLATION {
				English = "Mine laid in the mine-restricted area! Mine was deleted.";
				German = "Mine in der Minensperrzone gelegt! Mine wurde gelöscht.";
			};
			class MINE_VIOLATION_HEADER {
				English = "Restricted area";
				German = "Sperrzone";
			};
			class POINT_NO_DOMINATOR_AAFvCSAT {
				English = "No Dominator (AAF %1 | CSAT %2)";
				German = "Kein Dominator (AAF %1 | CSAT %2)";
			};
			class POINT_NO_DOMINATOR_NATOvCSAT {
				English = "No Dominator (NATO %1 | CSAT %2)";
				German = "Kein Dominator (NATO %1 | CSAT %2)";
			};
			class POINT_NO_DOMINATOR_NATOvAAF {
				English = "No Dominator (NATO %1 | AAF %2)";
				German = "Kein Dominator (NATO %1 | AAF %2)";
			};
			class CAPTURE_FLAG {
				English = "Capture the flag";
				German = "Flagge ziehen";
			};
			class TELEPORT_MSG_HEADER {
				English = "Teleport";
				German = "Teleport";
			};
			class TELEPORT_MSG {
				English = "Select position to teleport with left click.";
				German = "Position zum Teleport mit Linksklick auswählen.";
			};
		};
		class RULES {
			class SLOT_LOCK {
				English = "Slot lock";
				German = "Slotsperre";
			};
			class SLOT_LOCK_PILOT {
				English = "Only pilots are allowed to fly!";
				German = "Es ist nur Piloten erlaubt zu fliegen!";
			};
			class SLOT_LOCK_CREW {
				English = "This place is reserved for the crew!";
				German = "Dieser Platz ist Besatzungsmitgliedern vorbehalten!";
			};
			class PLACE_MINE {
				English = "Mines may only be laid by explosive technicians! Mine was deleted.";
				German = "Minen dürfen nur von Sprengmeister gelegt werden! Mine wurde gelöscht.";
			};
			class RULE_VIOLATION {
				English = "Violation of the rules";
				German = "Regelverstoß";
			};
			class UAV_LOGIN {
				English = "Connecting to UAV station";
				German = "Verbinden mit UAV-Station";
			};
			class UAV_LOGOUT {
				English = "Disconnect with UAV station";
				German = "Trenne mit UAV-Station";
			};
			class UAV_CONNECT {
				English = "Connecting...";
				German = "verbinde...";
			};
			class UAV_DISCONNECT {
				English = "disconnect...";
				German = "trenne...";
			};
			class UAV_CONNECTION_MSG {
				English = "UAV station \n\n Logged into UAV station. Connection is lost if more than 4m away.";
				German = "UAV-Station \n\n In UAV-Station eingeloggt. Verbindung geht verloren, wenn mehr als 4m entfernt.";
			};
			class CONNECTION_QUIT {
				English = "UAV station \n\n Logged out of UAV station.";
				German = "UAV-Station \n\n Von UAV-Station ausgeloggt.";
			};
			class UAV_CONNECTION_LOST {
				English = "UAV station \n\n Connection to UAV station lost.";
				German = "UAV-Station \n\n Verbindung zur UAV-Station verloren.";
			};
			class WEAPON_LOCK {
				English = "Weapon inadmissible for current player class.\n\n Weapon has been removed.";
				German = "Waffe unzulässig für aktuelle Spielerklasse.\n\n Waffe wurde entfernt.";
			};
		};
		class REVIVE {
			class KILL_MSG {
				English = "Name of the enemy:";
				German = "Name des Gegners:";
			};
			class KILL_SELF {
				English = "self-caused";
				German = "Selbstverschulden";
			};
			class FIRST_AID {
				English = "First Aid";
				German = "Erste Hilfe";
			};
			class MEDIC_REVIVE {
				English = "Resuscitate";
				German = "Wiederbeleben";
			};
			class STABILISE {
				English = "Stabilise";
				German = "Stabilisieren";
			};
			class SELF_CARE {
				English = "Self-care";
				German = "Eigenversorgung";
			};
			class MEDIC_DISTANCE {
				English = "Paramedic %1 is %2m away.";
				German = "Sanitäter %1 ist %2m entfernt.";
			};
			class NO_MEDIC {
				English = "No paramedics nearby.";
				German = "Kein Sanitäter in der Nähe.";
			};
			class CARRY_DRAG {
				English = "Carry/Drag";
				German = "Tragen/Ziehen";
			};
			class CARRY {
				English = "Carry";
				German = "Tragen";
			};
			class DRAG {
				English = "Drag";
				German = "Ziehen";
			};
			class CHAT_DEACTIVATED {
				English = "Chat disabled!";
				German = "Chat deaktiviert!";
			};
			class SAN_SYS {
				English = "San-System";
				German = "San-System";
			};
		};
		class HUD {
			class AAFvCSAT {
				English = "Player: (A) %1 vs %2 (C)";
				German = "Spieler: (A) %1 vs %2 (C)";
			};
			class NATOvCSAT {
				English = "Player: (N) %1 vs %2 (C)";
				German = "Spieler: (N) %1 vs %2 (C)";
			};
			class NATOvAAF {
				English = "Player: (N) %1 vs %2 (A)";
				German = "Spieler: (N) %1 vs %2 (A)";
			};
			class AAFvCSAT_POINT {
				English = "Points: (A) %1 vs %2 (C)";
				German = "Punkte: (A) %1 : %2 (C)";
			};
			class NATOvCSAT_POINT {
				English = "Points: (N) %1 vs %2 (C)";
				German = "Punkte: (N) %1 : %2 (C)";
			};
			class NATOvAAF_POINT {
				English = "Points: (N) %1 : %2 (A)";
				German = "Punkte: (N) %1 : %2 (A)";
			};
			class TIME_LEFT {
				English = "Remaining game time: %1";
				German = "Rest-Spielzeit: %1";
			};
			class TIME_END {
				English = "Time: 00:00";
				German = "Zeit: 00:00";
			};
			class TIME_CEASEFIRE {
				English = "Ceasefire: %1";
				German = "Waffenruhe: %1";
			};
			class TIME_CEASEFIRE_END {
				English = "Ceasefire: 00:00";
				German = "Waffenruhe: 00:00";
			};
		};
		class GPS {
			class PLAYER_STABILISED {
				English = "%1 stabilised";
				German = "%1 stabilisiert";
			};
			class PLAYER_INJURED {
				English = "%1 injured";
				German = "%1 verwundet";
			};
		};
		class GELDZEIT {
		};
		class FIELDREPAIR {
		};
	};
};
class CfgCLibLocalisation
{
    supportedLanguages[] = {"English", "German"};
    class OPT
    {
        class SECTORCONTROL
        {
            class ATTACK_FLAG
            {
                English = "Attack flag";
                German = "Angriffsflagge";
            };

            class FLAG_INST
            {
                English = "Please select a flag via the mousewheel menu. This must be done during the ceasefire!";
                German = "Bitte eine Flagge über das Mausradmenü wählen. Dies muss während der Waffenruhe geschehen!";
            };

            class FLAG_CHOOSE
            {
                English = "Choice of the attack flag";
                German = "Wahl der Angriffsflagge";
            };

            class SECTORCONTROL_INSTRUCTION
            {
                English = "All possible attack flags are marked with a black circle. The selected flag is highlighted in blue, green or red, depending on the side. It can be selected as often as you like.";
                German = "Alle möglichen Angriffsflaggen sind mit einem schwarzen Kreis markiert. Die gewählte Flagge wird je nach Seite blau,grün oder rot hervorgehoben. Es kann beliebig oft neu gewählt werden.";
            };

            class SECTORCONTROL_INSTRUCTION_HEADER
            {
                English = "Instructions";
                German = "Instruktionen";
            };

            class FLAG_CONFIRM
            {
                English = "%1 of %2 allowed flags selected.";
                German = "%1 von %2 erlaubten Flaggen gewählt.";
            };

            class MINE_VIOLATION
            {
                English = "Mine laid in the mine-restricted area! Mine was deleted.";
                German = "Mine in der Minensperrzone gelegt! Mine wurde gelöscht.";
            };

            class MINE_VIOLATION_HEADER
            {
                English = "Restricted area";
                German = "Sperrzone";
            };

            class NO_DOMINATOR
            {
                English = "No Dominator";
                German = "Kein Dominator";
            };
            
            class CAPTURE_FLAG
            {
                English = "Capture the flag";
                German = "Flagge ziehen";
            };
            
            class TELEPORT_MSG_HEADER
            {
                English = "Teleport";
                German = "Teleport";
            };
            
            class TELEPORT_MSG
            {
                English = "Select position to teleport with left click.";
                German = "Position zum Teleport mit Linksklick auswählen.";
            };
            
            class TELEPORT_FAIL
            {
                English = "Teleporting failed. Too much trees in that area.";
                German = "Teleport gescheitert. Zuviele Bäume in der Umgebung.";
            };
        };

        class RULES
        {
            class SLOT_LOCK
            {
                English = "Slot lock";
                German = "Slotsperre";
            };
            
            class SLOT_LOCK_PILOT
            {
                English = "Only pilots are allowed to fly!";
                German = "Es ist nur Piloten erlaubt zu fliegen!";
            };
            
            class SLOT_LOCK_CREW
            {
                English = "This place is reserved for the crew!";
                German = "Dieser Platz ist Besatzungsmitgliedern vorbehalten!";
            };
            
            class PLACE_MINE
            {
                English = "Mines may only be laid by explosive technicians! Mine was deleted.";
                German = "Minen dürfen nur von Sprengmeister gelegt werden! Mine wurde gelöscht.";
            };
            
            class RULE_VIOLATION
            {
                English = "Violation of the rules";
                German = "Regelverstoß";
            };
            
            class UAV_LOGIN
            {
                English = "Connecting to UAV station";
                German = "Verbinden mit UAV-Station";
            };
            
            class UAV_LOGOUT
            {
                English = "Disconnect with UAV station";
                German = "Trenne mit UAV-Station";
            };
            
            class UAV_CONNECT
            {
                English = "Connecting...";
                German = "verbinde...";
            };
            
            class UAV_DISCONNECT
            {
                English = "disconnect...";
                German = "trenne...";
            };
            
            class UAV_STATION
            {
                English = "UAV station";
                German = "UAV-Station";
            };
            
            class UAV_CONNECTION_MSG
            {
                English = "Logged into UAV station. Connection is lost if more than 4m away.";
                German = "In UAV-Station eingeloggt. Verbindung geht verloren, wenn mehr als 4m entfernt.";
            };
            
            class CONNECTION_QUIT
            {
                English = "Logged out of UAV station.";
                German = "Von UAV-Station ausgeloggt.";
            };
            
            class UAV_CONNECTION_LOST
            {
                English = "Connection to UAV station lost.";
                German = "Verbindung zur UAV-Station verloren.";
            };
            
            class WEAPON_LOCK
            {
                English = "Weapon inadmissible for current player class.\n\n Weapon has been removed.";
                German = "Waffe unzulässig für aktuelle Spielerklasse.\n\n Waffe wurde entfernt.";
            };

            class BASE_DISTANCE
            {
                English = "A player was automatically killed due to entering the enemy base!";
                German = "Ein Spieler wurde aufgrund des Betretens der feindlichen Basis automatisch getötet!";
            };
            class PLAYER_OUT_OF_MAP
            {
                English = "A player was automatically killed due to leaving the map!";
                German = "Ein Spieler wurde aufgrund des Verlassens der Karte automatisch getötet!";
            };
        };

        class REVIVE
        {
            class KILL_MSG
            {
                English = "Name of the enemy:";
                German = "Name des Gegners:";
            };
            
            class KILL_SELF
            {
                English = "self-caused";
                German = "Selbstverschulden";
            };
            
            class KILL_UNKNOWN
            {
                English = "unknown";
                German = "Unbekannt";
            };
            
            class FIRST_AID
            {
                English = "First Aid";
                German = "Erste Hilfe";
            };
            
            class MEDIC_REVIVE
            {
                English = "Revive";
                German = "Wiederbeleben";
            };
            
            class MEDIC_REVIVING
            {
                English = "Reviving";
                German = "Wiederbeleben";
            };
            
            class STABILISE
            {
                English = "Stabilise";
                German = "Stabilisieren";
            };
            
            class IS_STABILISED
            {
                English = "Stabilised";
                German = "Stabilisiert";
            };
            
            class STABILISING
            {
                English = "Stabilising";
                German = "Stabilisieren";
            };
            
            class SELF_CARE
            {
                English = "Self-care";
                German = "Eigenversorgung";
            };
            
            class MEDIC_DISTANCE
            {
                English = "Paramedic %1 is %2m away.";
                German = "Sanitäter %1 ist %2m entfernt.";
            };
            
            class NO_MEDIC
            {
                English = "No paramedics nearby.";
                German = "Kein Sanitäter in der Nähe.";
            };
            
            class CARRY_DRAG
            {
                English = "Carry/Drag";
                German = "Tragen/Ziehen";
            };
            
            class CARRY
            {
                English = "Carry";
                German = "Tragen";
            };
            
            class DRAG
            {
                English = "Drag";
                German = "Ziehen";
            };
            
            class CHAT_DEACTIVATED
            {
                English = "Chat disabled!";
                German = "Chat deaktiviert!";
            };
            
            class SAN_SYS
            {
                English = "San-System";
                German = "San-System";
            };
        };

        class HUD
        {
            class AAFvCSAT
            {
                English = "Player: (A) %1 vs %2 (C)";
                German = "Spieler: (A) %1 vs %2 (C)";
            };
            
            class NATOvCSAT
            {
                English = "Player: (N) %1 vs %2 (C)";
                German = "Spieler: (N) %1 vs %2 (C)";
            };
            
            class NATOvAAF
            {
                English = "Player: (N) %1 vs %2 (A)";
                German = "Spieler: (N) %1 vs %2 (A)";
            };
            
            class AAFvCSAT_POINT
            {
                English = "Points: (A) %1 : %2 (C)";
                German = "Punkte: (A) %1 : %2 (C)";
            };
            
            class NATOvCSAT_POINT
            {
                English = "Points: (N) %1 : %2 (C)";
                German = "Punkte: (N) %1 : %2 (C)";
            };
            
            class NATOvAAF_POINT
            {
                English = "Points: (N) %1 : %2 (A)";
                German = "Punkte: (N) %1 : %2 (A)";
            };
            
            class TIME_LEFT
            {
                English = "Remaining game time: %1";
                German = "Rest-Spielzeit: %1";
            };
            
            class TIME_END
            {
                English = "Time: 00:00";
                German = "Zeit: 00:00";
            };
            
            class TIME_CEASEFIRE
            {
                English = "Ceasefire: %1";
                German = "Waffenruhe: %1";
            };
            
            class TIME_CEASEFIRE_END
            {
                English = "Ceasefire: 00:00";
                German = "Waffenruhe: 00:00";
            };
        };

        class GPS
        {
            class PLAYER_STABILISED
            {
                English = "%1 stabilised";
                German = "%1 stabilisiert";
            };
            
            class PLAYER_INJURED
            {
                English = "%1 injured";
                German = "%1 verwundet";
            };
        };

        class GELDZEIT
        {
            class CSAT_WIN
            {
                English = "CSAT won!";
                German = "CSAT hat gewonnen!";
            };
            
            class NATO_WIN
            {
                English = "NATO won!";
                German = "NATO hat gewonnen!";
            };
            
            class AAF_WIN
            {
                English = "AAF won!";
                German = "AAF hat gewonnen!";
            };
            
            class NO_WINNER
            {
                English = "It's a tie!";
                German = "Unentschieden!";
            };
            
            class ACE_EQIP
            {
                English = "Equipment";
                German = "Ausrüstung";
            };
            
            class EARPLUGS_25
            {
                English = "Earplugs in";
                German = "Ohrenstöpsel rein";
            };
            
            class EARPLUGS_50
            {
                English = "Earplugs 50%";
                German = "Ohrenstöpsel 50%";
            };
            
            class EARPLUGS_100
            {
                English = "Earplugs out";
                German = "Ohrenstöpsel raus";
            };
            
            class BUDGET_MIO
            {
                English = "Budget: %1 Mio. €";
                German = "Budget: %1 Mio. €";
            };
            
            class BUDGET
            {
                English = "Budget: %1 €";
                German = "Budget: %1 €";
            };
            
            class OVERDRAFT_MIO
            {
                English = "Overdraft: %1 Mio. €";
                German = "Dispo: %1 Mio. €";
            };
            
            class OVERDRAFT
            {
                English = "Overdraft: %1 €";
                German = "Dispo: %1 €";
            };

            class BEAM
            {
                English = "Beam to other base";
                German = "Beam zur anderen Basis";
            };
            class HAFTLADUNG
            {
                English = "Attach explosive charge";
                German = "Sprengladung anbringen";
            };
            class HAFTLADUNGNOBOMBE
            {
                English = "no explosive charge ready to be attached";
                German = "keine Sprengladung bereit zum anbringen";
            };
            class HAFTLADUNGNOVEH
            {
                English = "no vehicle ready to mount";
                German = "keine Fahrzeug bereit zum anbringen";
            };
            class HAFTLADUNGATTACH
            {
                English = "Explosive charge attached to vehicle";
                German = "Sprengladung an Fahrzeug angebracht";
            };
        };

        class FIELDREPAIR
        {
            class ANOTHER_ACTION
            {
                English = "Other action in progress!";
                German = "Andere Aktion im Gange!";
            };
            
            class REPAIR_TRUCK_DEPLETED
            {
                English = "No more spare parts available in the repair truck.";
                German = "Keine weiteren Ersatzteile im Reparatur-LKW vorhanden.";
            };
            
            class REPAIR_FINISHED
            {
                English = "Repair finished";
                German = "Reparatur beendet";
            };
            
            class REPAIR_CONDITIONS
            {
                English = "Do not move the vehicle when working!";
                German = "Das Fahrzeug während der Arbeit nicht bewegen!";
            };
            
            class REPAIR_INTERRUPTED
            {
                English = "Repair interrupted";
                German = "Reparatur unterbrochen";
            };
            
            class REPAIR_MSG_STRNG
            {
                English = "Repair of %2 takes %1 s...";
                German = "Reparatur von %2 dauert %1 s...";
            };
            
            class NEED_TOOLKIT
            {
                English = "The vehicle no longer has any spare parts. Only an engineer can do field repairs now!";
                German = "Das Fahrzeug hat keine Ersatzteile mehr. Nur ein Ingenieur kann jetzt noch Feldreparaturen durchführen!";
            };
            
            class FIELD_REPAIR_HEADER
            {
                English = "Field Repair";
                German = "Feldreparatur";
            };
            
            class REFUEL_FINISHED
            {
                English = "Refuelling finished";
                German = "Auftanken beendet";
            };
            
            class REFUEL_INTERRUPTED
            {
                English = "Refuelling interrupted";
                German = "Auftanken unterbrochen";
            };
            
            class REFUEL_MSG_STRING
            {
                English = "Refuelling of %2 takes %1 s...";
                German = "Auftanken von %2 dauert %1 s...";
            };
            
            class CHECK_REPAIRS
            {
                English = "Check amount of spare parts";
                German = "Prüfe Zahl an Ersatzteilen";
            };
            
            class SERIOUS_REPAIR
            {
                English = "Perform complete repair";
                German = "Komplettreparatur durchführen";
            };
            
            class FIELD_REFUEL
            {
                English = "Use spare canister";
                German = "Reservekanister verwenden";
            };
            
            class FIELD_REPAIR
            {
                English = "Perform field repair";
                German = "Feldreparatur durchführen";
            };
            
            class REPAIRS_LEFT
            {
                English = "%1 of %2 Spare parts left";
                German = "%1 von %2 Ersatzteilen übrig";
            };
        };

        class SHOP
        {
            class SHOPMENU_AIR
            {
                English = "Air Force";
                German = "Luftwaffe";
            };
            
            class SHOPMENU_GROUND
            {
                English = "Vehicles";
                German = "Fahrzeuge";
            };
            
            class SHOPMENU_EQUIPMENT
            {
                English = "Equipment";
                German = "Ausrüstung";
            };
            
            class SHOPMENU_SEA
            {
                English = "Watercraft";
                German = "Wasserfahrzeuge";
            };
            
            class SHOPMENU_SELL
            {
                English = "Sell";
                German = "Verkaufen";
            };
            
            class HARDCAP
            {
                English = "Hardcap";
                German = "Hardcap";
            };
            
            class HARDCAP_TEXT
            {
                English = "Vehicle limit reached, purchase was cancelled";
                German = "Fahrzeuggrenze erreicht, kauf wurde abgebrochen";
            };

            class FLIP_VEH
            {
                English = "Raise the vehicle";
                German = "Fahrzeug aufrichten";
            };
            
            class BOX_CHECK_Empty
            {
                English = "No free box available";
                German = "Kein freie Box vorhanden";
            };
            
            class BOX_CHECK
            {
                English = "Box Check";
                German = "Box Check";
            };
        };
    };
};

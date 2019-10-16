/*
List all events used by OPT here
*/
#define OPT_EVENT(var)                  QUOTE(TRIPLE(opt,event,var))

// FAR Medic system (legacy) compatibility events
// Unit is rendered unconscious
// params ["_unit"]
#define EVENT_MEDIC_UNCONSCIOUS         OPT_EVENT(medic_unconscious)
// Unit has been stabilized
// params ["_unit"]
#define EVENT_MEDIC_STABILIZED          OPT_EVENT(medic_stabilized)
// Unit has been revived
// params ["_unit"]
#define EVENT_MEDIC_REVIVED             OPT_EVENT(medic_revived)
// Laden der Datenmatrix nach öffen des Shop Dialogs
// params [""]
#define EVENT_SHOP_KAUF_ONLOAD         OPT_EVENT(shop_kauf_onload)
// Erneuerung des Infosfeld nach änderung der Auswahl 
// params ["_typ"]
#define EVENT_SHOP_INFOFELD        OPT_EVENT(shop_infofeld)
// Kauf Shop ausführen 
// params ["_typ"]
#define EVENT_SHOP_ORDER      OPT_EVENT(shop_order)
// Laden der Datenmatrix nach öffen des Konfiguration Dialogs
// params ["_typ"]
#define EVENT_SHOP_KONFIG_ONLOAD         OPT_EVENT(shop_konfig_onload)
// Erneuerung des Infosfeld nach änderung der Auswahl 
// params [""]
#define EVENT_SHOP_NEUBERECHNUNG        OPT_EVENT(shop_neuberechnung)
// Kauf in Konfigurator ausführen 
// params ["_typ"]
#define EVENT_SHOP_KONFIG_ORDER      OPT_EVENT(shop_konfig_order)

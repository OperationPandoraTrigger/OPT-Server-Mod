/*
List all events used by OPT here
*/
#define OPT_EVENT(var)                  QUOTE(TRIPLE(PREFIX,event,var))

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
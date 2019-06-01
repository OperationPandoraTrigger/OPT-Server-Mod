#define PATH opt
#define PREFIX opt
#define MOD opt

// Define version information of this mod
#define MAJOR 0
#define MINOR 1
#define PATCHLVL 0
#define BUILD 0

#ifdef VERSION
    #undef VERSION
#endif
#ifdef VERSION_AR
    #undef VERSION_AR
#endif

#define VERSION_AR MAJOR,MINOR,PATCHLVL,BUILD
#define VERSION MAJOR.MINOR.PATCHLVL.BUILD


// Do not release with this setting enabled!
#include "isDev.hpp"
// #define DEBUGFULL // Enable all debug methods
// #define ENABLEPERFORMANCECOUNTER // Enable performance counter for function calls
// #define ENABLEFUNCTIONTRACE // Enable SQF based function tracer


#define DISABLECOMPRESSION

// include the default CLib-macros (providing GVAR and similar)
// Found here: https://github.com/TaktiCool/CLib/blob/master/addons/CLib/macros.hpp
#include "\tc\CLib\addons\CLib\macros.hpp"

// Makros for API variables + functions
#define OVAR(var) DOUBLE(OPT,var)
#define QOGVAR(var) QUOTE(OGVAR(var))
#define DOFUNC(var) TRIPLE(OPT,fnc,var)
#define QOFUNC(var) QUOTE(DOFUNC(var))

#define ERROR_LOG(msg) SYSLOGGING("ERROR", msg)

#ifdef ISDEV
    #define OFUNC(var) (currentNamespace getVariable [QOFUNC(var), {if (time > 0) then {["Error function %1 dont exist or isNil", QOFUNC(var)] call BIS_fnc_errorMsg;}; DUMP(QOFUNC(var) + " Doesn't Exist")}])
#else
    #define OFUNC(var) DOFUNC(var)
#endif


// expand the IS_XYZ macros from CLib (https://github.com/TaktiCool/CLib/blob/master/addons/CLib/supportMacros.hpp#L7)
#define IS_ARRAY_LENGTH(var, length) if (IS_ARRAY(var)) then {count var == length} else {false}
#define IS_POSITION2D(var) IS_ARRAY_LENGTH(var,2)
#define IS_POSITION3D(var) IS_ARRAY_LENGTH(var,3)
#define IS_POSITION(var) IS_POSITION2D(var) || IS_POSITION3D(var)
#define IS_NULL(var) isNull var


// Makros for assertions
#ifdef ISDEV
	#define ASSERTION_FAILED(msg) SYSLOGGING("FAILED ASSERTION",msg)

	#define ASSERT_IS_TYPE(var, type) ASSERT_IS_NOT_NIL(var); if !(var isEqualType type) then {private _errMsg = format["Expected %1 but got %2", typeName type, typeName var]; ASSERTION_FAILED(_errMsg);};
	#define ASSERT_IS_ARRAY(var) ASSERT_IS_TYPE(var,[])
	#define ASSERT_IS_BOOL(var) ASSERT_IS_TYPE(var,true)
	#define ASSERT_IS_CODE(var) ASSERT_IS_TYPE(var,{})
	#define ASSERT_IS_CONFIG(var) ASSERT_IS_TYPE(var,configNull)
	#define ASSERT_IS_CONTROL(var) ASSERT_IS_TYPE(var,controlNull)
	#define ASSERT_IS_DISPLAY(var) ASSERT_IS_TYPE(var,displayNull)
	#define ASSERT_IS_GROUP(var) ASSERT_IS_TYPE(var,grpNull)
	#define ASSERT_IS_OBJECT(var) ASSERT_IS_TYPE(var,objNull)
	#define ASSERT_IS_SCALAR(var) ASSERT_IS_TYPE(var,1)
	#define ASSERT_IS_NUMBER(var) ASSERT_IS_SCALAR(var)
	#define ASSERT_IS_SCRIPT(var) ASSERT_IS_TYPE(var,scriptNull)
	#define ASSERT_IS_SIDE(var) ASSERT_IS_TYPE(var,sideUnknown)
	#define ASSERT_IS_STRING(var) ASSERT_IS_TYPE(var,"")
	#define ASSERT_IS_TEXT(var) ASSERT_IS_TYPE(var,text "")
	#define ASSERT_IS_LOCATION(var) ASSERT_IS_TYPE(var,locationNull)
	#define ASSERT_IS_NAMESPACE(var) ASSERT_IS_TYPE(var,missionNamespace)
	#define ASSERT_IS_NULL(var) ASSERT_IS_NOT_NIL(var); if !(IS_NULL(var)) then {private _errMsg = format ["Expected variable to be of type Null but got %1", typeName var]; ASSERTION_FAILED(_errMsg);};
	#define ASSERT_IS_NOT_NULL(var) ASSERT_IS_NOT_NIL(var); if (IS_NULL(var)) then {ASSERTION_FAILED("Expected variable to not be Null, but it was");};
	#define ASSERT_IS_NIL(var) if !(isNil {var}) then {private _errMsg = format["Expected Nil but got %1", var]; ASSERTION_FAILED(_errMsg);};
	#define ASSERT_IS_NOT_NIL(var) if (isNil {var}) then {ASSERTION_FAILED("Variable was nil but shouldn't have been");};
	#define ASSERT_IS_POSITION(var) ASSERT_IS_NOT_NIL(var); if !(IS_POSITION(var)) then {private _errMsg = format ["Expected Position but got %1", var]; ASSERTION_FAILED(_errMsg);};
	#define ASSERT_IS_POSITION2D(var) ASSERT_IS_NOT_NIL(var); if !(IS_POSITION2D(var)) then {private _errMsg = format ["Expected Position2D but got %1", var]; ASSERTION_FAILED(_errMsg);};
	#define ASSERT_IS_POSITION3D(var) ASSERT_IS_NOT_NIL(var); if !(IS_POSITION3D(var)) then {private _errMsg = format ["Expected Position3D but got %1", var]; ASSERTION_FAILED(_errMsg);};
	#define ASSERT_IS_INTEGER(var) ASSERT_IS_NOT_NIL(var); if !(IS_SCALAR(var)) then {private _errMsg = format["Expected integer but got %1", typeName var]; ASSERTION_FAILED(_errMsg);}\
		else { if !(floor var isEqualTo var ) then { private _errMsg = format["Expected integer but got floating point number (%1)", var]; ASSERTION_FAILED(_errMsg);};};
	#define ASSERT_TRUE(var) ASSERT_IS_NOT_NIL(var); if !(var isEqualTo true) then {private _errMsg = format["Expected True but got %1", var]; ASSERTION_FAILED(_errMsg);};
	#define ASSERT_FALSE(var) ASSERT_IS_NOT_NIL(var); if !(var isEqualTo false) then {private _errMsg = format["Expected False but got %1", var]; ASSERTION_FAILED(_errMsg);};
	#define ASSERT_ARRAY_LENGTH(var,length) ASSERT_IS_NOT_NIL(var); ASSERT_IS_ARRAY(var); if !(IS_ARRAY_LENGTH(var,length)) then {private _errMsg = format ["Expected array of length but got %1", var];};
	#define ASSERT_ALIVE(var) ASSERT_IS_NOT_NIL(var); ASSERT_IS_OBJECT(var); if !(alive var) then {ASSERTION_FAILED("Expected object to be alive but it wasn't")};
	#define ASSERT_DEAD(var) ASSERT_IS_NOT_NIL(var); ASSERT_IS_OBJECT(var); if (alive var) then {ASSERTION_FAILED("Expected object to be alive but it wasn't")};
#else
	// Disable all assertions
	#define ASSERTION_FAILED(msg)

	#define ASSERT_IS_TYPE(var, type)
	#define ASSERT_IS_ARRAY(var)
	#define ASSERT_IS_BOOL(var)
	#define ASSERT_IS_CODE(var)
	#define ASSERT_IS_CONFIG(var)
	#define ASSERT_IS_CONTROL(var)
	#define ASSERT_IS_DISPLAY(var)
	#define ASSERT_IS_GROUP(var)
	#define ASSERT_IS_OBJECT(var)
	#define ASSERT_IS_SCALAR(var)
	#define ASSERT_IS_NUMBER(var)
	#define ASSERT_IS_SCRIPT(var)
	#define ASSERT_IS_SIDE(var)
	#define ASSERT_IS_STRING(var)
	#define ASSERT_IS_TEXT(var)
	#define ASSERT_IS_LOCATION(var)
	#define ASSERT_IS_NAMESPACE(var)
	#define ASSERT_IS_NULL(var)
	#define ASSERT_IS_NOT_NULL(var)
	#define ASSERT_IS_NIL(var)
	#define ASSERT_IS_NOT_NIL(var)
	#define ASSERT_IS_POSITION(var)
	#define ASSERT_IS_POSITION2D(var)
	#define ASSERT_IS_POSITION3D(var)
	#define ASSERT_IS_INTEGER(var)
	#define ASSERT_TRUE(var)
	#define ASSERT_FALSE(var)
	#define ASSERT_ARRAY_LENGTH(var,length)
	#define ASSERT_ALIVE(var)
	#define ASSERT_DEAD(var)
#endif
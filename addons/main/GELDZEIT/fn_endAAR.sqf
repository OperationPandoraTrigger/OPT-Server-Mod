#include "macros.hpp"

private _type = "TvT";
private _logged = false;
switch (GVAR(Fraktionauswahl)) do
{
    case "AAFvsCSAT":
    {
        private _points1 = EGVAR(SECTORCONTROL,aaf_points);
        private _points2 = EGVAR(SECTORCONTROL,csat_points);

        // Ermittel Sieger
        if (_points2 != _points1) then
        {
            if (_points2 > _points1) then
            {
                _logged = true;
                [east, format ["%1:%2", _points1, _points2], _type] call ocap_fnc_exportData;
            }
            else
            {
                _logged = true;
                [resistance, format ["%1:%2", _points1, _points2], _type] call ocap_fnc_exportData;
            };
        }
        else
        {
            _logged = true;
            [sideUnknown, format ["%1:%2", _points1, _points2], _type] call ocap_fnc_exportData;
        };
    };

    case "NATOvsCSAT":
    {
        private _points1 = EGVAR(SECTORCONTROL,nato_points);
        private _points2 = EGVAR(SECTORCONTROL,csat_points);

        // Ermittel Sieger
        if (_points2 != _points1) then
        {
            if (_points2 > _points1) then
            {
                _logged = true;
                [east, format ["%1:%2", _points1, _points2], _type] call ocap_fnc_exportData;
            }
            else
            {
                _logged = true;
                [west, format ["%1:%2", _points1, _points2], _type] call ocap_fnc_exportData;
            };
        }
        else
        {
            _logged = true;
            [sideUnknown, format ["%1:%2", _points1, _points2], _type] call ocap_fnc_exportData;
        };
    };

    case "NATOvsAAF":
    {
        private _points1 = EGVAR(SECTORCONTROL,nato_points);
        private _points2 = EGVAR(SECTORCONTROL,aaf_points);

        // Ermittel Sieger
        if (_points2 != _points1) then
        {
            if (_points2 > _points1) then
            {
                _logged = true;
                [resistance, format ["%1:%2", _points1, _points2], _type] call ocap_fnc_exportData;
            }
            else
            {
                _logged = true;
                [west, format ["%1:%2", _points1, _points2], _type] call ocap_fnc_exportData;
            };
        }
        else
        {
            _logged = true;
            [sideUnknown, format ["%1:%2", _points1, _points2], _type] call ocap_fnc_exportData;
        };
    };
};

if (!_logged) then {
    [sideUnknown, format ["NATO:%1 CSAT:%2 AAF:%3", EGVAR(SECTORCONTROL,nato_points), EGVAR(SECTORCONTROL,csat_points), EGVAR(SECTORCONTROL,aaf_points)], _type] call ocap_fnc_exportData;
};

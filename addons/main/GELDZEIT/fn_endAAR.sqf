#include "macros.hpp"

private _text = "";
private _type = "TvT";
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
                [east, MLOC(CSAT_WIN), _type] call ocap_fnc_exportData;
            }
            else
            {
                [resistance, MLOC(AAF_WIN), _type] call ocap_fnc_exportData;
            };
        }
        else
        {
            [west, MLOC(NO_WINNER), _type] call ocap_fnc_exportData;
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
                [east, MLOC(CSAT_WIN), _type] call ocap_fnc_exportData;
            }
            else
            {
                [west, MLOC(NATO_WIN), _type] call ocap_fnc_exportData;
            };
        }
        else
        {
            [west, MLOC(NO_WINNER), _type] call ocap_fnc_exportData;
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
                [resistance, MLOC(AAF_WIN), _type] call ocap_fnc_exportData;
            }
            else
            {
                [west, MLOC(NATO_WIN), _type] call ocap_fnc_exportData;
            };
        }
        else
        {
            [west, MLOC(NO_WINNER), _type] call ocap_fnc_exportData;
        };
    };
};

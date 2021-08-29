/**
* Description:
* Server-Initialisierung Beam System
*
* Author:
* form
*
* Arguments:
*
* Return Value:
*
* Server Only:
* Yes
*
* Global:
* No
*
* API:
* No
*
* Example:
* [] call FUNC(serverInit);
*/

#include "macros.hpp"

// Beam-System (Serverseitiger Teil)
GVAR(BEAMJOBS) = [];
GVAR(BEAMJOB) = [];
publicVariable QGVAR(BEAMJOB);

QGVAR(BEAMJOB) addPublicVariableEventHandler
{
    GVAR(BEAMJOBS) pushBackUnique GVAR(BEAMJOB);
    while {count GVAR(BEAMJOBS) > 0} do
    {
        // Ersten Job aus dem Array ziehen
        private _beamjob = GVAR(BEAMJOBS) deleteAt 0;   // FIFO
        private _player = _beamjob select 0;
        private _destination = _beamjob select 1;

        // Checken ob das Ziel frei ist
        private _freiePads = [[_destination], 8] call OPT_SHOP_fnc_checkpad;
        if ((count _freiePads) > 0) then
        {
            // Beamen
            {cutText ["Teleport...", "BLACK OUT", 0.1];} remoteExec ["call", _player];
            private _velocity = velocityModelSpace vehicle _player;
            private _playerHeight = getPosASL vehicle _player select 2;
            private _playerSurfaceHeight = lineIntersectsSurfaces [getPosASL vehicle _player, (getposASL vehicle _player) vectorAdd [0, 0, -5000], vehicle _player] select 0 select 0 select 2;
            private _heightAboveGround = _playerHeight - _playerSurfaceHeight;

            vehicle _player setPosASL (getPosASL _destination vectorAdd [0, 0, 1000]);
            vehicle _player setdir getdir _destination;

            if ((vehicle _player isKindOf "Air") && (_heightAboveGround > 2)) then
            {
                vehicle _player setVectorUp [0, 0, 1];
                vehicle _player setPosASL (getPosASL _destination vectorAdd [0, 0, _heightAboveGround + 20]);
            }
            else
            {
                vehicle _player setVectorUp vectorUp _destination;
                vehicle _player setPosASL (getPosASL _destination vectorAdd [0, 0, 0.2]);
            };

            [vehicle _player, _velocity] remoteExec ["setVelocityModelSpace", _player];
            {cutText ["Teleport...", "BLACK IN", 0.5];} remoteExec ["call", _player];
        }
        else
        {
            // Das Ziel ist belegt
            {
                hint format ["%1\n\n%2", MLOC(BEAM), MLOC(BEAM_BUSY)];
                playSound "additemok";
            } remoteExec ["call", _player];
        };
    };
};

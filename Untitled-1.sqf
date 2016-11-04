wreckKill = {
	_veh = vehicle (_this select 0);
	_pos = getPosATL _veh;

	hint format ["Vehicle is %1",_veh];

	_returnRoadPos = roadAt _pos;

	vectorXYZ = [
		(round random(30)) * cos ((vectorNormalized (_pos vectorFromTo _returnRoadPos)) select 0),
		(round random(30)) * sin ((vectorNormalized (_pos vectorFromTo _returnRoadPos)) select 1),
		0
	] vectorAdd _pos;

	_markerstr = createMarker ["markername",vectorXYZ];
	_markerstr setMarkerShape "ICON";
	_markerstr setMarkerType "hd_dot";

	_veh setPosATL vectorXYZ;
	_markerstr setMarkerText "The vehicle should be here!";
};

cursorTarget addEventHandler ["Killed", wreckKill];
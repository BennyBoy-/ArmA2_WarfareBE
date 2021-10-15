waitUntil {commonInitComplete};

if (local player) then {
	Private["_allies","_color","_hq","_marker","_structure","_text","_type","_side","_sideID","_voteTime"];
	
	_structure = _this select 0;
	_hq = _this select 1;
	_sideID = _this select 2;
	_side = (_sideID) Call WFBE_CO_FNC_GetSideFromID;
	_allies = if (count _this > 3) then {_this select 3} else {""};

	waitUntil {clientInitComplete};
	if (_side != WFBE_Client_SideJoined) exitWith {};
	
	sleep 2;

	_marker = Format["BaseMarker%1",buildingMarker];
	buildingMarker = buildingMarker + 1;
	createMarkerLocal [_marker,getPos _structure];
	_type = "mil_box";
	_color = "ColorOrange";
	if (_hq) then {_type = "Headquarters"};
	if (_allies != "") then {_type = "mil_box";_color = "ColorYellow"};
	_marker setMarkerTypeLocal _type;
	_text = "";
	if (!_hq && _allies == "") then {_text = [_structure, _side] Call GetStructureMarkerLabel;_marker setMarkerSizeLocal [0.5,0.5]};
	if (_allies != "") then {_marker setMarkerSizeLocal [0.5,0.5];_text = _allies};
	if (_text != "") then {_marker setMarkerTextLocal _text};
	_marker setMarkerColorLocal _color;
	
	while {!isNull _structure && alive _structure} do {sleep 2};

	deleteMarkerLocal _marker;
};
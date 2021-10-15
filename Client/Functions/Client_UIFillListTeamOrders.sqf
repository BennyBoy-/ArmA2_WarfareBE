Private ['_color','_extra','_i','_isVehicle','_listBox','_listContent','_pic','_unit'];
_listContent = _this select 0;
_listBox = _this select 1;
_i = 0;
_pic = "";

lnbClear _listBox;

{
	_unit = vehicle _x;
	_isVehicle = if (_x != _unit) then {true} else {false};

	_color = [];
	_extra = "";
	if (round(((getDammage _unit)*-100)+100) < 75) then {
		_color = [0.875, 0.5, 0, 1];
		_extra = "[Injured] ";
		if (round(((getDammage _unit)*-100)+100) < 50) then {
			_extra = "[Injured] ";
			_color = [0.875, 0, 0, 1];
			if !(alive _x) then {_extra = "[Dead]"};
		};
	};
	if (count _color == 0 && _isVehicle) then {
		if !(canMove _unit) then {
			_extra = "[Immobilized] ";
			_color = [0.875, 0.875, 0, 1];
		};
	};
	
	lnbAddRow [_listBox,[str(round(((getDammage _unit)*-100)+100)) + "%",_extra+"("+([typeOf _unit, 'displayName'] Call GetConfigInfo)+") "+name _x]];
	_pic = if (_isVehicle) then {[typeOf _unit, 'picture'] Call GetConfigInfo} else {[typeOf _unit, 'portrait'] Call GetConfigInfo};
	lnbSetPicture [_listBox,[_i,1],_pic];

	if (count _color > 0) then {
		lnbSetColor [_listBox,[_i,0],_color];
		lnbSetColor [_listBox,[_i,1],_color];
	};
	_i = _i + 1;
} forEach _listContent;

if (_i > 0) then {lnbSetCurSelRow [_listBox,0]} else {lnbSetCurSelRow [_listBox,-1]};
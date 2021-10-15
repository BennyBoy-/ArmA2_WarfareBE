Private["_message","_style"];

_message = _this Select 0;
_style = "PLAIN";
if (Count _this > 1) then {_style = _this Select 1};

12451 cutText ["\n\n\n\n\n\n\n" + _message,_style];
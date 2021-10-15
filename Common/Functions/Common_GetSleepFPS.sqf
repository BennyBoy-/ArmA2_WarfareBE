Private ["_delay"];

_delay = _this;

if (diag_fps > 15) exitWith {_delay};
if (diag_fps <= 15 && diag_fps > 10) exitWith {_delay * 0.85};
if (diag_fps <= 10 && diag_fps > 7) exitWith {_delay * 0.75};
if (diag_fps <= 7 && diag_fps > 5) exitWith {_delay * 0.70};
if (diag_fps <= 5) exitWith {_delay * 0.50};

_delay
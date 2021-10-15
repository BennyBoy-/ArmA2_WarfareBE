Private ['_amount','_change','_currentSupply','_side'];

_side = _this select 0;
_amount = _this select 1;

_currentSupply = (_side) Call GetSideSupply;
if (isNil '_currentSupply') then {_currentSupply = 0};
_change = _currentSupply + _amount;
if (_change < 0) then {_change = _currentSupply - _amount};

(_side Call WFBE_CO_FNC_GetSideLogic) setVariable ["wfbe_supply", _change, true];
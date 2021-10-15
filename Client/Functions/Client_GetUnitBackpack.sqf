/*
	Return the backpack of a unit (script friendly).
	 Parameters:
		- Unit
*/

if !(isNull(unitBackpack _this)) then {typeOf(unitBackpack _this)} else {""}
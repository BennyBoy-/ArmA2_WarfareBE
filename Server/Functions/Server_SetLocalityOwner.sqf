/*
	Make an object local to a client.
	 Parameters:
		- Object
		- Locality target (client)
*/

Private ["_building","_dammages","_dammages_current","_get","_killer","_logik","_origin","_structure"];

_object = _this select 0;
_local_to = _this select 1;

_object setOwner (owner _local_to);
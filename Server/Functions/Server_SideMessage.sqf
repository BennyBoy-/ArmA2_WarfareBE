Private ["_logik","_message","_parameters","_receiver","_side","_speaker","_topicside"];

_side = _this select 0;
_message = _this select 1;
_parameters = if (count _this > 2) then {_this select 2} else {[]};

_logik = (_side) Call WFBE_CO_FNC_GetSideLogic;

_speaker = _logik getVariable "wfbe_radio_hq";
_receiver = _logik getVariable "wfbe_radio_hq_rec";
_topicSide = _logik getVariable "wfbe_radio_hq_id";

switch (true) do {
	case (_message in ["Lost","Captured","HostilesDetectedNear"]): {
		_locRaw = str _parameters;
		_rlName = _parameters getVariable "name";
		
		_dub = _parameters getVariable "wfbe_town_dubbing";
		if (_dub != "Town") then {if (count(getArray(configFile >> (missionNamespace getVariable Format ["WFBE_%1_RadioAnnouncers_Config", _side]) >> "Words" >> _dub)) == 0) then {_dub = "Town"}};

		_speaker kbTell [_receiver, _topicSide, _message,["1","",_rlName,[_dub]],true];
	};
	case (_message in ["CapturedNear","LostAt"]): {
		_locRaw = str (_parameters select 1);
		_rlName = (_parameters select 1) getVariable "name";

		_dub = (_parameters select 1) getVariable "wfbe_town_dubbing";
		if (_dub != "Town") then {if (count(getArray(configFile >> (missionNamespace getVariable Format ["WFBE_%1_RadioAnnouncers_Config", _side]) >> "Words" >> _dub)) == 0) then {_dub = "Town"}};
		
		_speaker kbTell [_receiver, _topicSide, _message,["1","",(_parameters select 0),[(_parameters select 0)]],["2","",_rlName,[_dub]],true];
	};
	case (_message in ["Constructed","Destroyed","Deployed","Mobilized","IsUnderAttack"]): {
		_localizedString = "";
		_value = "";
		if ((_parameters select 0 ) == "Base") then {
			switch ((_parameters select 1) getVariable "wfbe_structure_type") do {
				case "Headquarters": {_localizedString = localize "STRHeadquarters";_value = "Headquarters"};
				case "Barracks": {_localizedString = localize "strwfbarracks";_value = "Barracks"};
				case "Light": {_localizedString = localize "STRLightVehicleSupply";_value = "LightVehicleSupply"};
				case "CommandCenter": {
					_localizedString = localize "STR_WF_CommandCenter";
					_value = "UAVTerminal";
					if (WF_A2_Arrowhead || (WF_A2_CombinedOps && _side == west)) then {_value = "CommandPost"};
				};
				case "Heavy": {_localizedString = localize "STRHeavyVehicleSupply";_value = "HeavyVehicleSupply"};
				case "Aircraft": {_localizedString = localize "STRHelipad";_value = "Helipad"};
				case "ServicePoint": {_localizedString = localize "STRServicePoint";_value = "ServicePoint"};
				case "AARadar": {_localizedString = localize "STRAntiAirRadar";_value = "AntiAirRadar"};
			};
		} else {
			_localizedString = (_parameters select 1) getVariable "name";
			_dub = (_parameters select 1) getVariable "wfbe_town_dubbing";
			if (_dub != "Town") then {if (count(getArray(configFile >> (missionNamespace getVariable Format ["WFBE_%1_RadioAnnouncers_Config", _side]) >> "Words" >> _dub)) == 0) then {_dub = "Town"}};
			_value = _dub;
		};
		_speaker kbTell [_receiver, _topicSide, _message,["1","",_localizedString,[_value]],true];
	};
	case (_message in ["VotingForNewCommander","NewIntelAvailable","MMissionFailed","NewMissionAvailable"]): {
		_speaker kbTell [_receiver, _topicSide, _message, true]
	};
	case (_message in ["MMissionComplete","ExtractionTeam","ExtractionTeamCancel"]): {
		_speaker kbTell [_receiver, _topicSide, _message,["1","",_parameters select 0,[_parameters select 1]],true];
	};
};
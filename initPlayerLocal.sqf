// get the saved data of the player or make new save game

// player has initialized;

private _saveFilePath = format ["%1.data", getPlayerUID player];

private _fileExists = [_saveFilePath] call filext_fnc_fileExists;

systemChat str (_fileExists);

if (!_fileExists) exitWith {
	["New player, saving data...", true, 5, 2] call ace_common_fnc_displayText;

	[player, _saveFilePath] call BLUE_fnc_newSaveFile;

	["Save complete.", true, 5, 2] call ace_common_fnc_displayText;

	true;
};

private _userData = [_saveFilePath] call BLUE_fnc_loadData;

private _kit = _userData[0];
private _rep = _userData[1];
private _history = _userData[2];
private _mission = _userData[3];
private _location = _userData[4];

systemChat _mission;
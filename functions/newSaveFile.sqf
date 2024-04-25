params ["_player", "_saveFilePath"];

private _player = _this select 0;
private _saveFilePath = _this select 1;

[_saveFilePath] call filext_fnc_open;

// get the data.
private _kit = [_this select 0] call CBA_fnc_getLoadout;
private _repArray = [0, 0, 0, 0, 0];
private _history = [];
private _mission = "0";
private _location = getPosATL _player;

private _kitArrayStr = str _kit;
private _historyArrayStr = str _history;
private _repArrayStr = str _repArray;
private _locationStr = str _location;

// Write the data.
[_saveFilePath, "kit", _kitArrayStr] call filext_fnc_set;
[_saveFilePath, "reputation", _repArrayStr] call filext_fnc_set;
[_saveFilePath, "history", _historyArrayStr] call filext_fnc_set;
[_saveFilePath, "mission", _mission] call filext_fnc_set;
[_saveFilePath, "location", _locationStr] call filext_fnc_set;

[_saveFilePath] call filext_fnc_write;
[_saveFilePath] call filext_fnc_close;


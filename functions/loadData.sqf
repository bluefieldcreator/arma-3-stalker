/*
	MISSION LOAD DATA

	Usage: 

	[_saveFilePath] call BLUE_fnc_loadData;
*/

//todo: FIX LOADING ERROR
// TODO: CHECK IF SAVE WORKS
// TODO: BEGIN MISSION FRAMEWORK

params ["_saveFilePath"];

private _saveFilePath = _this select 0;

systemChat format ["[loadData]: New load invoked at file %1", _saveFilePath];


[_saveFilePath] call filext_fnc_open;
[_saveFilePath] call filext_fnc_read;

systemChat "Init Runs";

private _kitStr = [_saveFilePath, "kit"] call filext_fnc_get; // JSON format used by ACE
private _repArrayStr = [_saveFilePath, "reputation"] call filext_fnc_get;
private _historyArrayStr = [_saveFilePath, "history"] call filext_fnc_get;
private _mission = [_saveFilePath, "mission"] call filext_fnc_get;
private _locationStr = [_saveFilePath, "location"] call filext_fnc_get;

systemChat "Data Extraction Complete";


private _kit = parseSimpleArray _kitStr;
private _rep = parseSimpleArray _repArrayStr;
private _history = parseSimpleArray _historyArrayStr;
private _location = parseSimpleArray _locationStr;


[_saveFilePath] call filext_fnc_close;

systemChat "File Closed";

systemChat "Returning";

[_kit, _rep, _history, _mission, _location];


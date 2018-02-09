[
    QGVAR(enabled),
    "CHECKBOX",
    [localize ACELSTRING(common,Enabled), localize LSTRING(Enabled_Description)],
    format ["ACEX %1", localize LSTRING(DisplayName)],
    false,
    true
] call CBA_settings_fnc_init;

[
    QGVAR(timeWithoutWater),
    "SLIDER",
    [localize LSTRING(TimeWithoutWater_DisplayName), localize LSTRING(TimeWithoutWater_Description)],
    format ["ACEX %1", localize LSTRING(DisplayName)],
    [1, 24, 2, 0],
    true
] call CBA_settings_fnc_init;

[
    QGVAR(timeWithoutFood),
    "SLIDER",
    [localize LSTRING(TimeWithoutFood_DisplayName), localize LSTRING(TimeWithoutFood_Description)],
    format ["ACEX %1", localize LSTRING(DisplayName)],
    [1, 24, 2, 0],
    true
] call CBA_settings_fnc_init;

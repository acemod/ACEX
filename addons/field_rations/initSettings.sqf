[
    QGVAR(enabled),
    "CHECKBOX",
    [localize ACELSTRING(common,Enabled), localize LSTRING(Enabled_Description)],
    localize LSTRING(DisplayName),
    false,
    true
] call CBA_settings_fnc_init;

[
    QGVAR(timeWithoutWater),
    "SLIDER",
    [localize LSTRING(TimeWithoutWater_DisplayName), localize LSTRING(TimeWithoutWater_Description)],
    localize LSTRING(DisplayName),
    [0.1, 24, 2, 1],
    true
] call CBA_settings_fnc_init;

[
    QGVAR(timeWithoutFood),
    "SLIDER",
    [localize LSTRING(TimeWithoutFood_DisplayName), localize LSTRING(TimeWithoutFood_Description)],
    localize LSTRING(DisplayName),
    [0.1, 24, 2, 1],
    true
] call CBA_settings_fnc_init;

[
    QGVAR(hudShowLevel),
    "LIST",
    [localize LSTRING(HudShowLevel_DisplayName), localize LSTRING(HudShowLevel_Description)],
    localize LSTRING(DisplayName),
    [[100, 90, 80, 70, 60, 50, 40, 30], [localize LSTRING(Always), "90%", "80%", "70%", "60%", "50%", "40%", "30%"], 7],
    false
] call CBA_settings_fnc_init;

[
    QGVAR(hudTransparency),
    "LIST",
    [localize LSTRING(HudTransparency_DisplayName), localize LSTRING(HudTransparency_Description)],
    localize LSTRING(DisplayName),
    [[-1, 1, 0.9, 0.8, 0.7, 0.6, 0.5, 0.4, 0.3, 0.2], [localize LSTRING(Dynamic), "0%", "10%", "20%", "30%", "40%", "50%", "60%", "70%", "80%"], 4],
    false
] call CBA_settings_fnc_init;

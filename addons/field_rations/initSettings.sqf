[
    QGVAR(enabled),
    "CHECKBOX",
    [ACELSTRING(common,Enabled), LSTRING(Enabled_Description)],
    LSTRING(DisplayName),
    false,
    true
] call CBA_settings_fnc_init;

[
    QGVAR(timeWithoutWater),
    "SLIDER",
    [LSTRING(TimeWithoutWater_DisplayName), LSTRING(TimeWithoutWater_Description)],
    LSTRING(DisplayName),
    [0.1, 24, 2, 1],
    true
] call CBA_settings_fnc_init;

[
    QGVAR(timeWithoutFood),
    "SLIDER",
    [LSTRING(TimeWithoutFood_DisplayName), LSTRING(TimeWithoutFood_Description)],
    LSTRING(DisplayName),
    [0.1, 24, 2, 1],
    true
] call CBA_settings_fnc_init;

[
    QGVAR(hudType),
    "LIST",
    [LSTRING(HudType), LSTRING(HudType_Description)],
    LSTRING(DisplayName),
    [[0, 1], [LSTRING(ColoredIcons), LSTRING(DrainingIcons)], 0],
    false
] call CBA_settings_fnc_init;

[
    QGVAR(hudShowLevel),
    "LIST",
    [LSTRING(HudShowLevel), LSTRING(HudShowLevel_Description)],
    LSTRING(DisplayName),
    [[0, 10, 20, 30, 40, 50, 60, 70], [LSTRING(Always), "10%", "20%", "30%", "40%", "50%", "60%", "70%"], 0],
    false
] call CBA_settings_fnc_init;

[
    QGVAR(hudTransparency),
    "LIST",
    [LSTRING(HudTransparency), LSTRING(HudTransparency_Description)],
    LSTRING(DisplayName),
    [[-1, 1, 0.9, 0.8, 0.7, 0.6, 0.5, 0.4, 0.3, 0.2], [LSTRING(Dynamic), "0%", "10%", "20%", "30%", "40%", "50%", "60%", "70%", "80%", 0], 0],
    false
] call CBA_settings_fnc_init;

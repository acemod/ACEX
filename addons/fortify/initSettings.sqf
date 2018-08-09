[
    QGVAR(settingHint),
    "LIST",
    [localize LSTRING(settingHint), localize LSTRING(settingHintDesc)],
    localize LSTRING(settingsCategory),
    [
        [0, 1, 2],
        [localize LSTRING(settingHintNone), localize LSTRING(settingHintHasTool), localize LSTRING(settingHintEveryone)],
        2
    ]
] call CBA_settings_fnc_init;

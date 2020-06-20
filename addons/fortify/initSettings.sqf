[
    QGVAR(settingHint),
    "LIST",
    [LLSTRING(settingHint), LLSTRING(settingHintDesc)],
    LLSTRING(settingsCategory),
    [
        [0, 1, 2],
        [LLSTRING(settingHintNone), LLSTRING(settingHintHasTool), LLSTRING(settingHintEveryone)],
        2
    ]
] call CBA_settings_fnc_init;

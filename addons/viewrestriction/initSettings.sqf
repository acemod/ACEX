[
    QGVAR(preserveView),
    "CHECKBOX",
    [LSTRING(SettingPreserveViewName), LSTRING(SettingPreserveViewDesc)],
    format ["ACEX %1", localize LSTRING(ModuleDisplayName)],
    false,
    false,
    LINKFUNC(switchPreserveView)
] call CBA_settings_fnc_init;

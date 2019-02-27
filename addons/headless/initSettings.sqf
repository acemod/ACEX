[
    QGVAR(transferLoadout),
    "LIST",
    [LSTRING(TransferLoadout), LSTRING(TransferLoadoutDesc)],
    format ["ACEX %1", localize LSTRING(Module)],
    [[0, 1, 2], [ACELSTRING(Common,Disabled), LSTRING(TransferLoadoutCurrent), LSTRING(TransferLoadoutConfig)], 0],
    true,
    {},
    true // needs mission restart
] call CBA_settings_fnc_init;

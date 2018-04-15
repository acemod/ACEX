class ACE_Settings {
    class GVAR(settingHint) {
        category = CSTRING(Fortify);
        value = 2;
        typeName = "SCALAR";
        force = 0;
        isClientSettable = 1;
        displayName = CSTRING(settingHint);
        description = CSTRING(settingHintDesc);
        values[] = {CSTRING(settingHintNone), CSTRING(settingHintHasTool), CSTRING(settingHintEveryone)};
    };
};

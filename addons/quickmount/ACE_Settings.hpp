class ACE_Settings {
    class GVAR(enabled) {
        value = 1;
        typeName = "BOOL";
        category = CSTRING(Category);
        displayName = ACECSTRING(common,Enabled);
        description = CSTRING(KeybindDescription);
        isClientSettable = 0;
        force = 1;
    };
    class GVAR(distance) {
        value = 3;
        typeName = "SCALAR";
        category = CSTRING(Category);
        displayName = ACECSTRING(common,Enabled);
        description = CSTRING(KeybindDescription);
        isClientSettable = 0;
        force = 1;
        values[] = {"0m", "1m", "2m", "3m", "4m", "5m", "6m", "7m", "8m", "9m", "10m"};
    };
};

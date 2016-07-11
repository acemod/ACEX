class ACE_Settings {
    class GVAR(enabled) {
        value = 1;
        typeName = "BOOL";
        category = CSTRING(Category);
        displayName = ACECSTRING(common,Enabled);
        description = CSTRING(KeybindDescription);
        isClientSettable = 0;
        force = 0;
    };
    class GVAR(distance) {
        value = DEFAULT_DISTANCE;
        typeName = "SCALAR";
        category = CSTRING(Category);
        displayName = ACECSTRING(common,Enabled);
        description = CSTRING(KeybindDescription);
        isClientSettable = 0;
        force = 0;
    };
};

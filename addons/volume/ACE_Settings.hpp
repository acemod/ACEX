class ACE_Settings {
    class GVAR(enabled) {
        value = 0;
        typeName = "BOOL";
        category = CSTRING(Name);
        displayName = ACECSTRING(common,Enabled);
        description = CSTRING(KeybindDescription);
        isClientSettable = 1;
        force = 0;
    };
    class GVAR(reduction) {
        value = 5;
        typeName = "SCALAR";
        category = CSTRING(Name);
        displayName = CSTRING(Reduction);
        description = CSTRING(ReductionDescription);
        isClientSettable = 1;
        force = 0;
        values[] = {"0%", "10%", "20%", "30%", "40%", "50%", "60%", "70%", "80%", "90%", "100%"};
    };
};

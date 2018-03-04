class ACE_Settings {
    class GVAR(systemEnabled) {
        value = 0;
        typeName = "BOOL";
    };
    class GVAR(timeWithoutWater) {
        value = 1;
        typeName = "SCALAR";
        displayName = CSTRING(timeWithoutWater_name);
        description = CSTRING(timeWithoutWater_description);
    };
    class GVAR(timeWithoutFood) {
        value = 1;
        typeName = "SCALAR";
        displayName = CSTRING(timeWithoutFood_name);
        description = CSTRING(timeWithoutFood_description);
    };
};

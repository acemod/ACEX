class ACE_Settings {
    class GVAR(enabled) {
        category = CSTRING(Module);
        value = 0;
        typeName = "BOOL";
        displayName = ACECSTRING(common,Enabled);
        description = CSTRING(EnabledDesc);
    };
    class GVAR(delay) {
        category = CSTRING(Module);
        value = DELAY_DEFAULT;
        typeName = "SCALAR";
        displayName = CSTRING(Delay);
        description = CSTRING(DelayDesc);
        sliderSettings[] = {0, 120, DELAY_DEFAULT, 0};
    };
    class GVAR(endMission) {
        category = CSTRING(Module);
        value = 0;
        values[] = {ACECSTRING(Common,Disabled), CSTRING(Instant), CSTRING(Delayed)};
        typeName = "SCALAR";
        displayName = CSTRING(EndMission);
        description = CSTRING(EndMissionDesc);
    };
    class GVAR(log) {
        category = CSTRING(Module);
        value = 0;
        typeName = "BOOL";
        displayName = CSTRING(Log);
        description = CSTRING(LogDesc);
    };
};

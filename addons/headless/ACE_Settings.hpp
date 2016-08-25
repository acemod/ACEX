class ACE_Settings {
    class GVAR(enabled) {
        value = 0;
        typeName = "BOOL";
        displayName = ACECSTRING(common,Enabled);
        description = CSTRING(EnabledDesc);
    };
    class GVAR(delay) {
        value = DELAY_DEFAULT;
        typeName = "SCALAR";
        displayName = CSTRING(Delay);
        description = CSTRING(DelayDesc);
    };
    class GVAR(endMission) {
        value = 0;
        values[] = {ACECSTRING(Common,Disabled), CSTRING(Instant), CSTRING(Delayed)};
        typeName = "SCALAR";
        displayName = CSTRING(EndMission);
        description = CSTRING(EndMissionDesc);
    };
    class GVAR(log) {
        value = 0;
        typeName = "BOOL";
        displayName = CSTRING(Log);
        description = CSTRING(LogDesc);
    };
};

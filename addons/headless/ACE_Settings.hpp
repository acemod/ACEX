class ACE_Settings {
    class GVAR(Enabled) {
        value = 0;
        typeName = "BOOL";
        displayName = ACECSTRING(common,Enabled);
        description = CSTRING(EnabledDesc);
    };
    class GVAR(Delay) {
        value = DELAY_DEFAULT;
        typeName = "SCALAR";
        displayName = CSTRING(Delay);
        description = CSTRING(DelayDesc);
    };
    class GVAR(EndMission) {
        value = 0;
        typeName = "BOOL";
        displayName = CSTRING(EndMission);
        description = CSTRING(EndMissionDesc);
    };
    class GVAR(Log) {
        value = 0;
        typeName = "BOOL";
        displayName = CSTRING(Log);
        description = CSTRING(LogDesc);
    };
};

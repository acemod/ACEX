class CfgVehicles {
    class ACE_Module;
    class GVAR(module): ACE_Module {
        author = ACECSTRING(common,ACETeam);
        category = "ACEX";
        displayName = CSTRING(Module);
        function = QFUNC(moduleInit);
        scope = 2;
        isGlobal = 1; // Global
        isTriggerActivated = 0;
        isDisposable = 0;
        icon = QPATHTOF(UI\Icon_Module_Headless_ca.paa);
        class Arguments {
            class enabled {
                displayName = ACECSTRING(common,Enabled);
                description = CSTRING(EnabledDesc);
                typeName = "BOOL";
                defaultValue = 0;
            };
            class delay {
                displayName = CSTRING(Delay);
                description = CSTRING(DelayDesc);
                typeName = "NUMBER";
                defaultValue = DELAY_DEFAULT;
            };
            class endMission {
                displayName = CSTRING(EndMission);
                description = CSTRING(EndMissionDesc);
                typeName = "NUMBER";
                class values {
                    class disabled {
                        name = ACECSTRING(Common,Disabled);
                        value = 0;
                        default = 1;
                    };
                    class instant {
                        name = CSTRING(Instant);
                        value = 1;
                    };
                    class delayed {
                        name = CSTRING(Delayed);
                        value = 2;
                    };
                };
            };
            class log {
                displayName = CSTRING(Log);
                description = CSTRING(LogDesc);
                typeName = "BOOL";
                defaultValue = 0;
            };
        };
        class ModuleDescription {
            description = CSTRING(ModuleDesc);
        };
    };
};

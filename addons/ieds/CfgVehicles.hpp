class CfgVehicles {
    class ACE_Module;
    class GVAR(createIed): ACE_Module {
        author = "STR_ACE_common_ACETeam";
        category = "ACE_missionModules";
        displayName = CSTRING(Module);
        function = QFUNC(moduleInit);
        scope = 2;
        isGlobal = 1; // Global
        isTriggerActivated = 0;
        isDisposable = 0;
        // icon = ""; // TODO add module icon
        class Arguments    {
            class typeOfIED {
                displayName = "Type";
                description = "The Type of the IED";
                typeName = "NUMBER";
                class values {
                    class land {name="Normal"; value=0; default=1; };
                    class urban {name="Urban"; value=1; };
                };
            };

            class sizeOfIED {
                displayName = "Size";
                description = "The size of the IED";
                typeName = "NUMBER";
                class values {
                    class small {name="Small"; value=1; default=1; };
                    class large {name="Large"; value=0; };
                };
            };

            class heightOfIED {
                displayName = "Height";
                description = "The height that the IED is burried";
                typeName = "NUMBER";
                class values {
                    class Above {name="Above Ground"; value=0; default=1; };
                    class slightly {name="Slightly burried"; value=1; };
                    class medium {name="Medium burried"; value=2; };
                    class almost {name="Almost burried"; value=3; };
                    class fully {name="Fully burried"; value=4; };
                };
            };

            class iedActivationType {
                displayName = "Activation Type";
                description = "How is the IED activated";
                typeName = "NUMBER";
                class values {
                    class None {name="None"; value=-1; };
                    class PressurePlate {name="Pressure Plate"; value=0; default=1;};
                    class Radio {name="Radio"; value=1; };
                };
            };

            class activatedForTargets {
                displayName = "Activated for";
                description = "What types is the IED activated for";
                typeName = "NUMBER";
                class values {
                    class None {name="None"; value=-1; };
                    class All {name="Any type"; value=0; default=1;};
                    class Vehicles {name="Any Vehicle"; value=1; };
                    class Land {name="Ground Vehicles"; value=2; };
                    class Air {name="Airial Vehicles"; value=3; };
                    class Man {name="Man"; value=4; };
                };
            };

            class activatedForSides {
                displayName = "What sides activate this IED";
                description = "What types is the IED activated for";
                typeName = "NUMBER";
                class values {
                    class None {name="None"; value=-1; };
                    class All {name="Any side"; value=0; default=1; };
                    class West {name="BLUFOR"; value=1; };
                    class East {name="OpFOR"; value=2; };
                    class Ind {name="Independant"; value=3; };
                    class Civ {name="Civilian"; value=4; };
                };
            };
        };

        class ModuleDescription {
            description = CSTRING(ModuleDesc);
        };
    };

    class ace_zeus_moduleBase;
    class GVAR(moduleCreateIedZeus): ace_zeus_moduleBase {
        curatorCanAttach = 1;
        displayName = CSTRING(Module);
        function = QFUNC(moduleZeus);
        // icon = ""; // TODO icon
        class ModuleDescription {
            description = "Creates an IED on position";
            sync[] = {};
        };
    };
};

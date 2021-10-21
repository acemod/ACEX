class CfgVehicles {
    class ACE_Module;
    class GVAR(createIed): ACE_Module {
        author = ACECSTRING(common,ACETeam);
        category = "ACE_missionModules";
        displayName = CSTRING(Module);
        function = QFUNC(moduleInit);
        scope = 2;
        isGlobal = 1; // Global
        isTriggerActivated = 0;
        isDisposable = 0;
        // icon = ""; // TODO add module icon
        class Arguments {
            class typeOfIED {
                displayName = CSTRING(Type);
                description = CSTRING(Type_Description);
                typeName = "NUMBER";
                class values {
                    class land {
                        name = CSTRING(Type_Normal);
                        value = 0; default = 1;
                    };
                    class urban {
                        name = CSTRING(Type_Urban);
                        value = 1;
                    };
                };
            };
            class sizeOfIED {
                displayName = CSTRING(Size);
                description = CSTRING(Size_Description);
                typeName = "NUMBER";
                class values {
                    class small {
                        name = CSTRING(Size_Normal);
                        value = 0; default = 1;
                    };
                    class large {
                        name = CSTRING(Size_Urban);
                        value = 1;
                    };
                };
            };

            class heightOfIED {
                displayName = CSTRING(Height);
                description = CSTRING(Height_Description);
                typeName = "NUMBER";
                class values {
                    class Above {
                        name = CSTRING(Height_AboveGround);
                        value = 0;
                        default = 1;
                    };
                    class slightly {
                        name = CSTRING(Height_SlightlyBurried);
                        value = 1;
                    };
                    class medium {
                        name = CSTRING(Height_MediumBurried);
                        value = 2;
                    };
                    class almost {
                        name = CSTRING(Height_AlmostBurried);
                        value = 3;
                    };
                    class fully {
                        name = CSTRING(Height_FullyBurried);
                        value = 4;
                    };
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

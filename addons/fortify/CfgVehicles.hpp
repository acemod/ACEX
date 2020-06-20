class CfgVehicles {
    class Man;
    class CAManBase: Man {
        class ACE_SelfActions {
            class ADDON {
                displayName = CSTRING(Fortify);
                condition = QUOTE([_player] call FUNC(canFortify));
                modifierFunction = QUOTE(call FUNC(modifyAction));
                insertChildren = QUOTE(_this call FUNC(addActions));
                statement = "";
                exceptions[] = {};
                showDisabled = 0;
                priority = 1;
            };
        };
    };

    class ACE_Module;
    class GVAR(setupModule): ACE_Module {
        author = ACECSTRING(common,ACETeam);
        category = "ACEX";
        displayName = CSTRING(Fortify);
        function = QFUNC(setupModule);
        scope = 2;
        isGlobal = 0;
        class Arguments {
            class Side {
                displayName = "$STR_eval_typeside";
                typeName = "NUMBER";
                class values {
                    class West {
                        name = "$STR_WEST";
                        value = 1;
                        default = 1;
                    };
                    class East {
                        name = "$STR_east";
                        value = 2;
                    };
                    class Indp {
                        name = "$STR_guerrila";
                        value = 3;
                    };
                    class Civ {
                        name = "$STR_civilian";
                        value = 4;
                    };
                };
            };
            class Preset {
                displayName = "$STR_controls_presets";
                typeName = "NUMBER";
                class values {
                    class small {
                        name = "$STR_small";
                        value = 1;
                        default = 1;
                    };
                    class medium {
                        name = "$STR_controller_sensitivity_medium";
                        value = 2;
                    };
                    class big {
                        name = "$STR_large";
                        value = 3;
                    };
                    class smallGreen {
                        name = CSTRING(SmallGreen);
                        value = 4;
                    };
                    class mediumGreen {
                        name = CSTRING(MediumGreen);
                        value = 5;
                    };
                    class bigGreen {
                        name = CSTRING(LargeGreen);
                        value = 6;
                    };
                };
            };
            class Budget {
                displayName = CSTRING(budget);
                typeName = "NUMBER";
                defaultValue = -1;
            };
            class AddToolItem {
                displayName = CSTRING(addToolItem);
                typeName = "BOOL";
                defaultValue = 0;
            };
        };
    };

    class GVAR(buildLocationModule): ACE_Module {
        author = ACECSTRING(common,ACETeam);
        category = "ACEX";
        displayName = CSTRING(buildLocationModule);
        scope = 2;
        isGlobal = 1;
        canSetArea = 1;
        function = QFUNC(buildLocationModule);
        class AttributeValues {
            size3[] = {300, 300, -1};
            IsRectangle = 1;
        };
    };

};

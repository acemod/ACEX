
class CBA_Extended_EventHandlers;

class CfgVehicles {
    class ACE_Module;
    class ACEX_ModuleSitting: ACE_Module {
        author = "$STR_ACE_common_ACETeam";
        category = "ACEX";
        displayName = CSTRING(ModuleDisplayName);
        function = QFUNC(moduleInit);
        scope = 2;
        isGlobal = 1;
        isSingular = 1;
        icon = QUOTE(PATHTOF(UI\Icon_Module_Sitting_ca.paa));
        class Arguments {
            class enable {
                displayName = CSTRING(Enable);
                description = CSTRING(Enable);
                typeName = "BOOL";
                defaultValue = 1;
            };
        };
        class ModuleDescription {
            description = CSTRING(ModuleDescription);
        };
    };
    class ACE_ModuleSitting: ACEX_ModuleSitting {
        scope = 1; // hiden, backwards compatability
    };

    class Man;
    class CAManBase: Man {
        class ACE_SelfActions {
            class GVAR(Stand) {
                displayName = CSTRING(Stand);
                condition = QUOTE(_player call FUNC(canStand));
                exceptions[] = {"isNotSitting"};
                statement = QUOTE(_player call FUNC(stand));
                priority = 0;
                icon = QUOTE(PATHTOF(UI\stand_ca.paa));
            };
        };
    };

    // Folding Chair
    class ThingX;
    class Land_CampingChair_V1_F: ThingX {
        class EventHandlers {
            class CBA_Extended_EventHandlers: CBA_Extended_EventHandlers {};
        };

        GVAR(canSit) = 1;
        GVAR(sitDirection) = 180;
        GVAR(sitPosition)[] = {0, -0.1, -0.45};
        ACEGVAR(dragging,canCarry) = 1;
        ACEGVAR(dragging,carryPosition)[] = {0, 0.75, 0.5};
        ACEGVAR(dragging,carryDirection) = 180;
    };
    // Camping Chair
    class Land_CampingChair_V2_F: ThingX {
        class EventHandlers {
            class CBA_Extended_EventHandlers: CBA_Extended_EventHandlers {};
        };

        GVAR(canSit) = 1;
        GVAR(sitDirection) = 180;
        GVAR(sitPosition)[] = {0, -0.1, -0.45};
        ACEGVAR(dragging,canCarry) = 1;
        ACEGVAR(dragging,carryPosition)[] = {0, 0.75, 0.5};
        ACEGVAR(dragging,carryDirection) = 180;
    };

    // Chair (Plastic)
    class Furniture_base_F: ThingX {};
    class Land_ChairPlastic_F: Furniture_base_F {
        class EventHandlers {
            class CBA_Extended_EventHandlers: CBA_Extended_EventHandlers {};
        };

        GVAR(canSit) = 1;
        GVAR(sitDirection) = 90;
        GVAR(sitPosition)[] = {0, 0, -0.5};
        ACEGVAR(dragging,canCarry) = 1;
        ACEGVAR(dragging,carryPosition)[] = {0, 0.75, 0.5};
        ACEGVAR(dragging,carryDirection) = 270;
    };
    // Chair (Wooden)
    class Land_ChairWood_F: Furniture_base_F {
        class EventHandlers {
            class CBA_Extended_EventHandlers: CBA_Extended_EventHandlers {};
        };

        GVAR(canSit) = 1;
        GVAR(sitDirection) = 180;
        GVAR(sitPosition)[] = {0, -0.05, 0};
        ACEGVAR(dragging,canCarry) = 1;
        ACEGVAR(dragging,carryPosition)[] = {0, 0.75, 0.5};
        ACEGVAR(dragging,carryDirection) = 180;
    };
    // Office Chair
    class Land_OfficeChair_01_F: Furniture_base_F {
        class EventHandlers {
            class CBA_Extended_EventHandlers: CBA_Extended_EventHandlers {};
        };

        GVAR(canSit) = 1;
        GVAR(sitDirection) = 180;
        GVAR(sitPosition)[] = {0, 0, -0.6};
        ACEGVAR(dragging,canCarry) = 1;
        ACEGVAR(dragging,carryPosition)[] = {0, 0.75, 0.5};
        ACEGVAR(dragging,carryDirection) = 180;
    };
    // Rattan Chair
    class Land_RattanChair_01_F: Furniture_base_F {
        class EventHandlers {
            class CBA_Extended_EventHandlers: CBA_Extended_EventHandlers {};
        };

        GVAR(canSit) = 1;
        GVAR(sitDirection) = 180;
        GVAR(sitPosition)[] = {0, -0.1, -1}; // Z must be -1 due to chair's geometry (magic floating seat point)
        ACEGVAR(dragging,canCarry) = 1;
        ACEGVAR(dragging,carryPosition)[] = {0, 0.75, 0.5};
        ACEGVAR(dragging,carryDirection) = 180;

        class ACE_Actions {
            class ACEX_Sitting_Position_1
            {
                displayName = CSTRING(Sit);
                position = "[0.5,0,0]";
                distance = 2;
                statement = QUOTE([_target,_player,1] call FUNC(sitMultiPos));
                condition = "true"; //TODO proper condition
                icon = QUOTE(PATHTOF(UI\sit_ca.paa));
            };
            class ACEX_Sitting_Position_2
            {
                displayName = CSTRING(Sit);
                position = "[-0.5, 0, 0]";
                distance = 2;
                statement = QUOTE([_target,_player,2] call FUNC(sitMultiPos));
                condition = "true"; //TODO proper condition
                icon = QUOTE(PATHTOF(UI\sit_ca.paa));
            };
        };
    };
    
    class House_Small_F;
    class Land_Bench_01_F : House_Small_F {
        class EventHandlers {
            class CBA_Extended_EventHandlers: CBA_Extended_EventHandlers {};
        };

        GVAR(canSit) = 1;
        GVAR(sitDirection) = 180;
        GVAR(sitPosition)[] = {0, -0.1, -1}; // Z must be -1 due to chair's geometry (magic floating seat point)
        ACEGVAR(dragging,canCarry) = 1;
        ACEGVAR(dragging,carryPosition)[] = {0, 0.75, 0.5};
        ACEGVAR(dragging,carryDirection) = 180;

        class ACE_Actions {
            class ACEX_Sitting_Position_1
            {
                displayName = CSTRING(Sit);
                position = "[0.5,0,0]";
                distance = 2;
                statement = QUOTE([_target,_player,1] call FUNC(sitMultiPos));
                condition = "true"; //TODO proper condition
                icon = QUOTE(PATHTOF(UI\sit_ca.paa));
            };
            class ACEX_Sitting_Position_2
            {
                displayName = CSTRING(Sit);
                position = "[-0.5, 0, 0]";
                distance = 2;
                statement = QUOTE([_target,_player,2] call FUNC(sitMultiPos));
                condition = "true"; //TODO proper condition
                icon = QUOTE(PATHTOF(UI\sit_ca.paa));
            };
        };
    };

    class Land_Bench_02_F : Land_Bench_01_F {};
    class Land_Bench_03_F : Land_Bench_01_F {};
    class Land_Bench_04_F : Land_Bench_01_F {};
    class Land_Bench_05_F : Land_Bench_01_F {};
    
};

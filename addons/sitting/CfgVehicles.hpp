
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
    };

    // Wooden Log
    class Land_WoodenLog_F: ThingX {
        class EventHandlers {
            class CBA_Extended_EventHandlers: CBA_Extended_EventHandlers {};
        };

        GVAR(canSit) = 1;
        GVAR(sitDirection) = 0;
        GVAR(sitPosition)[] = {0, -0.1, -1};
        ACEGVAR(dragging,canCarry) = 1;
        ACEGVAR(dragging,carryPosition)[] = {0, 0.75, 0.5};
        ACEGVAR(dragging,carryDirection) = 180;
    };

    // usage in class ACE_Actions SEAT_ACTION(seat name, interact point position/mem point, sitting position)
    // copy this macro to your custom config to create custom objects with multi sitting
    // if not already present include #include "\z\ace\addons\main\script_macros.hpp" or replace macros appropriately
    #define SEAT_ACTION(var1,var2,var3) class var1 \
            {\
                displayName = CSTRING(Sit); \
                distance = 2; \
                icon = QUOTE(PATHTOF(UI\sit_ca.paa)); \
                statement = QUOTE([_target,_player,QUOTE(QUOTE(var1))] call FUNC(sitMultiPos)); \
                condition = QUOTE([_target,_player,QUOTE(QUOTE(var1))] call FUNC(canSitMultiPos)); \
                position = var2; \
                GVAR(sitPosition)[] = var3; \
            }
    
    class House_Small_F;
    class Land_Bench_01_F : House_Small_F {
        class EventHandlers {
            class CBA_Extended_EventHandlers: CBA_Extended_EventHandlers {};
        };

        GVAR(canSit) = 1;
        GVAR(sitDirection) = 180;

        class ACE_Actions {
            SEAT_ACTION(GVAR(pos_1),"[0.5,0,0]", {0.5, -0.04, -0.90});
            SEAT_ACTION(GVAR(pos_2),"[-0.5,0,0]", {-0.5, -0.04, -0.90});
        };
    };

    class Land_Bench_02_F : Land_Bench_01_F {};

    class Land_Bench_03_F : Land_Bench_01_F {};

    class Land_Bench_05_F : Land_Bench_01_F {
        GVAR(sitDirection) = 0;
        class ACE_Actions {
            SEAT_ACTION(GVAR(pos_1),"[0.5,0,0.3]", {0.5, -0.04, -0.90});
            SEAT_ACTION(GVAR(pos_2),"[-0.5,0,0.3]", {-0.5, -0.04, -0.90});
        };
    };
    
};

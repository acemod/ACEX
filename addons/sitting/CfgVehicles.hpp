class CfgVehicles {
    class ACE_Module;
    class ACEX_ModuleSitting: ACE_Module {
        author = "$STR_ACE_common_ACETeam";
        category = "ACEX";
        displayName = CSTRING(ModuleDisplayName);
        function = QFUNC(moduleInit);
        scope = 1;
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
        GVAR(canSit) = 1;
        GVAR(sitDirection) = 180;
        GVAR(sitPosition)[] = {0, -0.1, -0.45};
        GVAR(interactPosition)[] = {0, 0, 0.3};

        ACEGVAR(interaction,replaceTerrainObject) = 1;
        ACEGVAR(dragging,canCarry) = 1;
        ACEGVAR(dragging,carryPosition)[] = {0, 0.75, 0.5};
        ACEGVAR(dragging,carryDirection) = 180;
    };

    // Camping Chair
    class Land_CampingChair_V2_F: ThingX {
        GVAR(canSit) = 1;
        GVAR(sitDirection) = 180;
        GVAR(sitPosition)[] = {0, -0.1, -0.45};
        GVAR(interactPosition)[] = {0, 0, 0.3};

        ACEGVAR(interaction,replaceTerrainObject) = 1;
        ACEGVAR(dragging,canCarry) = 1;
        ACEGVAR(dragging,carryPosition)[] = {0, 0.75, 0.5};
        ACEGVAR(dragging,carryDirection) = 180;
    };

    // Chair (Plastic)
    class Furniture_base_F: ThingX {};
    class Land_ChairPlastic_F: Furniture_base_F {
        GVAR(canSit) = 1;
        GVAR(sitDirection) = 90;
        GVAR(sitPosition)[] = {0, 0, -0.5};
        GVAR(interactPosition)[] = {0, 0, 0.3};

        ACEGVAR(interaction,replaceTerrainObject) = 1;
        ACEGVAR(dragging,canCarry) = 1;
        ACEGVAR(dragging,carryPosition)[] = {0, 0.75, 0.5};
        ACEGVAR(dragging,carryDirection) = 270;
    };

    // Chair (Wooden)
    class Land_ChairWood_F: Furniture_base_F {
        GVAR(canSit) = 1;
        GVAR(sitDirection) = 180;
        GVAR(sitPosition)[] = {0, -0.05, 0};
        GVAR(interactPosition)[] = {0, 0, 0.8};

        ACEGVAR(dragging,canCarry) = 1;
        ACEGVAR(dragging,carryPosition)[] = {0, 0.75, 0.5};
        ACEGVAR(dragging,carryDirection) = 180;
    };

    // Office Chair
    class Land_OfficeChair_01_F: Furniture_base_F {
        GVAR(canSit) = 1;
        GVAR(sitDirection) = 180;
        GVAR(sitPosition)[] = {0, 0, -0.6};
        GVAR(interactPosition)[] = {0, 0, 0.3};

        ACEGVAR(dragging,canCarry) = 1;
        ACEGVAR(dragging,carryPosition)[] = {0, 0.75, 0.5};
        ACEGVAR(dragging,carryDirection) = 180;
    };

    // Wooden Log
    class Land_WoodenLog_F: ThingX {
        GVAR(canSit) = 1;
        GVAR(sitDirection) = 0;
        GVAR(sitPosition)[] = {0, 0, -1};
        GVAR(interactPosition)[] = {0, 0, 0.5};

        ACEGVAR(dragging,canCarry) = 1;
        ACEGVAR(dragging,carryPosition)[] = {0, 0.75, 0.5};
        ACEGVAR(dragging,carryDirection) = 180;
    };

    // Rattan Chair
    class Land_RattanChair_01_F: Furniture_base_F {
        GVAR(canSit) = 1;
        GVAR(sitDirection) = 180;
        GVAR(sitPosition)[] = {0, 0, -1}; // Z must be -1 due to chair's geometry (magic floating seat point)
        GVAR(interactPosition)[] = {0, 0, 0.3};

        ACEGVAR(dragging,canCarry) = 1;
        ACEGVAR(dragging,carryPosition)[] = {0, 0.75, 0.5};
        ACEGVAR(dragging,carryDirection) = 180;
    };

    // Arm Chair
    class Furniture_Residental_base_F;
    class Land_ArmChair_01_F: Furniture_Residental_base_F {
        GVAR(canSit) = 1;
        GVAR(sitDirection) = 0;
        GVAR(sitPosition)[] = {0, 0, -1};
        GVAR(interactPosition)[] = {0, 0, 0.3};

        ACEGVAR(dragging,canCarry) = 1;
        ACEGVAR(dragging,carryPosition)[] = {0, 0.75, 0.5};
        ACEGVAR(dragging,carryDirection) = 180;

    };

    class House_F;
    class Land_BusStop_02_shelter_F: House_F {
        GVAR(canSit) = 1;
        GVAR(sitDirection) = 180;
        GVAR(sitPosition)[] = { {-0.5, 0.9, -1.3}, {0.5, 0.9, -1.3} };
        GVAR(interactPosition)[] = { {-0.5, 0.9, -0.3}, {0.5, 0.9, -0.3} };

        ACEGVAR(interaction,replaceTerrainObject) = 1;
    };

    // Benches
    class Land_Bench_F: Furniture_base_F {
        GVAR(canSit) = 1;
        GVAR(sitDirection) = 90;
        GVAR(sitPosition)[] = { {0.1, -0.5, -0.9}, {0.1, 0.5, -0.9} };
        GVAR(interactPosition)[] = { {0, -0.5, 0.3}, {0, 0.5, 0.3} };

        ACEGVAR(interaction,replaceTerrainObject) = 1;
        ACEGVAR(dragging,canCarry) = 1;
        ACEGVAR(dragging,carryDirection) = 90;
        ACEGVAR(dragging,canDrag) = 1;
        ACEGVAR(dragging,dragPosition)[] = {0, 1, 0};
        ACEGVAR(dragging,dragDirection) = 90;
    };

    class House_Small_F;
    class Land_Bench_01_F: House_Small_F {
        GVAR(canSit) = 1;
        GVAR(sitDirection) = 180;
        GVAR(sitPosition)[] = { {0.5, -0.04, -0.90}, {-0.5, -0.04, -0.90} };
        GVAR(interactPosition)[] = { {0.5, 0, 0.3}, {-0.5, 0, 0.3} };

        ACEGVAR(interaction,replaceTerrainObject) = 1;
    };

    class Land_Bench_02_F: House_Small_F {
        GVAR(canSit) = 1;
        GVAR(sitDirection) = 180;
        GVAR(sitPosition)[] = { {0.5, -0.04, -0.90}, {-0.5, -0.04, -0.90} };
        GVAR(interactPosition)[] = { {0.5, 0, 0.3}, {-0.5, 0, 0.3} };

        ACEGVAR(interaction,replaceTerrainObject) = 1;
    };

    class Land_Bench_03_F: House_Small_F {
        GVAR(canSit) = 1;
        GVAR(sitDirection) = 180;
        GVAR(sitPosition)[] = { {0.5, -0.15, -0.90}, {-0.5, -0.15, -0.90} };
        GVAR(interactPosition)[] = { {0.5, 0, 0.3}, {-0.5, 0, 0.3} };

        ACEGVAR(interaction,replaceTerrainObject) = 1;
    };

    /* Disabled due to a geometry issue with height
    class Land_Bench_04_F: House_Small_F {
        GVAR(canSit) = 1;
        GVAR(sitDirection) = 180;
        GVAR(sitPosition)[] = { {0.5, -0.04, -2.00}, {-0.5, -0.04, -2.00} };
        GVAR(interactPosition)[] = { {0.5, 0, 0.3}, {-0.5, 0, 0.3} };
    };*/

    class Land_Bench_05_F: House_Small_F {
        GVAR(canSit) = 1;
        GVAR(sitDirection) = 0;
        GVAR(sitPosition)[] = { {0.5, -0.04, -0.90}, {-0.5, -0.04, -0.90} };
        GVAR(interactPosition)[] = { {0.5, 0, 0.3}, {-0.5, 0, 0.3} };

        ACEGVAR(interaction,replaceTerrainObject) = 1;
    };

    class Stall_base_F;
    class Land_StallWater_F: Stall_base_F {
        GVAR(canSit) = 1;
        GVAR(sitDirection) = 180;
        GVAR(sitPosition)[] = { {-0.4, -0.8, -0.9}, {0.4, -0.8, -0.9} };
        GVAR(interactPosition)[] = { {-0.4, -0.75, 0.3}, {0.4, -0.75, 0.3} };

        ACEGVAR(interaction,replaceTerrainObject) = 1;
    };
};

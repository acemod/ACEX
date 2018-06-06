class CfgVehicles {
    class Man;
    class CAManBase: Man {
        class ACE_SelfActions {
            class ACEX_FieldRations {
                displayName = CSTRING(MainInteractionText);
                condition = QUOTE(GVAR(enabled));
                exceptions[] = {"isNotInside"};
                statement = QUOTE(GVAR(hudInteractionHover) = true; [0.5] call FUNC(showHud));
                runOnHover = 1;
                insertChildren = QUOTE((_this select 1) call FUNC(getConsumableChildren));
                icon = QPATHTOF(ui\icon_survival.paa);
            };
        };
    };

    class Items_base_F;
    class Land_WaterBarrel_F: Items_base_F {
        GVAR(waterSupply) = 200;
    };
    class Land_BarrelWater_F: Items_base_F {
        GVAR(waterSupply) = 160;
    };
    class Land_BarrelWater_grey_F: Items_base_F {
        GVAR(waterSupply) = 160;
    };
    class Land_WaterTank_F: Items_base_F {
        GVAR(waterSupply) = 600;
    };
    class Land_WaterCooler_01_new_F: Items_base_F {
        GVAR(waterSupply) = 20;
    };
    class Land_WaterCooler_01_old_F: Land_WaterCooler_01_new_F {
        GVAR(waterSupply) = 20;
    };

    class Infrastructure_base_F;
    class Land_WaterTank_01_F: Infrastructure_base_F {
        class ACE_Actions {
            class ACE_MainActions {
                displayName = ACECSTRING(interaction,MainAction);
                condition = "true";
                position = "[0, -1.42, -0.78]";
                distance = 2;
            };
        };
        GVAR(waterSupply) = 2400;
    };
    class Land_WaterTank_02_F: Infrastructure_base_F {
        class ACE_Actions {
            class ACE_MainActions {
                displayName = ACECSTRING(interaction,MainAction);
                condition = "true";
                position = "[-0.09, -1.45, 0.53]";
                distance = 2;
            };
        };
        GVAR(waterSupply) = 2400;
    };
    class Land_WaterTank_03_F: Infrastructure_base_F {
        GVAR(waterSupply) = 200;
    };
    class Land_WaterTank_04_F: Infrastructure_base_F {
        class ACE_Actions {
            class ACE_MainActions {
                displayName = ACECSTRING(interaction,MainAction);
                condition = "true";
                position = "[-0.155, -0.72, 0.37]";
                distance = 2;
            };
        };
        GVAR(waterSupply) = 200;
    };

    class Stall_base_F;
    class Land_StallWater_F: Stall_base_F {
        GVAR(waterSupply) = 250;
    };

    class StorageBladder_base_F;
    class Land_StorageBladder_02_F: StorageBladder_base_F {
        class ACE_Actions {
            class ACE_MainActions {
                displayName = ACECSTRING(interaction,MainAction);
                condition = "true";
                position = "[-2.02, 1.47, -0.02]";
                distance = 2;
            };
        };
    };
    class StorageBladder_02_water_forest_F: Land_StorageBladder_02_F {
        GVAR(waterSupply) = 10000;
    };
    class StorageBladder_02_water_sand_F: Land_StorageBladder_02_F {
        GVAR(waterSupply) = 10000;
    };

    class NonStrategic;
    class Land_Water_source_F: NonStrategic {
        GVAR(waterSupply) = REFILL_WATER_INFINITE;
    };

    class Machine_base_F;
    class WaterPump_01_forest_F: Machine_base_F {
        GVAR(waterSupply) = REFILL_WATER_INFINITE;
    };
    class WaterPump_01_sand_F: Machine_base_F {
        GVAR(waterSupply) = REFILL_WATER_INFINITE;
    };

    class Truck_02_water_base_F;
    class C_IDAP_Truck_02_water_F: Truck_02_water_base_F {
        GVAR(waterSupply) = 10000;
    };
};

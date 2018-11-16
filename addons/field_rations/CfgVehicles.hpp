class CfgVehicles {
    class Man;
    class CAManBase: Man {
        class ACE_SelfActions {
            class ADDON {
                displayName = CSTRING(MainInteractionText);
                condition = QUOTE(GVAR(enabled));
                exceptions[] = {"isNotInside"};
                statement = QUOTE(GVAR(hudInteractionHover) = true; [] call FUNC(handleHUD));
                runOnHover = 1;
                insertChildren = QUOTE(_player call FUNC(getConsumableChildren));
                icon = QPATHTOF(ui\icon_survival.paa);
            };
        };
    };

    class ACE_LogicDummy;
    class GVAR(helper): ACE_LogicDummy {};

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
        GVAR(waterSupply) = 2400;
        GVAR(offset)[] = {0, -1.42, -0.78};
    };
    class Land_WaterTank_02_F: Infrastructure_base_F {
        GVAR(waterSupply) = 2400;
        GVAR(offset)[] = {-0.09, -1.45, 0.53};
    };
    class Land_WaterTank_03_F: Infrastructure_base_F {
        GVAR(waterSupply) = 200;
    };
    class Land_WaterTank_04_F: Infrastructure_base_F {
        GVAR(waterSupply) = 200;
        GVAR(offset)[] = {-0.155, -0.72, 0.37};
    };

    class Stall_base_F;
    class Land_StallWater_F: Stall_base_F {
        GVAR(waterSupply) = 250;
    };

    class StorageBladder_base_F;
    class Land_StorageBladder_02_F: StorageBladder_base_F {
        GVAR(offset)[] = {-2.02, 1.47, -0.02};
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

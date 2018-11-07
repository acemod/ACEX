class CfgWeapons {
    /*
     * Consumable Items Config Entries:
     * --------------------------------
     * GVAR(consumeText)         - Text displayed for consumption progress bar
     * GVAR(consumeTime)         - Time in seconds to consume item
     * GVAR(consumeAnims)        - Array of animations [stand, crouch, prone]
     * GVAR(consumeSounds)       - Array of sounds [stand, crouch, prone]
     * GVAR(thirstRestored)      - Thirst restored on consumption
     * GVAR(hungerRestored)      - Hunger restored on consumption
     * GVAR(replacementItem)     - Replacement item on consumption (if any)
     * GVAR(refillItem)          - Item added when refilled (makes item refillable)
     * GVAR(refillAmount)        - Amount of water required to refill item
     */

    class ACE_ItemCore;
    class CBA_MiscItem_ItemInfo;

    class ACE_Banana: ACE_ItemCore {
        GVAR(consumeTime) = 10;
        GVAR(hungerRestored) = 3;
    };

    // - Water Bottles --------------------------------------------------------
    class ACE_WaterBottle: ACE_ItemCore {
        author = ACECSTRING(common,ACETeam);
        scope = 2;
        displayName = CSTRING(WaterBottle_DisplayName);
        descriptionShort = CSTRING(WaterBottle_Description);
        model = "\a3\structures_f_epa\items\food\bottleplastic_v2_f.p3d";
        picture = QPATHTOF(ui\item_waterbottle_full_co.paa);
        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 5;
        };
        GVAR(consumeTime) = 10;
        GVAR(thirstRestored) = 10;
        GVAR(consumeText) = CSTRING(DrinkingX);
        GVAR(replacementItem) = "ACE_WaterBottle_Half";
        GVAR(consumeAnims)[] = {QGVAR(drinkStand), QGVAR(drinkCrouch), QGVAR(drinkProne)};
        GVAR(consumeSounds)[] = {QGVAR(drink1), QGVAR(drink1), QGVAR(drink2)};
    };

    class ACE_WaterBottle_Half: ACE_WaterBottle {
        author = ACECSTRING(common,ACETeam);
        displayName = CSTRING(WaterBottleHalf_DisplayName);
        descriptionShort = CSTRING(WaterBottleHalf_Description);
        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 3;
        };
        GVAR(replacementItem) = "ACE_WaterBottle_Empty";
        GVAR(refillItem) = "ACE_WaterBottle";
        GVAR(refillAmount) = 0.5;
    };

    class ACE_WaterBottle_Empty: ACE_WaterBottle {
        author = ACECSTRING(common,ACETeam);
        displayName = CSTRING(WaterBottleEmpty_DisplayName);
        descriptionShort = CSTRING(WaterBottleEmpty_Description);
        picture = QPATHTOF(ui\item_waterbottle_empty_co.paa);
        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 1;
        };
        GVAR(thirstRestored) = 0;
        GVAR(replacementItem) = "";
        GVAR(refillItem) = "ACE_WaterBottle";
        GVAR(refillAmount) = 1;
    };

    // - Canteens -------------------------------------------------------------
    class ACE_Canteen: ACE_ItemCore {
        author = ACECSTRING(common,ACETeam);
        scope = 2;
        displayName = CSTRING(Canteen_DisplayName);
        descriptionShort = CSTRING(Canteen_Description);
        model = "\a3\structures_f_epa\items\food\canteen_f.p3d";
        picture = QPATHTOF(ui\item_canteen_co.paa);
        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 5;
        };
        GVAR(consumeTime) = 10;
        GVAR(thirstRestored) = 10;
        GVAR(consumeText) = CSTRING(DrinkingX);
        GVAR(replacementItem) = "ACE_Canteen_Half";
        GVAR(consumeAnims)[] = {QGVAR(drinkStand), QGVAR(drinkCrouch), QGVAR(drinkProne)};
        GVAR(consumeSounds)[] = {QGVAR(drink1), QGVAR(drink1), QGVAR(drink2)};
    };

    class ACE_Canteen_Half: ACE_Canteen {
        author = ACECSTRING(common,ACETeam);
        displayName = CSTRING(CanteenHalf_DisplayName);
        descriptionShort = CSTRING(CanteenHalf_Description);
        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 3;
        };
        GVAR(replacementItem) = "ACE_Canteen_Empty";
        GVAR(refillItem) = "ACE_Canteen";
        GVAR(refillAmount) = 0.5;
    };

    class ACE_Canteen_Empty: ACE_Canteen {
        author = ACECSTRING(common,ACETeam);
        displayName = CSTRING(CanteenEmpty_DisplayName);
        descriptionShort = CSTRING(CanteenEmpty_Description);
        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 1;
        };
        GVAR(thirstRestored) = 0;
        GVAR(replacementItem) = "";
        GVAR(refillItem) = "ACE_Canteen";
        GVAR(refillAmount) = 1;
    };

    // - Soda Cans ------------------------------------------------------------
    class ACE_Can_Spirit: ACE_ItemCore {
        author = ACECSTRING(common,ACETeam);
        scope = 2;
        displayName = "$STR_a3_cfgvehicles_land_can_v1_f0";
        descriptionShort = CSTRING(Can_Spirit_Description);
        model = "\a3\structures_f\items\food\can_v1_f.p3d";
        picture = QPATHTOF(ui\icon_can_spirit_ca.paa);
        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 3;
        };
        GVAR(consumeTime) = 10;
        GVAR(thirstRestored) = 5;
    };

    class ACE_Can_Franta: ACE_Can_Spirit {
        author = ACECSTRING(common,ACETeam);
        displayName = "$STR_a3_cfgvehicles_land_can_v2_f0";
        descriptionShort = CSTRING(Can_Franta_Description);
        model = "\a3\structures_f\items\food\can_v2_f.p3d";
        picture = QPATHTOF(ui\icon_can_franta_ca.paa);
    };

    class ACE_Can_RedGull: ACE_Can_Spirit {
        author = ACECSTRING(common,ACETeam);
        displayName = "$STR_a3_cfgvehicles_land_can_v3_f0";
        descriptionShort = CSTRING(Can_RedGull_Description);
        model = "\a3\structures_f\items\food\can_v3_f.p3d";
        picture = QPATHTOF(ui\icon_can_redgull_ca.paa);
    };

    // - MREs -----------------------------------------------------------------
    class ACE_MRE_LambCurry: ACE_ItemCore {
        author = ACECSTRING(common,ACETeam);
        scope = 2;
        displayName = CSTRING(MRE_LambCurry_DisplayName);
        descriptionShort = CSTRING(MRE_LambCurry_Description);
        model = QPATHTOF(data\mre_type1.p3d);
        picture = QPATHTOF(ui\item_mre_type1_co.paa);
        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 5;
        };
        GVAR(consumeTime) = 10;
        GVAR(hungerRestored) = 20;
    };

    class ACE_MRE_Rice: ACE_MRE_LambCurry {
        author = ACECSTRING(common,ACETeam);
        displayName = CSTRING(MRE_Rice_DisplayName);
        descriptionShort = CSTRING(MRE_Rice_Description);
        model = QPATHTOF(data\mre_type2.p3d);
        picture = QPATHTOF(ui\item_mre_type2_co.paa);
    };

    class ACE_MRE_CreamTomatoSoup: ACE_MRE_LambCurry {
        author = ACECSTRING(common,ACETeam);
        displayName = CSTRING(MRE_CreamTomatoSoup_DisplayName);
        descriptionShort = CSTRING(MRE_CreamTomatoSoup_Description);
        model = QPATHTOF(data\mre_type3.p3d);
        picture = QPATHTOF(ui\item_mre_type3_co.paa);
    };

    class ACE_MRE_CreamChickenSoup: ACE_MRE_CreamTomatoSoup {
        author = ACECSTRING(common,ACETeam);
        displayName = CSTRING(MRE_CreamChickenSoup_DisplayName);
        descriptionShort = CSTRING(MRE_CreamChickenSoup_Description);
    };

    class ACE_MRE_ChickenTikkaMasala: ACE_MRE_LambCurry {
        author = ACECSTRING(common,ACETeam);
        displayName = CSTRING(MRE_ChickenTikkaMasala_DisplayName);
        descriptionShort = CSTRING(MRE_ChickenTikkaMasala_Description);
        model = QPATHTOF(data\mre_type4.p3d);
        picture = QPATHTOF(ui\item_mre_type4_co.paa);
    };

    class ACE_MRE_SteakVegetables: ACE_MRE_LambCurry {
        author = ACECSTRING(common,ACETeam);
        displayName = CSTRING(MRE_SteakVegetables_DisplayName);
        descriptionShort = CSTRING(MRE_SteakVegetables_Description);
        model = QPATHTOF(data\mre_type5.p3d);
        picture = QPATHTOF(ui\item_mre_type5_co.paa);
    };

    class ACE_MRE_MeatballsPasta: ACE_MRE_LambCurry {
        author = ACECSTRING(common,ACETeam);
        displayName = CSTRING(MRE_MeatballsPasta_DisplayName);
        descriptionShort = CSTRING(MRE_MeatballsPasta_Description);
        model = QPATHTOF(data\mre_type6.p3d);
        picture = QPATHTOF(ui\item_mre_type6_co.paa);
    };

    class ACE_MRE_ChickenHerbDumplings: ACE_MRE_MeatballsPasta {
        author = ACECSTRING(common,ACETeam);
        displayName = CSTRING(MRE_ChickenHerbDumplings_DisplayName);
        descriptionShort = CSTRING(MRE_ChickenHerbDumplings_Description);
    };

    class ACE_Humanitarian_Ration: ACE_MRE_LambCurry {
        author = ACECSTRING(common,ACETeam);
        displayName = CSTRING(Humanitarian_Ration_DisplayName);
        descriptionShort = CSTRING(Humanitarian_Ration_Description);
        model = QPATHTOF(data\mre_human.p3d);
        picture = QPATHTOF(ui\item_mre_human_co.paa);
    };
};

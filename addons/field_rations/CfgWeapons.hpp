class CfgWeapons {
    class ACE_ItemCore;
    class CBA_MiscItem_ItemInfo;

    // Water Bottles
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
        GVAR(consumeTime) = 5;
        GVAR(consumeEffect) = QGVAR(drinking);
        GVAR(isDrinkable) = 7.5;
        GVAR(replacementItem) = "ACE_WaterBottle_half";
    };

    class ACE_WaterBottle_half: ACE_WaterBottle {
        author = ACECSTRING(common,ACETeam);
        displayName = CSTRING(WaterBottleHalf_DisplayName);
        descriptionShort = CSTRING(WaterBottleHalf_Description);
        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 3;
        };
        GVAR(replacementItem) = "ACE_WaterBottle_empty";
        GVAR(onRefill) = "ACE_WaterBottle";
    };

    class ACE_WaterBottle_empty: ACE_WaterBottle {
        author = ACECSTRING(common,ACETeam);
        displayName = CSTRING(WaterBottleEmpty_DisplayName);
        descriptionShort = CSTRING(WaterBottleEmpty_Description);
        picture = QPATHTOF(ui\item_waterbottle_empty_co.paa);
        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 1;
        };
        GVAR(isDrinkable) = 0;
        GVAR(replacementItem) = "";
        GVAR(onRefill) = "ACE_WaterBottle";
    };

    // Canteens
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
        GVAR(consumeTime) = 5;
        GVAR(consumeEffect) = QGVAR(drinking);
        GVAR(consumeActionText) = CSTRING(DrinkFromCanteen);
        GVAR(isDrinkable) = 10;
        GVAR(replacementItem) = "ACE_Canteen_half";
    };

    class ACE_Canteen_half: ACE_Canteen {
        author = ACECSTRING(common,ACETeam);
        displayName = CSTRING(CanteenHalf_DisplayName);
        descriptionShort = CSTRING(CanteenHalf_Description);
        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 3;
        };
        GVAR(consumeActionText) = CSTRING(DrinkFromCanteenHalf);
        GVAR(replacementItem) = "ACE_Canteen_empty";
        GVAR(onRefill) = "ACE_Canteen";
    };

    class ACE_Canteen_empty: ACE_Canteen {
        author = ACECSTRING(common,ACETeam);
        displayName = CSTRING(CanteenEmpty_DisplayName);
        descriptionShort = CSTRING(CanteenEmpty_Description);
        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 1;
        };
        GVAR(isDrinkable) = 0;
        GVAR(consumeActionText) = "";
        GVAR(replacementItem) = "";
        GVAR(onRefill) = "ACE_Canteen";
    };

    // MREs
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
        GVAR(consumeTime) = 8;
        GVAR(isEatable) = 20;
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

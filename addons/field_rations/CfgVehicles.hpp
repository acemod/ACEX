class CfgVehicles {
    class Man;
    class CAManBase: Man {
        class ACE_SelfActions {
            class FieldRations {
                displayName = CSTRING(mainInteractionName);
                runOnHover = 1;
                exceptions[] = {"isNotInside"};
                statement = QUOTE(_this call FUNC(onHoverDisplay));
                condition = QUOTE(GVAR(systemEnabled));
                insertChildren = QUOTE([ARR_2(_player, '')] call FUNC(getConsumableChildren));
                icon = PATHTOF(UI\icon_survival.paa);
            };
        };
    };


    class ACE_Module;
    class GVAR(module): ACE_Module {
        scope = 2;
        author = ACECSTRING(common,ACETeam);
        category = "ACEX";
        displayName = CSTRING(moduleName);
        //icon = "\ace\ace_main\data\ace_basic_module.paa";
        function = QFUNC(moduleSettings);
        functionPriority = 0;
        isGlobal = 0;
        isTriggerActivated = 0;
        class Arguments {
            class timeWithoutWater {
                displayName = CSTRING(timeWithoutWater_name);
                description = CSTRING(timeWithoutWater_description);
                typeName = "NUMBER";
                defaultValue = 24;
            };
            class timeWithoutFood {
                displayName = CSTRING(timeWithoutFood_name);
                description = CSTRING(timeWithoutFood_description);
                typeName = "NUMBER";
                defaultValue = 24;
            };
        };
    };

    class NATO_Box_Base;
    class GVAR(box): NATO_Box_Base {
        scope = 2;
        accuracy = 1000;
        displayName = "[ACEX] Field Rations [All]";
        model = "\A3\weapons_F\AmmoBoxes\AmmoBox_F";
        author = ACECSTRING(common,ACETeam);
        class TransportItems {
            MACRO_ADDITEM(ace_waterbottle,20);
            MACRO_ADDITEM(ace_canteen,20);
            MACRO_ADDITEM(ace_MRE_LambC,10);
            MACRO_ADDITEM(ace_MRE_Rice,10);
            MACRO_ADDITEM(ace_MRE_CreamTomatoSoup,10);
            MACRO_ADDITEM(ace_MRE_CreamChickenSoup,10);
            MACRO_ADDITEM(ace_MRE_ChickenTikkaMassala,10);
            MACRO_ADDITEM(ace_MRE_SteakVegetables,10);
            MACRO_ADDITEM(ace_MRE_MeatballsPasta,10);
            MACRO_ADDITEM(ace_MRE_ChickenHerbDumplings,10);
            MACRO_ADDITEM(ace_Humanitarian_Ration,10);
            MACRO_ADDITEM(ace_US_MRE_ChiliBeans,10);
            MACRO_ADDITEM(ace_US_MRE_ChickenFajita,10);
            MACRO_ADDITEM(ace_US_MRE_ChickenNoodles,10);
            MACRO_ADDITEM(ace_US_MRE_PorkSausageGravy,10);
            MACRO_ADDITEM(ace_US_MRE_MedChicen,10);
            MACRO_ADDITEM(ace_US_MRE_BeefRoastVeggies,10);
            MACRO_ADDITEM(ace_US_MRE_BeefBrisket,10);
            MACRO_ADDITEM(ace_US_MRE_MeatballMarinara,10);
            MACRO_ADDITEM(ace_US_MRE_BeefStew,10);
            MACRO_ADDITEM(ace_US_MRE_ChiliMacaroni,10);
            MACRO_ADDITEM(ace_US_MRE_VegetableLasagna,10);
            MACRO_ADDITEM(ace_US_MRE_SpicyPennePasta,10);
            MACRO_ADDITEM(ace_US_MRE_CheeseTortellini,10);
            MACRO_ADDITEM(ace_US_MRE_Ratatouille,10);
            MACRO_ADDITEM(ace_US_MRE_MexicanStyleChickenStew,10);
            MACRO_ADDITEM(ace_US_MRE_PorkRib,10);
            MACRO_ADDITEM(ace_US_MRE_MapleSausage,10);
            MACRO_ADDITEM(ace_US_MRE_BeefRavioli,10);
            MACRO_ADDITEM(ace_US_MRE_SloppyJoe,10);
            MACRO_ADDITEM(ace_US_MRE_SpaghettiMeatSauce,10);
            MACRO_ADDITEM(ace_US_MRE_LemonPepperTuna,10);
            MACRO_ADDITEM(ace_US_MRE_AsianBeefStrips,10);
            MACRO_ADDITEM(ace_US_MRE_ChickenPestoPasta,10);
            MACRO_ADDITEM(ace_US_MRE_SouthwestStyleBeefBlackBeans,10);
            MACRO_ADDITEM(ace_mre_c_ration,10);
        };
    };
};

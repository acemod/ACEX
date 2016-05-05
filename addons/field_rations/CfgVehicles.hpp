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
    class ACE_field_rations_module: ACE_Module {
        scope = 2;
        author = ECSTRING(common,ACETeam);
        category = "ACE";
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
    class acex_field_rations_all: NATO_Box_Base {
        scope = 2;
        accuracy = 1000;
        displayName = "[ACE] Field Rations [All]";
        model = "\A3\weapons_F\AmmoBoxes\AmmoBox_F";
        author = ECSTRING(common,ACETeam);
        class TransportWeapons {
            class ace_waterbottle {
                weapon = "ace_waterbottle";
                count = 20;
            };
            class _xx_ace_canteen {
                weapon = "ace_canteen";
                count = 20;
            };
            class _xx_ace_MRE_LambC {
                weapon = "ace_MRE_LambC";
                count = 10;
            };
            class _xx_ace_MRE_Rice {
                weapon = "ace_MRE_Rice";
                count = 10;
            };
            class _xx_ace_MRE_CreamTomatoSoup {
                weapon = "ace_MRE_CreamTomatoSoup";
                count = 10;
            };
            class _xx_ace_MRE_CreamChickenSoup {
                weapon = "ace_MRE_CreamChickenSoup";
                count = 10;
            };
            class _xx_ace_MRE_ChickenTikkaMassala {
                weapon = "ace_MRE_ChickenTikkaMassala";
                count = 10;
            };
            class _xx_ace_MRE_SteakVegetables {
                weapon = "ace_MRE_SteakVegetables";
                count = 10;
            };
            class _xx_ace_MRE_MeatballsPasta {
                weapon = "ace_MRE_MeatballsPasta";
                count = 10;
            };
            class _xx_ace_MRE_ChickenHerbDumplings {
                weapon = "ace_MRE_ChickenHerbDumplings";
                count = 10;
            };
            class _xx_ace_Humanitarian_Ration {
                weapon = "ace_Humanitarian_Ration";
                count = 10;
            };
            class _xx_ace_US_MRE_ChiliBeans {
                weapon = "ace_US_MRE_ChiliBeans";
                count = 10;
            };
            class _xx_ace_US_MRE_ChickenFajita {
                weapon = "ace_US_MRE_ChickenFajita";
                count = 10;
            };
            class _xx_ace_US_MRE_ChickenNoodles {
                weapon = "ace_US_MRE_ChickenNoodles";
                count = 10;
            };
            class _xx_ace_US_MRE_PorkSausageGravy {
                weapon = "ace_US_MRE_PorkSausageGravy";
                count = 10;
            };
            class _xx_ace_US_MRE_MedChicen {
                weapon = "ace_US_MRE_MedChicen";
                count = 10;
            };
            class _xx_ace_US_MRE_BeefRoastVeggies {
                weapon = "ace_US_MRE_BeefRoastVeggies";
                count = 10;
            };
            class _xx_ace_US_MRE_BeefBrisket {
                weapon = "ace_US_MRE_BeefBrisket";
                count = 10;
            };
            class _xx_ace_US_MRE_MeatballMarinara {
                weapon = "ace_US_MRE_MeatballMarinara";
                count = 10;
            };
            class _xx_ace_US_MRE_BeefStew {
                weapon = "ace_US_MRE_BeefStew";
                count = 10;
            };
            class _xx_ace_US_MRE_ChiliMacaroni {
                weapon = "ace_US_MRE_ChiliMacaroni";
                count = 10;
            };
            class _xx_ace_US_MRE_VegetableLasagna {
                weapon = "ace_US_MRE_VegetableLasagna";
                count = 10;
            };
            class _xx_ace_US_MRE_SpicyPennePasta {
                weapon = "ace_US_MRE_SpicyPennePasta";
                count = 10;
            };
            class _xx_ace_US_MRE_CheeseTortellini {
                weapon = "ace_US_MRE_CheeseTortellini";
                count = 10;
            };
            class _xx_ace_US_MRE_Ratatouille {
                weapon = "ace_US_MRE_Ratatouille";
                count = 10;
            };
            class _xx_ace_US_MRE_MexicanStyleChickenStew {
                weapon = "ace_US_MRE_MexicanStyleChickenStew";
                count = 10;
            };
            class _xx_ace_US_MRE_PorkRib {
                weapon = "ace_US_MRE_PorkRib";
                count = 10;
            };
            class _xx_ace_US_MRE_MapleSausage {
                weapon = "ace_US_MRE_MapleSausage";
                count = 10;
            };
            class _xx_ace_US_MRE_BeefRavioli {
                weapon = "ace_US_MRE_BeefRavioli";
                count = 10;
            };
            class _xx_ace_US_MRE_SloppyJoe {
                weapon = "ace_US_MRE_SloppyJoe";
                count = 10;
            };
            class _xx_ace_US_MRE_SpaghettiMeatSauce {
                weapon = "ace_US_MRE_SpaghettiMeatSauce";
                count = 10;
            };
            class _xx_ace_US_MRE_LemonPepperTuna {
                weapon = "ace_US_MRE_LemonPepperTuna";
                count = 10;
            };
            class _xx_ace_US_MRE_AsianBeefStrips {
                weapon = "ace_US_MRE_AsianBeefStrips";
                count = 10;
            };
            class _xx_ace_US_MRE_ChickenPestoPasta {
                weapon = "ace_US_MRE_ChickenPestoPasta";
                count = 10;
            };
            class _xx_ace_US_MRE_SouthwestStyleBeefBlackBeans {
                weapon = "ace_US_MRE_SouthwestStyleBeefBlackBeans";
                count = 10;
            };
            class _xx_ace_mre_c_ration {
                weapon = "ace_mre_c_ration";
                count = 10;
            };
        };
    };
};
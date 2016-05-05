class CfgWeapons {
    class ItemCore;
    class InventoryItem_Base_F;
    class ACE_waterbottle: ItemCore {
        scope = 2;
        value = 1;
        count = 1;
        type = 16;
        displayName = "Water Bottle";
        picture = QUOTE(PATHTOF(UI\item_waterbottle_full_co.paa));
        model = "\A3\Structures_F_EPA\Items\Food\BottlePlastic_V2_F.p3d";
        descriptionShort = "A waterbottle";
        class ItemInfo: InventoryItem_Base_F {
            mass= 5;
            type= 201;
        };
        GVAR(consumeTime) = 4.5;
        GVAR(isDrinkable) = 3.75;
        GVAR(replacementItem) = "ACE_waterbottle_half";
    };
    class ACE_waterbottle_half: ACE_waterbottle {
        displayName = "Water Bottle 1/2";
        picture = QUOTE(PATHTOF(UI\item_waterbottle_full_co.paa));
        descriptionShort = "Half full waterbottle";
        GVAR(replacementItem) = "ACE_waterbottle_empty";
        GVAR(isDrinkable) = 3.75;
        GVAR(onRefill) = "ACE_waterbottle";
    };
    class ACE_waterbottle_empty: ACE_waterbottle {
        displayName = "Empty Water Bottle";
        picture = QUOTE(PATHTOF(UI\item_waterbottle_empty_co.paa));
        descriptionShort = "An empty waterbottle";
        GVAR(isDrinkable) = 0;
        GVAR(onRefill) = "ACE_waterbottle";
        GVAR(replacementItem) = "";
    };
    class ACE_canteen: ItemCore {
        scope = 2;
        value = 1;
        count = 1;
        type = 16;
        displayName = "Canteen (Water)";
        picture = QUOTE(PATHTOF(UI\item_canteen_co.paa));
        model = "\A3\Structures_F_EPA\Items\Food\Canteen_F.p3d";
        descriptionShort = "A Canteen containing water";
        class ItemInfo: InventoryItem_Base_F {
            mass= 5;
            type= 201;
        };
        GVAR(isDrinkable) = 3.75;
        GVAR(replacementItem) = "ACE_canteen_half";
    };
    class ACE_canteen_half: ACE_canteen {
        displayName = "Canteen (Half)";
        model = "\A3\Structures_F_EPA\Items\Food\Canteen_F.p3d";
        descriptionShort = "A Canteen containing water (Half)";
        GVAR(isDrinkable) = 3.75;
        GVAR(replacementItem) = "ACE_canteen_empty";
        GVAR(onRefill) = "ACE_canteen";
    };
    class ACE_canteen_empty: ACE_canteen {
        displayName = "Canteen (Empty)";
        model = "\A3\Structures_F_EPA\Items\Food\Canteen_F.p3d";
        descriptionShort = "A Canteen containing water (Half)";
        GVAR(isDrinkable) = 0;
        GVAR(replacementItem) = "";
        GVAR(onRefill) = "ACE_canteen";
    };

    //Food:

    class ACE_MRE_BASE: ACE_waterbottle {
        scope = 2;
        value = 1;
        count = 1;
        type = 16;
        displayName = "MRE";
        picture = QUOTE(PATHTOF(UI\item_MRE_type1_co.paa));
        model = QUOTE(PATHTOF(models\mre_type1.p3d));
        descriptionShort = "A Meal Ready to Eat, unprepared";
        class ItemInfo: InventoryItem_Base_F
        {
            mass= 2;
            type= 201;
        };
        GVAR(consumeTime) = 10;
        GVAR(isEatable) = 10;
        GVAR(isDrinkable) = 0;
        GVAR(replacementItem) = "";
    };

    class ACE_MRE_LambC: ACE_MRE_BASE {
        displayName = "MRE Lamb Curry";
        descriptionShort = "An MRE containing Lamb Curry. Heat for best effect";
    };
    // class ACE_MRE_LambC_prepared: ACE_MRE_LambC {
    // displayName = "MRE Lamb Curry (Heated)";
    // };

    class ACE_MRE_Rice: ACE_MRE_BASE {
        displayName = "MRE Rice";
        picture = QUOTE(PATHTOF(UI\item_MRE_type2_co.paa));
        model = QUOTE(PATHTOF(models\mre_type2.p3d));
        descriptionShort = "An MRE Containing Rice. Heat for best effect";
    };
    // class ACE_MRE_Rice_prepared: ACE_MRE_Rice {
    // displayName = "MRE Rice (Heated)";
    // };

    class ACE_MRE_CreamTomatoSoup: ACE_MRE_BASE {
        displayName = "MRE Cream Tomato Soup";
        picture = QUOTE(PATHTOF(UI\item_MRE_type3_co.paa));
        model = QUOTE(PATHTOF(models\mre_type3.p3d));
        descriptionShort = "An MRE Containing Tomato Soup cream. Mix with water and heat for best effect";
    };
    // class ACE_MRE_CreamTomatoSoup_prepared: ACE_MRE_CreamTomatoSoup {
    // displayName = "MRE Cream Tomato Soup (Heated)";
    // };

    class ACE_MRE_CreamChickenSoup: ACE_MRE_BASE {
        displayName = "MRE Cream Chicken Soup";
        picture = QUOTE(PATHTOF(UI\item_MRE_type3_co.paa));
        model = QUOTE(PATHTOF(models\mre_type3.p3d));
        descriptionShort = "An MRE Containing Chicken Soup. Mix with water and heat for best effect";
    };
    // class ACE_MRE_CreamChickenSoup_prepared: ACE_MRE_CreamChickenSoup {
    // displayName = "MRE Cream Chicken Soup (Heated)";
    // };

    class ACE_MRE_ChickenTikkaMassala: ACE_MRE_BASE {
        displayName = "MRE Chicken Tikka Massala";
        picture = QUOTE(PATHTOF(UI\item_MRE_type4_co.paa));
        model = QUOTE(PATHTOF(models\mre_type4.p3d));
        descriptionShort = "An MRE with Chicken Tikka Massala. Heat for best effect";
    };
    // class ACE_MRE_ChickenTikkaMassala_prepared: ACE_MRE_ChickenTikkaMassala {
    // displayName = "MRE Chicken Tikka Massala (Heated)";
    // };

    class ACE_MRE_SteakVegetables: ACE_MRE_BASE {
        displayName = "MRE Steak & Vegetables";
        picture = QUOTE(PATHTOF(UI\item_MRE_type5_co.paa));
        model = QUOTE(PATHTOF(models\mre_type5.p3d));
        descriptionShort = "An MRE Containing Steak & Vegetables. Heat for best effect";
    };
    // class ACE_MRE_SteakVegetables_prepared: ACE_MRE_SteakVegetables {
    // displayName = "MRE Steak & Vegetables (Heated)";
    // };

    class ACE_MRE_MeatballsPasta: ACE_MRE_BASE {
        displayName = "MRE Meatballs & Pasta";
        picture = QUOTE(PATHTOF(UI\item_MRE_type6_co.paa));
        model = QUOTE(PATHTOF(models\mre_type6.p3d));
        descriptionShort = "An MRE Containing Meatballs & Pasta. Heat for best effect";
    };
    // class ACE_MRE_MeatballsPasta_prepared: ACE_MRE_MeatballsPasta {
    // displayName = "MRE Meatballs & Pastas (Heated)";
    // };

    class ACE_MRE_ChickenHerbDumplings: ACE_MRE_BASE {
        displayName = "MRE Chicken with Herb Dumplings";
        picture = QUOTE(PATHTOF(UI\item_MRE_type6_co.paa));
        model = QUOTE(PATHTOF(models\mre_type6.p3d));
        descriptionShort = "An MRE Containing Chicken with Herb Dumplings. Heat for best effect";
    };
    // class ACE_MRE_ChickenHerbDumplings_prepared: ACE_MRE_ChickenHerbDumplings {
    // displayName = "MRE Chicken with Herb Dumplings (Heated)";
    // };

    class ACE_Humanitarian_Ration: ACE_MRE_BASE {
        displayName = "Humanitarian Ration";
        picture = QUOTE(PATHTOF(UI\item_MRE_human_co.paa));
        model = QUOTE(PATHTOF(models\mre_human.p3d));
        descriptionShort = "An Humanitarian Ration, for handing out to the local population";
    };

    class ACE_US_MRE_ChiliBeans: ACE_MRE_BASE  {
        displayName = "Chile with Beans MRE";
        descriptionShort = "An MRE containing Chili with Beans";
    };
    // class ACE_US_MRE_ChiliBeans_prepared: ACE_US_MRE_ChiliBeans {
    // displayName = "Chile with Beans MRE (Heated)";
    // };
    class ACE_US_MRE_ChickenFajita: ACE_MRE_BASE {
        displayName = "Chicken Fajita MRE";
        descriptionShort = "A Chicken Fajita MRE";
    };
    // class ACE_US_MRE_ChickenFajita_prepared: ACE_US_MRE_ChickenFajita {
    // displayName = "Chicken Fajita MRE (Heated)";
    // };

    class ACE_US_MRE_ChickenNoodles: ACE_MRE_BASE {
        displayName = "Chicken with Noodles MRE";
        descriptionShort = "An MRE containing Chicken with Noodles";
    };
    // class ACE_US_MRE_ChickenNoodles_prepared: ACE_US_MRE_ChickenNoodles {
    // displayName = "Chicken Fajita MRE(Heated)";
    // };

    class ACE_US_MRE_PorkSausageGravy: ACE_MRE_BASE {
        displayName = "Pork Sausage with Gravy MRE";
        descriptionShort = "An MRE containing Pork Sausage with Gravy";
    };
    // class ACE_US_MRE_PorkSausageGravy_prepared: ACE_US_MRE_PorkSausageGravy  {
    // displayName = "Pork Sausage Gravy MRE(Heated)";
    // };

    class ACE_US_MRE_MedChicen: ACE_MRE_BASE {
        displayName = "Mediterranean Chicken MRE";
        descriptionShort = "An MRE containing Mediterranean Chicken";
    };
    // class ACE_US_MRE_MedChicken_prepared: ACE_US_MRE_MedChicen {
    // displayName = "Mediterranean Chicken MRE(Heated)";
    // };

    class ACE_US_MRE_BeefRoastVeggies: ACE_MRE_BASE {
        displayName = "Beef Roast with Veggies MRE";
        descriptionShort = "An MRE containing Beef Roast with Veggies";
    };
    // class ACE_US_MRE_BeefRoastVeggies_prepared: ACE_US_MRE_BeefRoastVeggies {
    // displayName = "Beef Roast Veg MRE(Heated)";
    // };

    class ACE_US_MRE_BeefBrisket: ACE_MRE_BASE {
        displayName = "Beef Brisket MRE";
        descriptionShort = "An MRE containing Beef Brisket";
    };
    // class ACE_US_MRE_BeefBrisket_prepared: ACE_US_MRE_BeefBrisket {
    // displayName = "Beef Brisket MRE(Heated)";
    // };

    class ACE_US_MRE_MeatballMarinara: ACE_MRE_BASE {
        displayName = "Meatball Marinara MRE";
        descriptionShort = "An MRE containing Meatballs with Marinara Sauce";
    };
    // class ACE_US_MRE_MeatballMarinara_prepared: ACE_US_MRE_MeatballMarinara {
    // displayName = "Meatball Marinara(Heated)";
    // };

    class ACE_US_MRE_BeefStew: ACE_MRE_BASE {
        displayName = "Beef Stew MRE";
        descriptionShort = "An MRE containing Beef Stew";
    };
    // class ACE_US_MRE_BeefStew_prepared: ACE_US_MRE_BeefStew {
    // displayName = "Beef Stew MRE(Heated)";
    // };

    class ACE_US_MRE_ChiliMacaroni: ACE_MRE_BASE {
        displayName = "Chile Macaroni MRE";
        descriptionShort = "An MRE containing Chile Macaroni";
    };
    // class ACE_US_MRE_ChileMacaroni_prepared: ACE_US_MRE_ChiliMacaroni {
    // displayName = "Chile Macaroni MRE(Heated)";
    // };

    class ACE_US_MRE_VegetableLasagna: ACE_MRE_BASE {
        displayName = "Vegetable Lasagna MRE";
        descriptionShort = "An MRE containing Vegetable Lasagna";
    };
    // class ACE_US_MRE_VegetableLasagna_prepared: ACE_US_MRE_VegetableLasagna {
    // displayName = "Vegetable Lasagna MRE(Heated)";
    // };

    class ACE_US_MRE_SpicyPennePasta: ACE_MRE_BASE {
        displayName = "Spicy Penne Pasta MRE";
        descriptionShort = "An MRE containing Spicy Penne Pasta";
    };
    // class ACE_US_MRE_SpicyPennePasta_prepared: ACE_US_MRE_SpicyPennePasta {
    // displayName = "Spicy Penne Pasta MRE(Heated)";
    // };

    class ACE_US_MRE_CheeseTortellini: ACE_MRE_BASE {
        displayName = "Cheese Tortellini MRE";
        descriptionShort = "An MRE containing CheeseTortellini";
    };
    // class ACE_US_MRE_CheeseTortellini_prepared: ACE_US_MRE_CheeseTortellini {
    // displayName = "Cheese Tortellini MRE(Heated)";
    // };

    class ACE_US_MRE_Ratatouille: ACE_MRE_BASE {
        displayName = "Ratatouille MRE";
        descriptionShort = "An MRE containing Ratatouille";
    };
    // class ACE_US_MRE_Ratatouille_prepared: ACE_US_MRE_Ratatouille {
    // displayName = "Ratatouille MRE (Heated)";
    // };

    class ACE_US_MRE_MexicanStyleChickenStew: ACE_MRE_BASE {
        displayName = "Mexican Style Chicken Stew MRE";
        descriptionShort = "An MRE containing Mexican Style Chicken Stew";
    };
    // class ACE_US_MRE_MexicanStyleChickenStew_prepared: ACE_US_MRE_MexicanStyleChickenStew {
    // displayName = "Mexican Style Chicken Stew MRE (Heated)";
    // };

    class ACE_US_MRE_PorkRib: ACE_MRE_BASE {
        displayName = "Pork Rib MRE";
        descriptionShort = "An MRE Containing Pork Rib";
    };
    // class ACE_US_MRE_PorkRib_prepared: ACE_US_MRE_PorkRib {
    // displayName = "Pork Rib MRE (Heated)";
    // };

    class ACE_US_MRE_MapleSausage: ACE_MRE_BASE {
        displayName = "Maple Sausage MRE";
        descriptionShort = "An MRE Containing Maple Sausage";
    };
    // class ACE_US_MRE_MapleSausage_prepared: ACE_US_MRE_MapleSausage {
    // displayName = "Maple Sausage MRE (Heated)";
    // };

    class ACE_US_MRE_BeefRavioli: ACE_MRE_BASE {
        displayName = "Beef Ravioli MRE";
        descriptionShort = "An MRE Containing Beef Ravioli";
    };
    // class ACE_US_MRE_BeefRavioli_prepared: ACE_US_MRE_BeefRavioli {
    // displayName = "Beef Ravioli MRE (Heated)";
    // };

    class ACE_US_MRE_SloppyJoe: ACE_MRE_BASE {
        displayName = "Sloppy Joe MRE";
        descriptionShort = "An MRE Containing a Sloppy Joe";
    };
    // class ACE_US_MRE_SloppyJoe_prepared: ACE_US_MRE_SloppyJoe {
    // displayName = "Sloppy Joe MRE (Heated)";
    // };

    class ACE_US_MRE_SpaghettiMeatSauce: ACE_MRE_BASE {
        displayName = "Spaghetti with Meat Sauce MRE";
        descriptionShort = "An MRE Containing Spaghetti with Meat Sauce";
    };
    // class ACE_US_MRE_SpaghettiMeatSauce_prepared: ACE_US_MRE_SpaghettiMeatSauce {
    // displayName = "Spaghetti with Meat Sauce  MRE (Heated)";
    // };

    class ACE_US_MRE_LemonPepperTuna: ACE_MRE_BASE {
        displayName = " Lemon Pepper Tuna MRE";
        descriptionShort = "An MRE Containing Lemon Pepper Tuna";
    };
    // class ACE_US_MRE_LemonPepperTuna_prepared: ACE_US_MRE_LemonPepperTuna {
    // displayName = "Lemon Pepper Tuna MRE (Heated)";
    // };

    class ACE_US_MRE_AsianBeefStrips: ACE_MRE_BASE {
        displayName = "Asian Beef Strips MRE";
        descriptionShort = "An MRE Containing Asian Beef Strips";
    };
    // class ACE_US_MRE_AsianBeefStrips_prepared: ACE_US_MRE_AsianBeefStrips {
    // displayName = "Asian Beef Strips MRE (Heated)";
    // };

    class ACE_US_MRE_ChickenPestoPasta: ACE_MRE_BASE {
        displayName = "Chicken Pesto Pasta MRE";
        descriptionShort = "An MRE Containing Chicken Pesto Pasta";
    };
    // class ACE_US_MRE_ChickenPestoPasta_prepared: ACE_US_MRE_ChickenPestoPasta {
    // displayName = "Chicken Pesto Pasta (Heated)";
    // };

    class ACE_US_MRE_SouthwestStyleBeefBlackBeans: ACE_MRE_BASE {
        displayName = "Southwest Style Beef & Black Beans";
        descriptionShort = "An MRE Containing Southwest Style Beef & Black Beans";
    };
    // class ACE_US_MRE_SouthwestStyleBeefBlackBeans_prepared: ACE_US_MRE_SouthwestStyleBeefBlackBeans {
    // displayName = "Southwest Style Beef & Black Beans (Heated)";
    // };

    class ACE_mre_c_ration: ACE_MRE_BASE {
        displayName = "C Ration";
        picture = QUOTE(PATHTOF(UI\item_MRE_c_ration_co.paa));
        descriptionShort = "C ration";
    };

};
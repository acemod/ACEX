class CfgVehicles {
    class Man;
    class CAManBase: Man {
        class ACE_SelfActions {
            class ACEX_FieldRations {
                displayName = "Survival" // TODO: localize. change text/
                condition = QUOTE(GVAR(enabled)); // TODO: dont show action if nothing to eat/drink? (unit has consumables?)
                exceptions[] = {"isNotInside"};
                statement = ""; // TODO: HUD show
                runOnHover = 1;
                insertChildren = QUOTE((_this select 1) call FUNC(getConsumableChildren));
                icon = QPATHTOF(ui\icon_survival.paa);
            };
        };
    };
};

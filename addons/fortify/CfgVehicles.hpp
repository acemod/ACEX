class CfgVehicles {
    class Man;
    class CAManBase: Man {
        class ACE_SelfActions {
            class ADDON {
                displayName = "Fortify";
                condition = QUOTE([_player] call FUNC(canFortify));
                insertChildren = QUOTE(_this call FUNC(addActions));
                statement = "";
                exceptions[] = {};
                showDisabled = 0;
                priority = 1;
            };
        };
    };
};

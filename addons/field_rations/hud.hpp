class RscPicture;

class RscTitles {
    class ace_field_rations_PlayerStatusUI {
        duration = 1e+011;
        idd = 1111;
        movingEnable = 0;
        onLoad = "uiNamespace setVariable ['ace_field_rations_PlayerStatusUI', _this select 0];";
        class controlsBackground {
            class FoodStatus: RscPicture {
                sizeEx = 0.032;
                text = QUOTE(PATHTOF(UI\hud_foodstatus2.paa));
                colorText[] = {0.0,1.0,0.0,0.4};
                idc = 11112;
                x = "(safezoneW + safezoneX) - (2.1 * (((safezoneW / safezoneH) min 1.2) / 40))";
                y = "(safezoneH + safezoneY) - 2 * (2.1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25))";
                w = "1.8 * (((safezoneW / safezoneH) min 1.2) / 40)";
                h = "1.8 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
            };
            class drinkStatus: FoodStatus {
                text = QUOTE(PATHTOF(UI\hud_drinkstatus2.paa));
                colorText[] = {0.0,1.0,0.0,0.4};
                idc = 11113;
                y = "(safezoneH + safezoneY) - 1 * (2.1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25))";
            };
        };
    };
};

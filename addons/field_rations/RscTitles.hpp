class RscPicture;

class RscTitles {
    class GVAR(hud) {
        idd = -1;
        fadeIn = 0;
        fadeOut = 0;
        duration = 999999;
        movingEnable = 0;
        onLoad = QUOTE(uiNamespace setVariable [ARR_2(QQGVAR(hud),_this select 0)]);
        onUnload = QUOTE(uiNamespace setVariable [ARR_2(QQGVAR(hud),displayNull)]);
        class controls {
            class thirstStatus: RscPicture {
                idc = IDC_THIRST;
                x = "(safeZoneX + safeZoneW) - (4.2 * ((safeZoneW / safeZoneH) min 1.2) / 40)";
                y = "(safeZoneY + safeZoneH) - (2.1 * (((safeZoneW / safeZoneH) min 1.2) / 1.2) / 25))";
                w = "2 * (((safeZoneW / safeZoneH) min 1.2) / 40)";
                h = "2 * ((((safeZoneW / safeZoneH) min 1.2) / 1.2) / 25)";
                sizeEx = 0.032;
                text = QPATHTOF(ui\icon_hud_thirststatus.paa);
                colorText[] = {1, 1, 1, 1};
            };
            class hungerStatus: thirstStatus {
                idc = IDC_HUNGER;
                x = "(safeZoneX + safeZoneW) - (2.1 * ((safeZoneW / safeZoneH) min 1.2) / 40)";
                text = QPATHTOF(ui\icon_hud_hungerstatus.paa);
            };
        };
    };
};

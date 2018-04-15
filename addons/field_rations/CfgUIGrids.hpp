class CfgUIGrids {
    class IGUI {
        class Presets {
            class Arma3 {
                class Variables {
                    grid_ACEX_FieldRations[] = {{"(safeZoneX + safeZoneW) - (4.2 * ((safeZoneW / safeZoneH) min 1.2) / 40)", "(safeZoneY + safeZoneH) - (2.1 * (((safeZoneW / safeZoneH) min 1.2) / 1.2) / 25)", "4.1 * (((safeZoneW / safeZoneH) min 1.2) / 40)", "2 * ((((safeZoneW / safeZoneH) min 1.2) / 1.2) / 25)"}, "(((safeZoneW / safeZoneH) min 1.2) / 40)", "((((safeZoneW / safeZoneH) min 1.2) / 1.2) / 25)"};
                };
            };
        };
        class Variables {
            class grid_ACEX_FieldRations {
                displayName = COMPONENT_NAME;
                description = CSTRING(IGUI_Description);
                preview = QPATHTOF(ui\igui_preview.paa);
                saveToProfile[] = {0, 1};
                canResize = 0;
            };
        };
    };
};

#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        units[] = {};
        weapons[] = {"ACEX_Item_FMRadio", "ACEX_Item_ExtensionCord", "ACEX_Item_handycam", "ACEX_Item_Laptop", "ACEX_Item_Mobilephone_old", "ACEX_Item_Mobilephone_smart", "ACEX_Item_PortableLongRangeRadio", "ACEX_Item_Satellitephone","ACEX_Item_SurvivalRadio", "ACEX_Item_File1", "ACEX_Item_File2", "ACEX_Item_Filephoto", "ACEX_Item_Map", "ACEX_Item_Notepad", "ACEX_Item_Photos_V1", "ACEX_Item_BottlePlastic_V1", "ACEX_Item_Can_Dented", "ACEX_Item_Can_Rusty", "ACEX_Item_Can_V1", "ACEX_Item_Can_V2", "ACEX_Item_Can_V3", "ACEX_Item_TacticalBacon", "ACEX_Item_Suitcase", "ACEX_Item_PenBlack", "ACEX_Item_PenRed", "ACEX_Item_PencilRed", "ACEX_Item_PencilBlue", "ACEX_Item_PencilGreen", "ACEX_Item_PencilYellow", "ACEX_Item_PensAndPencils", "ACEX_Item_Axe", "ACEX_Item_Axe_Fire","ACEX_Item_DrillAku", "ACEX_Item_DustMask", "ACEX_Item_File_Tool", "ACEX_Item_Gloves", "ACEX_Item_Grinder", "ACEX_Item_Hammer", "ACEX_Item_Meter3m", "ACEX_Item_Multimeter", "ACEX_Item_Pliers", "ACEX_Item_Saw", "ACEX_Item_Screwdriver_V1", "ACEX_Item_Screwdriver_V2", "ACEX_Item_Wrench", "ACEX_Item_Money", "ACEX_Item_Battery", "ACEX_Item_BakedBeans", "ACEX_Item_BottlePlastic_V2", "ACEX_Item_Canteen", "ACEX_Item_CerealsBox", "ACEX_Item_PowderedMilk", "ACEX_Item_RiceBox", "ACEX_Item_HeatPack", "ACEX_Item_VitaminBottle", "ACEX_Item_WaterPurificationTablets", "ACEX_Item_ButaneCanister", "ACEX_Item_ButaneTorch", "ACEX_Item_CanOpener", "ACEX_Item_DuctTape", "ACEX_Item_FireExtinguisher", "ACEX_Item_GasCanister", "ACEX_Item_GasCooker", "ACEX_Item_Matches", "ACEX_Item_MetalWire", "ACEX_Item_Shovel", "ACEX_Item_Map_Altis", "ACEX_Item_Map_Blank", "ACEX_Item_Map_Stratis"};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"acex_main"};
        author = ACECSTRING(common,ACETeam);
        authors[] = {"voiper", "Bohemia Interactive"};
        url = ACECSTRING(main,URL);
        VERSION_CONFIG;
    };
};

#include "CfgVehicleClasses.hpp"
#include "CfgVehicles.hpp"
#include "CfgWeapons.hpp"

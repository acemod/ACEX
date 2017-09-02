class CfgWeapons {
    class InventoryItem_Base_F;
    class ACE_ItemCore;

    class ACE_Fortify: ACE_ItemCore {
        author = ACECSTRING(common,ACETeam);
        displayName = CSTRING(FortifyItem_name);
        descriptionShort = "";
        model = "\A3\Structures_F\Items\Tools\Hammer_F.p3d";
        picture = QPATHTOF(UI\hammer_ca.paa);
        scope = 2;
        class ItemInfo: InventoryItem_Base_F {
            mass = 0;
        };
    };
};

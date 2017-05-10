class CfgWeapons {
    class InventoryItem_Base_F;
    class ACE_ItemCore;

    class ACE_FortifyPickaxe: ACE_ItemCore {
        author = ECSTRING(common,ACETeam);
        displayName = "Pickaxe";
        descriptionShort = "";
        model = "\A3\Structures_F\Items\Tools\Hammer_F.p3d";
        picture = QPATHTOF(UI\blank_co.paa);
        scope = 2;
        class ItemInfo: InventoryItem_Base_F {
            mass = 0;
        };
    };
};

class CfgMovesBasic;
class CfgMovesMaleSdr: CfgMovesBasic {
    class States {
        class CutSceneAnimationBase;
        class GVAR(drinkStand): CutSceneAnimationBase {
            file = QPATHTOF(anim\drink_stand.rtm);
            actions = "CivilStandActions";
            speed = 0.1;
            disableWeapons = 1;
            disableWeaponsLong = 1;
            canReload = 0;
            canPullTrigger = 0;
            showWeaponAim = 0;
            looped = 0;
            head = "headNo";
            aiming = "aimingNo";
            legs = "legsNo";
            connectTo[] = {"AmovPercMstpSnonWnonDnon", 0.1};
            interpolateFrom[] = {"AmovPercMstpSnonWnonDnon", 0.1};
            interpolateTo[] = {"Unconscious", 0.1};
        };
        class GVAR(drinkCrouch): GVAR(drinkStand) {
            file = QPATHTOF(anim\drink_crouch.rtm);
            actions = "CivilKneelActions";
            connectTo[] = {"AmovPknlMstpSnonWnonDnon", 0.1};
            interpolateFrom[] = {"AmovPknlMstpSnonWnonDnon", 0.1};
        };
        class GVAR(drinkProne): GVAR(drinkStand) {
            file = QPATHTOF(anim\drink_prone.rtm);
            actions = "CivilProneActions";
            connectTo[] = {"AmovPpneMstpSnonWnonDnon", 0.1};
            interpolateFrom[] = {"AmovPpneMstpSnonWnonDnon", 0.1};
        };
    };
};

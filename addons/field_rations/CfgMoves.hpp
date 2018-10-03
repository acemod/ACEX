class CfgMovesBasic {
    class Default;
};

class CfgMovesMaleSdr: CfgMovesBasic {
    class States {
        class CutSceneAnimationBase;
        class GVAR(drinkStand): CutSceneAnimationBase {
            file = QPATHTOF(anim\drink_stand.rtm);
            speed = 0.1;
            disableWeapons = 1;
            disableWeaponsLong = 1;
            canReload = 0;
            canPullTrigger = 0;
            looped = 0;
            head = "headNo";
            aiming = "aimingNo";
            legs = "legsNo";
        };
        class GVAR(drinkCrouch): GVAR(drinkStand) {
            file = QPATHTOF(anim\drink_crouch.rtm);
        };
        class GVAR(drinkProne): GVAR(drinkStand) {
            file = QPATHTOF(anim\drink_prone.rtm);
        };
    };
};

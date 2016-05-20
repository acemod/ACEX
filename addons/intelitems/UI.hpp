class ctrlControlsGroupNoScrollbars;
class ctrlStaticPicture;
class ctrlEditMulti;
class ctrlStatic;
class ctrlStaticMulti;
class ctrlActivePicture;
class ctrlStaticPictureKeepAspect;
class ctrlActivePictureKeepAspect;

class RscControlsGroup;
class RscControlsGroupNoScrollbars;

//ControlGroup used in both display and dialog
class GVAR(controlGroup): ctrlControlsGroupNoScrollbars {
    idc = -1;
    x = 0 * safezoneW + safezoneX;
    y = 0.25 * safezoneH + safezoneY;
    w = 0.5625 * (0.5 * safezoneH);
    h = 0.5 * safezoneH;
    class Controls {
        class paperBackground: ctrlStaticPicture {
            idc = 724341;
            text = "#(argb,8,8,3)color(0.89,0.89,0.89,1)";
            x = 0;
            y = 0;
            w = 0.5625 * (0.5 * safezoneH);
            h = 0.5 * safezoneH;
        };
        class contentPicture: ctrlStaticPictureKeepAspect {
            idc = 724345;
            text = "#(argb,8,8,3)color(1,0,0,1)";
            x = 0;
            y = 0;
            w = 0.5625 * (0.5 * safezoneH);
            h = 0.5 * safezoneH;
            onMouseButtonDown = QUOTE([ARR_2(ctrlParentControlsGroup (_this select 0), true)] call FUNC(onIntelButtonClick););
        };
        class contentEdit: ctrlEditMulti {
            idc = 724346;
            text = "";
            sizeEx = "4.32 * (1 / (getResolution select 3)) * 1.25 * 4";
            font = "PuristaSemibold";
            shadow = 0;
            x = 0;
            y = 0;
            w = 0.5625 * (0.5 * safezoneH);
            h = 0.5 * safezoneH;
            colorBackground[] = {0, 0, 0, 0};
            colorDisabled[] = {0, 0, 0, 0};
            colorText[] = {0, 0, 0, 1};
            onMouseButtonDown = QUOTE([ARR_2(ctrlParentControlsGroup (_this select 0), true)] call FUNC(onIntelButtonClick););
        };
        class contentText: ctrlStaticMulti {
            idc = 724347;
            text = "";
            sizeEx = "4.32 * (1 / (getResolution select 3)) * 1.25 * 4";
            font = "PuristaSemibold";
            shadow = 0;
            x = 0;
            y = 0;
            w = 0.5625 * (0.5 * safezoneH);
            h = 0.5 * safezoneH;
            colorBackground[] = {0, 0, 0, 0};
            colorDisabled[] = {0, 0, 0, 0};
            colorText[] = {0, 0, 0, 1};
            onMouseButtonDown = QUOTE([ARR_2(ctrlParentControlsGroup (_this select 0), true)] call FUNC(onIntelButtonClick););
        };
    };
};

//Interactive dialog:
class GVAR(dialog) {
    idd = -1;
    movingenable = 1;
    onLoad = QUOTE(with uiNamespace do {GVAR(dialog) = _this select 0;};);
    onUnload = QUOTE(_this call FUNC(dialogClose););
    class controlsBackground {
        class clickOff: ctrlActivePicture {
            text = "#(argb,8,8,3)color(0,0,0,0.5)";
            x = -10 * safezoneW + safezoneX;
            y = -10 * safezoneH + safezoneY;
            w = 20 * safezoneW;
            h = 20 * safezoneH;
            onMouseButtonDown = QUOTE(closeDialog 55;);
        };
    };
    class Controls {
        class controlGroup: GVAR(controlGroup) {
            idc = 724340;
        };
        class topBar: ctrlStatic {
            idc = 724350;
            colorBackground[] = {0.1, 0.1, 0.1, 1};
            moving = 1;
        };
        class closeButton: ctrlActivePictureKeepAspect {
            idc = 724351;
            text = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArcadeMap\icon_exit_cross_ca.paa";
            moving = 1;
            colorText[] = {1,1,1,0.7};
            colorActive[] = {1,1,1,1};
            onButtonClick = QUOTE(closeDialog 0;);
        };
    };
};


//Zeus Attributes:
class RscDisplayAttributes {
    class Controls {
        class Background;
        class Title;
        class Content: RscControlsGroup {
            class controls;
        };
        class ButtonOK;
        class ButtonCancel;
    };
};

class GVAR(zeusAttributes): RscDisplayAttributes {
    onLoad = QUOTE([ARR_3('onLoad', _this, QUOTE(QGVAR(zeusAttributes)))] call compile preprocessFileLineNumbers '\a3\ui_f_curator\UI\Displays\RscDisplayAttributes.sqf');
    onUnload = QUOTE([ARR_3('onUnload', _this, QUOTE(QGVAR(zeusAttributes)))] call compile preprocessFileLineNumbers '\a3\ui_f_curator\UI\Displays\RscDisplayAttributes.sqf');
    class Controls: Controls {
        class Background: Background {};
        class Title: Title {};
        class Content: Content {
            class Controls {
                class GVAR(zeus): RscControlsGroupNoScrollbars {
                    onSetFocus = QUOTE(_this call FUNC(zeusAttributeFocus));
                    idc = 26466;
                    x = "7 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
                    y = "10 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY + (safezoneH - 					(			((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
                    w = "26 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
                    h = "5 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
                    class controls {
                        class Title: ctrlStatic {
                            idc = 26468;
                            text = CSTRING(edit_text);
                            x = "0 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
                            y = "0 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
                            w = "5 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
                            h = "5 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
                            colorBackground[] = {0,0,0,0.5};
                        };
                        class Value: ctrlEditMulti {
                            idc = 26469;
                            x = "5.5 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
                            y = "0 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
                            w = "19 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
                            h = "5 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
                            autocomplete = "";
                        };
                    };
                };
            };
        };
        class ButtonOK: ButtonOK {};
        class ButtonCancel: ButtonCancel {};
    };
};


class CfgVehicles {
    class ThingX;
    class GVAR(base): ThingX {
        XEH_ENABLED;
        icon = "iconObject_2x3";
        mapSize = 0.3;
        vehicleClass = QUOTE(ADDON);
        destrType = "DesturctNo";
        curatorInfoTypeEmpty = QGVAR(zeusAttributes);
        class Attributes {
            class GVAR(3denAttribute) {
                displayName = CSTRING(edit_text);
                property = QGVAR(data);
                control = "EditMulti5";
                expression = QUOTE([ARR_2(_this, _value)] call FUNC(server_setObjectData););
                defaultValue = "''";
                unique = 0;
                validate = "string";
                condition = "object";
                typeName = "STRING";
            };
        };
        class ACE_Actions {
            class GVAR(pickup) {
                displayName = CSTRING(pickupAction);
                selection = "";
                distance = 4;
                condition = QUOTE(_this call FUNC(canPickupIntelObject));
                statement = QUOTE(_this call FUNC(pickupIntelObject));
            };
        };
    };


    class GVAR(DocumentObject): GVAR(base) {
        displayName = CSTRING(Document_displayName);
        author = "PabstMirror";
        model = "\A3\Structures_F\Items\Documents\File2_F.p3d";
        scope = 2;
        scopeCurator = 2;
    };
    class GVAR(PhotoObject): GVAR(base) {
        displayName = CSTRING(Photo_displayName);
        author = "PabstMirror";
        model = "\A3\Structures_F\Items\Documents\FilePhotos_F.p3d";
        scope = 2;
        scopeCurator = 2;
        class Attributes: Attributes {
            class GVAR(3denAttribute): GVAR(3denAttribute) {
                displayName = CSTRING(edit_photo);
                control = "Edit";
            };
        };
    };
    class GVAR(NotepadObject): GVAR(base) {
        displayName = CSTRING(Notepad_displayName);
        author = "Pabst";
        model = "\A3\Structures_F\Items\Documents\Notepad_F.p3d";
        scope = 2;
        scopeCurator = 2;
    };
};

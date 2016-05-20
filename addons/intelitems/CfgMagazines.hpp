class CfgMagazines {
    class CA_Magazine;
    class GVAR(document): CA_Magazine {
        displayName = CSTRING(Document_displayName);
        descriptionShort = CSTRING(Document_descriptionShort);
        picture = QUOTE(PATHTOF(UI\document_ca.paa));
        model = "\A3\Structures_F\Items\Documents\File2_F.p3d";
        count = 1;
        mass = 0;
        ACE_isUnique = 1;
    };
    class GVAR(photo): GVAR(document) {
        displayName = CSTRING(Photo_displayName);
        descriptionShort = CSTRING(Photo_descriptionShort);
        picture = QUOTE(PATHTOF(UI\photo_ca.paa));
        model = "\A3\Structures_F\Items\Documents\FilePhotos_F.p3d";
    };
    class GVAR(notepad): GVAR(document) {
        displayName = CSTRING(Notepad_displayName);
        descriptionShort = CSTRING(Notepad_descriptionShort);
        picture = QUOTE(PATHTOF(UI\notepad_ca.paa));
        model = "\A3\Structures_F\Items\Documents\Notepad_F.p3d";
    };
};

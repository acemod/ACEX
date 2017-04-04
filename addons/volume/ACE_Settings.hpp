class ACE_Settings {
    class GVAR(enabled) {
        value = 0;
        typeName = "BOOL";
        category = CSTRING(Name);
        displayName = ACECSTRING(common,Enabled);
        description = CSTRING(KeybindDescription);
        isClientSettable = 1;
        force = 0;
    };
    class GVAR(reduction) {
        value = 5;
        typeName = "SCALAR";
        category = CSTRING(Name);
        displayName = CSTRING(Reduction);
        description = CSTRING(ReductionDescription);
        isClientSettable = 1;
        force = 0;
        values[] = {"0%", "10%", "20%", "30%", "40%", "50%", "60%", "70%", "80%", "90%", "100%"};
    };
    class GVAR(fadeDelay) {
        value = 1;
        typeName = "SCALAR";
        category = CSTRING(Name);
        displayName = CSTRING(FadeDelay);
        description = CSTRING(FadeDelayDescription);
        isClientSettable = 1;
        force = 0;
        values[] = {"0s", "1s", "2s", "3s", "4s", "5s", "6s", "7s", "8s", "9s", "10s"};
    };
    class GVAR(lowerInVehicles) {
        value = 0;
        typeName = "BOOL";
        category = CSTRING(Name);
        displayName = CSTRING(LowerInVehicles);
        description = CSTRING(LowerInVehiclesDescription);
        isClientSettable = 1;
        force = 0;
    };
    class GVAR(showNotification) {
        value = 1;
        typeName = "BOOL";
        category = CSTRING(Name);
        displayName = CSTRING(ShowNotification);
        description = CSTRING(ShowNotificationDescription);
        isClientSettable = 1;
        force = 0;
    };
    class GVAR(remindIfLowered) {
        value = 0;
        typeName = "BOOL";
        category = CSTRING(Name);
        displayName = CSTRING(RemindIfLowered);
        description = CSTRING(RemindIfLoweredDescription);
        isClientSettable = 1;
        force = 0;
    };
};

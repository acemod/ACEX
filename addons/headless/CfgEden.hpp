class Cfg3DEN {
    class Object {
        class AttributeCategories {
            class ace_attributes {
                class Attributes {
                    class GVAR(blacklist) {
                        displayName = "Headless Blacklist";
                        tooltip = "If blacklisted this vehicle will not be transfered to headless clients.";
                        property = QGVAR(blacklist);
                        control = "Checkbox";
                        condition = "objectVehicle";
                        expression = QUOTE(_this setVariable [ARR_3(QQGVAR(blacklist), _value, true)]);
                        defaultValue = 0;
                    };
                };
            };
        };
    };
    class Group {
        class AttributeCategories {
            class ace_attributes {
                class Attributes {
                    class GVAR(blacklist) {
                        displayName = "Headless Blacklist";
                        tooltip = "If blacklisted this group will not be transfered to headless clients.";
                        property = QGVAR(blacklist);
                        control = "Checkbox";
                        expression = QUOTE(_this setVariable [ARR_3(QQGVAR(blacklist), _value, true)]);
                        defaultValue = 0;
                    };
                };
            };
        };
    };
};

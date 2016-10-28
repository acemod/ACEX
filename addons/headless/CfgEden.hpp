class Cfg3DEN {
    class Object {
        class AttributeCategories {
            class ace_attributes {
                class Attributes {
                    class GVAR(blacklist) {
                        displayName = CSTRING(BlacklistEden);
                        tooltip = CSTRING(BlacklistEdenDesc);
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
                        displayName = CSTRING(BlacklistEden);
                        tooltip = CSTRING(BlacklistEdenDesc);
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

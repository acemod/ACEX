class Cfg3DEN
{
    class Attributes
    {
        class Title;
        class Combo: Title {
            class Controls {
                class Title;
                class Value;
            };
        };
        class GVAR(presetSelection): Combo {
            class Controls: Controls {
                class Title: Title {};
                class Value: Value {
                    delete Items;
                    class ItemsConfig {
                        path[] = { QGVAR(Presets) };
                        localConfig = 1;
                        propertyText = "displayName";
                        sort = true;
                    };
                };
            };
        };
    };
};

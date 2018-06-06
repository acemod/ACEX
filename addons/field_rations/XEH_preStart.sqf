#include "script_component.hpp"

#include "XEH_PREP.hpp"

// Compile list of water sources from config
private _filter = QUOTE(getNumber (_x >> 'scope') == 2 && {getNumber (_x >> QQGVAR(waterSupply)) > 0 || {getNumber (_x >> QQGVAR(waterSupply)) == REFILL_WATER_INFINITE}});
private _waterSources = (_filter configClasses (configFile >> "CfgVehicles")) apply {configName _x};
SETUVAR(GVAR(waterSources),_waterSources);

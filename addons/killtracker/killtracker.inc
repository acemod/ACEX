/*
    Author: Freddo

    Creates a killtracker debriefing section,
    displayed at the end mission debriefing screen.

    Include this file in description.ext of your mission

    Example:
    class CfgDebriefingSections {
        #if __has_include("\z\acex\addons\killtracker\killtracker.inc")
            #include "\z\acex\addons\killtracker\killtracker.inc"
        #endif
    };
*/

class acex_killTracker {
    title = "$STR_ACEX_KillTracker_Title";
    variable = "acex_killTracker_outputText";
};

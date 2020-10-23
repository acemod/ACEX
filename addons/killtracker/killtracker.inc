/*
    Author: Freddo
    
    Creates a killtracker debriefing section, 
    displayed at the end mission debriefing screen.
    
    Include this file in description.ext of your mission
    
    Example:
    class CfgDebriefingSections {
        #include "\z\acex\addons\killtracker\killtracker.inc"
    };
*/

class acex_killTracker {
    title = "ACEX Killed Events";
    variable = "acex_killTracker_outputText";
};

%%
%[text] ## Fetch Player Stats
%[text] This example shows how to retrieve career statistics for an NBA player using the NBA Toolbox.
%%
%[text] ### Add the toolbox to the path
addpath(genpath(fullfile(pwd,"toolbox")))
%%
%[text] ### Retrieve per-game stats for LeBron James
%[text] Player ID **2544** corresponds to LeBron James on stats.nba.com.
playerStats = nba.getPlayerStats(2544, "2023-24", "PerGame");
disp(playerStats)
%%
%[text] ### Compare with totals
%[text] Pass `"Totals"` as the third argument to get raw counting stats.
totalStats = nba.getPlayerStats(2544, "2023-24", "Totals");
disp(totalStats)
%[appendix]{"version":"1.0"}
%---
%[metadata:view]
%   data: {"layout":"inline"}
%---

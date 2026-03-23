%%
%[text] ## Fetch Team Stats
%[text] This example shows how to retrieve year-by-year statistics for an NBA team using the NBA Toolbox.
%%
%[text] ### Add the toolbox to the path
addpath(genpath(fullfile(pwd,"toolbox")))
%%
%[text] ### Retrieve per-game stats for the Los Angeles Lakers
%[text] Team ID **1610612747** corresponds to the Lakers on stats.nba.com.
teamStats = nba.getTeamStats(1610612747, "2023-24", "PerGame");
disp(teamStats)
%%
%[text] ### View season totals
%[text] Pass `"Totals"` to see raw win/loss and other counting stats.
teamTotals = nba.getTeamStats(1610612747, "2023-24", "Totals");
disp(teamTotals)
%[appendix]{"version":"1.0"}
%---
%[metadata:view]
%   data: {"layout":"inline"}
%---

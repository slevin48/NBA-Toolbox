%%
%[text] ## Getting Started with NBA Toolbox
%[text] This live script walks you through the main features of the NBA Toolbox for MATLAB.
%%
%[text] ### Setup
%[text] Add the `toolbox` folder to your MATLAB path so that the `nba` package is available.
addpath(genpath(fullfile(pwd,"toolbox")))
%%
%[text] ### Fetch Player Stats
%[text] Use `nba.getPlayerStats` to retrieve career statistics for a player. You need the NBA player ID and a season string in `YYYY-YY` format. For example, LeBron James has player ID **2544**.
playerStats = nba.getPlayerStats(2544, "2023-24");
disp(playerStats)
%%
%[text] ### Fetch Team Stats
%[text] Use `nba.getTeamStats` to retrieve year-by-year statistics for a team. The Los Angeles Lakers have team ID **1610612747**.
teamStats = nba.getTeamStats(1610612747, "2023-24");
disp(teamStats)
%%
%[text] ### Per-Mode Options
%[text] Both functions accept a third argument to change the per-mode view. Valid options are `"PerGame"` (default), `"Totals"`, `"Per36"`, and `"Per100Possessions"`.
totals = nba.getPlayerStats(2544, "2023-24", "Totals");
disp(totals)
%%
%[text] ### Next Steps
%[text] - See `examples/FetchPlayerStats.m` for a focused player data workflow \
%[text] - See `examples/FetchTeamStats.m` for a focused team data workflow \
%[appendix]{"version":"1.0"}
%---
%[metadata:view]
%   data: {"layout":"inline"}
%---

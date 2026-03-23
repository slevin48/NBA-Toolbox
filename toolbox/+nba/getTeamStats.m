function data = getTeamStats(teamId, season, perMode, opts)
%GETTEAMSTATS Retrieve team stats for a given season from stats.nba.com.
%   data = nba.getTeamStats(teamId, season, perMode) fetches year-by-year
%   team statistics for the specified season.
%   Provide RequestFcn for testing or custom HTTP behavior.

arguments
    teamId (1,1) {mustBeNumeric, mustBeFinite, mustBePositive}
    season (1,1) string {nba.validate.mustBeSeasonString}
    perMode (1,1) string {mustBeMember(perMode,["PerGame","Totals","Per36","Per100Possessions"])} = "PerGame"
    opts.RequestFcn (1,1) function_handle = @webread
end

season = char(season);
perMode = char(perMode);

params = struct(...
    "TeamID", teamId,...
    "PerMode", perMode,...
    "LeagueID", "00",...
    "Season", season,...
    "SeasonType", "Regular Season");

endpoint = "https://stats.nba.com/stats/teamyearbyyearstats";
raw = nba.private.makeNbaRequest(endpoint, params, opts.RequestFcn);

data = nba.private.parseResultSet(raw, "TeamStats");
end

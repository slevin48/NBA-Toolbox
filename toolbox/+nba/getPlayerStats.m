function data = getPlayerStats(playerId, season, perMode, opts)
%GETPLAYERSTATS Retrieve career stats for a player from stats.nba.com.
%   data = nba.getPlayerStats(playerId, season, perMode) fetches player
%   career totals for the requested season and per-mode view.
%   An optional RequestFcn can be provided for testing.

arguments
    playerId (1,1) {mustBeNumeric, mustBeFinite, mustBePositive}
    season (1,1) string {nba.validate.mustBeSeasonString}
    perMode (1,1) string {mustBeMember(perMode,["PerGame","Totals","Per36","Per100Possessions"])} = "PerGame"
    opts.RequestFcn (1,1) function_handle = @webread
end

season = char(season);
perMode = char(perMode);

params = struct(...
    "PlayerID", playerId,...
    "PerMode", perMode,...
    "LeagueID", "00",...
    "Season", season);

endpoint = "https://stats.nba.com/stats/playercareerstats";
raw = nba.private.makeNbaRequest(endpoint, params, opts.RequestFcn);

data = nba.private.parseResultSet(raw, "CareerTotalsRegularSeason");
end

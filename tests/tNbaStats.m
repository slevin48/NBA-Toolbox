classdef tNbaStats < matlab.unittest.TestCase
    methods (Test)
        function playerParsing(testCase)
            fakeResponse = struct( ...
                "resultSets", struct( ...
                    "name", "CareerTotalsRegularSeason", ...
                    "headers", {{"SEASON_ID", "PLAYER_ID", "GP"}}, ...
                    "rowSet", {{ {"2023-24", 2544, 60}; {"2022-23", 2544, 55} }}));

            fakeRequest = @(url, params, options) fakeResponse; %#ok<INUSD>
            data = nba.getPlayerStats(2544, "2023-24", "PerGame", struct("RequestFcn", fakeRequest));

            testCase.verifyEqual(data.Properties.VariableNames, {'SEASON_ID','PLAYER_ID','GP'});
            testCase.verifyEqual(data.GP(1), 60);
        end

        function teamParsing(testCase)
            fakeResponse = struct( ...
                "resultSets", struct( ...
                    "name", "TeamStats", ...
                    "headers", {{"TEAM_ID", "W", "L"}}, ...
                    "rowSet", {{ {1610612747, 52, 30}; {1610612747, 43, 39} }}));

            fakeRequest = @(url, params, options) fakeResponse; %#ok<INUSD>
            data = nba.getTeamStats(1610612747, "2023-24", "Totals", struct("RequestFcn", fakeRequest));

            testCase.verifyEqual(height(data), 2);
            testCase.verifyEqual(data.W(1), 52);
        end

        function invalidSeasonFormat(testCase)
            testCase.verifyError(@() nba.getPlayerStats(2544, "202324"), "NBA:InvalidSeasonFormat");
        end
    end
end

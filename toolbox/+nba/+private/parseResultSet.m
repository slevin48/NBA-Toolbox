function data = parseResultSet(raw, preferredName)
%PARSERESULTSET Convert NBA stats API resultSets to a table.
arguments
    raw (1,1) struct
    preferredName (1,:) char = ""
end

if isfield(raw, "resultSets")
    sets = raw.resultSets;
elseif isfield(raw, "ResultSets")
    sets = raw.ResultSets;
else
    error("NBA:UnexpectedResponse", "Response does not contain resultSets.");
end

if iscell(sets)
    sets = [sets{:}];
end

if ~isempty(preferredName)
    match = arrayfun(@(s) strcmpi(s.name, preferredName), sets);
    if any(match)
        target = sets(find(match,1));
    else
        target = sets(1);
    end
else
    target = sets(1);
end

headers = string(target.headers);
rows = target.rowSet;

if iscell(rows) && ~isempty(rows) && iscell(rows{1})
    rows = vertcat(rows{:});
end

tableData = cell2table(rows, 'VariableNames', matlab.lang.makeValidName(headers));

data = tableData;
end

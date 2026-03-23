function mustBeSeasonString(str)
%MUSTBESEASONSTRING Validate NBA season format YYYY-YY.

if ~(ischar(str) || isstring(str))
    error("NBA:InvalidSeasonFormat","Season must be a character vector or string scalar.");
end

expr = "^\d{4}-\d{2}$";
if isempty(regexp(string(str), expr, "once"))
    error("NBA:InvalidSeasonFormat", ...
        "Season must match the format YYYY-YY, for example '2023-24'.");
end
end

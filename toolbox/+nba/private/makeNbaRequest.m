function raw = makeNbaRequest(url, params, requestFcn)
%MAKENBAREQUEST Construct NBA Stats API request with headers and defaults.
%   This function centralizes HTTP configuration so public APIs remain
%   concise and testable.

arguments
    url (1,:) char
    params (1,1) struct
    requestFcn (1,1) function_handle = @webread
end

headers = nba.private.standardHeaders();
options = weboptions(...
    "Timeout", 20,...
    "HeaderFields", headers,...
    "ContentType", "json");

raw = requestFcn(url, params, options);
end

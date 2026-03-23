function headers = standardHeaders()
%STANDARDHEADERS Default HTTP headers required by stats.nba.com.
headers = {
    'Accept', 'application/json, text/plain, */*';
    'Accept-Language', 'en-US,en;q=0.9';
    'Origin', 'https://www.nba.com';
    'Referer', 'https://www.nba.com';
    'User-Agent', 'MATLAB Web Client';
    'Connection', 'keep-alive'
    };
end

# NBA Toolbox

MATLAB utilities for pulling NBA statistics from stats.nba.com. The toolbox provides simple entry points for player and team data, argument validation, and tab completion support.

[![Open in MATLAB Online](https://www.mathworks.com/images/responsive/global/open-in-matlab-online.svg)](https://matlab.mathworks.com/open/github/v1?repo=slevin48/NBA-Toolbox)

## Installation
1. Clone or download this repository.
2. Add the `toolbox` folder to your MATLAB path:
   ```matlab
   addpath(genpath(fullfile(pwd, 'toolbox')))
   ```
3. Open `doc/GettingStarted.m` as a live script for a guided tour.

## Usage
```matlab
playerStats = nba.getPlayerStats(2544, "2023-24", "PerGame");
teamStats   = nba.getTeamStats(1610612747, "2023-24", "Totals");
```
Both functions accept an optional `RequestFcn` for injecting a custom HTTP client or mock during testing.

## Documentation and Examples
- `doc/GettingStarted.m` – overview and quick steps (open as Live Script in MATLAB)
- `examples/FetchPlayerStats.m` – download player data
- `examples/FetchTeamStats.m` – download team data

## Testing
Run MATLAB unit tests from the repository root:
```matlab
results = runtests('tests');
assertSuccess(results);
```

## Security
See [SECURITY.md](SECURITY.md) for vulnerability reporting guidelines.

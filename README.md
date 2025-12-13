# NBA Toolbox

MATLAB utilities for pulling NBA statistics from stats.nba.com. The toolbox provides simple entry points for player and team data, argument validation, and tab completion support.

![Open in MATLAB Online](https://www.mathworks.com/products/matlab-online.html)

## Installation
1. Clone or download this repository.
2. Add the `toolbox` folder to your MATLAB path:
   ```matlab
   addpath(genpath(fullfile(pwd, 'toolbox')))
   ```
3. Open `doc/GettingStarted.mlx` for a guided tour.

## Usage
```matlab
playerStats = nba.getPlayerStats(2544, "2023-24", "PerGame");
teamStats   = nba.getTeamStats(1610612747, "2023-24", "Totals");
```
Both functions accept an optional `RequestFcn` for injecting a custom HTTP client or mock during testing.

## Documentation and Examples
- `doc/GettingStarted.mlx` – overview and quick steps
- `examples/FetchPlayerStats.mlx` – download player data
- `examples/FetchTeamStats.mlx` – download team data

## Testing
Run MATLAB unit tests from the repository root:
```matlab
results = runtests('tests');
assertSuccess(results);
```

## Security
See [SECURITY.md](SECURITY.md) for vulnerability reporting guidelines.

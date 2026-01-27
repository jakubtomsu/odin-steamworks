# Odin Steamworks
Odin bindings for Valve's [Steamworks API](https://partner.steamgames.com/doc/sdk). Includes a binding generator.

> The Steamworks API allows your game to take full advantage of Steam by accessing all of the underlying systems provided through the API. This includes things such as pausing your game when the user opens the Steam Overlay, inviting friends to play, allowing players to unlock Steam Achievements, letting players compete on the Steam Leaderboards and much more.

the Steamworks API also includes the [Steam GameNetworkingSockets](https://github.com/ValveSoftware/GameNetworkingSockets)

Current Steamworks SDK version: `1.60`

Latest tested Odin version: `dev-2024-09:c6b551d2c`

## How to Use
1. Copy the [steamworks](steamworks/) folder into your project
2. Copy `steam_api64.dll` (not the `steam_api.dll`!) next to your exe
3. Create a `steam_appid.txt` with your steam app ID. Use `480` for testing purposes

Take a look at the [example](example/example.odin) to see the API usage.

## Example
- copy `steam_api64.dll` to the example folder (Windows)
- `cd example`
- `odin run .`

## About the generator
Initially a custom generator was used to create the bindings, which was removed in commit [ddd0f5a](https://github.com/jakubtomsu/odin-steamworks/commit/ddd0f5ad2f7e14aaf7b02cefd4ed529be770fa8c).
It used the `steamworks_api.json` to generate a single source file.

Note: The naming is slightly different than in the C/C++ API. For instance, things aren't prefixed with `Steam`, `m_`, `k_`, etc. Also `_t` suffixes for structs aren't used.

## Contributing
Contributions are welcome, especially bugfixes! Please submit a pull request here on Github.

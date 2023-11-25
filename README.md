# Odin bindings for Steamworks
Odin bindings for Valve's [Steamworks API](https://partner.steamgames.com/doc/sdk). Includes a binding generator.

Current Steamworks SDK version: `1.58a`

> The Steamworks API allows your game to take full advantage of Steam by accessing all of the underlying systems provided through the API. This includes things such as pausing your game when the user opens the Steam Overlay, inviting friends to play, allowing players to unlock Steam Achievements, letting players compete on the Steam Leaderboards and much more.

the Steamworks API also includes the [Steam GameNetworkingSockets](https://github.com/ValveSoftware/GameNetworkingSockets)

## How to Use
1. Copy the [steamworks](steamworks/) folder into your project.
2. Put `steam_api64.dll` next to your exe.
3. (debug-only) Create a `steam_appid.txt` with the text `480`. Do not ship this with your game.

Take a look at the [example](example/example.odin) to see the API usage.

## About the generator
The generator uses the `steamworks_api.json` to generate a single source file. The file has to be manually edited, because
the generator just doesn't handle everything. (`steamworks/steamworks.odin` is already edited and ready to go)

Build the generator with `odin build` commands.

Note: The naming is slightly different than in the C/C++ API. For instance, things aren't prefixed with `Steam`, `m_`, `k_`, etc. Also `_t` suffixes for structs aren't used.

## Contributing
Contributions are welcome! Preferrably submit a pull request here on Github.

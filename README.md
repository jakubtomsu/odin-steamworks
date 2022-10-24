# Odin bindings for Steamworks
Odin bindings for Valve's [Steamworks API](https://partner.steamgames.com/doc/sdk). Includes a binding generator.

Current Steamworks SDK version: `1.55`

> The Steamworks API allows your game to take full advantage of Steam by accessing all of the underlying systems provided through the API. This includes things such as pausing your game when the user opens the Steam Overlay, inviting friends to play, allowing players to unlock Steam Achievements, letting players compete on the Steam Leaderboards and much more.

## How to Use
Just copy the `steamworks/steamworks.odin` file somewhere to your project.

## About the generator
The generator uses the `steamworks_api.json` to generate a single source file. The file has to be manually edited, because
the generator just doesn't handle everything. (`steamworks/steamworks.odin` is already edited and ready to go)

Build the generator with `odin build` commands.

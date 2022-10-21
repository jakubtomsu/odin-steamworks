# Odin Steamworks Bindings
Odin bindings for Valve's [Steamworks SDK](https://partner.steamgames.com/doc/sdk). Includes a binding generator.


> Steamworks is a set of tools and services that help game developers and publishers build
> their games and get the most out of distributing on Steam.

## How to Use
Just copy the `steamworks/steamworks.odin` file somewhere to your project.

## About the generator
The generator uses the `steamworks_api.json` to generate a single source file. The file has to be manually edited, because
there are many small inconsistencies in the API. (`steamworks/steamworks.odin` is already edited and ready to go)

Build the generator with `odin build` commands.

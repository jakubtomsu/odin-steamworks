package main
import "core:fmt"
import "core:c"
import "../steamworks"
import "core:runtime"
import "core:strings"
import "vendor:raylib"

main :: proc() {
    fmt.println("Hello world!")

    if steamworks.RestartAppIfNecessary(steamworks.uAppIdInvalid) {
        fmt.println("Launching app through steamworks...")
        return
    }

    if !steamworks.Init() do panic("steamworks.Init failed. Make sure Steam is running.")

    steamworks.Client_SetWarningMessageHook(steamworks.Client(), steamworksApiDebugTextHook)

    if !steamworks.User_BLoggedOn(steamworks.User()) {
        panic("User isn't logged in.")
    } else do fmt.println("USER IS LOGGED IN")

    fmt.println(string(steamworks.Friends_GetPersonaName(steamworks.Friends())))
    fmt.println(steamworks.Friends_GetPersonaState(steamworks.Friends()))


    raylib.InitWindow(800, 480, "Odin Steamworks Example")
    raylib.SetTargetFPS(60)

    for !raylib.WindowShouldClose() {
        raylib.BeginDrawing()
        raylib.ClearBackground(raylib.DARKBLUE)
        raylib.DrawFPS(2, 2)
        raylib.DrawText(raylib.TextFormat("Friends_GetPersonaName: %s", steamworks.Friends_GetPersonaName(steamworks.Friends())), 2, 22 * 2, 20, raylib.WHITE)
        raylib.DrawText(raylib.TextFormat("Friends_GetPersonaState: %s", steamworks.Friends_GetPersonaState(steamworks.Friends())), 2, 22 * 3, 20, raylib.WHITE)
        raylib.EndDrawing()
    }

    raylib.CloseWindow()

    steamworks.Shutdown()
}

steamworksApiDebugTextHook :: proc "c" (severity: c.int, debugText: cstring) {
    // if you're running in the debugger, only warnings (nSeverity >= 1) will be sent
    // if you add -debug_steamworksapi to the command-line, a lot of extra informational messages will also be sent
    runtime.print_string(string(debugText))

    if severity >= 1 {
        // TODO: breakpoint
    }
}

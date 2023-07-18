package main
import "core:fmt"
import "core:c"
import "core:runtime"
import "core:strings"
import "core:mem"
import "vendor:raylib"
import "../steamworks"

// https://partner.steamgames.com/doc/sdk/api
// https://partner.steamgames.com/doc/sdk/api#manual_dispatch

numberOfCurrentPlayers: int

main :: proc() {
    fmt.println("Hello world!")

    if steamworks.RestartAppIfNecessary(steamworks.uAppIdInvalid) {
        fmt.println("Launching app through steamworks...")
        return
    }

    if !steamworks.Init() do panic("steamworks.Init failed. Make sure Steam is running.")

    steamworks.Client_SetWarningMessageHook(steamworks.Client(), steamDebugTextHook)

    steamworks.ManualDispatch_Init()

    if !steamworks.User_BLoggedOn(steamworks.User()) {
        panic("User isn't logged in.")
    } else do fmt.println("USER IS LOGGED IN")

    fmt.println(string(steamworks.Friends_GetPersonaName(steamworks.Friends())))
    fmt.println(steamworks.Friends_GetPersonaState(steamworks.Friends()))

    // lobbyCall := steamworks.Matchmaking_RequestLobbyList(steamworks.Matchmaking())

    raylib.InitWindow(800, 480, "Odin Steamworks Example")
    raylib.SetTargetFPS(60)

    for !raylib.WindowShouldClose() {
        raylib.BeginDrawing()
        raylib.ClearBackground(raylib.DARKBLUE)
        raylib.DrawFPS(2, 2)
        raylib.DrawText("Press Shift+Tab to open Steam Overlay", 2, 22 * 2, 20, raylib.WHITE)
        raylib.DrawText(raylib.TextFormat("Friends_GetPersonaName: %s", steamworks.Friends_GetPersonaName(steamworks.Friends())), 2, 22 * 4, 20, raylib.WHITE)
        raylib.DrawText(raylib.TextFormat("Friends_GetPersonaState: %s", steamworks.Friends_GetPersonaState(steamworks.Friends())), 2, 22 * 5, 20, raylib.WHITE)
        raylib.DrawText(raylib.TextFormat("Number of current players (refresh with N key): %i", numberOfCurrentPlayers), 2, 22 * 6, 20, raylib.WHITE)
        runSteamCallbacks()

        if raylib.IsKeyPressed(.N) {
            getNumberOfCurrentPlayers()
        }

        raylib.EndDrawing()
    }

    raylib.CloseWindow()

    steamworks.Shutdown()
}

steamDebugTextHook :: proc "c" (severity: c.int, debugText: cstring) {
    // if you're running in the debugger, only warnings (nSeverity >= 1) will be sent
    // if you add -debug_steamworksapi to the command-line, a lot of extra informational messages will also be sent
    runtime.print_string(string(debugText))

    if severity >= 1 {
        // TODO: breakpoint
    }
}

runSteamCallbacks :: proc() {
    tempMem := make([dynamic]byte, context.temp_allocator)

    hSteamPipe := steamworks.GetHSteamPipe()
    steamworks.ManualDispatch_RunFrame(hSteamPipe)
    callback: steamworks.CallbackMsg

    for steamworks.ManualDispatch_GetNextCallback(hSteamPipe, &callback) {
        // Check for dispatching API call results
        if callback.iCallback == steamworks.SteamAPICallCompleted_iCallback {
            fmt.println("CallResult: ", callback)

            pCallCompleted := transmute(^steamworks.SteamAPICallCompleted)callback.pubParam
            resize(&tempMem, int(callback.cubParam))
            if pTmpCallResult, ok := mem.alloc(int(callback.cubParam)); ok == nil {
                bFailed: bool
                if steamworks.ManualDispatch_GetAPICallResult(hSteamPipe, pCallCompleted.hAsyncCall, pTmpCallResult, callback.cubParam, callback.iCallback, &bFailed) {
                    // Dispatch the call result to the registered handler(s) for the
                    // call identified by pCallCompleted->m_hAsyncCall
                    fmt.println("   pCallCompleted", pCallCompleted)
                    if pCallCompleted.iCallback == steamworks.NumberOfCurrentPlayers_iCallback {
                        onGetNumberOfCurrentPlayers(transmute(^steamworks.NumberOfCurrentPlayers)pTmpCallResult, bFailed)
                    }
                }
                mem.free(pTmpCallResult)
            }

        } else {
            // Look at callback.m_iCallback to see what kind of callback it is,
            // and dispatch to appropriate handler(s)
            fmt.println("Callback: ", callback)

            if callback.iCallback == steamworks.GameOverlayActivated_iCallback {
                fmt.println("GameOverlayActivated")
                onGameOverlayActivated(transmute(^steamworks.GameOverlayActivated)callback.pubParam)
            }
        }
        steamworks.ManualDispatch_FreeLastCallback(hSteamPipe)
    }
}

onGameOverlayActivated :: proc(using data: ^steamworks.GameOverlayActivated) {
    fmt.println("Is overlay active =", bActive)
}

onGetNumberOfCurrentPlayers :: proc(using data: ^steamworks.NumberOfCurrentPlayers, ioFailure: bool) {
    fmt.println("[getNumberOfCurrentPlayers] success:", bSuccess)
    if ioFailure || !bool(bSuccess) {
        fmt.println("getNumberOfCurrentPlayers failed.")
        return
    }

    fmt.println("[getNumberOfCurrentPlayers] Number of players currently playing:", cPlayers)
    numberOfCurrentPlayers = int(cPlayers)
}

getNumberOfCurrentPlayers :: proc() {
    fmt.println("[getNumberOfCurrentPlayers] Getting number of current players.")
    hSteamApiCall := steamworks.UserStats_GetNumberOfCurrentPlayers(steamworks.UserStats())
}

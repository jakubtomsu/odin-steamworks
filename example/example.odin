package steamworks_example

import steam "../steamworks"
import "base:runtime"
import "core:c"
import "core:fmt"
import "core:mem"
import "core:strings"
import "vendor:raylib"

// https://partner.steamgames.com/doc/sdk/api
// https://partner.steamgames.com/doc/sdk/api#manual_dispatch

number_of_current_players: int

main :: proc() {
    fmt.println("Hello world!")

    if steam.RestartAppIfNecessary(steam.uAppIdInvalid) {
        fmt.println("Launching app through steam...")
        return
    }

    err_msg: steam.SteamErrMsg
    if err := steam.InitFlat(&err_msg); err != .OK {
        fmt.printfln("steam.InitFlat failed with code '{}' and message \"{}\"", err, transmute(cstring)&err_msg[0])
        panic("Steam Init failed. Make sure Steam is running.")
    }

    steam.Client_SetWarningMessageHook(steam.Client(), steam_debug_text_hook)

    steam.ManualDispatch_Init()

    if !steam.User_BLoggedOn(steam.User()) {
        panic("User isn't logged in.")
    } else {
        fmt.println("USER IS LOGGED IN")
    }

    fmt.println(string(steam.Friends_GetPersonaName(steam.Friends())))
    fmt.println(steam.Friends_GetPersonaState(steam.Friends()))

    // lobbyCall := steam.Matchmaking_RequestLobbyList(steam.Matchmaking())

    raylib.InitWindow(800, 480, "Odin Steamworks Example")
    raylib.SetTargetFPS(60)

    for !raylib.WindowShouldClose() {
        raylib.BeginDrawing()
        raylib.ClearBackground(raylib.DARKBLUE)
        raylib.DrawFPS(2, 2)
        raylib.DrawText("Press Shift+Tab to open Steam Overlay", 2, 22 * 2, 20, raylib.WHITE)
        raylib.DrawText(raylib.TextFormat("Friends_GetPersonaName: %s", steam.Friends_GetPersonaName(steam.Friends())), 2, 22 * 4, 20, raylib.WHITE)
        raylib.DrawText(raylib.TextFormat("Friends_GetPersonaState: %s", steam.Friends_GetPersonaState(steam.Friends())), 2, 22 * 5, 20, raylib.WHITE)
        raylib.DrawText(raylib.TextFormat("Number of current players (refresh with N key): %i", number_of_current_players), 2, 22 * 6, 20, raylib.WHITE)
        run_steam_callbacks()

        if raylib.IsKeyPressed(.N) {
            get_number_of_current_players()
        }

        raylib.EndDrawing()
    }

    raylib.CloseWindow()

    steam.Shutdown()
}

steam_debug_text_hook :: proc "c" (severity: c.int, debugText: cstring) {
    // if you're running in the debugger, only warnings (nSeverity >= 1) will be sent
    // if you add -debug_steamworksapi to the command-line, a lot of extra informational messages will also be sent
    runtime.print_string(string(debugText))

    if severity >= 1 {
        runtime.debug_trap()
    }
}

run_steam_callbacks :: proc() {
    temp_mem := make([dynamic]byte, context.temp_allocator)

    steam_pipe := steam.GetHSteamPipe()
    steam.ManualDispatch_RunFrame(steam_pipe)
    callback: steam.CallbackMsg

    for steam.ManualDispatch_GetNextCallback(steam_pipe, &callback) {
        // Check for dispatching API call results
        if callback.iCallback == .SteamAPICallCompleted {
            fmt.println("CallResult: ", callback)

            call_completed := transmute(^steam.SteamAPICallCompleted)callback.pubParam
            resize(&temp_mem, int(callback.cubParam))
            if temp_call_res, ok := mem.alloc(int(callback.cubParam), allocator = context.temp_allocator); ok == nil {
                bFailed: bool
                if steam.ManualDispatch_GetAPICallResult(steam_pipe, call_completed.hAsyncCall, temp_call_res, callback.cubParam, callback.iCallback, &bFailed) {
                    // Dispatch the call result to the registered handler(s) for the
                    // call identified by call_completed->m_hAsyncCall
                    fmt.println("   call_completed", call_completed)
                    if call_completed.iCallback == .NumberOfCurrentPlayers {
                        onGetNumberOfCurrentPlayers(transmute(^steam.NumberOfCurrentPlayers)temp_call_res, bFailed)
                    }
                }
            }

        } else {
            // Look at callback.m_iCallback to see what kind of callback it is,
            // and dispatch to appropriate handler(s)
            fmt.println("Callback: ", callback)

            if callback.iCallback == .GameOverlayActivated {
                fmt.println("GameOverlayActivated")
                onGameOverlayActivated(transmute(^steam.GameOverlayActivated)callback.pubParam)
            }
        }

        steam.ManualDispatch_FreeLastCallback(steam_pipe)
    }
}

onGameOverlayActivated :: proc(using data: ^steam.GameOverlayActivated) {
    fmt.println("Is overlay active =", bActive)
}

onGetNumberOfCurrentPlayers :: proc(using data: ^steam.NumberOfCurrentPlayers, ioFailure: bool) {
    fmt.println("[get_number_of_current_players] success:", bSuccess)
    if ioFailure || !bool(bSuccess) {
        fmt.println("get_number_of_current_players failed.")
        return
    }

    fmt.println("[get_number_of_current_players] Number of players currently playing:", cPlayers)
    number_of_current_players = int(cPlayers)
}

get_number_of_current_players :: proc() {
    fmt.println("[get_number_of_current_players] Getting number of current players.")
    hSteamApiCall := steam.UserStats_GetNumberOfCurrentPlayers(steam.UserStats())
}

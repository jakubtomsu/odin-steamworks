package main
import "core:fmt"
import "core:c"
import steam "../steamworks"
import "core:runtime"
import "core:strings"

main :: proc() {
	fmt.println("Hello world!")

	if steam.RestartAppIfNecessary(steam.k_uAppIdInvalid) {
		fmt.println("Launching app through Steam...")
		return
	}

	if !steam.Init() do panic("steam.Init failed.")

	steam.Client_SetWarningMessageHook(steam.Client(), steamApiDebugTextHook)

	if !steam.User_BLoggedOn(steam.User()) {
		panic("User isn't logged in.")
	} else do fmt.println("USER IS LOGGED IN")

	fmt.println(string(steam.Friends_GetPersonaName(steam.Friends())))
	fmt.println(steam.Friends_GetPersonaState(steam.Friends()))

	steam.Shutdown()
}

steamApiDebugTextHook :: proc "c" (severity: c.int, debugText: cstring) {
	// if you're running in the debugger, only warnings (nSeverity >= 1) will be sent
	// if you add -debug_steamapi to the command-line, a lot of extra informational messages will also be sent
	runtime.print_string(string(debugText))

	if severity >= 1 {
		// TODO: breakpoint
	}
}

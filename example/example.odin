package main
import "core:fmt"
import "../steamworks"

main :: proc() {
	fmt.println("Hello world!")

	if !steamworks.Init() do panic("steamworks.Init failed")
	steamworks.Shutdown()
}

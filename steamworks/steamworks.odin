package steamworks
import "core:c"
foreign import lib "steam_api64.lib"

// HACK
CSteamID :: u64

uint8 :: u8
int8 :: i8
int16 :: i16
uint16 :: u16
int32 :: i32
uint32 :: u32
int64 :: i64
uint64 :: u64
lint64 :: i64
ulint64 :: u64
intp :: int
uintp :: uintptr
AppId_t :: c.uint
DepotId_t :: c.uint
RTime32 :: c.uint
SteamAPICall_t :: u64
AccountID_t :: c.uint
PartyBeaconID_t :: u64
HAuthTicket :: c.uint
PFNPreMinidumpCallback :: proc "c" (_: rawptr)
HSteamPipe :: int
HSteamUser :: int
FriendsGroupID_t :: i64
HServerListRequest :: rawptr
HServerQuery :: int
UGCHandle_t :: u64
PublishedFileUpdateHandle_t :: u64
PublishedFileId_t :: u64
UGCFileWriteStreamHandle_t :: u64
SteamLeaderboard_t :: u64
SteamLeaderboardEntries_t :: u64
SNetSocket_t :: c.uint
SNetListenSocket_t :: c.uint
ScreenshotHandle :: c.uint
HTTPRequestHandle :: c.uint
HTTPCookieContainerHandle :: c.uint
InputHandle_t :: u64
InputActionSetHandle_t :: u64
InputDigitalActionHandle_t :: u64
InputAnalogActionHandle_t :: u64
SteamInputActionEventCallbackPointer :: proc "c" (_: ^SteamInputActionEvent_t)
ControllerHandle_t :: u64
ControllerActionSetHandle_t :: u64
ControllerDigitalActionHandle_t :: u64
ControllerAnalogActionHandle_t :: u64
UGCQueryHandle_t :: u64
UGCUpdateHandle_t :: u64
HHTMLBrowser :: c.uint
SteamItemInstanceID_t :: u64
SteamItemDef_t :: int
SteamInventoryResult_t :: int
SteamInventoryUpdateHandle_t :: u64
RemotePlaySessionID_t :: c.uint
FnSteamNetConnectionStatusChanged :: proc "c" (_: ^SteamNetConnectionStatusChangedCallback_t)
FnSteamNetAuthenticationStatusChanged :: proc "c" (_: ^SteamNetAuthenticationStatus_t)
FnSteamRelayNetworkStatusChanged :: proc "c" (_: ^SteamRelayNetworkStatus_t)
FnSteamNetworkingMessagesSessionRequest :: proc "c" (_: ^SteamNetworkingMessagesSessionRequest_t)
FnSteamNetworkingMessagesSessionFailed :: proc "c" (_: ^SteamNetworkingMessagesSessionFailed_t)
FnSteamNetworkingFakeIPResult :: proc "c" (_: ^SteamNetworkingFakeIPResult_t)
HSteamNetConnection :: c.uint
HSteamListenSocket :: c.uint
HSteamNetPollGroup :: c.uint
SteamNetworkingErrMsg :: [1024]u8
SteamNetworkingPOPID :: c.uint
SteamNetworkingMicroseconds :: c.longlong
FSteamNetworkingSocketsDebugOutput :: proc "c" (_: ESteamNetworkingSocketsDebugOutputType, _: cstring)

SteamNetworkingMessage_t :: struct #packed {
	m_pData:            rawptr,
	m_cbSize:           c.int,
	m_conn:             HSteamNetConnection,
	m_identityPeer:     SteamNetworkingIdentity,
	m_nConnUserData:    int64,
	m_usecTimeReceived: SteamNetworkingMicroseconds,
	m_nMessageNumber:   int64,
	m_pfnFreeData:      proc "c" (_: ^SteamNetworkingMessage_t),
	m_pfnRelease:       proc "c" (_: ^SteamNetworkingMessage_t),
	m_nChannel:         c.int,
	m_nFlags:           c.int,
	m_nUserData:        int64,
	m_idxLane:          uint16,
	_pad1__:            uint16,
}

k_UGCHandleInvalid: UGCHandle_t : 0xffffffffffffffff
k_PublishedFileUpdateHandleInvalid: PublishedFileUpdateHandle_t : 0xffffffffffffffff
k_UGCFileStreamHandleInvalid: UGCFileWriteStreamHandle_t : 0xffffffffffffffff
k_UGCQueryHandleInvalid: UGCQueryHandle_t : 0xffffffffffffffff
k_UGCUpdateHandleInvalid: UGCUpdateHandle_t : 0xffffffffffffffff
k_SteamInventoryUpdateHandleInvalid: SteamInventoryUpdateHandle_t : 0xffffffffffffffff
k_SteamDatagramPOPID_dev: SteamNetworkingPOPID : (uint32('d') << 16) | (uint32('e') << 8) | uint32('v')

SteamInputActionEvent_t_AnalogAction_t :: struct {
	actionHandle:     InputAnalogActionHandle_t,
	analogActionData: InputAnalogActionData_t,
}

SteamInputActionEvent_t_DigitalAction_t :: struct {
	actionHandle:      InputDigitalActionHandle_t,
	digitalActionData: InputDigitalActionData_t,
}

SteamInputActionEvent_t :: struct {
	controllerHandle: InputHandle_t,
	eEventType:       ESteamInputActionEventType,
	using actions:    struct #raw_union {
		analogAction:  SteamInputActionEvent_t_AnalogAction_t,
		digitalAction: SteamInputActionEvent_t_DigitalAction_t,
	},
}

@(link_prefix = "SteamAPI_", default_calling_convention = "c")
foreign lib {

	//----------------------------------------------------------------------------------------------------------------------------------------------------------//
	//	Steam API setup & shutdown
	//
	//	These functions manage loading, initializing and shutdown of the steamclient.dll
	//
	//----------------------------------------------------------------------------------------------------------------------------------------------------------//


	// SteamAPI_Init must be called before using any other API functions. If it fails, an
	// error message will be output to the debugger (or stderr) with further information.
	Init :: proc "c" () -> bool ---

	// SteamAPI_Shutdown should be called during process shutdown if possible.
	Shutdown :: proc "c" () ---

	// SteamAPI_RestartAppIfNecessary ensures that your executable was launched through Steam.
	//
	// Returns true if the current process should terminate. Steam is now re-launching your application.
	//
	// Returns false if no action needs to be taken. This means that your executable was started through
	// the Steam client, or a steam_appid.txt file is present in your game's directory (for development).
	// Your current process should continue if false is returned.
	//
	// NOTE: If you use the Steam DRM wrapper on your primary executable file, this check is unnecessary
	// since the DRM wrapper will ensure that your application was launched properly through Steam.
	RestartAppIfNecessary :: proc "c" (unOwnAppID: uint32) ---

	// Many Steam API functions allocate a small amount of thread-local memory for parameter storage.
	// SteamAPI_ReleaseCurrentThreadMemory() will free API memory associated with the calling thread.
	// This function is also called automatically by SteamAPI_RunCallbacks(), so a single-threaded
	// program never needs to explicitly call this function.
	ReleaseCurrentThreadMemory :: proc "c" () ---


	// crash dump recording functions
	WriteMiniDump :: proc "c" (uStructuredExceptionCode: uint32, pvExceptionInfo: rawptr, uBuildID: uint32) ---
	SetMiniDumpComment :: proc "c" (pchMsg: cstring) ---

	//----------------------------------------------------------------------------------------------------------------------------------------------------------//
	//	steamclient.dll private wrapper functions
	//
	//	The following functions are part of abstracting API access to the steamclient.dll, but should only be used in very specific cases
	//----------------------------------------------------------------------------------------------------------------------------------------------------------//

	// SteamAPI_IsSteamRunning() returns true if Steam is currently running
	IsSteamRunning :: proc "c" () -> bool ---

	// returns the filename path of the current running Steam process, used if you need to load an explicit steam dll by name.
	// DEPRECATED - implementation is Windows only, and the path returned is a UTF-8 string which must be converted to UTF-16 for use with Win32 APIs
	SteamAPI_GetSteamInstallPath :: proc "c" () -> cstring ---

	// sets whether or not Steam_RunCallbacks() should do a try {} catch (...) {} around calls to issuing callbacks
	// This is ignored if you are using the manual callback dispatch method
	bTryCatchCallbacks :: proc "c" () ---

	// exists only for backwards compat with code written against older SDKs
	InitSafe :: proc "c" () -> bool ---

	// this should be called before the game initialized the steam APIs
	// pchDate should be of the format "Mmm dd yyyy" (such as from the __ DATE __ macro )
	// pchTime should be of the format "hh:mm:ss" (such as from the __ TIME __ macro )
	// bFullMemoryDumps (Win32 only) -- writes out a uuid-full.dmp in the client/dumps folder
	// pvContext-- can be NULL, will be the void * context passed into m_pfnPreMinidumpCallback
	// PFNPreMinidumpCallback m_pfnPreMinidumpCallback   -- optional callback which occurs just before a .dmp file is written during a crash.  Applications can hook this to allow adding additional information into the .dmp comment stream.
	UseBreakpadCrashHandler :: proc "c" (pchVersion: cstring, pchDate: cstring, pchTime: cstring, bFullMemoryDumps: bool, pvContext: rawptr, m_pfnPreMinidumpCallback: PFNPreMinidumpCallback) ---
	SetBreakpadAppID :: proc "c" (unAppID: uint32) ---

	/// Inform the API that you wish to use manual event dispatch.  This must be called after SteamAPI_Init, but before
	/// you use any of the other manual dispatch functions below.
	ManualDispatch_Init :: proc "c" () ---

	/// Perform certain periodic actions that need to be performed.
	ManualDispatch_RunFrame :: proc "c" (hSteamPipe: HSteamPipe) ---

	/// You must call this after dispatching the callback, if SteamAPI_ManualDispatch_GetNextCallback returns true.
	ManualDispatch_FreeLastCallback :: proc "c" (hSteamPipe: HSteamPipe) ---

	/// Return the call result for the specified call on the specified pipe.  You really should
	/// only call this in a handler for SteamAPICallCompleted_t callback.
	ManualDispatch_GetAPICallResult :: proc "c" (hSteamPipe: HSteamPipe, hSteamAPICall: SteamAPICall_t, pCallback: rawptr, cubCallback: c.int, iCallbackExpected: c.int, pbFailed: ^bool) -> bool ---

}

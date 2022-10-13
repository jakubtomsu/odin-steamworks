package steamworks
import "core:c"

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

package steamworks
import "core:c"
foreign import lib "steam_api64.lib"

intptr :: distinct int

// HACK
CGameID :: uint64

// HACK
CSteamID :: u64

SteamDatagramRelayAuthTicketPtr :: distinct rawptr
INetworkingConnectionSignalingPtr :: distinct rawptr
INetworkingSignalingRecvContextPtr :: distinct rawptr

// ---------
// Constants
// ---------

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

k_uAppIdInvalid: AppId_t : 0x0
k_uDepotIdInvalid: DepotId_t : 0x0
k_uAPICallInvalid: SteamAPICall_t : 0x0
k_ulPartyBeaconIdInvalid: PartyBeaconID_t : 0
k_HAuthTicketInvalid: HAuthTicket : 0
k_unSteamAccountIDMask: c.uint : 0xFFFFFFFF
k_unSteamAccountInstanceMask: c.uint : 0x000FFFFF
k_unSteamUserDefaultInstance: c.uint : 1
k_cchGameExtraInfoMax: c.int : 64
k_cchMaxFriendsGroupName: c.int : 64
k_cFriendsGroupLimit: c.int : 100
k_FriendsGroupID_Invalid: FriendsGroupID_t : -1
k_cEnumerateFollowersMax: c.int : 50
k_cubChatMetadataMax: uint32 : 8192
k_cbMaxGameServerGameDir: c.int : 32
k_cbMaxGameServerMapName: c.int : 32
k_cbMaxGameServerGameDescription: c.int : 64
k_cbMaxGameServerName: c.int : 64
k_cbMaxGameServerTags: c.int : 128
k_cbMaxGameServerGameData: c.int : 2048
HSERVERQUERY_INVALID: c.uint : 0xffffffff
k_unFavoriteFlagNone: uint32 : 0x00
k_unFavoriteFlagFavorite: uint32 : 0x01
k_unFavoriteFlagHistory: uint32 : 0x02
k_unMaxCloudFileChunkSize: uint32 : 100 * 1024 * 1024
k_PublishedFileIdInvalid: PublishedFileId_t : 0
k_cchPublishedDocumentTitleMax: uint32 : 128 + 1
k_cchPublishedDocumentDescriptionMax: uint32 : 8000
k_cchPublishedDocumentChangeDescriptionMax: uint32 : 8000
k_unEnumeratePublishedFilesMaxResults: uint32 : 50
k_cchTagListMax: uint32 : 1024 + 1
k_cchFilenameMax: uint32 : 260
k_cchPublishedFileURLMax: uint32 : 256
k_cubAppProofOfPurchaseKeyMax: c.int : 240
k_nScreenshotMaxTaggedUsers: uint32 : 32
k_nScreenshotMaxTaggedPublishedFiles: uint32 : 32
k_cubUFSTagTypeMax: c.int : 255
k_cubUFSTagValueMax: c.int : 255
k_ScreenshotThumbWidth: c.int : 200
kNumUGCResultsPerPage: uint32 : 50
k_cchDeveloperMetadataMax: uint32 : 5000
INVALID_HTMLBROWSER: uint32 : 0
k_SteamItemInstanceIDInvalid: SteamItemInstanceID_t : ~SteamItemInstanceID_t(0)
k_SteamInventoryResultInvalid: SteamInventoryResult_t : -1
k_HSteamNetConnection_Invalid: HSteamNetConnection : 0
k_HSteamListenSocket_Invalid: HSteamListenSocket : 0
k_HSteamNetPollGroup_Invalid: HSteamNetPollGroup : 0
k_cchMaxSteamNetworkingErrMsg: c.int : 1024
k_cchSteamNetworkingMaxConnectionCloseReason: c.int : 128
k_cchSteamNetworkingMaxConnectionDescription: c.int : 128
k_cchSteamNetworkingMaxConnectionAppName: c.int : 32
k_nSteamNetworkConnectionInfoFlags_Unauthenticated: c.int : 1
k_nSteamNetworkConnectionInfoFlags_Unencrypted: c.int : 2
k_nSteamNetworkConnectionInfoFlags_LoopbackBuffers: c.int : 4
k_nSteamNetworkConnectionInfoFlags_Fast: c.int : 8
k_nSteamNetworkConnectionInfoFlags_Relayed: c.int : 16
k_nSteamNetworkConnectionInfoFlags_DualWifi: c.int : 32
k_cbMaxSteamNetworkingSocketsMessageSizeSend: c.int : 512 * 1024
k_nSteamNetworkingSend_Unreliable: c.int : 0
k_nSteamNetworkingSend_NoNagle: c.int : 1
k_nSteamNetworkingSend_UnreliableNoNagle: c.int : k_nSteamNetworkingSend_Unreliable | k_nSteamNetworkingSend_NoNagle
k_nSteamNetworkingSend_NoDelay: c.int : 4
k_nSteamNetworkingSend_UnreliableNoDelay: c.int : k_nSteamNetworkingSend_Unreliable | k_nSteamNetworkingSend_NoDelay | k_nSteamNetworkingSend_NoNagle
k_nSteamNetworkingSend_Reliable: c.int : 8
k_nSteamNetworkingSend_ReliableNoNagle: c.int : k_nSteamNetworkingSend_Reliable | k_nSteamNetworkingSend_NoNagle
k_nSteamNetworkingSend_UseCurrentThread: c.int : 16
k_nSteamNetworkingSend_AutoRestartBrokenSession: c.int : 32
k_cchMaxSteamNetworkingPingLocationString: c.int : 1024
k_nSteamNetworkingPing_Failed: c.int : -1
k_nSteamNetworkingPing_Unknown: c.int : -2
k_nSteamNetworkingConfig_P2P_Transport_ICE_Enable_Default: c.int : -1
k_nSteamNetworkingConfig_P2P_Transport_ICE_Enable_Disable: c.int : 0
k_nSteamNetworkingConfig_P2P_Transport_ICE_Enable_Relay: c.int : 1
k_nSteamNetworkingConfig_P2P_Transport_ICE_Enable_Private: c.int : 2
k_nSteamNetworkingConfig_P2P_Transport_ICE_Enable_Public: c.int : 4
k_nSteamNetworkingConfig_P2P_Transport_ICE_Enable_All: c.int : 0x7fffffff
STEAMGAMESERVER_QUERY_PORT_SHARED: uint16 : 0xffff
MASTERSERVERUPDATERPORT_USEGAMESOCKETSHARE: uint16 : STEAMGAMESERVER_QUERY_PORT_SHARED
k_cbSteamDatagramMaxSerializedTicket: uint32 : 512
k_cbMaxSteamDatagramGameCoordinatorServerLoginAppData: uint32 : 2048
k_cbMaxSteamDatagramGameCoordinatorServerLoginSerialized: uint32 : 4096
k_cbSteamNetworkingSocketsFakeUDPPortRecommendedMTU: c.int : 1200
k_cbSteamNetworkingSocketsFakeUDPPortMaxMessageSize: c.int : 4096

k_UGCHandleInvalid: UGCHandle_t : 0xffffffffffffffff
k_PublishedFileUpdateHandleInvalid: PublishedFileUpdateHandle_t : 0xffffffffffffffff
k_UGCFileStreamHandleInvalid: UGCFileWriteStreamHandle_t : 0xffffffffffffffff
k_UGCQueryHandleInvalid: UGCQueryHandle_t : 0xffffffffffffffff
k_UGCUpdateHandleInvalid: UGCUpdateHandle_t : 0xffffffffffffffff
k_SteamInventoryUpdateHandleInvalid: SteamInventoryUpdateHandle_t : 0xffffffffffffffff
k_SteamDatagramPOPID_dev: SteamNetworkingPOPID : (uint32('d') << 16) | (uint32('e') << 8) | uint32('v')

// -------
// Structs
// -------

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


SteamServersConnected_t :: struct #packed {}

SteamServerConnectFailure_t :: struct #packed {
	m_eResult:        EResult,
	m_bStillRetrying: bool,
}

SteamServersDisconnected_t :: struct #packed {
	m_eResult: EResult,
}

ClientGameServerDeny_t :: struct #packed {
	m_uAppID:           uint32,
	m_unGameServerIP:   uint32,
	m_usGameServerPort: uint16,
	m_bSecure:          uint16,
	m_uReason:          uint32,
}

IPCFailure_t :: struct #packed {
	m_eFailureType: uint8,
}

LicensesUpdated_t :: struct #packed {}

ValidateAuthTicketResponse_t :: struct #packed {
	m_SteamID:              CSteamID,
	m_eAuthSessionResponse: EAuthSessionResponse,
	m_OwnerSteamID:         CSteamID,
}

MicroTxnAuthorizationResponse_t :: struct #packed {
	m_unAppID:     uint32,
	m_ulOrderID:   uint64,
	m_bAuthorized: uint8,
}

EncryptedAppTicketResponse_t :: struct #packed {
	m_eResult: EResult,
}

GetAuthSessionTicketResponse_t :: struct #packed {
	m_hAuthTicket: HAuthTicket,
	m_eResult:     EResult,
}

GameWebCallback_t :: struct #packed {
	m_szURL: [256]u8,
}

StoreAuthURLResponse_t :: struct #packed {
	m_szURL: [512]u8,
}

MarketEligibilityResponse_t :: struct #packed {
	m_bAllowed:                   bool,
	m_eNotAllowedReason:          EMarketNotAllowedReasonFlags,
	m_rtAllowedAtTime:            RTime32,
	m_cdaySteamGuardRequiredDays: c.int,
	m_cdayNewDeviceCooldown:      c.int,
}

DurationControl_t :: struct #packed {
	m_eResult:        EResult,
	m_appid:          AppId_t,
	m_bApplicable:    bool,
	m_csecsLast5h:    int32,
	m_progress:       EDurationControlProgress,
	m_notification:   EDurationControlNotification,
	m_csecsToday:     int32,
	m_csecsRemaining: int32,
}

PersonaStateChange_t :: struct #packed {
	m_ulSteamID:    uint64,
	m_nChangeFlags: c.int,
}

GameOverlayActivated_t :: struct #packed {
	m_bActive: uint8,
}

GameServerChangeRequested_t :: struct #packed {
	m_rgchServer:   [64]u8,
	m_rgchPassword: [64]u8,
}

GameLobbyJoinRequested_t :: struct #packed {
	m_steamIDLobby:  CSteamID,
	m_steamIDFriend: CSteamID,
}

AvatarImageLoaded_t :: struct #packed {
	m_steamID: CSteamID,
	m_iImage:  c.int,
	m_iWide:   c.int,
	m_iTall:   c.int,
}

ClanOfficerListResponse_t :: struct #packed {
	m_steamIDClan: CSteamID,
	m_cOfficers:   c.int,
	m_bSuccess:    uint8,
}

FriendRichPresenceUpdate_t :: struct #packed {
	m_steamIDFriend: CSteamID,
	m_nAppID:        AppId_t,
}

GameRichPresenceJoinRequested_t :: struct #packed {
	m_steamIDFriend: CSteamID,
	m_rgchConnect:   [256]u8,
}

GameConnectedClanChatMsg_t :: struct #packed {
	m_steamIDClanChat: CSteamID,
	m_steamIDUser:     CSteamID,
	m_iMessageID:      c.int,
}

GameConnectedChatJoin_t :: struct #packed {
	m_steamIDClanChat: CSteamID,
	m_steamIDUser:     CSteamID,
}

GameConnectedChatLeave_t :: struct #packed {
	m_steamIDClanChat: CSteamID,
	m_steamIDUser:     CSteamID,
	m_bKicked:         bool,
	m_bDropped:        bool,
}

DownloadClanActivityCountsResult_t :: struct #packed {
	m_bSuccess: bool,
}

JoinClanChatRoomCompletionResult_t :: struct #packed {
	m_steamIDClanChat:        CSteamID,
	m_eChatRoomEnterResponse: EChatRoomEnterResponse,
}

GameConnectedFriendChatMsg_t :: struct #packed {
	m_steamIDUser: CSteamID,
	m_iMessageID:  c.int,
}

FriendsGetFollowerCount_t :: struct #packed {
	m_eResult: EResult,
	m_steamID: CSteamID,
	m_nCount:  c.int,
}

FriendsIsFollowing_t :: struct #packed {
	m_eResult:      EResult,
	m_steamID:      CSteamID,
	m_bIsFollowing: bool,
}

FriendsEnumerateFollowingList_t :: struct #packed {
	m_eResult:           EResult,
	m_rgSteamID:         [50]CSteamID,
	m_nResultsReturned:  int32,
	m_nTotalResultCount: int32,
}

SetPersonaNameResponse_t :: struct #packed {
	m_bSuccess:      bool,
	m_bLocalSuccess: bool,
	m_result:        EResult,
}

UnreadChatMessagesChanged_t :: struct #packed {}

OverlayBrowserProtocolNavigation_t :: struct #packed {
	rgchURI: [1024]u8,
}

EquippedProfileItemsChanged_t :: struct #packed {
	m_steamID: CSteamID,
}

EquippedProfileItems_t :: struct #packed {
	m_eResult:                   EResult,
	m_steamID:                   CSteamID,
	m_bHasAnimatedAvatar:        bool,
	m_bHasAvatarFrame:           bool,
	m_bHasProfileModifier:       bool,
	m_bHasProfileBackground:     bool,
	m_bHasMiniProfileBackground: bool,
}

IPCountry_t :: struct #packed {}

LowBatteryPower_t :: struct #packed {
	m_nMinutesBatteryLeft: uint8,
}

SteamAPICallCompleted_t :: struct #packed {
	m_hAsyncCall: SteamAPICall_t,
	m_iCallback:  c.int,
	m_cubParam:   uint32,
}

SteamShutdown_t :: struct #packed {}

CheckFileSignature_t :: struct #packed {
	m_eCheckFileSignature: ECheckFileSignature,
}

GamepadTextInputDismissed_t :: struct #packed {
	m_bSubmitted:      bool,
	m_unSubmittedText: uint32,
}

AppResumingFromSuspend_t :: struct #packed {}

f32ingGamepadTextInputDismissed_t :: struct #packed {}

FavoritesListChanged_t :: struct #packed {
	m_nIP:         uint32,
	m_nQueryPort:  uint32,
	m_nConnPort:   uint32,
	m_nAppID:      uint32,
	m_nFlags:      uint32,
	m_bAdd:        bool,
	m_unAccountId: AccountID_t,
}

LobbyInvite_t :: struct #packed {
	m_ulSteamIDUser:  uint64,
	m_ulSteamIDLobby: uint64,
	m_ulGameID:       uint64,
}

LobbyEnter_t :: struct #packed {
	m_ulSteamIDLobby:         uint64,
	m_rgfChatPermissions:     uint32,
	m_bLocked:                bool,
	m_EChatRoomEnterResponse: uint32,
}

LobbyDataUpdate_t :: struct #packed {
	m_ulSteamIDLobby:  uint64,
	m_ulSteamIDMember: uint64,
	m_bSuccess:        uint8,
}

LobbyChatUpdate_t :: struct #packed {
	m_ulSteamIDLobby:           uint64,
	m_ulSteamIDUserChanged:     uint64,
	m_ulSteamIDMakingChange:    uint64,
	m_rgfChatMemberStateChange: uint32,
}

LobbyChatMsg_t :: struct #packed {
	m_ulSteamIDLobby: uint64,
	m_ulSteamIDUser:  uint64,
	m_eChatEntryType: uint8,
	m_iChatID:        uint32,
}

LobbyGameCreated_t :: struct #packed {
	m_ulSteamIDLobby:      uint64,
	m_ulSteamIDGameServer: uint64,
	m_unIP:                uint32,
	m_usPort:              uint16,
}

LobbyMatchList_t :: struct #packed {
	m_nLobbiesMatching: uint32,
}

LobbyKicked_t :: struct #packed {
	m_ulSteamIDLobby:         uint64,
	m_ulSteamIDAdmin:         uint64,
	m_bKickedDueToDisconnect: uint8,
}

LobbyCreated_t :: struct #packed {
	m_eResult:        EResult,
	m_ulSteamIDLobby: uint64,
}

PSNGameBootInviteResult_t :: struct #packed {
	m_bGameBootInviteExists: bool,
	m_steamIDLobby:          CSteamID,
}

FavoritesListAccountsUpdated_t :: struct #packed {
	m_eResult: EResult,
}

SearchForGameProgressCallback_t :: struct #packed {
	m_ullSearchID:               uint64,
	m_eResult:                   EResult,
	m_lobbyID:                   CSteamID,
	m_steamIDEndedSearch:        CSteamID,
	m_nSecondsRemainingEstimate: int32,
	m_cPlayersSearching:         int32,
}

SearchForGameResultCallback_t :: struct #packed {
	m_ullSearchID:         uint64,
	m_eResult:             EResult,
	m_nCountPlayersInGame: int32,
	m_nCountAcceptedGame:  int32,
	m_steamIDHost:         CSteamID,
	m_bFinalCallback:      bool,
}

RequestPlayersForGameProgressCallback_t :: struct #packed {
	m_eResult:     EResult,
	m_ullSearchID: uint64,
}

RequestPlayersForGameResultCallback_t :: struct #packed {
	m_eResult:                   EResult,
	m_ullSearchID:               uint64,
	m_SteamIDPlayerFound:        CSteamID,
	m_SteamIDLobby:              CSteamID,
	m_ePlayerAcceptState:        RequestPlayersForGameResultCallback_t_PlayerAcceptState_t,
	m_nPlayerIndex:              int32,
	m_nTotalPlayersFound:        int32,
	m_nTotalPlayersAcceptedGame: int32,
	m_nSuggestedTeamIndex:       int32,
	m_ullUniqueGameID:           uint64,
}

RequestPlayersForGameResultCallback_t_PlayerAcceptState_t :: enum {
	k_EStateUnknown        = 0,
	k_EStatePlayerAccepted = 1,
	k_EStatePlayerDeclined = 2,
}

RequestPlayersForGameFinalResultCallback_t :: struct #packed {
	m_eResult:         EResult,
	m_ullSearchID:     uint64,
	m_ullUniqueGameID: uint64,
}

SubmitPlayerResultResultCallback_t :: struct #packed {
	m_eResult:       EResult,
	ullUniqueGameID: uint64,
	steamIDPlayer:   CSteamID,
}

EndGameResultCallback_t :: struct #packed {
	m_eResult:       EResult,
	ullUniqueGameID: uint64,
}

JoinPartyCallback_t :: struct #packed {
	m_eResult:            EResult,
	m_ulBeaconID:         PartyBeaconID_t,
	m_SteamIDBeaconOwner: CSteamID,
	m_rgchConnectString:  [256]u8,
}

CreateBeaconCallback_t :: struct #packed {
	m_eResult:    EResult,
	m_ulBeaconID: PartyBeaconID_t,
}

ReservationNotificationCallback_t :: struct #packed {
	m_ulBeaconID:    PartyBeaconID_t,
	m_steamIDJoiner: CSteamID,
}

ChangeNumOpenSlotsCallback_t :: struct #packed {
	m_eResult: EResult,
}

AvailableBeaconLocationsUpdated_t :: struct #packed {}

ActiveBeaconsUpdated_t :: struct #packed {}

RemoteStorageFileShareResult_t :: struct #packed {
	m_eResult:      EResult,
	m_hFile:        UGCHandle_t,
	m_rgchFilename: [260]u8,
}

RemoteStoragePublishFileResult_t :: struct #packed {
	m_eResult:                                  EResult,
	m_nPublishedFileId:                         PublishedFileId_t,
	m_bUserNeedsToAcceptWorkshopLegalAgreement: bool,
}

RemoteStorageDeletePublishedFileResult_t :: struct #packed {
	m_eResult:          EResult,
	m_nPublishedFileId: PublishedFileId_t,
}

RemoteStorageEnumerateUserPublishedFilesResult_t :: struct #packed {
	m_eResult:           EResult,
	m_nResultsReturned:  int32,
	m_nTotalResultCount: int32,
	m_rgPublishedFileId: [50]PublishedFileId_t,
}

RemoteStorageSubscribePublishedFileResult_t :: struct #packed {
	m_eResult:          EResult,
	m_nPublishedFileId: PublishedFileId_t,
}

RemoteStorageEnumerateUserSubscribedFilesResult_t :: struct #packed {
	m_eResult:           EResult,
	m_nResultsReturned:  int32,
	m_nTotalResultCount: int32,
	m_rgPublishedFileId: [50]PublishedFileId_t,
	m_rgRTimeSubscribed: [50]uint32,
}

RemoteStorageUnsubscribePublishedFileResult_t :: struct #packed {
	m_eResult:          EResult,
	m_nPublishedFileId: PublishedFileId_t,
}

RemoteStorageUpdatePublishedFileResult_t :: struct #packed {
	m_eResult:                                  EResult,
	m_nPublishedFileId:                         PublishedFileId_t,
	m_bUserNeedsToAcceptWorkshopLegalAgreement: bool,
}

RemoteStorageDownloadUGCResult_t :: struct #packed {
	m_eResult:        EResult,
	m_hFile:          UGCHandle_t,
	m_nAppID:         AppId_t,
	m_nSizeInBytes:   int32,
	m_pchFileName:    [260]u8,
	m_ulSteamIDOwner: uint64,
}

RemoteStorageGetPublishedFileDetailsResult_t :: struct #packed {
	m_eResult:          EResult,
	m_nPublishedFileId: PublishedFileId_t,
	m_nCreatorAppID:    AppId_t,
	m_nConsumerAppID:   AppId_t,
	m_rgchTitle:        [129]u8,
	m_rgchDescription:  [8000]u8,
	m_hFile:            UGCHandle_t,
	m_hPreviewFile:     UGCHandle_t,
	m_ulSteamIDOwner:   uint64,
	m_rtimeCreated:     uint32,
	m_rtimeUpdated:     uint32,
	m_eVisibility:      ERemoteStoragePublishedFileVisibility,
	m_bBanned:          bool,
	m_rgchTags:         [1025]u8,
	m_bTagsTruncated:   bool,
	m_pchFileName:      [260]u8,
	m_nFileSize:        int32,
	m_nPreviewFileSize: int32,
	m_rgchURL:          [256]u8,
	m_eFileType:        EWorkshopFileType,
	m_bAcceptedForUse:  bool,
}

RemoteStorageEnumerateWorkshopFilesResult_t :: struct #packed {
	m_eResult:           EResult,
	m_nResultsReturned:  int32,
	m_nTotalResultCount: int32,
	m_rgPublishedFileId: [50]PublishedFileId_t,
	m_rgScore:           [50]f32,
	m_nAppId:            AppId_t,
	m_unStartIndex:      uint32,
}

RemoteStorageGetPublishedItemVoteDetailsResult_t :: struct #packed {
	m_eResult:           EResult,
	m_unPublishedFileId: PublishedFileId_t,
	m_nVotesFor:         int32,
	m_nVotesAgainst:     int32,
	m_nReports:          int32,
	m_fScore:            f32,
}

RemoteStoragePublishedFileSubscribed_t :: struct #packed {
	m_nPublishedFileId: PublishedFileId_t,
	m_nAppID:           AppId_t,
}

RemoteStoragePublishedFileUnsubscribed_t :: struct #packed {
	m_nPublishedFileId: PublishedFileId_t,
	m_nAppID:           AppId_t,
}

RemoteStoragePublishedFileDeleted_t :: struct #packed {
	m_nPublishedFileId: PublishedFileId_t,
	m_nAppID:           AppId_t,
}

RemoteStorageUpdateUserPublishedItemVoteResult_t :: struct #packed {
	m_eResult:          EResult,
	m_nPublishedFileId: PublishedFileId_t,
}

RemoteStorageUserVoteDetails_t :: struct #packed {
	m_eResult:          EResult,
	m_nPublishedFileId: PublishedFileId_t,
	m_eVote:            EWorkshopVote,
}

RemoteStorageEnumerateUserSharedWorkshopFilesResult_t :: struct #packed {
	m_eResult:           EResult,
	m_nResultsReturned:  int32,
	m_nTotalResultCount: int32,
	m_rgPublishedFileId: [50]PublishedFileId_t,
}

RemoteStorageSetUserPublishedFileActionResult_t :: struct #packed {
	m_eResult:          EResult,
	m_nPublishedFileId: PublishedFileId_t,
	m_eAction:          EWorkshopFileAction,
}

RemoteStorageEnumeratePublishedFilesByUserActionResult_t :: struct #packed {
	m_eResult:           EResult,
	m_eAction:           EWorkshopFileAction,
	m_nResultsReturned:  int32,
	m_nTotalResultCount: int32,
	m_rgPublishedFileId: [50]PublishedFileId_t,
	m_rgRTimeUpdated:    [50]uint32,
}

RemoteStoragePublishFileProgress_t :: struct #packed {
	m_dPercentFile: f64,
	m_bPreview:     bool,
}

RemoteStoragePublishedFileUpdated_t :: struct #packed {
	m_nPublishedFileId: PublishedFileId_t,
	m_nAppID:           AppId_t,
	m_ulUnused:         uint64,
}

RemoteStorageFileWriteAsyncComplete_t :: struct #packed {
	m_eResult: EResult,
}

RemoteStorageFileReadAsyncComplete_t :: struct #packed {
	m_hFileReadAsync: SteamAPICall_t,
	m_eResult:        EResult,
	m_nOffset:        uint32,
	m_cubRead:        uint32,
}

RemoteStorageLocalFileChange_t :: struct #packed {}

UserStatsReceived_t :: struct #packed {
	m_nGameID:     uint64,
	m_eResult:     EResult,
	m_steamIDUser: CSteamID,
}

UserStatsStored_t :: struct #packed {
	m_nGameID: uint64,
	m_eResult: EResult,
}

UserAchievementStored_t :: struct #packed {
	m_nGameID:             uint64,
	m_bGroupAchievement:   bool,
	m_rgchAchievementName: [128]u8,
	m_nCurProgress:        uint32,
	m_nMaxProgress:        uint32,
}

LeaderboardFindResult_t :: struct #packed {
	m_hSteamLeaderboard: SteamLeaderboard_t,
	m_bLeaderboardFound: uint8,
}

LeaderboardScoresDownloaded_t :: struct #packed {
	m_hSteamLeaderboard:        SteamLeaderboard_t,
	m_hSteamLeaderboardEntries: SteamLeaderboardEntries_t,
	m_cEntryCount:              c.int,
}

LeaderboardScoreUploaded_t :: struct #packed {
	m_bSuccess:            uint8,
	m_hSteamLeaderboard:   SteamLeaderboard_t,
	m_nScore:              int32,
	m_bScoreChanged:       uint8,
	m_nGlobalRankNew:      c.int,
	m_nGlobalRankPrevious: c.int,
}

NumberOfCurrentPlayers_t :: struct #packed {
	m_bSuccess: uint8,
	m_cPlayers: int32,
}

UserStatsUnloaded_t :: struct #packed {
	m_steamIDUser: CSteamID,
}

UserAchievementIconFetched_t :: struct #packed {
	m_nGameID:             CGameID,
	m_rgchAchievementName: [128]u8,
	m_bAchieved:           bool,
	m_nIconHandle:         c.int,
}

GlobalAchievementPercentagesReady_t :: struct #packed {
	m_nGameID: uint64,
	m_eResult: EResult,
}

LeaderboardUGCSet_t :: struct #packed {
	m_eResult:           EResult,
	m_hSteamLeaderboard: SteamLeaderboard_t,
}

PS3TrophiesInstalled_t :: struct #packed {
	m_nGameID:             uint64,
	m_eResult:             EResult,
	m_ulRequiredDiskSpace: uint64,
}

GlobalStatsReceived_t :: struct #packed {
	m_nGameID: uint64,
	m_eResult: EResult,
}

DlcInstalled_t :: struct #packed {
	m_nAppID: AppId_t,
}

RegisterActivationCodeResponse_t :: struct #packed {
	m_eResult:             ERegisterActivationCodeResult,
	m_unPackageRegistered: uint32,
}

NewUrlLaunchParameters_t :: struct #packed {}

AppProofOfPurchaseKeyResponse_t :: struct #packed {
	m_eResult:      EResult,
	m_nAppID:       uint32,
	m_cchKeyLength: uint32,
	m_rgchKey:      [240]u8,
}

FileDetailsResult_t :: struct #packed {
	m_eResult:    EResult,
	m_ulFileSize: uint64,
	m_FileSHA:    [20]uint8,
	m_unFlags:    uint32,
}

TimedTrialStatus_t :: struct #packed {
	m_unAppID:          AppId_t,
	m_bIsOffline:       bool,
	m_unSecondsAllowed: uint32,
	m_unSecondsPlayed:  uint32,
}

P2PSessionRequest_t :: struct #packed {
	m_steamIDRemote: CSteamID,
}

P2PSessionConnectFail_t :: struct #packed {
	m_steamIDRemote:    CSteamID,
	m_eP2PSessionError: uint8,
}

SocketStatusCallback_t :: struct #packed {
	m_hSocket:          SNetSocket_t,
	m_hListenSocket:    SNetListenSocket_t,
	m_steamIDRemote:    CSteamID,
	m_eSNetSocketState: c.int,
}

ScreenshotReady_t :: struct #packed {
	m_hLocal:  ScreenshotHandle,
	m_eResult: EResult,
}

ScreenshotRequested_t :: struct #packed {}

PlaybackStatusHasChanged_t :: struct #packed {}

VolumeHasChanged_t :: struct #packed {
	m_flNewVolume: f32,
}

MusicPlayerRemoteWillActivate_t :: struct #packed {}

MusicPlayerRemoteWillDeactivate_t :: struct #packed {}

MusicPlayerRemoteToFront_t :: struct #packed {}

MusicPlayerWillQuit_t :: struct #packed {}

MusicPlayerWantsPlay_t :: struct #packed {}

MusicPlayerWantsPause_t :: struct #packed {}

MusicPlayerWantsPlayPrevious_t :: struct #packed {}

MusicPlayerWantsPlayNext_t :: struct #packed {}

MusicPlayerWantsShuffled_t :: struct #packed {
	m_bShuffled: bool,
}

MusicPlayerWantsLooped_t :: struct #packed {
	m_bLooped: bool,
}

MusicPlayerWantsVolume_t :: struct #packed {
	m_flNewVolume: f32,
}

MusicPlayerSelectsQueueEntry_t :: struct #packed {
	nID: c.int,
}

MusicPlayerSelectsPlaylistEntry_t :: struct #packed {
	nID: c.int,
}

MusicPlayerWantsPlayingRepeatStatus_t :: struct #packed {
	m_nPlayingRepeatStatus: c.int,
}

HTTPRequestCompleted_t :: struct #packed {
	m_hRequest:           HTTPRequestHandle,
	m_ulContextValue:     uint64,
	m_bRequestSuccessful: bool,
	m_eStatusCode:        EHTTPStatusCode,
	m_unBodySize:         uint32,
}

HTTPRequestHeadersReceived_t :: struct #packed {
	m_hRequest:       HTTPRequestHandle,
	m_ulContextValue: uint64,
}

HTTPRequestDataReceived_t :: struct #packed {
	m_hRequest:       HTTPRequestHandle,
	m_ulContextValue: uint64,
	m_cOffset:        uint32,
	m_cBytesReceived: uint32,
}

SteamInputDeviceConnected_t :: struct #packed {
	m_ulConnectedDeviceHandle: InputHandle_t,
}

SteamInputDeviceDisconnected_t :: struct #packed {
	m_ulDisconnectedDeviceHandle: InputHandle_t,
}

SteamInputConfigurationLoaded_t :: struct #packed {
	m_unAppID:            AppId_t,
	m_ulDeviceHandle:     InputHandle_t,
	m_ulMappingCreator:   CSteamID,
	m_unMajorRevision:    uint32,
	m_unMinorRevision:    uint32,
	m_bUsesSteamInputAPI: bool,
	m_bUsesGamepadAPI:    bool,
}

SteamUGCQueryCompleted_t :: struct #packed {
	m_handle:                 UGCQueryHandle_t,
	m_eResult:                EResult,
	m_unNumResultsReturned:   uint32,
	m_unTotalMatchingResults: uint32,
	m_bCachedData:            bool,
	m_rgchNextCursor:         [256]u8,
}

SteamUGCRequestUGCDetailsResult_t :: struct #packed {
	m_details:     SteamUGCDetails_t,
	m_bCachedData: bool,
}

CreateItemResult_t :: struct #packed {
	m_eResult:                                  EResult,
	m_nPublishedFileId:                         PublishedFileId_t,
	m_bUserNeedsToAcceptWorkshopLegalAgreement: bool,
}

SubmitItemUpdateResult_t :: struct #packed {
	m_eResult:                                  EResult,
	m_bUserNeedsToAcceptWorkshopLegalAgreement: bool,
	m_nPublishedFileId:                         PublishedFileId_t,
}

ItemInstalled_t :: struct #packed {
	m_unAppID:          AppId_t,
	m_nPublishedFileId: PublishedFileId_t,
}

DownloadItemResult_t :: struct #packed {
	m_unAppID:          AppId_t,
	m_nPublishedFileId: PublishedFileId_t,
	m_eResult:          EResult,
}

UserFavoriteItemsListChanged_t :: struct #packed {
	m_nPublishedFileId: PublishedFileId_t,
	m_eResult:          EResult,
	m_bWasAddRequest:   bool,
}

SetUserItemVoteResult_t :: struct #packed {
	m_nPublishedFileId: PublishedFileId_t,
	m_eResult:          EResult,
	m_bVoteUp:          bool,
}

GetUserItemVoteResult_t :: struct #packed {
	m_nPublishedFileId: PublishedFileId_t,
	m_eResult:          EResult,
	m_bVotedUp:         bool,
	m_bVotedDown:       bool,
	m_bVoteSkipped:     bool,
}

StartPlaytimeTrackingResult_t :: struct #packed {
	m_eResult: EResult,
}

StopPlaytimeTrackingResult_t :: struct #packed {
	m_eResult: EResult,
}

AddUGCDependencyResult_t :: struct #packed {
	m_eResult:               EResult,
	m_nPublishedFileId:      PublishedFileId_t,
	m_nChildPublishedFileId: PublishedFileId_t,
}

RemoveUGCDependencyResult_t :: struct #packed {
	m_eResult:               EResult,
	m_nPublishedFileId:      PublishedFileId_t,
	m_nChildPublishedFileId: PublishedFileId_t,
}

AddAppDependencyResult_t :: struct #packed {
	m_eResult:          EResult,
	m_nPublishedFileId: PublishedFileId_t,
	m_nAppID:           AppId_t,
}

RemoveAppDependencyResult_t :: struct #packed {
	m_eResult:          EResult,
	m_nPublishedFileId: PublishedFileId_t,
	m_nAppID:           AppId_t,
}

GetAppDependenciesResult_t :: struct #packed {
	m_eResult:                  EResult,
	m_nPublishedFileId:         PublishedFileId_t,
	m_rgAppIDs:                 [32]AppId_t,
	m_nNumAppDependencies:      uint32,
	m_nTotalNumAppDependencies: uint32,
}

DeleteItemResult_t :: struct #packed {
	m_eResult:          EResult,
	m_nPublishedFileId: PublishedFileId_t,
}

UserSubscribedItemsListChanged_t :: struct #packed {
	m_nAppID: AppId_t,
}

WorkshopEULAStatus_t :: struct #packed {
	m_eResult:      EResult,
	m_nAppID:       AppId_t,
	m_unVersion:    uint32,
	m_rtAction:     RTime32,
	m_bAccepted:    bool,
	m_bNeedsAction: bool,
}

SteamAppInstalled_t :: struct #packed {
	m_nAppID:              AppId_t,
	m_iInstallFolderIndex: c.int,
}

SteamAppUninstalled_t :: struct #packed {
	m_nAppID:              AppId_t,
	m_iInstallFolderIndex: c.int,
}

HTML_BrowserReady_t :: struct #packed {
	unBrowserHandle: HHTMLBrowser,
}

HTML_NeedsPaint_t :: struct #packed {
	unBrowserHandle: HHTMLBrowser,
	pBGRA:           cstring,
	unWide:          uint32,
	unTall:          uint32,
	unUpdateX:       uint32,
	unUpdateY:       uint32,
	unUpdateWide:    uint32,
	unUpdateTall:    uint32,
	unScrollX:       uint32,
	unScrollY:       uint32,
	flPageScale:     f32,
	unPageSerial:    uint32,
}

HTML_StartRequest_t :: struct #packed {
	unBrowserHandle: HHTMLBrowser,
	pchURL:          cstring,
	pchTarget:       cstring,
	pchPostData:     cstring,
	bIsRedirect:     bool,
}

HTML_CloseBrowser_t :: struct #packed {
	unBrowserHandle: HHTMLBrowser,
}

HTML_URLChanged_t :: struct #packed {
	unBrowserHandle: HHTMLBrowser,
	pchURL:          cstring,
	pchPostData:     cstring,
	bIsRedirect:     bool,
	pchPageTitle:    cstring,
	bNewNavigation:  bool,
}

HTML_FinishedRequest_t :: struct #packed {
	unBrowserHandle: HHTMLBrowser,
	pchURL:          cstring,
	pchPageTitle:    cstring,
}

HTML_OpenLinkInNewTab_t :: struct #packed {
	unBrowserHandle: HHTMLBrowser,
	pchURL:          cstring,
}

HTML_ChangedTitle_t :: struct #packed {
	unBrowserHandle: HHTMLBrowser,
	pchTitle:        cstring,
}

HTML_SearchResults_t :: struct #packed {
	unBrowserHandle: HHTMLBrowser,
	unResults:       uint32,
	unCurrentMatch:  uint32,
}

HTML_CanGoBackAndForward_t :: struct #packed {
	unBrowserHandle: HHTMLBrowser,
	bCanGoBack:      bool,
	bCanGoForward:   bool,
}

HTML_HorizontalScroll_t :: struct #packed {
	unBrowserHandle: HHTMLBrowser,
	unScrollMax:     uint32,
	unScrollCurrent: uint32,
	flPageScale:     f32,
	bVisible:        bool,
	unPageSize:      uint32,
}

HTML_VerticalScroll_t :: struct #packed {
	unBrowserHandle: HHTMLBrowser,
	unScrollMax:     uint32,
	unScrollCurrent: uint32,
	flPageScale:     f32,
	bVisible:        bool,
	unPageSize:      uint32,
}

HTML_LinkAtPosition_t :: struct #packed {
	unBrowserHandle: HHTMLBrowser,
	x:               uint32,
	y:               uint32,
	pchURL:          cstring,
	bInput:          bool,
	bLiveLink:       bool,
}

HTML_JSAlert_t :: struct #packed {
	unBrowserHandle: HHTMLBrowser,
	pchMessage:      cstring,
}

HTML_JSConfirm_t :: struct #packed {
	unBrowserHandle: HHTMLBrowser,
	pchMessage:      cstring,
}

HTML_FileOpenDialog_t :: struct #packed {
	unBrowserHandle: HHTMLBrowser,
	pchTitle:        cstring,
	pchInitialFile:  cstring,
}

HTML_NewWindow_t :: struct #packed {
	unBrowserHandle:                  HHTMLBrowser,
	pchURL:                           cstring,
	unX:                              uint32,
	unY:                              uint32,
	unWide:                           uint32,
	unTall:                           uint32,
	unNewWindow_BrowserHandle_IGNORE: HHTMLBrowser,
}

HTML_SetCursor_t :: struct #packed {
	unBrowserHandle: HHTMLBrowser,
	eMouseCursor:    uint32,
}

HTML_StatusText_t :: struct #packed {
	unBrowserHandle: HHTMLBrowser,
	pchMsg:          cstring,
}

HTML_ShowToolTip_t :: struct #packed {
	unBrowserHandle: HHTMLBrowser,
	pchMsg:          cstring,
}

HTML_UpdateToolTip_t :: struct #packed {
	unBrowserHandle: HHTMLBrowser,
	pchMsg:          cstring,
}

HTML_HideToolTip_t :: struct #packed {
	unBrowserHandle: HHTMLBrowser,
}

HTML_BrowserRestarted_t :: struct #packed {
	unBrowserHandle:    HHTMLBrowser,
	unOldBrowserHandle: HHTMLBrowser,
}

SteamInventoryResultReady_t :: struct #packed {
	m_handle: SteamInventoryResult_t,
	m_result: EResult,
}

SteamInventoryFullUpdate_t :: struct #packed {
	m_handle: SteamInventoryResult_t,
}

SteamInventoryDefinitionUpdate_t :: struct #packed {}

SteamInventoryEligiblePromoItemDefIDs_t :: struct #packed {
	m_result:                   EResult,
	m_steamID:                  CSteamID,
	m_numEligiblePromoItemDefs: c.int,
	m_bCachedData:              bool,
}

SteamInventoryStartPurchaseResult_t :: struct #packed {
	m_result:    EResult,
	m_ulOrderID: uint64,
	m_ulTransID: uint64,
}

SteamInventoryRequestPricesResult_t :: struct #packed {
	m_result:       EResult,
	m_rgchCurrency: [4]u8,
}

GetVideoURLResult_t :: struct #packed {
	m_eResult:      EResult,
	m_unVideoAppID: AppId_t,
	m_rgchURL:      [256]u8,
}

GetOPFSettingsResult_t :: struct #packed {
	m_eResult:      EResult,
	m_unVideoAppID: AppId_t,
}

SteamParentalSettingsChanged_t :: struct #packed {}

SteamRemotePlaySessionConnected_t :: struct #packed {
	m_unSessionID: RemotePlaySessionID_t,
}

SteamRemotePlaySessionDisconnected_t :: struct #packed {
	m_unSessionID: RemotePlaySessionID_t,
}

SteamNetworkingMessagesSessionRequest_t :: struct #packed {
	m_identityRemote: SteamNetworkingIdentity,
}

SteamNetworkingMessagesSessionFailed_t :: struct #packed {
	m_info: SteamNetConnectionInfo_t,
}

SteamNetConnectionStatusChangedCallback_t :: struct #packed {
	m_hConn:     HSteamNetConnection,
	m_info:      SteamNetConnectionInfo_t,
	m_eOldState: ESteamNetworkingConnectionState,
}

SteamNetAuthenticationStatus_t :: struct #packed {
	m_eAvail:   ESteamNetworkingAvailability,
	m_debugMsg: [256]u8,
}

SteamRelayNetworkStatus_t :: struct #packed {
	m_eAvail:                     ESteamNetworkingAvailability,
	m_bPingMeasurementInProgress: c.int,
	m_eAvailNetworkConfig:        ESteamNetworkingAvailability,
	m_eAvailAnyRelay:             ESteamNetworkingAvailability,
	m_debugMsg:                   [256]u8,
}

GSClientApprove_t :: struct #packed {
	m_SteamID:      CSteamID,
	m_OwnerSteamID: CSteamID,
}

GSClientDeny_t :: struct #packed {
	m_SteamID:          CSteamID,
	m_eDenyReason:      EDenyReason,
	m_rgchOptionalText: [128]u8,
}

GSClientKick_t :: struct #packed {
	m_SteamID:     CSteamID,
	m_eDenyReason: EDenyReason,
}

GSClientAchievementStatus_t :: struct #packed {
	m_SteamID:        uint64,
	m_pchAchievement: [128]u8,
	m_bUnlocked:      bool,
}

GSPolicyResponse_t :: struct #packed {
	m_bSecure: uint8,
}

GSGameplayStats_t :: struct #packed {
	m_eResult:              EResult,
	m_nRank:                int32,
	m_unTotalConnects:      uint32,
	m_unTotalMinutesPlayed: uint32,
}

GSClientGroupStatus_t :: struct #packed {
	m_SteamIDUser:  CSteamID,
	m_SteamIDGroup: CSteamID,
	m_bMember:      bool,
	m_bOfficer:     bool,
}

GSReputation_t :: struct #packed {
	m_eResult:           EResult,
	m_unReputationScore: uint32,
	m_bBanned:           bool,
	m_unBannedIP:        uint32,
	m_usBannedPort:      uint16,
	m_ulBannedGameID:    uint64,
	m_unBanExpires:      uint32,
}

AssociateWithClanResult_t :: struct #packed {
	m_eResult: EResult,
}

ComputeNewPlayerCompatibilityResult_t :: struct #packed {
	m_eResult:                           EResult,
	m_cPlayersThatDontLikeCandidate:     c.int,
	m_cPlayersThatCandidateDoesntLike:   c.int,
	m_cClanPlayersThatDontLikeCandidate: c.int,
	m_SteamIDCandidate:                  CSteamID,
}

GSStatsReceived_t :: struct #packed {
	m_eResult:     EResult,
	m_steamIDUser: CSteamID,
}

GSStatsStored_t :: struct #packed {
	m_eResult:     EResult,
	m_steamIDUser: CSteamID,
}

GSStatsUnloaded_t :: struct #packed {
	m_steamIDUser: CSteamID,
}

SteamNetworkingFakeIPResult_t :: struct #packed {
	m_eResult:  EResult,
	m_identity: SteamNetworkingIdentity,
	m_unIP:     uint32,
	m_unPorts:  [8]uint16,
}

// -----
// Enums
// -----

CGameID_EGameIDType :: enum {
	k_EGameIDTypeApp      = 0,
	k_EGameIDTypeGameMod  = 1,
	k_EGameIDTypeShortcut = 2,
	k_EGameIDTypeP2P      = 3,
}

ESteamIPType :: enum {
	k_ESteamIPTypeIPv4 = 0,
	k_ESteamIPTypeIPv6 = 1,
}

EUniverse :: enum {
	k_EUniverseInvalid  = 0,
	k_EUniversePublic   = 1,
	k_EUniverseBeta     = 2,
	k_EUniverseInternal = 3,
	k_EUniverseDev      = 4,
	k_EUniverseMax      = 5,
}

EResult :: enum {
	k_EResultNone                                    = 0,
	k_EResultOK                                      = 1,
	k_EResultFail                                    = 2,
	k_EResultNoConnection                            = 3,
	k_EResultInvalidPassword                         = 5,
	k_EResultLoggedInElsewhere                       = 6,
	k_EResultInvalidProtocolVer                      = 7,
	k_EResultInvalidParam                            = 8,
	k_EResultFileNotFound                            = 9,
	k_EResultBusy                                    = 10,
	k_EResultInvalidState                            = 11,
	k_EResultInvalidName                             = 12,
	k_EResultInvalidEmail                            = 13,
	k_EResultDuplicateName                           = 14,
	k_EResultAccessDenied                            = 15,
	k_EResultTimeout                                 = 16,
	k_EResultBanned                                  = 17,
	k_EResultAccountNotFound                         = 18,
	k_EResultInvalidSteamID                          = 19,
	k_EResultServiceUnavailable                      = 20,
	k_EResultNotLoggedOn                             = 21,
	k_EResultPending                                 = 22,
	k_EResultEncryptionFailure                       = 23,
	k_EResultInsufficientPrivilege                   = 24,
	k_EResultLimitExceeded                           = 25,
	k_EResultRevoked                                 = 26,
	k_EResultExpired                                 = 27,
	k_EResultAlreadyRedeemed                         = 28,
	k_EResultDuplicateRequest                        = 29,
	k_EResultAlreadyOwned                            = 30,
	k_EResultIPNotFound                              = 31,
	k_EResultPersistFailed                           = 32,
	k_EResultLockingFailed                           = 33,
	k_EResultLogonSessionReplaced                    = 34,
	k_EResultConnectFailed                           = 35,
	k_EResultHandshakeFailed                         = 36,
	k_EResultIOFailure                               = 37,
	k_EResultRemoteDisconnect                        = 38,
	k_EResultShoppingCartNotFound                    = 39,
	k_EResultBlocked                                 = 40,
	k_EResultIgnored                                 = 41,
	k_EResultNoMatch                                 = 42,
	k_EResultAccountDisabled                         = 43,
	k_EResultServiceReadOnly                         = 44,
	k_EResultAccountNotFeatured                      = 45,
	k_EResultAdministratorOK                         = 46,
	k_EResultContentVersion                          = 47,
	k_EResultTryAnotherCM                            = 48,
	k_EResultPasswordRequiredToKickSession           = 49,
	k_EResultAlreadyLoggedInElsewhere                = 50,
	k_EResultSuspended                               = 51,
	k_EResultCancelled                               = 52,
	k_EResultDataCorruption                          = 53,
	k_EResultDiskFull                                = 54,
	k_EResultRemoteCallFailed                        = 55,
	k_EResultPasswordUnset                           = 56,
	k_EResultExternalAccountUnlinked                 = 57,
	k_EResultPSNTicketInvalid                        = 58,
	k_EResultExternalAccountAlreadyLinked            = 59,
	k_EResultRemoteFileConflict                      = 60,
	k_EResultIllegalPassword                         = 61,
	k_EResultSameAsPreviousValue                     = 62,
	k_EResultAccountLogonDenied                      = 63,
	k_EResultCannotUseOldPassword                    = 64,
	k_EResultInvalidLoginAuthCode                    = 65,
	k_EResultAccountLogonDeniedNoMail                = 66,
	k_EResultHardwareNotCapableOfIPT                 = 67,
	k_EResultIPTInitError                            = 68,
	k_EResultParentalControlRestricted               = 69,
	k_EResultFacebookQueryError                      = 70,
	k_EResultExpiredLoginAuthCode                    = 71,
	k_EResultIPLoginRestrictionFailed                = 72,
	k_EResultAccountLockedDown                       = 73,
	k_EResultAccountLogonDeniedVerifiedEmailRequired = 74,
	k_EResultNoMatchingURL                           = 75,
	k_EResultBadResponse                             = 76,
	k_EResultRequirePasswordReEntry                  = 77,
	k_EResultValueOutOfRange                         = 78,
	k_EResultUnexpectedError                         = 79,
	k_EResultDisabled                                = 80,
	k_EResultInvalidCEGSubmission                    = 81,
	k_EResultRestrictedDevice                        = 82,
	k_EResultRegionLocked                            = 83,
	k_EResultRateLimitExceeded                       = 84,
	k_EResultAccountLoginDeniedNeedTwoFactor         = 85,
	k_EResultItemDeleted                             = 86,
	k_EResultAccountLoginDeniedThrottle              = 87,
	k_EResultTwoFactorCodeMismatch                   = 88,
	k_EResultTwoFactorActivationCodeMismatch         = 89,
	k_EResultAccountAssociatedToMultiplePartners     = 90,
	k_EResultNotModified                             = 91,
	k_EResultNoMobileDevice                          = 92,
	k_EResultTimeNotSynced                           = 93,
	k_EResultSmsCodeFailed                           = 94,
	k_EResultAccountLimitExceeded                    = 95,
	k_EResultAccountActivityLimitExceeded            = 96,
	k_EResultPhoneActivityLimitExceeded              = 97,
	k_EResultRefundToWallet                          = 98,
	k_EResultEmailSendFailure                        = 99,
	k_EResultNotSettled                              = 100,
	k_EResultNeedCaptcha                             = 101,
	k_EResultGSLTDenied                              = 102,
	k_EResultGSOwnerDenied                           = 103,
	k_EResultInvalidItemType                         = 104,
	k_EResultIPBanned                                = 105,
	k_EResultGSLTExpired                             = 106,
	k_EResultInsufficientFunds                       = 107,
	k_EResultTooManyPending                          = 108,
	k_EResultNoSiteLicensesFound                     = 109,
	k_EResultWGNetworkSendExceeded                   = 110,
	k_EResultAccountNotFriends                       = 111,
	k_EResultLimitedUserAccount                      = 112,
	k_EResultCantRemoveItem                          = 113,
	k_EResultAccountDeleted                          = 114,
	k_EResultExistingUserCancelledLicense            = 115,
	k_EResultCommunityCooldown                       = 116,
	k_EResultNoLauncherSpecified                     = 117,
	k_EResultMustAgreeToSSA                          = 118,
	k_EResultLauncherMigrated                        = 119,
	k_EResultSteamRealmMismatch                      = 120,
	k_EResultInvalidSignature                        = 121,
	k_EResultParseFailure                            = 122,
	k_EResultNoVerifiedPhone                         = 123,
	k_EResultInsufficientBattery                     = 124,
	k_EResultChargerRequired                         = 125,
	k_EResultCachedCredentialInvalid                 = 126,
	K_EResultPhoneNumberIsVOIP                       = 127,
}

EVoiceResult :: enum {
	k_EVoiceResultOK                   = 0,
	k_EVoiceResultNotInitialized       = 1,
	k_EVoiceResultNotRecording         = 2,
	k_EVoiceResultNoData               = 3,
	k_EVoiceResultBufferTooSmall       = 4,
	k_EVoiceResultDataCorrupted        = 5,
	k_EVoiceResultRestricted           = 6,
	k_EVoiceResultUnsupportedCodec     = 7,
	k_EVoiceResultReceiverOutOfDate    = 8,
	k_EVoiceResultReceiverDidNotAnswer = 9,
}

EDenyReason :: enum {
	k_EDenyInvalid                 = 0,
	k_EDenyInvalidVersion          = 1,
	k_EDenyGeneric                 = 2,
	k_EDenyNotLoggedOn             = 3,
	k_EDenyNoLicense               = 4,
	k_EDenyCheater                 = 5,
	k_EDenyLoggedInElseWhere       = 6,
	k_EDenyUnknownText             = 7,
	k_EDenyIncompatibleAnticheat   = 8,
	k_EDenyMemoryCorruption        = 9,
	k_EDenyIncompatibleSoftware    = 10,
	k_EDenySteamConnectionLost     = 11,
	k_EDenySteamConnectionError    = 12,
	k_EDenySteamResponseTimedOut   = 13,
	k_EDenySteamValidationStalled  = 14,
	k_EDenySteamOwnerLeftGuestUser = 15,
}

EBeginAuthSessionResult :: enum {
	k_EBeginAuthSessionResultOK               = 0,
	k_EBeginAuthSessionResultInvalidTicket    = 1,
	k_EBeginAuthSessionResultDuplicateRequest = 2,
	k_EBeginAuthSessionResultInvalidVersion   = 3,
	k_EBeginAuthSessionResultGameMismatch     = 4,
	k_EBeginAuthSessionResultExpiredTicket    = 5,
}

EAuthSessionResponse :: enum {
	k_EAuthSessionResponseOK                           = 0,
	k_EAuthSessionResponseUserNotConnectedToSteam      = 1,
	k_EAuthSessionResponseNoLicenseOrExpired           = 2,
	k_EAuthSessionResponseVACBanned                    = 3,
	k_EAuthSessionResponseLoggedInElseWhere            = 4,
	k_EAuthSessionResponseVACCheckTimedOut             = 5,
	k_EAuthSessionResponseAuthTicketCanceled           = 6,
	k_EAuthSessionResponseAuthTicketInvalidAlreadyUsed = 7,
	k_EAuthSessionResponseAuthTicketInvalid            = 8,
	k_EAuthSessionResponsePublisherIssuedBan           = 9,
}

EUserHasLicenseForAppResult :: enum {
	k_EUserHasLicenseResultHasLicense         = 0,
	k_EUserHasLicenseResultDoesNotHaveLicense = 1,
	k_EUserHasLicenseResultNoAuth             = 2,
}

EAccountType :: enum {
	k_EAccountTypeInvalid        = 0,
	k_EAccountTypeIndividual     = 1,
	k_EAccountTypeMultiseat      = 2,
	k_EAccountTypeGameServer     = 3,
	k_EAccountTypeAnonGameServer = 4,
	k_EAccountTypePending        = 5,
	k_EAccountTypeContentServer  = 6,
	k_EAccountTypeClan           = 7,
	k_EAccountTypeChat           = 8,
	k_EAccountTypeConsoleUser    = 9,
	k_EAccountTypeAnonUser       = 10,
	k_EAccountTypeMax            = 11,
}

EChatEntryType :: enum {
	k_EChatEntryTypeInvalid          = 0,
	k_EChatEntryTypeChatMsg          = 1,
	k_EChatEntryTypeTyping           = 2,
	k_EChatEntryTypeInviteGame       = 3,
	k_EChatEntryTypeEmote            = 4,
	k_EChatEntryTypeLeftConversation = 6,
	k_EChatEntryTypeEntered          = 7,
	k_EChatEntryTypeWasKicked        = 8,
	k_EChatEntryTypeWasBanned        = 9,
	k_EChatEntryTypeDisconnected     = 10,
	k_EChatEntryTypeHistoricalChat   = 11,
	k_EChatEntryTypeLinkBlocked      = 14,
}

EChatRoomEnterResponse :: enum {
	k_EChatRoomEnterResponseSuccess           = 1,
	k_EChatRoomEnterResponseDoesntExist       = 2,
	k_EChatRoomEnterResponseNotAllowed        = 3,
	k_EChatRoomEnterResponseFull              = 4,
	k_EChatRoomEnterResponseError             = 5,
	k_EChatRoomEnterResponseBanned            = 6,
	k_EChatRoomEnterResponseLimited           = 7,
	k_EChatRoomEnterResponseClanDisabled      = 8,
	k_EChatRoomEnterResponseCommunityBan      = 9,
	k_EChatRoomEnterResponseMemberBlockedYou  = 10,
	k_EChatRoomEnterResponseYouBlockedMember  = 11,
	k_EChatRoomEnterResponseRatelimitExceeded = 15,
}

EChatSteamIDInstanceFlags :: enum {
	k_EChatAccountInstanceMask  = 4095,
	k_EChatInstanceFlagClan     = 524288,
	k_EChatInstanceFlagLobby    = 262144,
	k_EChatInstanceFlagMMSLobby = 131072,
}

ENotificationPosition :: enum {
	k_EPositionTopLeft     = 0,
	k_EPositionTopRight    = 1,
	k_EPositionBottomLeft  = 2,
	k_EPositionBottomRight = 3,
}

EBroadcastUploadResult :: enum {
	k_EBroadcastUploadResultNone              = 0,
	k_EBroadcastUploadResultOK                = 1,
	k_EBroadcastUploadResultInitFailed        = 2,
	k_EBroadcastUploadResultFrameFailed       = 3,
	k_EBroadcastUploadResultTimeout           = 4,
	k_EBroadcastUploadResultBandwidthExceeded = 5,
	k_EBroadcastUploadResultLowFPS            = 6,
	k_EBroadcastUploadResultMissingKeyFrames  = 7,
	k_EBroadcastUploadResultNoConnection      = 8,
	k_EBroadcastUploadResultRelayFailed       = 9,
	k_EBroadcastUploadResultSettingsChanged   = 10,
	k_EBroadcastUploadResultMissingAudio      = 11,
	k_EBroadcastUploadResultTooFarBehind      = 12,
	k_EBroadcastUploadResultTranscodeBehind   = 13,
	k_EBroadcastUploadResultNotAllowedToPlay  = 14,
	k_EBroadcastUploadResultBusy              = 15,
	k_EBroadcastUploadResultBanned            = 16,
	k_EBroadcastUploadResultAlreadyActive     = 17,
	k_EBroadcastUploadResultForcedOff         = 18,
	k_EBroadcastUploadResultAudioBehind       = 19,
	k_EBroadcastUploadResultShutdown          = 20,
	k_EBroadcastUploadResultDisconnect        = 21,
	k_EBroadcastUploadResultVideoInitFailed   = 22,
	k_EBroadcastUploadResultAudioInitFailed   = 23,
}

EMarketNotAllowedReasonFlags :: enum {
	k_EMarketNotAllowedReason_None                             = 0,
	k_EMarketNotAllowedReason_TemporaryFailure                 = 1,
	k_EMarketNotAllowedReason_AccountDisabled                  = 2,
	k_EMarketNotAllowedReason_AccountLockedDown                = 4,
	k_EMarketNotAllowedReason_AccountLimited                   = 8,
	k_EMarketNotAllowedReason_TradeBanned                      = 16,
	k_EMarketNotAllowedReason_AccountNotTrusted                = 32,
	k_EMarketNotAllowedReason_SteamGuardNotEnabled             = 64,
	k_EMarketNotAllowedReason_SteamGuardOnlyRecentlyEnabled    = 128,
	k_EMarketNotAllowedReason_RecentPasswordReset              = 256,
	k_EMarketNotAllowedReason_NewPaymentMethod                 = 512,
	k_EMarketNotAllowedReason_InvalidCookie                    = 1024,
	k_EMarketNotAllowedReason_UsingNewDevice                   = 2048,
	k_EMarketNotAllowedReason_RecentSelfRefund                 = 4096,
	k_EMarketNotAllowedReason_NewPaymentMethodCannotBeVerified = 8192,
	k_EMarketNotAllowedReason_NoRecentPurchases                = 16384,
	k_EMarketNotAllowedReason_AcceptedWalletGift               = 32768,
}

EDurationControlProgress :: enum {
	k_EDurationControlProgress_Full   = 0,
	k_EDurationControlProgress_Half   = 1,
	k_EDurationControlProgress_None   = 2,
	k_EDurationControl_ExitSoon_3h    = 3,
	k_EDurationControl_ExitSoon_5h    = 4,
	k_EDurationControl_ExitSoon_Night = 5,
}

EDurationControlNotification :: enum {
	k_EDurationControlNotification_None           = 0,
	k_EDurationControlNotification_1Hour          = 1,
	k_EDurationControlNotification_3Hours         = 2,
	k_EDurationControlNotification_HalfProgress   = 3,
	k_EDurationControlNotification_NoProgress     = 4,
	k_EDurationControlNotification_ExitSoon_3h    = 5,
	k_EDurationControlNotification_ExitSoon_5h    = 6,
	k_EDurationControlNotification_ExitSoon_Night = 7,
}

EDurationControlOnlineState :: enum {
	k_EDurationControlOnlineState_Invalid       = 0,
	k_EDurationControlOnlineState_Offline       = 1,
	k_EDurationControlOnlineState_Online        = 2,
	k_EDurationControlOnlineState_OnlineHighPri = 3,
}

EGameSearchErrorCode_t :: enum {
	k_EGameSearchErrorCode_OK                                = 1,
	k_EGameSearchErrorCode_Failed_Search_Already_In_Progress = 2,
	k_EGameSearchErrorCode_Failed_No_Search_In_Progress      = 3,
	k_EGameSearchErrorCode_Failed_Not_Lobby_Leader           = 4,
	k_EGameSearchErrorCode_Failed_No_Host_Available          = 5,
	k_EGameSearchErrorCode_Failed_Search_Params_Invalid      = 6,
	k_EGameSearchErrorCode_Failed_Offline                    = 7,
	k_EGameSearchErrorCode_Failed_NotAuthorized              = 8,
	k_EGameSearchErrorCode_Failed_Unknown_Error              = 9,
}

EPlayerResult_t :: enum {
	k_EPlayerResultFailedToConnect = 1,
	k_EPlayerResultAbandoned       = 2,
	k_EPlayerResultKicked          = 3,
	k_EPlayerResultIncomplete      = 4,
	k_EPlayerResultCompleted       = 5,
}

ESteamIPv6ConnectivityProtocol :: enum {
	k_ESteamIPv6ConnectivityProtocol_Invalid = 0,
	k_ESteamIPv6ConnectivityProtocol_HTTP    = 1,
	k_ESteamIPv6ConnectivityProtocol_UDP     = 2,
}

ESteamIPv6ConnectivityState :: enum {
	k_ESteamIPv6ConnectivityState_Unknown = 0,
	k_ESteamIPv6ConnectivityState_Good    = 1,
	k_ESteamIPv6ConnectivityState_Bad     = 2,
}

EFriendRelationship :: enum {
	k_EFriendRelationshipNone                 = 0,
	k_EFriendRelationshipBlocked              = 1,
	k_EFriendRelationshipRequestRecipient     = 2,
	k_EFriendRelationshipFriend               = 3,
	k_EFriendRelationshipRequestInitiator     = 4,
	k_EFriendRelationshipIgnored              = 5,
	k_EFriendRelationshipIgnoredFriend        = 6,
	k_EFriendRelationshipSuggested_DEPRECATED = 7,
	k_EFriendRelationshipMax                  = 8,
}

EPersonaState :: enum {
	k_EPersonaStateOffline        = 0,
	k_EPersonaStateOnline         = 1,
	k_EPersonaStateBusy           = 2,
	k_EPersonaStateAway           = 3,
	k_EPersonaStateSnooze         = 4,
	k_EPersonaStateLookingToTrade = 5,
	k_EPersonaStateLookingToPlay  = 6,
	k_EPersonaStateInvisible      = 7,
	k_EPersonaStateMax            = 8,
}

EFriendFlags :: enum {
	k_EFriendFlagNone                 = 0,
	k_EFriendFlagBlocked              = 1,
	k_EFriendFlagFriendshipRequested  = 2,
	k_EFriendFlagImmediate            = 4,
	k_EFriendFlagClanMember           = 8,
	k_EFriendFlagOnGameServer         = 16,
	k_EFriendFlagRequestingFriendship = 128,
	k_EFriendFlagRequestingInfo       = 256,
	k_EFriendFlagIgnored              = 512,
	k_EFriendFlagIgnoredFriend        = 1024,
	k_EFriendFlagChatMember           = 4096,
	k_EFriendFlagAll                  = 65535,
}

EUserRestriction :: enum {
	k_nUserRestrictionNone        = 0,
	k_nUserRestrictionUnknown     = 1,
	k_nUserRestrictionAnyChat     = 2,
	k_nUserRestrictionVoiceChat   = 4,
	k_nUserRestrictionGroupChat   = 8,
	k_nUserRestrictionRating      = 16,
	k_nUserRestrictionGameInvites = 32,
	k_nUserRestrictionTrading     = 64,
}

EOverlayToStoreFlag :: enum {
	k_EOverlayToStoreFlag_None             = 0,
	k_EOverlayToStoreFlag_AddToCart        = 1,
	k_EOverlayToStoreFlag_AddToCartAndShow = 2,
}

EActivateGameOverlayToWebPageMode :: enum {
	k_EActivateGameOverlayToWebPageMode_Default = 0,
	k_EActivateGameOverlayToWebPageMode_Modal   = 1,
}

ECommunityProfileItemType :: enum {
	k_ECommunityProfileItemType_AnimatedAvatar        = 0,
	k_ECommunityProfileItemType_AvatarFrame           = 1,
	k_ECommunityProfileItemType_ProfileModifier       = 2,
	k_ECommunityProfileItemType_ProfileBackground     = 3,
	k_ECommunityProfileItemType_MiniProfileBackground = 4,
}

ECommunityProfileItemProperty :: enum {
	k_ECommunityProfileItemProperty_ImageSmall     = 0,
	k_ECommunityProfileItemProperty_ImageLarge     = 1,
	k_ECommunityProfileItemProperty_InternalName   = 2,
	k_ECommunityProfileItemProperty_Title          = 3,
	k_ECommunityProfileItemProperty_Description    = 4,
	k_ECommunityProfileItemProperty_AppID          = 5,
	k_ECommunityProfileItemProperty_TypeID         = 6,
	k_ECommunityProfileItemProperty_Class          = 7,
	k_ECommunityProfileItemProperty_MovieWebM      = 8,
	k_ECommunityProfileItemProperty_MovieMP4       = 9,
	k_ECommunityProfileItemProperty_MovieWebMSmall = 10,
	k_ECommunityProfileItemProperty_MovieMP4Small  = 11,
}

EPersonaChange :: enum {
	k_EPersonaChangeName                = 1,
	k_EPersonaChangeStatus              = 2,
	k_EPersonaChangeComeOnline          = 4,
	k_EPersonaChangeGoneOffline         = 8,
	k_EPersonaChangeGamePlayed          = 16,
	k_EPersonaChangeGameServer          = 32,
	k_EPersonaChangeAvatar              = 64,
	k_EPersonaChangeJoinedSource        = 128,
	k_EPersonaChangeLeftSource          = 256,
	k_EPersonaChangeRelationshipChanged = 512,
	k_EPersonaChangeNameFirstSet        = 1024,
	k_EPersonaChangeBroadcast           = 2048,
	k_EPersonaChangeNickname            = 4096,
	k_EPersonaChangeSteamLevel          = 8192,
	k_EPersonaChangeRichPresence        = 16384,
}

ESteamAPICallFailure :: enum {
	k_ESteamAPICallFailureNone               = -1,
	k_ESteamAPICallFailureSteamGone          = 0,
	k_ESteamAPICallFailureNetworkFailure     = 1,
	k_ESteamAPICallFailureInvalidHandle      = 2,
	k_ESteamAPICallFailureMismatchedCallback = 3,
}

EGamepadTextInputMode :: enum {
	k_EGamepadTextInputModeNormal   = 0,
	k_EGamepadTextInputModePassword = 1,
}

EGamepadTextInputLineMode :: enum {
	k_EGamepadTextInputLineModeSingleLine    = 0,
	k_EGamepadTextInputLineModeMultipleLines = 1,
}

Ef32ingGamepadTextInputMode :: enum {
	k_Ef32ingGamepadTextInputModeModeSingleLine    = 0,
	k_Ef32ingGamepadTextInputModeModeMultipleLines = 1,
	k_Ef32ingGamepadTextInputModeModeEmail         = 2,
	k_Ef32ingGamepadTextInputModeModeNumeric       = 3,
}

ETextFilteringContext :: enum {
	k_ETextFilteringContextUnknown     = 0,
	k_ETextFilteringContextGameContent = 1,
	k_ETextFilteringContextChat        = 2,
	k_ETextFilteringContextName        = 3,
}

ECheckFileSignature :: enum {
	k_ECheckFileSignatureInvalidSignature             = 0,
	k_ECheckFileSignatureValidSignature               = 1,
	k_ECheckFileSignatureFileNotFound                 = 2,
	k_ECheckFileSignatureNoSignaturesFoundForThisApp  = 3,
	k_ECheckFileSignatureNoSignaturesFoundForThisFile = 4,
}

EMatchMakingServerResponse :: enum {
	eServerResponded               = 0,
	eServerFailedToRespond         = 1,
	eNoServersListedOnMasterServer = 2,
}

ELobbyType :: enum {
	k_ELobbyTypePrivate       = 0,
	k_ELobbyTypeFriendsOnly   = 1,
	k_ELobbyTypePublic        = 2,
	k_ELobbyTypeInvisible     = 3,
	k_ELobbyTypePrivateUnique = 4,
}

ELobbyComparison :: enum {
	k_ELobbyComparisonEqualToOrLessThan    = -2,
	k_ELobbyComparisonLessThan             = -1,
	k_ELobbyComparisonEqual                = 0,
	k_ELobbyComparisonGreaterThan          = 1,
	k_ELobbyComparisonEqualToOrGreaterThan = 2,
	k_ELobbyComparisonNotEqual             = 3,
}

ELobbyDistanceFilter :: enum {
	k_ELobbyDistanceFilterClose     = 0,
	k_ELobbyDistanceFilterDefault   = 1,
	k_ELobbyDistanceFilterFar       = 2,
	k_ELobbyDistanceFilterWorldwide = 3,
}

EChatMemberStateChange :: enum {
	k_EChatMemberStateChangeEntered      = 1,
	k_EChatMemberStateChangeLeft         = 2,
	k_EChatMemberStateChangeDisconnected = 4,
	k_EChatMemberStateChangeKicked       = 8,
	k_EChatMemberStateChangeBanned       = 16,
}

ESteamPartyBeaconLocationType :: enum {
	k_ESteamPartyBeaconLocationType_Invalid   = 0,
	k_ESteamPartyBeaconLocationType_ChatGroup = 1,
	k_ESteamPartyBeaconLocationType_Max       = 2,
}

ESteamPartyBeaconLocationData :: enum {
	k_ESteamPartyBeaconLocationDataInvalid       = 0,
	k_ESteamPartyBeaconLocationDataName          = 1,
	k_ESteamPartyBeaconLocationDataIconURLSmall  = 2,
	k_ESteamPartyBeaconLocationDataIconURLMedium = 3,
	k_ESteamPartyBeaconLocationDataIconURLLarge  = 4,
}

ERemoteStoragePlatform :: enum {
	k_ERemoteStoragePlatformNone    = 0,
	k_ERemoteStoragePlatformWindows = 1,
	k_ERemoteStoragePlatformOSX     = 2,
	k_ERemoteStoragePlatformPS3     = 4,
	k_ERemoteStoragePlatformLinux   = 8,
	k_ERemoteStoragePlatformSwitch  = 16,
	k_ERemoteStoragePlatformAndroid = 32,
	k_ERemoteStoragePlatformIOS     = 64,
	k_ERemoteStoragePlatformAll     = -1,
}

ERemoteStoragePublishedFileVisibility :: enum {
	k_ERemoteStoragePublishedFileVisibilityPublic      = 0,
	k_ERemoteStoragePublishedFileVisibilityFriendsOnly = 1,
	k_ERemoteStoragePublishedFileVisibilityPrivate     = 2,
	k_ERemoteStoragePublishedFileVisibilityUnlisted    = 3,
}

EWorkshopFileType :: enum {
	k_EWorkshopFileTypeFirst                  = 0,
	k_EWorkshopFileTypeCommunity              = 0,
	k_EWorkshopFileTypeMicrotransaction       = 1,
	k_EWorkshopFileTypeCollection             = 2,
	k_EWorkshopFileTypeArt                    = 3,
	k_EWorkshopFileTypeVideo                  = 4,
	k_EWorkshopFileTypeScreenshot             = 5,
	k_EWorkshopFileTypeGame                   = 6,
	k_EWorkshopFileTypeSoftware               = 7,
	k_EWorkshopFileTypeConcept                = 8,
	k_EWorkshopFileTypeWebGuide               = 9,
	k_EWorkshopFileTypeIntegratedGuide        = 10,
	k_EWorkshopFileTypeMerch                  = 11,
	k_EWorkshopFileTypeControllerBinding      = 12,
	k_EWorkshopFileTypeSteamworksAccessInvite = 13,
	k_EWorkshopFileTypeSteamVideo             = 14,
	k_EWorkshopFileTypeGameManagedItem        = 15,
	k_EWorkshopFileTypeMax                    = 16,
}

EWorkshopVote :: enum {
	k_EWorkshopVoteUnvoted = 0,
	k_EWorkshopVoteFor     = 1,
	k_EWorkshopVoteAgainst = 2,
	k_EWorkshopVoteLater   = 3,
}

EWorkshopFileAction :: enum {
	k_EWorkshopFileActionPlayed    = 0,
	k_EWorkshopFileActionCompleted = 1,
}

EWorkshopEnumerationType :: enum {
	k_EWorkshopEnumerationTypeRankedByVote            = 0,
	k_EWorkshopEnumerationTypeRecent                  = 1,
	k_EWorkshopEnumerationTypeTrending                = 2,
	k_EWorkshopEnumerationTypeFavoritesOfFriends      = 3,
	k_EWorkshopEnumerationTypeVotedByFriends          = 4,
	k_EWorkshopEnumerationTypeContentByFriends        = 5,
	k_EWorkshopEnumerationTypeRecentFromFollowedUsers = 6,
}

EWorkshopVideoProvider :: enum {
	k_EWorkshopVideoProviderNone    = 0,
	k_EWorkshopVideoProviderYoutube = 1,
}

EUGCReadAction :: enum {
	k_EUGCRead_ContinueReadingUntilFinished = 0,
	k_EUGCRead_ContinueReading              = 1,
	k_EUGCRead_Close                        = 2,
}

ERemoteStorageLocalFileChange :: enum {
	k_ERemoteStorageLocalFileChange_Invalid     = 0,
	k_ERemoteStorageLocalFileChange_FileUpdated = 1,
	k_ERemoteStorageLocalFileChange_FileDeleted = 2,
}

ERemoteStorageFilePathType :: enum {
	k_ERemoteStorageFilePathType_Invalid     = 0,
	k_ERemoteStorageFilePathType_Absolute    = 1,
	k_ERemoteStorageFilePathType_APIFilename = 2,
}

ELeaderboardDataRequest :: enum {
	k_ELeaderboardDataRequestGlobal           = 0,
	k_ELeaderboardDataRequestGlobalAroundUser = 1,
	k_ELeaderboardDataRequestFriends          = 2,
	k_ELeaderboardDataRequestUsers            = 3,
}

ELeaderboardSortMethod :: enum {
	k_ELeaderboardSortMethodNone       = 0,
	k_ELeaderboardSortMethodAscending  = 1,
	k_ELeaderboardSortMethodDescending = 2,
}

ELeaderboardDisplayType :: enum {
	k_ELeaderboardDisplayTypeNone             = 0,
	k_ELeaderboardDisplayTypeNumeric          = 1,
	k_ELeaderboardDisplayTypeTimeSeconds      = 2,
	k_ELeaderboardDisplayTypeTimeMilliSeconds = 3,
}

ELeaderboardUploadScoreMethod :: enum {
	k_ELeaderboardUploadScoreMethodNone        = 0,
	k_ELeaderboardUploadScoreMethodKeepBest    = 1,
	k_ELeaderboardUploadScoreMethodForceUpdate = 2,
}

ERegisterActivationCodeResult :: enum {
	k_ERegisterActivationCodeResultOK                = 0,
	k_ERegisterActivationCodeResultFail              = 1,
	k_ERegisterActivationCodeResultAlreadyRegistered = 2,
	k_ERegisterActivationCodeResultTimeout           = 3,
	k_ERegisterActivationCodeAlreadyOwned            = 4,
}

EP2PSessionError :: enum {
	k_EP2PSessionErrorNone                           = 0,
	k_EP2PSessionErrorNoRightsToApp                  = 2,
	k_EP2PSessionErrorTimeout                        = 4,
	k_EP2PSessionErrorNotRunningApp_DELETED          = 1,
	k_EP2PSessionErrorDestinationNotLoggedIn_DELETED = 3,
	k_EP2PSessionErrorMax                            = 5,
}

EP2PSend :: enum {
	k_EP2PSendUnreliable            = 0,
	k_EP2PSendUnreliableNoDelay     = 1,
	k_EP2PSendReliable              = 2,
	k_EP2PSendReliableWithBuffering = 3,
}

ESNetSocketState :: enum {
	k_ESNetSocketStateInvalid                  = 0,
	k_ESNetSocketStateConnected                = 1,
	k_ESNetSocketStateInitiated                = 10,
	k_ESNetSocketStateLocalCandidatesFound     = 11,
	k_ESNetSocketStateReceivedRemoteCandidates = 12,
	k_ESNetSocketStateChallengeHandshake       = 15,
	k_ESNetSocketStateDisconnecting            = 21,
	k_ESNetSocketStateLocalDisconnect          = 22,
	k_ESNetSocketStateTimeoutDuringConnect     = 23,
	k_ESNetSocketStateRemoteEndDisconnected    = 24,
	k_ESNetSocketStateConnectionBroken         = 25,
}

ESNetSocketConnectionType :: enum {
	k_ESNetSocketConnectionTypeNotConnected = 0,
	k_ESNetSocketConnectionTypeUDP          = 1,
	k_ESNetSocketConnectionTypeUDPRelay     = 2,
}

EVRScreenshotType :: enum {
	k_EVRScreenshotType_None           = 0,
	k_EVRScreenshotType_Mono           = 1,
	k_EVRScreenshotType_Stereo         = 2,
	k_EVRScreenshotType_MonoCubemap    = 3,
	k_EVRScreenshotType_MonoPanorama   = 4,
	k_EVRScreenshotType_StereoPanorama = 5,
}

AudioPlayback_Status :: enum {
	AudioPlayback_Undefined = 0,
	AudioPlayback_Playing   = 1,
	AudioPlayback_Paused    = 2,
	AudioPlayback_Idle      = 3,
}

EHTTPMethod :: enum {
	k_EHTTPMethodInvalid = 0,
	k_EHTTPMethodGET     = 1,
	k_EHTTPMethodHEAD    = 2,
	k_EHTTPMethodPOST    = 3,
	k_EHTTPMethodPUT     = 4,
	k_EHTTPMethodDELETE  = 5,
	k_EHTTPMethodOPTIONS = 6,
	k_EHTTPMethodPATCH   = 7,
}

EHTTPStatusCode :: enum {
	k_EHTTPStatusCodeInvalid                         = 0,
	k_EHTTPStatusCode100Continue                     = 100,
	k_EHTTPStatusCode101SwitchingProtocols           = 101,
	k_EHTTPStatusCode200OK                           = 200,
	k_EHTTPStatusCode201Created                      = 201,
	k_EHTTPStatusCode202Accepted                     = 202,
	k_EHTTPStatusCode203NonAuthoritative             = 203,
	k_EHTTPStatusCode204NoContent                    = 204,
	k_EHTTPStatusCode205ResetContent                 = 205,
	k_EHTTPStatusCode206PartialContent               = 206,
	k_EHTTPStatusCode300MultipleChoices              = 300,
	k_EHTTPStatusCode301MovedPermanently             = 301,
	k_EHTTPStatusCode302Found                        = 302,
	k_EHTTPStatusCode303SeeOther                     = 303,
	k_EHTTPStatusCode304NotModified                  = 304,
	k_EHTTPStatusCode305UseProxy                     = 305,
	k_EHTTPStatusCode307TemporaryRedirect            = 307,
	k_EHTTPStatusCode400BadRequest                   = 400,
	k_EHTTPStatusCode401Unauthorized                 = 401,
	k_EHTTPStatusCode402PaymentRequired              = 402,
	k_EHTTPStatusCode403Forbidden                    = 403,
	k_EHTTPStatusCode404NotFound                     = 404,
	k_EHTTPStatusCode405MethodNotAllowed             = 405,
	k_EHTTPStatusCode406NotAcceptable                = 406,
	k_EHTTPStatusCode407ProxyAuthRequired            = 407,
	k_EHTTPStatusCode408RequestTimeout               = 408,
	k_EHTTPStatusCode409Conflict                     = 409,
	k_EHTTPStatusCode410Gone                         = 410,
	k_EHTTPStatusCode411LengthRequired               = 411,
	k_EHTTPStatusCode412PreconditionFailed           = 412,
	k_EHTTPStatusCode413RequestEntityTooLarge        = 413,
	k_EHTTPStatusCode414RequestURITooLong            = 414,
	k_EHTTPStatusCode415UnsupportedMediaType         = 415,
	k_EHTTPStatusCode416RequestedRangeNotSatisfiable = 416,
	k_EHTTPStatusCode417ExpectationFailed            = 417,
	k_EHTTPStatusCode4xxUnknown                      = 418,
	k_EHTTPStatusCode429TooManyRequests              = 429,
	k_EHTTPStatusCode444ConnectionClosed             = 444,
	k_EHTTPStatusCode500InternalServerError          = 500,
	k_EHTTPStatusCode501NotImplemented               = 501,
	k_EHTTPStatusCode502BadGateway                   = 502,
	k_EHTTPStatusCode503ServiceUnavailable           = 503,
	k_EHTTPStatusCode504GatewayTimeout               = 504,
	k_EHTTPStatusCode505HTTPVersionNotSupported      = 505,
	k_EHTTPStatusCode5xxUnknown                      = 599,
}

EInputSourceMode :: enum {
	k_EInputSourceMode_None           = 0,
	k_EInputSourceMode_Dpad           = 1,
	k_EInputSourceMode_Buttons        = 2,
	k_EInputSourceMode_FourButtons    = 3,
	k_EInputSourceMode_AbsoluteMouse  = 4,
	k_EInputSourceMode_RelativeMouse  = 5,
	k_EInputSourceMode_JoystickMove   = 6,
	k_EInputSourceMode_JoystickMouse  = 7,
	k_EInputSourceMode_JoystickCamera = 8,
	k_EInputSourceMode_ScrollWheel    = 9,
	k_EInputSourceMode_Trigger        = 10,
	k_EInputSourceMode_TouchMenu      = 11,
	k_EInputSourceMode_MouseJoystick  = 12,
	k_EInputSourceMode_MouseRegion    = 13,
	k_EInputSourceMode_RadialMenu     = 14,
	k_EInputSourceMode_SingleButton   = 15,
	k_EInputSourceMode_Switches       = 16,
}

EInputActionOrigin :: enum {
	k_EInputActionOrigin_None                                = 0,
	k_EInputActionOrigin_SteamController_A                   = 1,
	k_EInputActionOrigin_SteamController_B                   = 2,
	k_EInputActionOrigin_SteamController_X                   = 3,
	k_EInputActionOrigin_SteamController_Y                   = 4,
	k_EInputActionOrigin_SteamController_LeftBumper          = 5,
	k_EInputActionOrigin_SteamController_RightBumper         = 6,
	k_EInputActionOrigin_SteamController_LeftGrip            = 7,
	k_EInputActionOrigin_SteamController_RightGrip           = 8,
	k_EInputActionOrigin_SteamController_Start               = 9,
	k_EInputActionOrigin_SteamController_Back                = 10,
	k_EInputActionOrigin_SteamController_LeftPad_Touch       = 11,
	k_EInputActionOrigin_SteamController_LeftPad_Swipe       = 12,
	k_EInputActionOrigin_SteamController_LeftPad_Click       = 13,
	k_EInputActionOrigin_SteamController_LeftPad_DPadNorth   = 14,
	k_EInputActionOrigin_SteamController_LeftPad_DPadSouth   = 15,
	k_EInputActionOrigin_SteamController_LeftPad_DPadWest    = 16,
	k_EInputActionOrigin_SteamController_LeftPad_DPadEast    = 17,
	k_EInputActionOrigin_SteamController_RightPad_Touch      = 18,
	k_EInputActionOrigin_SteamController_RightPad_Swipe      = 19,
	k_EInputActionOrigin_SteamController_RightPad_Click      = 20,
	k_EInputActionOrigin_SteamController_RightPad_DPadNorth  = 21,
	k_EInputActionOrigin_SteamController_RightPad_DPadSouth  = 22,
	k_EInputActionOrigin_SteamController_RightPad_DPadWest   = 23,
	k_EInputActionOrigin_SteamController_RightPad_DPadEast   = 24,
	k_EInputActionOrigin_SteamController_LeftTrigger_Pull    = 25,
	k_EInputActionOrigin_SteamController_LeftTrigger_Click   = 26,
	k_EInputActionOrigin_SteamController_RightTrigger_Pull   = 27,
	k_EInputActionOrigin_SteamController_RightTrigger_Click  = 28,
	k_EInputActionOrigin_SteamController_LeftStick_Move      = 29,
	k_EInputActionOrigin_SteamController_LeftStick_Click     = 30,
	k_EInputActionOrigin_SteamController_LeftStick_DPadNorth = 31,
	k_EInputActionOrigin_SteamController_LeftStick_DPadSouth = 32,
	k_EInputActionOrigin_SteamController_LeftStick_DPadWest  = 33,
	k_EInputActionOrigin_SteamController_LeftStick_DPadEast  = 34,
	k_EInputActionOrigin_SteamController_Gyro_Move           = 35,
	k_EInputActionOrigin_SteamController_Gyro_Pitch          = 36,
	k_EInputActionOrigin_SteamController_Gyro_Yaw            = 37,
	k_EInputActionOrigin_SteamController_Gyro_Roll           = 38,
	k_EInputActionOrigin_SteamController_Reserved0           = 39,
	k_EInputActionOrigin_SteamController_Reserved1           = 40,
	k_EInputActionOrigin_SteamController_Reserved2           = 41,
	k_EInputActionOrigin_SteamController_Reserved3           = 42,
	k_EInputActionOrigin_SteamController_Reserved4           = 43,
	k_EInputActionOrigin_SteamController_Reserved5           = 44,
	k_EInputActionOrigin_SteamController_Reserved6           = 45,
	k_EInputActionOrigin_SteamController_Reserved7           = 46,
	k_EInputActionOrigin_SteamController_Reserved8           = 47,
	k_EInputActionOrigin_SteamController_Reserved9           = 48,
	k_EInputActionOrigin_SteamController_Reserved10          = 49,
	k_EInputActionOrigin_PS4_X                               = 50,
	k_EInputActionOrigin_PS4_Circle                          = 51,
	k_EInputActionOrigin_PS4_Triangle                        = 52,
	k_EInputActionOrigin_PS4_Square                          = 53,
	k_EInputActionOrigin_PS4_LeftBumper                      = 54,
	k_EInputActionOrigin_PS4_RightBumper                     = 55,
	k_EInputActionOrigin_PS4_Options                         = 56,
	k_EInputActionOrigin_PS4_Share                           = 57,
	k_EInputActionOrigin_PS4_LeftPad_Touch                   = 58,
	k_EInputActionOrigin_PS4_LeftPad_Swipe                   = 59,
	k_EInputActionOrigin_PS4_LeftPad_Click                   = 60,
	k_EInputActionOrigin_PS4_LeftPad_DPadNorth               = 61,
	k_EInputActionOrigin_PS4_LeftPad_DPadSouth               = 62,
	k_EInputActionOrigin_PS4_LeftPad_DPadWest                = 63,
	k_EInputActionOrigin_PS4_LeftPad_DPadEast                = 64,
	k_EInputActionOrigin_PS4_RightPad_Touch                  = 65,
	k_EInputActionOrigin_PS4_RightPad_Swipe                  = 66,
	k_EInputActionOrigin_PS4_RightPad_Click                  = 67,
	k_EInputActionOrigin_PS4_RightPad_DPadNorth              = 68,
	k_EInputActionOrigin_PS4_RightPad_DPadSouth              = 69,
	k_EInputActionOrigin_PS4_RightPad_DPadWest               = 70,
	k_EInputActionOrigin_PS4_RightPad_DPadEast               = 71,
	k_EInputActionOrigin_PS4_CenterPad_Touch                 = 72,
	k_EInputActionOrigin_PS4_CenterPad_Swipe                 = 73,
	k_EInputActionOrigin_PS4_CenterPad_Click                 = 74,
	k_EInputActionOrigin_PS4_CenterPad_DPadNorth             = 75,
	k_EInputActionOrigin_PS4_CenterPad_DPadSouth             = 76,
	k_EInputActionOrigin_PS4_CenterPad_DPadWest              = 77,
	k_EInputActionOrigin_PS4_CenterPad_DPadEast              = 78,
	k_EInputActionOrigin_PS4_LeftTrigger_Pull                = 79,
	k_EInputActionOrigin_PS4_LeftTrigger_Click               = 80,
	k_EInputActionOrigin_PS4_RightTrigger_Pull               = 81,
	k_EInputActionOrigin_PS4_RightTrigger_Click              = 82,
	k_EInputActionOrigin_PS4_LeftStick_Move                  = 83,
	k_EInputActionOrigin_PS4_LeftStick_Click                 = 84,
	k_EInputActionOrigin_PS4_LeftStick_DPadNorth             = 85,
	k_EInputActionOrigin_PS4_LeftStick_DPadSouth             = 86,
	k_EInputActionOrigin_PS4_LeftStick_DPadWest              = 87,
	k_EInputActionOrigin_PS4_LeftStick_DPadEast              = 88,
	k_EInputActionOrigin_PS4_RightStick_Move                 = 89,
	k_EInputActionOrigin_PS4_RightStick_Click                = 90,
	k_EInputActionOrigin_PS4_RightStick_DPadNorth            = 91,
	k_EInputActionOrigin_PS4_RightStick_DPadSouth            = 92,
	k_EInputActionOrigin_PS4_RightStick_DPadWest             = 93,
	k_EInputActionOrigin_PS4_RightStick_DPadEast             = 94,
	k_EInputActionOrigin_PS4_DPad_North                      = 95,
	k_EInputActionOrigin_PS4_DPad_South                      = 96,
	k_EInputActionOrigin_PS4_DPad_West                       = 97,
	k_EInputActionOrigin_PS4_DPad_East                       = 98,
	k_EInputActionOrigin_PS4_Gyro_Move                       = 99,
	k_EInputActionOrigin_PS4_Gyro_Pitch                      = 100,
	k_EInputActionOrigin_PS4_Gyro_Yaw                        = 101,
	k_EInputActionOrigin_PS4_Gyro_Roll                       = 102,
	k_EInputActionOrigin_PS4_DPad_Move                       = 103,
	k_EInputActionOrigin_PS4_Reserved1                       = 104,
	k_EInputActionOrigin_PS4_Reserved2                       = 105,
	k_EInputActionOrigin_PS4_Reserved3                       = 106,
	k_EInputActionOrigin_PS4_Reserved4                       = 107,
	k_EInputActionOrigin_PS4_Reserved5                       = 108,
	k_EInputActionOrigin_PS4_Reserved6                       = 109,
	k_EInputActionOrigin_PS4_Reserved7                       = 110,
	k_EInputActionOrigin_PS4_Reserved8                       = 111,
	k_EInputActionOrigin_PS4_Reserved9                       = 112,
	k_EInputActionOrigin_PS4_Reserved10                      = 113,
	k_EInputActionOrigin_XBoxOne_A                           = 114,
	k_EInputActionOrigin_XBoxOne_B                           = 115,
	k_EInputActionOrigin_XBoxOne_X                           = 116,
	k_EInputActionOrigin_XBoxOne_Y                           = 117,
	k_EInputActionOrigin_XBoxOne_LeftBumper                  = 118,
	k_EInputActionOrigin_XBoxOne_RightBumper                 = 119,
	k_EInputActionOrigin_XBoxOne_Menu                        = 120,
	k_EInputActionOrigin_XBoxOne_View                        = 121,
	k_EInputActionOrigin_XBoxOne_LeftTrigger_Pull            = 122,
	k_EInputActionOrigin_XBoxOne_LeftTrigger_Click           = 123,
	k_EInputActionOrigin_XBoxOne_RightTrigger_Pull           = 124,
	k_EInputActionOrigin_XBoxOne_RightTrigger_Click          = 125,
	k_EInputActionOrigin_XBoxOne_LeftStick_Move              = 126,
	k_EInputActionOrigin_XBoxOne_LeftStick_Click             = 127,
	k_EInputActionOrigin_XBoxOne_LeftStick_DPadNorth         = 128,
	k_EInputActionOrigin_XBoxOne_LeftStick_DPadSouth         = 129,
	k_EInputActionOrigin_XBoxOne_LeftStick_DPadWest          = 130,
	k_EInputActionOrigin_XBoxOne_LeftStick_DPadEast          = 131,
	k_EInputActionOrigin_XBoxOne_RightStick_Move             = 132,
	k_EInputActionOrigin_XBoxOne_RightStick_Click            = 133,
	k_EInputActionOrigin_XBoxOne_RightStick_DPadNorth        = 134,
	k_EInputActionOrigin_XBoxOne_RightStick_DPadSouth        = 135,
	k_EInputActionOrigin_XBoxOne_RightStick_DPadWest         = 136,
	k_EInputActionOrigin_XBoxOne_RightStick_DPadEast         = 137,
	k_EInputActionOrigin_XBoxOne_DPad_North                  = 138,
	k_EInputActionOrigin_XBoxOne_DPad_South                  = 139,
	k_EInputActionOrigin_XBoxOne_DPad_West                   = 140,
	k_EInputActionOrigin_XBoxOne_DPad_East                   = 141,
	k_EInputActionOrigin_XBoxOne_DPad_Move                   = 142,
	k_EInputActionOrigin_XBoxOne_LeftGrip_Lower              = 143,
	k_EInputActionOrigin_XBoxOne_LeftGrip_Upper              = 144,
	k_EInputActionOrigin_XBoxOne_RightGrip_Lower             = 145,
	k_EInputActionOrigin_XBoxOne_RightGrip_Upper             = 146,
	k_EInputActionOrigin_XBoxOne_Share                       = 147,
	k_EInputActionOrigin_XBoxOne_Reserved6                   = 148,
	k_EInputActionOrigin_XBoxOne_Reserved7                   = 149,
	k_EInputActionOrigin_XBoxOne_Reserved8                   = 150,
	k_EInputActionOrigin_XBoxOne_Reserved9                   = 151,
	k_EInputActionOrigin_XBoxOne_Reserved10                  = 152,
	k_EInputActionOrigin_XBox360_A                           = 153,
	k_EInputActionOrigin_XBox360_B                           = 154,
	k_EInputActionOrigin_XBox360_X                           = 155,
	k_EInputActionOrigin_XBox360_Y                           = 156,
	k_EInputActionOrigin_XBox360_LeftBumper                  = 157,
	k_EInputActionOrigin_XBox360_RightBumper                 = 158,
	k_EInputActionOrigin_XBox360_Start                       = 159,
	k_EInputActionOrigin_XBox360_Back                        = 160,
	k_EInputActionOrigin_XBox360_LeftTrigger_Pull            = 161,
	k_EInputActionOrigin_XBox360_LeftTrigger_Click           = 162,
	k_EInputActionOrigin_XBox360_RightTrigger_Pull           = 163,
	k_EInputActionOrigin_XBox360_RightTrigger_Click          = 164,
	k_EInputActionOrigin_XBox360_LeftStick_Move              = 165,
	k_EInputActionOrigin_XBox360_LeftStick_Click             = 166,
	k_EInputActionOrigin_XBox360_LeftStick_DPadNorth         = 167,
	k_EInputActionOrigin_XBox360_LeftStick_DPadSouth         = 168,
	k_EInputActionOrigin_XBox360_LeftStick_DPadWest          = 169,
	k_EInputActionOrigin_XBox360_LeftStick_DPadEast          = 170,
	k_EInputActionOrigin_XBox360_RightStick_Move             = 171,
	k_EInputActionOrigin_XBox360_RightStick_Click            = 172,
	k_EInputActionOrigin_XBox360_RightStick_DPadNorth        = 173,
	k_EInputActionOrigin_XBox360_RightStick_DPadSouth        = 174,
	k_EInputActionOrigin_XBox360_RightStick_DPadWest         = 175,
	k_EInputActionOrigin_XBox360_RightStick_DPadEast         = 176,
	k_EInputActionOrigin_XBox360_DPad_North                  = 177,
	k_EInputActionOrigin_XBox360_DPad_South                  = 178,
	k_EInputActionOrigin_XBox360_DPad_West                   = 179,
	k_EInputActionOrigin_XBox360_DPad_East                   = 180,
	k_EInputActionOrigin_XBox360_DPad_Move                   = 181,
	k_EInputActionOrigin_XBox360_Reserved1                   = 182,
	k_EInputActionOrigin_XBox360_Reserved2                   = 183,
	k_EInputActionOrigin_XBox360_Reserved3                   = 184,
	k_EInputActionOrigin_XBox360_Reserved4                   = 185,
	k_EInputActionOrigin_XBox360_Reserved5                   = 186,
	k_EInputActionOrigin_XBox360_Reserved6                   = 187,
	k_EInputActionOrigin_XBox360_Reserved7                   = 188,
	k_EInputActionOrigin_XBox360_Reserved8                   = 189,
	k_EInputActionOrigin_XBox360_Reserved9                   = 190,
	k_EInputActionOrigin_XBox360_Reserved10                  = 191,
	k_EInputActionOrigin_Switch_A                            = 192,
	k_EInputActionOrigin_Switch_B                            = 193,
	k_EInputActionOrigin_Switch_X                            = 194,
	k_EInputActionOrigin_Switch_Y                            = 195,
	k_EInputActionOrigin_Switch_LeftBumper                   = 196,
	k_EInputActionOrigin_Switch_RightBumper                  = 197,
	k_EInputActionOrigin_Switch_Plus                         = 198,
	k_EInputActionOrigin_Switch_Minus                        = 199,
	k_EInputActionOrigin_Switch_Capture                      = 200,
	k_EInputActionOrigin_Switch_LeftTrigger_Pull             = 201,
	k_EInputActionOrigin_Switch_LeftTrigger_Click            = 202,
	k_EInputActionOrigin_Switch_RightTrigger_Pull            = 203,
	k_EInputActionOrigin_Switch_RightTrigger_Click           = 204,
	k_EInputActionOrigin_Switch_LeftStick_Move               = 205,
	k_EInputActionOrigin_Switch_LeftStick_Click              = 206,
	k_EInputActionOrigin_Switch_LeftStick_DPadNorth          = 207,
	k_EInputActionOrigin_Switch_LeftStick_DPadSouth          = 208,
	k_EInputActionOrigin_Switch_LeftStick_DPadWest           = 209,
	k_EInputActionOrigin_Switch_LeftStick_DPadEast           = 210,
	k_EInputActionOrigin_Switch_RightStick_Move              = 211,
	k_EInputActionOrigin_Switch_RightStick_Click             = 212,
	k_EInputActionOrigin_Switch_RightStick_DPadNorth         = 213,
	k_EInputActionOrigin_Switch_RightStick_DPadSouth         = 214,
	k_EInputActionOrigin_Switch_RightStick_DPadWest          = 215,
	k_EInputActionOrigin_Switch_RightStick_DPadEast          = 216,
	k_EInputActionOrigin_Switch_DPad_North                   = 217,
	k_EInputActionOrigin_Switch_DPad_South                   = 218,
	k_EInputActionOrigin_Switch_DPad_West                    = 219,
	k_EInputActionOrigin_Switch_DPad_East                    = 220,
	k_EInputActionOrigin_Switch_ProGyro_Move                 = 221,
	k_EInputActionOrigin_Switch_ProGyro_Pitch                = 222,
	k_EInputActionOrigin_Switch_ProGyro_Yaw                  = 223,
	k_EInputActionOrigin_Switch_ProGyro_Roll                 = 224,
	k_EInputActionOrigin_Switch_DPad_Move                    = 225,
	k_EInputActionOrigin_Switch_Reserved1                    = 226,
	k_EInputActionOrigin_Switch_Reserved2                    = 227,
	k_EInputActionOrigin_Switch_Reserved3                    = 228,
	k_EInputActionOrigin_Switch_Reserved4                    = 229,
	k_EInputActionOrigin_Switch_Reserved5                    = 230,
	k_EInputActionOrigin_Switch_Reserved6                    = 231,
	k_EInputActionOrigin_Switch_Reserved7                    = 232,
	k_EInputActionOrigin_Switch_Reserved8                    = 233,
	k_EInputActionOrigin_Switch_Reserved9                    = 234,
	k_EInputActionOrigin_Switch_Reserved10                   = 235,
	k_EInputActionOrigin_Switch_RightGyro_Move               = 236,
	k_EInputActionOrigin_Switch_RightGyro_Pitch              = 237,
	k_EInputActionOrigin_Switch_RightGyro_Yaw                = 238,
	k_EInputActionOrigin_Switch_RightGyro_Roll               = 239,
	k_EInputActionOrigin_Switch_LeftGyro_Move                = 240,
	k_EInputActionOrigin_Switch_LeftGyro_Pitch               = 241,
	k_EInputActionOrigin_Switch_LeftGyro_Yaw                 = 242,
	k_EInputActionOrigin_Switch_LeftGyro_Roll                = 243,
	k_EInputActionOrigin_Switch_LeftGrip_Lower               = 244,
	k_EInputActionOrigin_Switch_LeftGrip_Upper               = 245,
	k_EInputActionOrigin_Switch_RightGrip_Lower              = 246,
	k_EInputActionOrigin_Switch_RightGrip_Upper              = 247,
	k_EInputActionOrigin_Switch_Reserved11                   = 248,
	k_EInputActionOrigin_Switch_Reserved12                   = 249,
	k_EInputActionOrigin_Switch_Reserved13                   = 250,
	k_EInputActionOrigin_Switch_Reserved14                   = 251,
	k_EInputActionOrigin_Switch_Reserved15                   = 252,
	k_EInputActionOrigin_Switch_Reserved16                   = 253,
	k_EInputActionOrigin_Switch_Reserved17                   = 254,
	k_EInputActionOrigin_Switch_Reserved18                   = 255,
	k_EInputActionOrigin_Switch_Reserved19                   = 256,
	k_EInputActionOrigin_Switch_Reserved20                   = 257,
	k_EInputActionOrigin_PS5_X                               = 258,
	k_EInputActionOrigin_PS5_Circle                          = 259,
	k_EInputActionOrigin_PS5_Triangle                        = 260,
	k_EInputActionOrigin_PS5_Square                          = 261,
	k_EInputActionOrigin_PS5_LeftBumper                      = 262,
	k_EInputActionOrigin_PS5_RightBumper                     = 263,
	k_EInputActionOrigin_PS5_Option                          = 264,
	k_EInputActionOrigin_PS5_Create                          = 265,
	k_EInputActionOrigin_PS5_Mute                            = 266,
	k_EInputActionOrigin_PS5_LeftPad_Touch                   = 267,
	k_EInputActionOrigin_PS5_LeftPad_Swipe                   = 268,
	k_EInputActionOrigin_PS5_LeftPad_Click                   = 269,
	k_EInputActionOrigin_PS5_LeftPad_DPadNorth               = 270,
	k_EInputActionOrigin_PS5_LeftPad_DPadSouth               = 271,
	k_EInputActionOrigin_PS5_LeftPad_DPadWest                = 272,
	k_EInputActionOrigin_PS5_LeftPad_DPadEast                = 273,
	k_EInputActionOrigin_PS5_RightPad_Touch                  = 274,
	k_EInputActionOrigin_PS5_RightPad_Swipe                  = 275,
	k_EInputActionOrigin_PS5_RightPad_Click                  = 276,
	k_EInputActionOrigin_PS5_RightPad_DPadNorth              = 277,
	k_EInputActionOrigin_PS5_RightPad_DPadSouth              = 278,
	k_EInputActionOrigin_PS5_RightPad_DPadWest               = 279,
	k_EInputActionOrigin_PS5_RightPad_DPadEast               = 280,
	k_EInputActionOrigin_PS5_CenterPad_Touch                 = 281,
	k_EInputActionOrigin_PS5_CenterPad_Swipe                 = 282,
	k_EInputActionOrigin_PS5_CenterPad_Click                 = 283,
	k_EInputActionOrigin_PS5_CenterPad_DPadNorth             = 284,
	k_EInputActionOrigin_PS5_CenterPad_DPadSouth             = 285,
	k_EInputActionOrigin_PS5_CenterPad_DPadWest              = 286,
	k_EInputActionOrigin_PS5_CenterPad_DPadEast              = 287,
	k_EInputActionOrigin_PS5_LeftTrigger_Pull                = 288,
	k_EInputActionOrigin_PS5_LeftTrigger_Click               = 289,
	k_EInputActionOrigin_PS5_RightTrigger_Pull               = 290,
	k_EInputActionOrigin_PS5_RightTrigger_Click              = 291,
	k_EInputActionOrigin_PS5_LeftStick_Move                  = 292,
	k_EInputActionOrigin_PS5_LeftStick_Click                 = 293,
	k_EInputActionOrigin_PS5_LeftStick_DPadNorth             = 294,
	k_EInputActionOrigin_PS5_LeftStick_DPadSouth             = 295,
	k_EInputActionOrigin_PS5_LeftStick_DPadWest              = 296,
	k_EInputActionOrigin_PS5_LeftStick_DPadEast              = 297,
	k_EInputActionOrigin_PS5_RightStick_Move                 = 298,
	k_EInputActionOrigin_PS5_RightStick_Click                = 299,
	k_EInputActionOrigin_PS5_RightStick_DPadNorth            = 300,
	k_EInputActionOrigin_PS5_RightStick_DPadSouth            = 301,
	k_EInputActionOrigin_PS5_RightStick_DPadWest             = 302,
	k_EInputActionOrigin_PS5_RightStick_DPadEast             = 303,
	k_EInputActionOrigin_PS5_DPad_North                      = 304,
	k_EInputActionOrigin_PS5_DPad_South                      = 305,
	k_EInputActionOrigin_PS5_DPad_West                       = 306,
	k_EInputActionOrigin_PS5_DPad_East                       = 307,
	k_EInputActionOrigin_PS5_Gyro_Move                       = 308,
	k_EInputActionOrigin_PS5_Gyro_Pitch                      = 309,
	k_EInputActionOrigin_PS5_Gyro_Yaw                        = 310,
	k_EInputActionOrigin_PS5_Gyro_Roll                       = 311,
	k_EInputActionOrigin_PS5_DPad_Move                       = 312,
	k_EInputActionOrigin_PS5_Reserved1                       = 313,
	k_EInputActionOrigin_PS5_Reserved2                       = 314,
	k_EInputActionOrigin_PS5_Reserved3                       = 315,
	k_EInputActionOrigin_PS5_Reserved4                       = 316,
	k_EInputActionOrigin_PS5_Reserved5                       = 317,
	k_EInputActionOrigin_PS5_Reserved6                       = 318,
	k_EInputActionOrigin_PS5_Reserved7                       = 319,
	k_EInputActionOrigin_PS5_Reserved8                       = 320,
	k_EInputActionOrigin_PS5_Reserved9                       = 321,
	k_EInputActionOrigin_PS5_Reserved10                      = 322,
	k_EInputActionOrigin_PS5_Reserved11                      = 323,
	k_EInputActionOrigin_PS5_Reserved12                      = 324,
	k_EInputActionOrigin_PS5_Reserved13                      = 325,
	k_EInputActionOrigin_PS5_Reserved14                      = 326,
	k_EInputActionOrigin_PS5_Reserved15                      = 327,
	k_EInputActionOrigin_PS5_Reserved16                      = 328,
	k_EInputActionOrigin_PS5_Reserved17                      = 329,
	k_EInputActionOrigin_PS5_Reserved18                      = 330,
	k_EInputActionOrigin_PS5_Reserved19                      = 331,
	k_EInputActionOrigin_PS5_Reserved20                      = 332,
	k_EInputActionOrigin_SteamDeck_A                         = 333,
	k_EInputActionOrigin_SteamDeck_B                         = 334,
	k_EInputActionOrigin_SteamDeck_X                         = 335,
	k_EInputActionOrigin_SteamDeck_Y                         = 336,
	k_EInputActionOrigin_SteamDeck_L1                        = 337,
	k_EInputActionOrigin_SteamDeck_R1                        = 338,
	k_EInputActionOrigin_SteamDeck_Menu                      = 339,
	k_EInputActionOrigin_SteamDeck_View                      = 340,
	k_EInputActionOrigin_SteamDeck_LeftPad_Touch             = 341,
	k_EInputActionOrigin_SteamDeck_LeftPad_Swipe             = 342,
	k_EInputActionOrigin_SteamDeck_LeftPad_Click             = 343,
	k_EInputActionOrigin_SteamDeck_LeftPad_DPadNorth         = 344,
	k_EInputActionOrigin_SteamDeck_LeftPad_DPadSouth         = 345,
	k_EInputActionOrigin_SteamDeck_LeftPad_DPadWest          = 346,
	k_EInputActionOrigin_SteamDeck_LeftPad_DPadEast          = 347,
	k_EInputActionOrigin_SteamDeck_RightPad_Touch            = 348,
	k_EInputActionOrigin_SteamDeck_RightPad_Swipe            = 349,
	k_EInputActionOrigin_SteamDeck_RightPad_Click            = 350,
	k_EInputActionOrigin_SteamDeck_RightPad_DPadNorth        = 351,
	k_EInputActionOrigin_SteamDeck_RightPad_DPadSouth        = 352,
	k_EInputActionOrigin_SteamDeck_RightPad_DPadWest         = 353,
	k_EInputActionOrigin_SteamDeck_RightPad_DPadEast         = 354,
	k_EInputActionOrigin_SteamDeck_L2_SoftPull               = 355,
	k_EInputActionOrigin_SteamDeck_L2                        = 356,
	k_EInputActionOrigin_SteamDeck_R2_SoftPull               = 357,
	k_EInputActionOrigin_SteamDeck_R2                        = 358,
	k_EInputActionOrigin_SteamDeck_LeftStick_Move            = 359,
	k_EInputActionOrigin_SteamDeck_L3                        = 360,
	k_EInputActionOrigin_SteamDeck_LeftStick_DPadNorth       = 361,
	k_EInputActionOrigin_SteamDeck_LeftStick_DPadSouth       = 362,
	k_EInputActionOrigin_SteamDeck_LeftStick_DPadWest        = 363,
	k_EInputActionOrigin_SteamDeck_LeftStick_DPadEast        = 364,
	k_EInputActionOrigin_SteamDeck_LeftStick_Touch           = 365,
	k_EInputActionOrigin_SteamDeck_RightStick_Move           = 366,
	k_EInputActionOrigin_SteamDeck_R3                        = 367,
	k_EInputActionOrigin_SteamDeck_RightStick_DPadNorth      = 368,
	k_EInputActionOrigin_SteamDeck_RightStick_DPadSouth      = 369,
	k_EInputActionOrigin_SteamDeck_RightStick_DPadWest       = 370,
	k_EInputActionOrigin_SteamDeck_RightStick_DPadEast       = 371,
	k_EInputActionOrigin_SteamDeck_RightStick_Touch          = 372,
	k_EInputActionOrigin_SteamDeck_L4                        = 373,
	k_EInputActionOrigin_SteamDeck_R4                        = 374,
	k_EInputActionOrigin_SteamDeck_L5                        = 375,
	k_EInputActionOrigin_SteamDeck_R5                        = 376,
	k_EInputActionOrigin_SteamDeck_DPad_Move                 = 377,
	k_EInputActionOrigin_SteamDeck_DPad_North                = 378,
	k_EInputActionOrigin_SteamDeck_DPad_South                = 379,
	k_EInputActionOrigin_SteamDeck_DPad_West                 = 380,
	k_EInputActionOrigin_SteamDeck_DPad_East                 = 381,
	k_EInputActionOrigin_SteamDeck_Gyro_Move                 = 382,
	k_EInputActionOrigin_SteamDeck_Gyro_Pitch                = 383,
	k_EInputActionOrigin_SteamDeck_Gyro_Yaw                  = 384,
	k_EInputActionOrigin_SteamDeck_Gyro_Roll                 = 385,
	k_EInputActionOrigin_SteamDeck_Reserved1                 = 386,
	k_EInputActionOrigin_SteamDeck_Reserved2                 = 387,
	k_EInputActionOrigin_SteamDeck_Reserved3                 = 388,
	k_EInputActionOrigin_SteamDeck_Reserved4                 = 389,
	k_EInputActionOrigin_SteamDeck_Reserved5                 = 390,
	k_EInputActionOrigin_SteamDeck_Reserved6                 = 391,
	k_EInputActionOrigin_SteamDeck_Reserved7                 = 392,
	k_EInputActionOrigin_SteamDeck_Reserved8                 = 393,
	k_EInputActionOrigin_SteamDeck_Reserved9                 = 394,
	k_EInputActionOrigin_SteamDeck_Reserved10                = 395,
	k_EInputActionOrigin_SteamDeck_Reserved11                = 396,
	k_EInputActionOrigin_SteamDeck_Reserved12                = 397,
	k_EInputActionOrigin_SteamDeck_Reserved13                = 398,
	k_EInputActionOrigin_SteamDeck_Reserved14                = 399,
	k_EInputActionOrigin_SteamDeck_Reserved15                = 400,
	k_EInputActionOrigin_SteamDeck_Reserved16                = 401,
	k_EInputActionOrigin_SteamDeck_Reserved17                = 402,
	k_EInputActionOrigin_SteamDeck_Reserved18                = 403,
	k_EInputActionOrigin_SteamDeck_Reserved19                = 404,
	k_EInputActionOrigin_SteamDeck_Reserved20                = 405,
	k_EInputActionOrigin_Count                               = 406,
	k_EInputActionOrigin_MaximumPossibleValue                = 32767,
}

EXboxOrigin :: enum {
	k_EXboxOrigin_A                    = 0,
	k_EXboxOrigin_B                    = 1,
	k_EXboxOrigin_X                    = 2,
	k_EXboxOrigin_Y                    = 3,
	k_EXboxOrigin_LeftBumper           = 4,
	k_EXboxOrigin_RightBumper          = 5,
	k_EXboxOrigin_Menu                 = 6,
	k_EXboxOrigin_View                 = 7,
	k_EXboxOrigin_LeftTrigger_Pull     = 8,
	k_EXboxOrigin_LeftTrigger_Click    = 9,
	k_EXboxOrigin_RightTrigger_Pull    = 10,
	k_EXboxOrigin_RightTrigger_Click   = 11,
	k_EXboxOrigin_LeftStick_Move       = 12,
	k_EXboxOrigin_LeftStick_Click      = 13,
	k_EXboxOrigin_LeftStick_DPadNorth  = 14,
	k_EXboxOrigin_LeftStick_DPadSouth  = 15,
	k_EXboxOrigin_LeftStick_DPadWest   = 16,
	k_EXboxOrigin_LeftStick_DPadEast   = 17,
	k_EXboxOrigin_RightStick_Move      = 18,
	k_EXboxOrigin_RightStick_Click     = 19,
	k_EXboxOrigin_RightStick_DPadNorth = 20,
	k_EXboxOrigin_RightStick_DPadSouth = 21,
	k_EXboxOrigin_RightStick_DPadWest  = 22,
	k_EXboxOrigin_RightStick_DPadEast  = 23,
	k_EXboxOrigin_DPad_North           = 24,
	k_EXboxOrigin_DPad_South           = 25,
	k_EXboxOrigin_DPad_West            = 26,
	k_EXboxOrigin_DPad_East            = 27,
	k_EXboxOrigin_Count                = 28,
}

ESteamControllerPad :: enum {
	k_ESteamControllerPad_Left  = 0,
	k_ESteamControllerPad_Right = 1,
}

EControllerHapticLocation :: enum {
	k_EControllerHapticLocation_Left  = 1,
	k_EControllerHapticLocation_Right = 2,
	k_EControllerHapticLocation_Both  = 3,
}

EControllerHapticType :: enum {
	k_EControllerHapticType_Off   = 0,
	k_EControllerHapticType_Tick  = 1,
	k_EControllerHapticType_Click = 2,
}

ESteamInputType :: enum {
	k_ESteamInputType_Unknown              = 0,
	k_ESteamInputType_SteamController      = 1,
	k_ESteamInputType_XBox360Controller    = 2,
	k_ESteamInputType_XBoxOneController    = 3,
	k_ESteamInputType_GenericGamepad       = 4,
	k_ESteamInputType_PS4Controller        = 5,
	k_ESteamInputType_AppleMFiController   = 6,
	k_ESteamInputType_AndroidController    = 7,
	k_ESteamInputType_SwitchJoyConPair     = 8,
	k_ESteamInputType_SwitchJoyConSingle   = 9,
	k_ESteamInputType_SwitchProController  = 10,
	k_ESteamInputType_MobileTouch          = 11,
	k_ESteamInputType_PS3Controller        = 12,
	k_ESteamInputType_PS5Controller        = 13,
	k_ESteamInputType_SteamDeckController  = 14,
	k_ESteamInputType_Count                = 15,
	k_ESteamInputType_MaximumPossibleValue = 255,
}

ESteamInputConfigurationEnableType :: enum {
	k_ESteamInputConfigurationEnableType_None        = 0,
	k_ESteamInputConfigurationEnableType_Playstation = 1,
	k_ESteamInputConfigurationEnableType_Xbox        = 2,
	k_ESteamInputConfigurationEnableType_Generic     = 4,
	k_ESteamInputConfigurationEnableType_Switch      = 8,
}

ESteamInputLEDFlag :: enum {
	k_ESteamInputLEDFlag_SetColor           = 0,
	k_ESteamInputLEDFlag_RestoreUserDefault = 1,
}

ESteamInputGlyphSize :: enum {
	k_ESteamInputGlyphSize_Small  = 0,
	k_ESteamInputGlyphSize_Medium = 1,
	k_ESteamInputGlyphSize_Large  = 2,
	k_ESteamInputGlyphSize_Count  = 3,
}

ESteamInputGlyphStyle :: enum {
	ESteamInputGlyphStyle_Knockout         = 0,
	ESteamInputGlyphStyle_Light            = 1,
	ESteamInputGlyphStyle_Dark             = 2,
	ESteamInputGlyphStyle_NeutralColorABXY = 16,
	ESteamInputGlyphStyle_SolidABXY        = 32,
}

ESteamInputActionEventType :: enum {
	ESteamInputActionEventType_DigitalAction = 0,
	ESteamInputActionEventType_AnalogAction  = 1,
}

EControllerActionOrigin :: enum {
	k_EControllerActionOrigin_None                             = 0,
	k_EControllerActionOrigin_A                                = 1,
	k_EControllerActionOrigin_B                                = 2,
	k_EControllerActionOrigin_X                                = 3,
	k_EControllerActionOrigin_Y                                = 4,
	k_EControllerActionOrigin_LeftBumper                       = 5,
	k_EControllerActionOrigin_RightBumper                      = 6,
	k_EControllerActionOrigin_LeftGrip                         = 7,
	k_EControllerActionOrigin_RightGrip                        = 8,
	k_EControllerActionOrigin_Start                            = 9,
	k_EControllerActionOrigin_Back                             = 10,
	k_EControllerActionOrigin_LeftPad_Touch                    = 11,
	k_EControllerActionOrigin_LeftPad_Swipe                    = 12,
	k_EControllerActionOrigin_LeftPad_Click                    = 13,
	k_EControllerActionOrigin_LeftPad_DPadNorth                = 14,
	k_EControllerActionOrigin_LeftPad_DPadSouth                = 15,
	k_EControllerActionOrigin_LeftPad_DPadWest                 = 16,
	k_EControllerActionOrigin_LeftPad_DPadEast                 = 17,
	k_EControllerActionOrigin_RightPad_Touch                   = 18,
	k_EControllerActionOrigin_RightPad_Swipe                   = 19,
	k_EControllerActionOrigin_RightPad_Click                   = 20,
	k_EControllerActionOrigin_RightPad_DPadNorth               = 21,
	k_EControllerActionOrigin_RightPad_DPadSouth               = 22,
	k_EControllerActionOrigin_RightPad_DPadWest                = 23,
	k_EControllerActionOrigin_RightPad_DPadEast                = 24,
	k_EControllerActionOrigin_LeftTrigger_Pull                 = 25,
	k_EControllerActionOrigin_LeftTrigger_Click                = 26,
	k_EControllerActionOrigin_RightTrigger_Pull                = 27,
	k_EControllerActionOrigin_RightTrigger_Click               = 28,
	k_EControllerActionOrigin_LeftStick_Move                   = 29,
	k_EControllerActionOrigin_LeftStick_Click                  = 30,
	k_EControllerActionOrigin_LeftStick_DPadNorth              = 31,
	k_EControllerActionOrigin_LeftStick_DPadSouth              = 32,
	k_EControllerActionOrigin_LeftStick_DPadWest               = 33,
	k_EControllerActionOrigin_LeftStick_DPadEast               = 34,
	k_EControllerActionOrigin_Gyro_Move                        = 35,
	k_EControllerActionOrigin_Gyro_Pitch                       = 36,
	k_EControllerActionOrigin_Gyro_Yaw                         = 37,
	k_EControllerActionOrigin_Gyro_Roll                        = 38,
	k_EControllerActionOrigin_PS4_X                            = 39,
	k_EControllerActionOrigin_PS4_Circle                       = 40,
	k_EControllerActionOrigin_PS4_Triangle                     = 41,
	k_EControllerActionOrigin_PS4_Square                       = 42,
	k_EControllerActionOrigin_PS4_LeftBumper                   = 43,
	k_EControllerActionOrigin_PS4_RightBumper                  = 44,
	k_EControllerActionOrigin_PS4_Options                      = 45,
	k_EControllerActionOrigin_PS4_Share                        = 46,
	k_EControllerActionOrigin_PS4_LeftPad_Touch                = 47,
	k_EControllerActionOrigin_PS4_LeftPad_Swipe                = 48,
	k_EControllerActionOrigin_PS4_LeftPad_Click                = 49,
	k_EControllerActionOrigin_PS4_LeftPad_DPadNorth            = 50,
	k_EControllerActionOrigin_PS4_LeftPad_DPadSouth            = 51,
	k_EControllerActionOrigin_PS4_LeftPad_DPadWest             = 52,
	k_EControllerActionOrigin_PS4_LeftPad_DPadEast             = 53,
	k_EControllerActionOrigin_PS4_RightPad_Touch               = 54,
	k_EControllerActionOrigin_PS4_RightPad_Swipe               = 55,
	k_EControllerActionOrigin_PS4_RightPad_Click               = 56,
	k_EControllerActionOrigin_PS4_RightPad_DPadNorth           = 57,
	k_EControllerActionOrigin_PS4_RightPad_DPadSouth           = 58,
	k_EControllerActionOrigin_PS4_RightPad_DPadWest            = 59,
	k_EControllerActionOrigin_PS4_RightPad_DPadEast            = 60,
	k_EControllerActionOrigin_PS4_CenterPad_Touch              = 61,
	k_EControllerActionOrigin_PS4_CenterPad_Swipe              = 62,
	k_EControllerActionOrigin_PS4_CenterPad_Click              = 63,
	k_EControllerActionOrigin_PS4_CenterPad_DPadNorth          = 64,
	k_EControllerActionOrigin_PS4_CenterPad_DPadSouth          = 65,
	k_EControllerActionOrigin_PS4_CenterPad_DPadWest           = 66,
	k_EControllerActionOrigin_PS4_CenterPad_DPadEast           = 67,
	k_EControllerActionOrigin_PS4_LeftTrigger_Pull             = 68,
	k_EControllerActionOrigin_PS4_LeftTrigger_Click            = 69,
	k_EControllerActionOrigin_PS4_RightTrigger_Pull            = 70,
	k_EControllerActionOrigin_PS4_RightTrigger_Click           = 71,
	k_EControllerActionOrigin_PS4_LeftStick_Move               = 72,
	k_EControllerActionOrigin_PS4_LeftStick_Click              = 73,
	k_EControllerActionOrigin_PS4_LeftStick_DPadNorth          = 74,
	k_EControllerActionOrigin_PS4_LeftStick_DPadSouth          = 75,
	k_EControllerActionOrigin_PS4_LeftStick_DPadWest           = 76,
	k_EControllerActionOrigin_PS4_LeftStick_DPadEast           = 77,
	k_EControllerActionOrigin_PS4_RightStick_Move              = 78,
	k_EControllerActionOrigin_PS4_RightStick_Click             = 79,
	k_EControllerActionOrigin_PS4_RightStick_DPadNorth         = 80,
	k_EControllerActionOrigin_PS4_RightStick_DPadSouth         = 81,
	k_EControllerActionOrigin_PS4_RightStick_DPadWest          = 82,
	k_EControllerActionOrigin_PS4_RightStick_DPadEast          = 83,
	k_EControllerActionOrigin_PS4_DPad_North                   = 84,
	k_EControllerActionOrigin_PS4_DPad_South                   = 85,
	k_EControllerActionOrigin_PS4_DPad_West                    = 86,
	k_EControllerActionOrigin_PS4_DPad_East                    = 87,
	k_EControllerActionOrigin_PS4_Gyro_Move                    = 88,
	k_EControllerActionOrigin_PS4_Gyro_Pitch                   = 89,
	k_EControllerActionOrigin_PS4_Gyro_Yaw                     = 90,
	k_EControllerActionOrigin_PS4_Gyro_Roll                    = 91,
	k_EControllerActionOrigin_XBoxOne_A                        = 92,
	k_EControllerActionOrigin_XBoxOne_B                        = 93,
	k_EControllerActionOrigin_XBoxOne_X                        = 94,
	k_EControllerActionOrigin_XBoxOne_Y                        = 95,
	k_EControllerActionOrigin_XBoxOne_LeftBumper               = 96,
	k_EControllerActionOrigin_XBoxOne_RightBumper              = 97,
	k_EControllerActionOrigin_XBoxOne_Menu                     = 98,
	k_EControllerActionOrigin_XBoxOne_View                     = 99,
	k_EControllerActionOrigin_XBoxOne_LeftTrigger_Pull         = 100,
	k_EControllerActionOrigin_XBoxOne_LeftTrigger_Click        = 101,
	k_EControllerActionOrigin_XBoxOne_RightTrigger_Pull        = 102,
	k_EControllerActionOrigin_XBoxOne_RightTrigger_Click       = 103,
	k_EControllerActionOrigin_XBoxOne_LeftStick_Move           = 104,
	k_EControllerActionOrigin_XBoxOne_LeftStick_Click          = 105,
	k_EControllerActionOrigin_XBoxOne_LeftStick_DPadNorth      = 106,
	k_EControllerActionOrigin_XBoxOne_LeftStick_DPadSouth      = 107,
	k_EControllerActionOrigin_XBoxOne_LeftStick_DPadWest       = 108,
	k_EControllerActionOrigin_XBoxOne_LeftStick_DPadEast       = 109,
	k_EControllerActionOrigin_XBoxOne_RightStick_Move          = 110,
	k_EControllerActionOrigin_XBoxOne_RightStick_Click         = 111,
	k_EControllerActionOrigin_XBoxOne_RightStick_DPadNorth     = 112,
	k_EControllerActionOrigin_XBoxOne_RightStick_DPadSouth     = 113,
	k_EControllerActionOrigin_XBoxOne_RightStick_DPadWest      = 114,
	k_EControllerActionOrigin_XBoxOne_RightStick_DPadEast      = 115,
	k_EControllerActionOrigin_XBoxOne_DPad_North               = 116,
	k_EControllerActionOrigin_XBoxOne_DPad_South               = 117,
	k_EControllerActionOrigin_XBoxOne_DPad_West                = 118,
	k_EControllerActionOrigin_XBoxOne_DPad_East                = 119,
	k_EControllerActionOrigin_XBox360_A                        = 120,
	k_EControllerActionOrigin_XBox360_B                        = 121,
	k_EControllerActionOrigin_XBox360_X                        = 122,
	k_EControllerActionOrigin_XBox360_Y                        = 123,
	k_EControllerActionOrigin_XBox360_LeftBumper               = 124,
	k_EControllerActionOrigin_XBox360_RightBumper              = 125,
	k_EControllerActionOrigin_XBox360_Start                    = 126,
	k_EControllerActionOrigin_XBox360_Back                     = 127,
	k_EControllerActionOrigin_XBox360_LeftTrigger_Pull         = 128,
	k_EControllerActionOrigin_XBox360_LeftTrigger_Click        = 129,
	k_EControllerActionOrigin_XBox360_RightTrigger_Pull        = 130,
	k_EControllerActionOrigin_XBox360_RightTrigger_Click       = 131,
	k_EControllerActionOrigin_XBox360_LeftStick_Move           = 132,
	k_EControllerActionOrigin_XBox360_LeftStick_Click          = 133,
	k_EControllerActionOrigin_XBox360_LeftStick_DPadNorth      = 134,
	k_EControllerActionOrigin_XBox360_LeftStick_DPadSouth      = 135,
	k_EControllerActionOrigin_XBox360_LeftStick_DPadWest       = 136,
	k_EControllerActionOrigin_XBox360_LeftStick_DPadEast       = 137,
	k_EControllerActionOrigin_XBox360_RightStick_Move          = 138,
	k_EControllerActionOrigin_XBox360_RightStick_Click         = 139,
	k_EControllerActionOrigin_XBox360_RightStick_DPadNorth     = 140,
	k_EControllerActionOrigin_XBox360_RightStick_DPadSouth     = 141,
	k_EControllerActionOrigin_XBox360_RightStick_DPadWest      = 142,
	k_EControllerActionOrigin_XBox360_RightStick_DPadEast      = 143,
	k_EControllerActionOrigin_XBox360_DPad_North               = 144,
	k_EControllerActionOrigin_XBox360_DPad_South               = 145,
	k_EControllerActionOrigin_XBox360_DPad_West                = 146,
	k_EControllerActionOrigin_XBox360_DPad_East                = 147,
	k_EControllerActionOrigin_SteamV2_A                        = 148,
	k_EControllerActionOrigin_SteamV2_B                        = 149,
	k_EControllerActionOrigin_SteamV2_X                        = 150,
	k_EControllerActionOrigin_SteamV2_Y                        = 151,
	k_EControllerActionOrigin_SteamV2_LeftBumper               = 152,
	k_EControllerActionOrigin_SteamV2_RightBumper              = 153,
	k_EControllerActionOrigin_SteamV2_LeftGrip_Lower           = 154,
	k_EControllerActionOrigin_SteamV2_LeftGrip_Upper           = 155,
	k_EControllerActionOrigin_SteamV2_RightGrip_Lower          = 156,
	k_EControllerActionOrigin_SteamV2_RightGrip_Upper          = 157,
	k_EControllerActionOrigin_SteamV2_LeftBumper_Pressure      = 158,
	k_EControllerActionOrigin_SteamV2_RightBumper_Pressure     = 159,
	k_EControllerActionOrigin_SteamV2_LeftGrip_Pressure        = 160,
	k_EControllerActionOrigin_SteamV2_RightGrip_Pressure       = 161,
	k_EControllerActionOrigin_SteamV2_LeftGrip_Upper_Pressure  = 162,
	k_EControllerActionOrigin_SteamV2_RightGrip_Upper_Pressure = 163,
	k_EControllerActionOrigin_SteamV2_Start                    = 164,
	k_EControllerActionOrigin_SteamV2_Back                     = 165,
	k_EControllerActionOrigin_SteamV2_LeftPad_Touch            = 166,
	k_EControllerActionOrigin_SteamV2_LeftPad_Swipe            = 167,
	k_EControllerActionOrigin_SteamV2_LeftPad_Click            = 168,
	k_EControllerActionOrigin_SteamV2_LeftPad_Pressure         = 169,
	k_EControllerActionOrigin_SteamV2_LeftPad_DPadNorth        = 170,
	k_EControllerActionOrigin_SteamV2_LeftPad_DPadSouth        = 171,
	k_EControllerActionOrigin_SteamV2_LeftPad_DPadWest         = 172,
	k_EControllerActionOrigin_SteamV2_LeftPad_DPadEast         = 173,
	k_EControllerActionOrigin_SteamV2_RightPad_Touch           = 174,
	k_EControllerActionOrigin_SteamV2_RightPad_Swipe           = 175,
	k_EControllerActionOrigin_SteamV2_RightPad_Click           = 176,
	k_EControllerActionOrigin_SteamV2_RightPad_Pressure        = 177,
	k_EControllerActionOrigin_SteamV2_RightPad_DPadNorth       = 178,
	k_EControllerActionOrigin_SteamV2_RightPad_DPadSouth       = 179,
	k_EControllerActionOrigin_SteamV2_RightPad_DPadWest        = 180,
	k_EControllerActionOrigin_SteamV2_RightPad_DPadEast        = 181,
	k_EControllerActionOrigin_SteamV2_LeftTrigger_Pull         = 182,
	k_EControllerActionOrigin_SteamV2_LeftTrigger_Click        = 183,
	k_EControllerActionOrigin_SteamV2_RightTrigger_Pull        = 184,
	k_EControllerActionOrigin_SteamV2_RightTrigger_Click       = 185,
	k_EControllerActionOrigin_SteamV2_LeftStick_Move           = 186,
	k_EControllerActionOrigin_SteamV2_LeftStick_Click          = 187,
	k_EControllerActionOrigin_SteamV2_LeftStick_DPadNorth      = 188,
	k_EControllerActionOrigin_SteamV2_LeftStick_DPadSouth      = 189,
	k_EControllerActionOrigin_SteamV2_LeftStick_DPadWest       = 190,
	k_EControllerActionOrigin_SteamV2_LeftStick_DPadEast       = 191,
	k_EControllerActionOrigin_SteamV2_Gyro_Move                = 192,
	k_EControllerActionOrigin_SteamV2_Gyro_Pitch               = 193,
	k_EControllerActionOrigin_SteamV2_Gyro_Yaw                 = 194,
	k_EControllerActionOrigin_SteamV2_Gyro_Roll                = 195,
	k_EControllerActionOrigin_Switch_A                         = 196,
	k_EControllerActionOrigin_Switch_B                         = 197,
	k_EControllerActionOrigin_Switch_X                         = 198,
	k_EControllerActionOrigin_Switch_Y                         = 199,
	k_EControllerActionOrigin_Switch_LeftBumper                = 200,
	k_EControllerActionOrigin_Switch_RightBumper               = 201,
	k_EControllerActionOrigin_Switch_Plus                      = 202,
	k_EControllerActionOrigin_Switch_Minus                     = 203,
	k_EControllerActionOrigin_Switch_Capture                   = 204,
	k_EControllerActionOrigin_Switch_LeftTrigger_Pull          = 205,
	k_EControllerActionOrigin_Switch_LeftTrigger_Click         = 206,
	k_EControllerActionOrigin_Switch_RightTrigger_Pull         = 207,
	k_EControllerActionOrigin_Switch_RightTrigger_Click        = 208,
	k_EControllerActionOrigin_Switch_LeftStick_Move            = 209,
	k_EControllerActionOrigin_Switch_LeftStick_Click           = 210,
	k_EControllerActionOrigin_Switch_LeftStick_DPadNorth       = 211,
	k_EControllerActionOrigin_Switch_LeftStick_DPadSouth       = 212,
	k_EControllerActionOrigin_Switch_LeftStick_DPadWest        = 213,
	k_EControllerActionOrigin_Switch_LeftStick_DPadEast        = 214,
	k_EControllerActionOrigin_Switch_RightStick_Move           = 215,
	k_EControllerActionOrigin_Switch_RightStick_Click          = 216,
	k_EControllerActionOrigin_Switch_RightStick_DPadNorth      = 217,
	k_EControllerActionOrigin_Switch_RightStick_DPadSouth      = 218,
	k_EControllerActionOrigin_Switch_RightStick_DPadWest       = 219,
	k_EControllerActionOrigin_Switch_RightStick_DPadEast       = 220,
	k_EControllerActionOrigin_Switch_DPad_North                = 221,
	k_EControllerActionOrigin_Switch_DPad_South                = 222,
	k_EControllerActionOrigin_Switch_DPad_West                 = 223,
	k_EControllerActionOrigin_Switch_DPad_East                 = 224,
	k_EControllerActionOrigin_Switch_ProGyro_Move              = 225,
	k_EControllerActionOrigin_Switch_ProGyro_Pitch             = 226,
	k_EControllerActionOrigin_Switch_ProGyro_Yaw               = 227,
	k_EControllerActionOrigin_Switch_ProGyro_Roll              = 228,
	k_EControllerActionOrigin_Switch_RightGyro_Move            = 229,
	k_EControllerActionOrigin_Switch_RightGyro_Pitch           = 230,
	k_EControllerActionOrigin_Switch_RightGyro_Yaw             = 231,
	k_EControllerActionOrigin_Switch_RightGyro_Roll            = 232,
	k_EControllerActionOrigin_Switch_LeftGyro_Move             = 233,
	k_EControllerActionOrigin_Switch_LeftGyro_Pitch            = 234,
	k_EControllerActionOrigin_Switch_LeftGyro_Yaw              = 235,
	k_EControllerActionOrigin_Switch_LeftGyro_Roll             = 236,
	k_EControllerActionOrigin_Switch_LeftGrip_Lower            = 237,
	k_EControllerActionOrigin_Switch_LeftGrip_Upper            = 238,
	k_EControllerActionOrigin_Switch_RightGrip_Lower           = 239,
	k_EControllerActionOrigin_Switch_RightGrip_Upper           = 240,
	k_EControllerActionOrigin_PS4_DPad_Move                    = 241,
	k_EControllerActionOrigin_XBoxOne_DPad_Move                = 242,
	k_EControllerActionOrigin_XBox360_DPad_Move                = 243,
	k_EControllerActionOrigin_Switch_DPad_Move                 = 244,
	k_EControllerActionOrigin_PS5_X                            = 245,
	k_EControllerActionOrigin_PS5_Circle                       = 246,
	k_EControllerActionOrigin_PS5_Triangle                     = 247,
	k_EControllerActionOrigin_PS5_Square                       = 248,
	k_EControllerActionOrigin_PS5_LeftBumper                   = 249,
	k_EControllerActionOrigin_PS5_RightBumper                  = 250,
	k_EControllerActionOrigin_PS5_Option                       = 251,
	k_EControllerActionOrigin_PS5_Create                       = 252,
	k_EControllerActionOrigin_PS5_Mute                         = 253,
	k_EControllerActionOrigin_PS5_LeftPad_Touch                = 254,
	k_EControllerActionOrigin_PS5_LeftPad_Swipe                = 255,
	k_EControllerActionOrigin_PS5_LeftPad_Click                = 256,
	k_EControllerActionOrigin_PS5_LeftPad_DPadNorth            = 257,
	k_EControllerActionOrigin_PS5_LeftPad_DPadSouth            = 258,
	k_EControllerActionOrigin_PS5_LeftPad_DPadWest             = 259,
	k_EControllerActionOrigin_PS5_LeftPad_DPadEast             = 260,
	k_EControllerActionOrigin_PS5_RightPad_Touch               = 261,
	k_EControllerActionOrigin_PS5_RightPad_Swipe               = 262,
	k_EControllerActionOrigin_PS5_RightPad_Click               = 263,
	k_EControllerActionOrigin_PS5_RightPad_DPadNorth           = 264,
	k_EControllerActionOrigin_PS5_RightPad_DPadSouth           = 265,
	k_EControllerActionOrigin_PS5_RightPad_DPadWest            = 266,
	k_EControllerActionOrigin_PS5_RightPad_DPadEast            = 267,
	k_EControllerActionOrigin_PS5_CenterPad_Touch              = 268,
	k_EControllerActionOrigin_PS5_CenterPad_Swipe              = 269,
	k_EControllerActionOrigin_PS5_CenterPad_Click              = 270,
	k_EControllerActionOrigin_PS5_CenterPad_DPadNorth          = 271,
	k_EControllerActionOrigin_PS5_CenterPad_DPadSouth          = 272,
	k_EControllerActionOrigin_PS5_CenterPad_DPadWest           = 273,
	k_EControllerActionOrigin_PS5_CenterPad_DPadEast           = 274,
	k_EControllerActionOrigin_PS5_LeftTrigger_Pull             = 275,
	k_EControllerActionOrigin_PS5_LeftTrigger_Click            = 276,
	k_EControllerActionOrigin_PS5_RightTrigger_Pull            = 277,
	k_EControllerActionOrigin_PS5_RightTrigger_Click           = 278,
	k_EControllerActionOrigin_PS5_LeftStick_Move               = 279,
	k_EControllerActionOrigin_PS5_LeftStick_Click              = 280,
	k_EControllerActionOrigin_PS5_LeftStick_DPadNorth          = 281,
	k_EControllerActionOrigin_PS5_LeftStick_DPadSouth          = 282,
	k_EControllerActionOrigin_PS5_LeftStick_DPadWest           = 283,
	k_EControllerActionOrigin_PS5_LeftStick_DPadEast           = 284,
	k_EControllerActionOrigin_PS5_RightStick_Move              = 285,
	k_EControllerActionOrigin_PS5_RightStick_Click             = 286,
	k_EControllerActionOrigin_PS5_RightStick_DPadNorth         = 287,
	k_EControllerActionOrigin_PS5_RightStick_DPadSouth         = 288,
	k_EControllerActionOrigin_PS5_RightStick_DPadWest          = 289,
	k_EControllerActionOrigin_PS5_RightStick_DPadEast          = 290,
	k_EControllerActionOrigin_PS5_DPad_Move                    = 291,
	k_EControllerActionOrigin_PS5_DPad_North                   = 292,
	k_EControllerActionOrigin_PS5_DPad_South                   = 293,
	k_EControllerActionOrigin_PS5_DPad_West                    = 294,
	k_EControllerActionOrigin_PS5_DPad_East                    = 295,
	k_EControllerActionOrigin_PS5_Gyro_Move                    = 296,
	k_EControllerActionOrigin_PS5_Gyro_Pitch                   = 297,
	k_EControllerActionOrigin_PS5_Gyro_Yaw                     = 298,
	k_EControllerActionOrigin_PS5_Gyro_Roll                    = 299,
	k_EControllerActionOrigin_XBoxOne_LeftGrip_Lower           = 300,
	k_EControllerActionOrigin_XBoxOne_LeftGrip_Upper           = 301,
	k_EControllerActionOrigin_XBoxOne_RightGrip_Lower          = 302,
	k_EControllerActionOrigin_XBoxOne_RightGrip_Upper          = 303,
	k_EControllerActionOrigin_XBoxOne_Share                    = 304,
	k_EControllerActionOrigin_SteamDeck_A                      = 305,
	k_EControllerActionOrigin_SteamDeck_B                      = 306,
	k_EControllerActionOrigin_SteamDeck_X                      = 307,
	k_EControllerActionOrigin_SteamDeck_Y                      = 308,
	k_EControllerActionOrigin_SteamDeck_L1                     = 309,
	k_EControllerActionOrigin_SteamDeck_R1                     = 310,
	k_EControllerActionOrigin_SteamDeck_Menu                   = 311,
	k_EControllerActionOrigin_SteamDeck_View                   = 312,
	k_EControllerActionOrigin_SteamDeck_LeftPad_Touch          = 313,
	k_EControllerActionOrigin_SteamDeck_LeftPad_Swipe          = 314,
	k_EControllerActionOrigin_SteamDeck_LeftPad_Click          = 315,
	k_EControllerActionOrigin_SteamDeck_LeftPad_DPadNorth      = 316,
	k_EControllerActionOrigin_SteamDeck_LeftPad_DPadSouth      = 317,
	k_EControllerActionOrigin_SteamDeck_LeftPad_DPadWest       = 318,
	k_EControllerActionOrigin_SteamDeck_LeftPad_DPadEast       = 319,
	k_EControllerActionOrigin_SteamDeck_RightPad_Touch         = 320,
	k_EControllerActionOrigin_SteamDeck_RightPad_Swipe         = 321,
	k_EControllerActionOrigin_SteamDeck_RightPad_Click         = 322,
	k_EControllerActionOrigin_SteamDeck_RightPad_DPadNorth     = 323,
	k_EControllerActionOrigin_SteamDeck_RightPad_DPadSouth     = 324,
	k_EControllerActionOrigin_SteamDeck_RightPad_DPadWest      = 325,
	k_EControllerActionOrigin_SteamDeck_RightPad_DPadEast      = 326,
	k_EControllerActionOrigin_SteamDeck_L2_SoftPull            = 327,
	k_EControllerActionOrigin_SteamDeck_L2                     = 328,
	k_EControllerActionOrigin_SteamDeck_R2_SoftPull            = 329,
	k_EControllerActionOrigin_SteamDeck_R2                     = 330,
	k_EControllerActionOrigin_SteamDeck_LeftStick_Move         = 331,
	k_EControllerActionOrigin_SteamDeck_L3                     = 332,
	k_EControllerActionOrigin_SteamDeck_LeftStick_DPadNorth    = 333,
	k_EControllerActionOrigin_SteamDeck_LeftStick_DPadSouth    = 334,
	k_EControllerActionOrigin_SteamDeck_LeftStick_DPadWest     = 335,
	k_EControllerActionOrigin_SteamDeck_LeftStick_DPadEast     = 336,
	k_EControllerActionOrigin_SteamDeck_LeftStick_Touch        = 337,
	k_EControllerActionOrigin_SteamDeck_RightStick_Move        = 338,
	k_EControllerActionOrigin_SteamDeck_R3                     = 339,
	k_EControllerActionOrigin_SteamDeck_RightStick_DPadNorth   = 340,
	k_EControllerActionOrigin_SteamDeck_RightStick_DPadSouth   = 341,
	k_EControllerActionOrigin_SteamDeck_RightStick_DPadWest    = 342,
	k_EControllerActionOrigin_SteamDeck_RightStick_DPadEast    = 343,
	k_EControllerActionOrigin_SteamDeck_RightStick_Touch       = 344,
	k_EControllerActionOrigin_SteamDeck_L4                     = 345,
	k_EControllerActionOrigin_SteamDeck_R4                     = 346,
	k_EControllerActionOrigin_SteamDeck_L5                     = 347,
	k_EControllerActionOrigin_SteamDeck_R5                     = 348,
	k_EControllerActionOrigin_SteamDeck_DPad_Move              = 349,
	k_EControllerActionOrigin_SteamDeck_DPad_North             = 350,
	k_EControllerActionOrigin_SteamDeck_DPad_South             = 351,
	k_EControllerActionOrigin_SteamDeck_DPad_West              = 352,
	k_EControllerActionOrigin_SteamDeck_DPad_East              = 353,
	k_EControllerActionOrigin_SteamDeck_Gyro_Move              = 354,
	k_EControllerActionOrigin_SteamDeck_Gyro_Pitch             = 355,
	k_EControllerActionOrigin_SteamDeck_Gyro_Yaw               = 356,
	k_EControllerActionOrigin_SteamDeck_Gyro_Roll              = 357,
	k_EControllerActionOrigin_SteamDeck_Reserved1              = 358,
	k_EControllerActionOrigin_SteamDeck_Reserved2              = 359,
	k_EControllerActionOrigin_SteamDeck_Reserved3              = 360,
	k_EControllerActionOrigin_SteamDeck_Reserved4              = 361,
	k_EControllerActionOrigin_SteamDeck_Reserved5              = 362,
	k_EControllerActionOrigin_SteamDeck_Reserved6              = 363,
	k_EControllerActionOrigin_SteamDeck_Reserved7              = 364,
	k_EControllerActionOrigin_SteamDeck_Reserved8              = 365,
	k_EControllerActionOrigin_SteamDeck_Reserved9              = 366,
	k_EControllerActionOrigin_SteamDeck_Reserved10             = 367,
	k_EControllerActionOrigin_SteamDeck_Reserved11             = 368,
	k_EControllerActionOrigin_SteamDeck_Reserved12             = 369,
	k_EControllerActionOrigin_SteamDeck_Reserved13             = 370,
	k_EControllerActionOrigin_SteamDeck_Reserved14             = 371,
	k_EControllerActionOrigin_SteamDeck_Reserved15             = 372,
	k_EControllerActionOrigin_SteamDeck_Reserved16             = 373,
	k_EControllerActionOrigin_SteamDeck_Reserved17             = 374,
	k_EControllerActionOrigin_SteamDeck_Reserved18             = 375,
	k_EControllerActionOrigin_SteamDeck_Reserved19             = 376,
	k_EControllerActionOrigin_SteamDeck_Reserved20             = 377,
	k_EControllerActionOrigin_Count                            = 378,
	k_EControllerActionOrigin_MaximumPossibleValue             = 32767,
}

ESteamControllerLEDFlag :: enum {
	k_ESteamControllerLEDFlag_SetColor           = 0,
	k_ESteamControllerLEDFlag_RestoreUserDefault = 1,
}

EUGCMatchingUGCType :: enum {
	k_EUGCMatchingUGCType_Items              = 0,
	k_EUGCMatchingUGCType_Items_Mtx          = 1,
	k_EUGCMatchingUGCType_Items_ReadyToUse   = 2,
	k_EUGCMatchingUGCType_Collections        = 3,
	k_EUGCMatchingUGCType_Artwork            = 4,
	k_EUGCMatchingUGCType_Videos             = 5,
	k_EUGCMatchingUGCType_Screenshots        = 6,
	k_EUGCMatchingUGCType_AllGuides          = 7,
	k_EUGCMatchingUGCType_WebGuides          = 8,
	k_EUGCMatchingUGCType_IntegratedGuides   = 9,
	k_EUGCMatchingUGCType_UsableInGame       = 10,
	k_EUGCMatchingUGCType_ControllerBindings = 11,
	k_EUGCMatchingUGCType_GameManagedItems   = 12,
	k_EUGCMatchingUGCType_All                = -1,
}

EUserUGCList :: enum {
	k_EUserUGCList_Published     = 0,
	k_EUserUGCList_VotedOn       = 1,
	k_EUserUGCList_VotedUp       = 2,
	k_EUserUGCList_VotedDown     = 3,
	k_EUserUGCList_WillVoteLater = 4,
	k_EUserUGCList_Favorited     = 5,
	k_EUserUGCList_Subscribed    = 6,
	k_EUserUGCList_UsedOrPlayed  = 7,
	k_EUserUGCList_Followed      = 8,
}

EUserUGCListSortOrder :: enum {
	k_EUserUGCListSortOrder_CreationOrderDesc    = 0,
	k_EUserUGCListSortOrder_CreationOrderAsc     = 1,
	k_EUserUGCListSortOrder_TitleAsc             = 2,
	k_EUserUGCListSortOrder_LastUpdatedDesc      = 3,
	k_EUserUGCListSortOrder_SubscriptionDateDesc = 4,
	k_EUserUGCListSortOrder_VoteScoreDesc        = 5,
	k_EUserUGCListSortOrder_ForModeration        = 6,
}

EUGCQuery :: enum {
	k_EUGCQuery_RankedByVote                                  = 0,
	k_EUGCQuery_RankedByPublicationDate                       = 1,
	k_EUGCQuery_AcceptedForGameRankedByAcceptanceDate         = 2,
	k_EUGCQuery_RankedByTrend                                 = 3,
	k_EUGCQuery_FavoritedByFriendsRankedByPublicationDate     = 4,
	k_EUGCQuery_CreatedByFriendsRankedByPublicationDate       = 5,
	k_EUGCQuery_RankedByNumTimesReported                      = 6,
	k_EUGCQuery_CreatedByFollowedUsersRankedByPublicationDate = 7,
	k_EUGCQuery_NotYetRated                                   = 8,
	k_EUGCQuery_RankedByTotalVotesAsc                         = 9,
	k_EUGCQuery_RankedByVotesUp                               = 10,
	k_EUGCQuery_RankedByTextSearch                            = 11,
	k_EUGCQuery_RankedByTotalUniqueSubscriptions              = 12,
	k_EUGCQuery_RankedByPlaytimeTrend                         = 13,
	k_EUGCQuery_RankedByTotalPlaytime                         = 14,
	k_EUGCQuery_RankedByAveragePlaytimeTrend                  = 15,
	k_EUGCQuery_RankedByLifetimeAveragePlaytime               = 16,
	k_EUGCQuery_RankedByPlaytimeSessionsTrend                 = 17,
	k_EUGCQuery_RankedByLifetimePlaytimeSessions              = 18,
	k_EUGCQuery_RankedByLastUpdatedDate                       = 19,
}

EItemUpdateStatus :: enum {
	k_EItemUpdateStatusInvalid              = 0,
	k_EItemUpdateStatusPreparingConfig      = 1,
	k_EItemUpdateStatusPreparingContent     = 2,
	k_EItemUpdateStatusUploadingContent     = 3,
	k_EItemUpdateStatusUploadingPreviewFile = 4,
	k_EItemUpdateStatusCommittingChanges    = 5,
}

EItemState :: enum {
	k_EItemStateNone            = 0,
	k_EItemStateSubscribed      = 1,
	k_EItemStateLegacyItem      = 2,
	k_EItemStateInstalled       = 4,
	k_EItemStateNeedsUpdate     = 8,
	k_EItemStateDownloading     = 16,
	k_EItemStateDownloadPending = 32,
}

EItemStatistic :: enum {
	k_EItemStatistic_NumSubscriptions                    = 0,
	k_EItemStatistic_NumFavorites                        = 1,
	k_EItemStatistic_NumFollowers                        = 2,
	k_EItemStatistic_NumUniqueSubscriptions              = 3,
	k_EItemStatistic_NumUniqueFavorites                  = 4,
	k_EItemStatistic_NumUniqueFollowers                  = 5,
	k_EItemStatistic_NumUniqueWebsiteViews               = 6,
	k_EItemStatistic_ReportScore                         = 7,
	k_EItemStatistic_NumSecondsPlayed                    = 8,
	k_EItemStatistic_NumPlaytimeSessions                 = 9,
	k_EItemStatistic_NumComments                         = 10,
	k_EItemStatistic_NumSecondsPlayedDuringTimePeriod    = 11,
	k_EItemStatistic_NumPlaytimeSessionsDuringTimePeriod = 12,
}

EItemPreviewType :: enum {
	k_EItemPreviewType_Image                          = 0,
	k_EItemPreviewType_YouTubeVideo                   = 1,
	k_EItemPreviewType_Sketchfab                      = 2,
	k_EItemPreviewType_EnvironmentMap_HorizontalCross = 3,
	k_EItemPreviewType_EnvironmentMap_LatLong         = 4,
	k_EItemPreviewType_ReservedMax                    = 255,
}

ESteamItemFlags :: enum {
	k_ESteamItemNoTrade  = 1,
	k_ESteamItemRemoved  = 256,
	k_ESteamItemConsumed = 512,
}

EParentalFeature :: enum {
	k_EFeatureInvalid       = 0,
	k_EFeatureStore         = 1,
	k_EFeatureCommunity     = 2,
	k_EFeatureProfile       = 3,
	k_EFeatureFriends       = 4,
	k_EFeatureNews          = 5,
	k_EFeatureTrading       = 6,
	k_EFeatureSettings      = 7,
	k_EFeatureConsole       = 8,
	k_EFeatureBrowser       = 9,
	k_EFeatureParentalSetup = 10,
	k_EFeatureLibrary       = 11,
	k_EFeatureTest          = 12,
	k_EFeatureSiteLicense   = 13,
	k_EFeatureMax           = 14,
}

ESteamDeviceFormFactor :: enum {
	k_ESteamDeviceFormFactorUnknown  = 0,
	k_ESteamDeviceFormFactorPhone    = 1,
	k_ESteamDeviceFormFactorTablet   = 2,
	k_ESteamDeviceFormFactorComputer = 3,
	k_ESteamDeviceFormFactorTV       = 4,
}

ESteamNetworkingAvailability :: enum {
	k_ESteamNetworkingAvailability_CannotTry   = -102,
	k_ESteamNetworkingAvailability_Failed      = -101,
	k_ESteamNetworkingAvailability_Previously  = -100,
	k_ESteamNetworkingAvailability_Retrying    = -10,
	k_ESteamNetworkingAvailability_NeverTried  = 1,
	k_ESteamNetworkingAvailability_Waiting     = 2,
	k_ESteamNetworkingAvailability_Attempting  = 3,
	k_ESteamNetworkingAvailability_Current     = 100,
	k_ESteamNetworkingAvailability_Unknown     = 0,
	k_ESteamNetworkingAvailability__Force32bit = 2147483647,
}

ESteamNetworkingIdentityType :: enum {
	k_ESteamNetworkingIdentityType_Invalid        = 0,
	k_ESteamNetworkingIdentityType_SteamID        = 16,
	k_ESteamNetworkingIdentityType_XboxPairwiseID = 17,
	k_ESteamNetworkingIdentityType_SonyPSN        = 18,
	k_ESteamNetworkingIdentityType_GoogleStadia   = 19,
	k_ESteamNetworkingIdentityType_IPAddress      = 1,
	k_ESteamNetworkingIdentityType_GenericString  = 2,
	k_ESteamNetworkingIdentityType_GenericBytes   = 3,
	k_ESteamNetworkingIdentityType_UnknownType    = 4,
	k_ESteamNetworkingIdentityType__Force32bit    = 2147483647,
}

ESteamNetworkingFakeIPType :: enum {
	k_ESteamNetworkingFakeIPType_Invalid     = 0,
	k_ESteamNetworkingFakeIPType_NotFake     = 1,
	k_ESteamNetworkingFakeIPType_GlobalIPv4  = 2,
	k_ESteamNetworkingFakeIPType_LocalIPv4   = 3,
	k_ESteamNetworkingFakeIPType__Force32Bit = 2147483647,
}

ESteamNetworkingConnectionState :: enum {
	k_ESteamNetworkingConnectionState_None                   = 0,
	k_ESteamNetworkingConnectionState_Connecting             = 1,
	k_ESteamNetworkingConnectionState_FindingRoute           = 2,
	k_ESteamNetworkingConnectionState_Connected              = 3,
	k_ESteamNetworkingConnectionState_ClosedByPeer           = 4,
	k_ESteamNetworkingConnectionState_ProblemDetectedLocally = 5,
	k_ESteamNetworkingConnectionState_FinWait                = -1,
	k_ESteamNetworkingConnectionState_Linger                 = -2,
	k_ESteamNetworkingConnectionState_Dead                   = -3,
	k_ESteamNetworkingConnectionState__Force32Bit            = 2147483647,
}

ESteamNetConnectionEnd :: enum {
	k_ESteamNetConnectionEnd_Invalid                          = 0,
	k_ESteamNetConnectionEnd_App_Min                          = 1000,
	k_ESteamNetConnectionEnd_App_Generic                      = 1000,
	k_ESteamNetConnectionEnd_App_Max                          = 1999,
	k_ESteamNetConnectionEnd_AppException_Min                 = 2000,
	k_ESteamNetConnectionEnd_AppException_Generic             = 2000,
	k_ESteamNetConnectionEnd_AppException_Max                 = 2999,
	k_ESteamNetConnectionEnd_Local_Min                        = 3000,
	k_ESteamNetConnectionEnd_Local_OfflineMode                = 3001,
	k_ESteamNetConnectionEnd_Local_ManyRelayConnectivity      = 3002,
	k_ESteamNetConnectionEnd_Local_HostedServerPrimaryRelay   = 3003,
	k_ESteamNetConnectionEnd_Local_NetworkConfig              = 3004,
	k_ESteamNetConnectionEnd_Local_Rights                     = 3005,
	k_ESteamNetConnectionEnd_Local_P2P_ICE_NoPublicAddresses  = 3006,
	k_ESteamNetConnectionEnd_Local_Max                        = 3999,
	k_ESteamNetConnectionEnd_Remote_Min                       = 4000,
	k_ESteamNetConnectionEnd_Remote_Timeout                   = 4001,
	k_ESteamNetConnectionEnd_Remote_BadCrypt                  = 4002,
	k_ESteamNetConnectionEnd_Remote_BadCert                   = 4003,
	k_ESteamNetConnectionEnd_Remote_BadProtocolVersion        = 4006,
	k_ESteamNetConnectionEnd_Remote_P2P_ICE_NoPublicAddresses = 4007,
	k_ESteamNetConnectionEnd_Remote_Max                       = 4999,
	k_ESteamNetConnectionEnd_Misc_Min                         = 5000,
	k_ESteamNetConnectionEnd_Misc_Generic                     = 5001,
	k_ESteamNetConnectionEnd_Misc_InternalError               = 5002,
	k_ESteamNetConnectionEnd_Misc_Timeout                     = 5003,
	k_ESteamNetConnectionEnd_Misc_SteamConnectivity           = 5005,
	k_ESteamNetConnectionEnd_Misc_NoRelaySessionsToClient     = 5006,
	k_ESteamNetConnectionEnd_Misc_P2P_Rendezvous              = 5008,
	k_ESteamNetConnectionEnd_Misc_P2P_NAT_Firewall            = 5009,
	k_ESteamNetConnectionEnd_Misc_PeerSentNoConnection        = 5010,
	k_ESteamNetConnectionEnd_Misc_Max                         = 5999,
	k_ESteamNetConnectionEnd__Force32Bit                      = 2147483647,
}

ESteamNetworkingConfigScope :: enum {
	k_ESteamNetworkingConfig_Global           = 1,
	k_ESteamNetworkingConfig_SocketsInterface = 2,
	k_ESteamNetworkingConfig_ListenSocket     = 3,
	k_ESteamNetworkingConfig_Connection       = 4,
	k_ESteamNetworkingConfigScope__Force32Bit = 2147483647,
}

ESteamNetworkingConfigDataType :: enum {
	k_ESteamNetworkingConfig_Int32               = 1,
	k_ESteamNetworkingConfig_Int64               = 2,
	k_ESteamNetworkingConfig_f32                 = 3,
	k_ESteamNetworkingConfig_String              = 4,
	k_ESteamNetworkingConfig_Ptr                 = 5,
	k_ESteamNetworkingConfigDataType__Force32Bit = 2147483647,
}

ESteamNetworkingConfigValue :: enum {
	k_ESteamNetworkingConfig_Invalid                                        = 0,
	k_ESteamNetworkingConfig_TimeoutInitial                                 = 24,
	k_ESteamNetworkingConfig_TimeoutConnected                               = 25,
	k_ESteamNetworkingConfig_SendBufferSize                                 = 9,
	k_ESteamNetworkingConfig_ConnectionUserData                             = 40,
	k_ESteamNetworkingConfig_SendRateMin                                    = 10,
	k_ESteamNetworkingConfig_SendRateMax                                    = 11,
	k_ESteamNetworkingConfig_NagleTime                                      = 12,
	k_ESteamNetworkingConfig_IP_AllowWithoutAuth                            = 23,
	k_ESteamNetworkingConfig_MTU_PacketSize                                 = 32,
	k_ESteamNetworkingConfig_MTU_DataSize                                   = 33,
	k_ESteamNetworkingConfig_Unencrypted                                    = 34,
	k_ESteamNetworkingConfig_SymmetricConnect                               = 37,
	k_ESteamNetworkingConfig_LocalVirtualPort                               = 38,
	k_ESteamNetworkingConfig_DualWifi_Enable                                = 39,
	k_ESteamNetworkingConfig_EnableDiagnosticsUI                            = 46,
	k_ESteamNetworkingConfig_FakePacketLoss_Send                            = 2,
	k_ESteamNetworkingConfig_FakePacketLoss_Recv                            = 3,
	k_ESteamNetworkingConfig_FakePacketLag_Send                             = 4,
	k_ESteamNetworkingConfig_FakePacketLag_Recv                             = 5,
	k_ESteamNetworkingConfig_FakePacketReorder_Send                         = 6,
	k_ESteamNetworkingConfig_FakePacketReorder_Recv                         = 7,
	k_ESteamNetworkingConfig_FakePacketReorder_Time                         = 8,
	k_ESteamNetworkingConfig_FakePacketDup_Send                             = 26,
	k_ESteamNetworkingConfig_FakePacketDup_Recv                             = 27,
	k_ESteamNetworkingConfig_FakePacketDup_TimeMax                          = 28,
	k_ESteamNetworkingConfig_PacketTraceMaxBytes                            = 41,
	k_ESteamNetworkingConfig_FakeRateLimit_Send_Rate                        = 42,
	k_ESteamNetworkingConfig_FakeRateLimit_Send_Burst                       = 43,
	k_ESteamNetworkingConfig_FakeRateLimit_Recv_Rate                        = 44,
	k_ESteamNetworkingConfig_FakeRateLimit_Recv_Burst                       = 45,
	k_ESteamNetworkingConfig_Callback_ConnectionStatusChanged               = 201,
	k_ESteamNetworkingConfig_Callback_AuthStatusChanged                     = 202,
	k_ESteamNetworkingConfig_Callback_RelayNetworkStatusChanged             = 203,
	k_ESteamNetworkingConfig_Callback_MessagesSessionRequest                = 204,
	k_ESteamNetworkingConfig_Callback_MessagesSessionFailed                 = 205,
	k_ESteamNetworkingConfig_Callback_CreateConnectionSignaling             = 206,
	k_ESteamNetworkingConfig_Callback_FakeIPResult                          = 207,
	k_ESteamNetworkingConfig_P2P_STUN_ServerList                            = 103,
	k_ESteamNetworkingConfig_P2P_Transport_ICE_Enable                       = 104,
	k_ESteamNetworkingConfig_P2P_Transport_ICE_Penalty                      = 105,
	k_ESteamNetworkingConfig_P2P_Transport_SDR_Penalty                      = 106,
	k_ESteamNetworkingConfig_P2P_TURN_ServerList                            = 107,
	k_ESteamNetworkingConfig_P2P_TURN_UserList                              = 108,
	k_ESteamNetworkingConfig_P2P_TURN_PassList                              = 109,
	k_ESteamNetworkingConfig_P2P_Transport_ICE_Implementation               = 110,
	k_ESteamNetworkingConfig_SDRClient_ConsecutitivePingTimeoutsFailInitial = 19,
	k_ESteamNetworkingConfig_SDRClient_ConsecutitivePingTimeoutsFail        = 20,
	k_ESteamNetworkingConfig_SDRClient_MinPingsBeforePingAccurate           = 21,
	k_ESteamNetworkingConfig_SDRClient_SingleSocket                         = 22,
	k_ESteamNetworkingConfig_SDRClient_ForceRelayCluster                    = 29,
	k_ESteamNetworkingConfig_SDRClient_DebugTicketAddress                   = 30,
	k_ESteamNetworkingConfig_SDRClient_ForceProxyAddr                       = 31,
	k_ESteamNetworkingConfig_SDRClient_FakeClusterPing                      = 36,
	k_ESteamNetworkingConfig_LogLevel_AckRTT                                = 13,
	k_ESteamNetworkingConfig_LogLevel_PacketDecode                          = 14,
	k_ESteamNetworkingConfig_LogLevel_Message                               = 15,
	k_ESteamNetworkingConfig_LogLevel_PacketGaps                            = 16,
	k_ESteamNetworkingConfig_LogLevel_P2PRendezvous                         = 17,
	k_ESteamNetworkingConfig_LogLevel_SDRRelayPings                         = 18,
	k_ESteamNetworkingConfig_DELETED_EnumerateDevVars                       = 35,
	k_ESteamNetworkingConfigValue__Force32Bit                               = 2147483647,
}

ESteamNetworkingGetConfigValueResult :: enum {
	k_ESteamNetworkingGetConfigValue_BadValue          = -1,
	k_ESteamNetworkingGetConfigValue_BadScopeObj       = -2,
	k_ESteamNetworkingGetConfigValue_BufferTooSmall    = -3,
	k_ESteamNetworkingGetConfigValue_OK                = 1,
	k_ESteamNetworkingGetConfigValue_OKInherited       = 2,
	k_ESteamNetworkingGetConfigValueResult__Force32Bit = 2147483647,
}

ESteamNetworkingSocketsDebugOutputType :: enum {
	k_ESteamNetworkingSocketsDebugOutputType_None        = 0,
	k_ESteamNetworkingSocketsDebugOutputType_Bug         = 1,
	k_ESteamNetworkingSocketsDebugOutputType_Error       = 2,
	k_ESteamNetworkingSocketsDebugOutputType_Important   = 3,
	k_ESteamNetworkingSocketsDebugOutputType_Warning     = 4,
	k_ESteamNetworkingSocketsDebugOutputType_Msg         = 5,
	k_ESteamNetworkingSocketsDebugOutputType_Verbose     = 6,
	k_ESteamNetworkingSocketsDebugOutputType_Debug       = 7,
	k_ESteamNetworkingSocketsDebugOutputType_Everything  = 8,
	k_ESteamNetworkingSocketsDebugOutputType__Force32Bit = 2147483647,
}

EServerMode :: enum {
	eServerModeInvalid                 = 0,
	eServerModeNoAuthentication        = 1,
	eServerModeAuthentication          = 2,
	eServerModeAuthenticationAndSecure = 3,
}

IHTMLSurface_EHTMLMouseButton :: enum {
	eHTMLMouseButton_Left   = 0,
	eHTMLMouseButton_Right  = 1,
	eHTMLMouseButton_Middle = 2,
}

IHTMLSurface_EMouseCursor :: enum {
	dc_user           = 0,
	dc_none           = 1,
	dc_arrow          = 2,
	dc_ibeam          = 3,
	dc_hourglass      = 4,
	dc_waitarrow      = 5,
	dc_crosshair      = 6,
	dc_up             = 7,
	dc_sizenw         = 8,
	dc_sizese         = 9,
	dc_sizene         = 10,
	dc_sizesw         = 11,
	dc_sizew          = 12,
	dc_sizee          = 13,
	dc_sizen          = 14,
	dc_sizes          = 15,
	dc_sizewe         = 16,
	dc_sizens         = 17,
	dc_sizeall        = 18,
	dc_no             = 19,
	dc_hand           = 20,
	dc_blank          = 21,
	dc_middle_pan     = 22,
	dc_north_pan      = 23,
	dc_north_east_pan = 24,
	dc_east_pan       = 25,
	dc_south_east_pan = 26,
	dc_south_pan      = 27,
	dc_south_west_pan = 28,
	dc_west_pan       = 29,
	dc_north_west_pan = 30,
	dc_alias          = 31,
	dc_cell           = 32,
	dc_colresize      = 33,
	dc_copycur        = 34,
	dc_verticaltext   = 35,
	dc_rowresize      = 36,
	dc_zoomin         = 37,
	dc_zoomout        = 38,
	dc_help           = 39,
	dc_custom         = 40,
	dc_last           = 41,
}

IHTMLSurface_EHTMLKeyModifiers :: enum {
	k_eHTMLKeyModifier_None      = 0,
	k_eHTMLKeyModifier_AltDown   = 1,
	k_eHTMLKeyModifier_CtrlDown  = 2,
	k_eHTMLKeyModifier_ShiftDown = 4,
}

SteamIPAddress_t :: struct #packed {
	m_rgubIPv6: [16]uint8,
	m_eType:    ESteamIPType,
}

FriendGameInfo_t :: struct #packed {
	m_gameID:       CGameID,
	m_unGameIP:     uint32,
	m_usGamePort:   uint16,
	m_usQueryPort:  uint16,
	m_steamIDLobby: CSteamID,
}

MatchMakingKeyValuePair_t :: struct #packed {
	m_szKey:   [256]u8,
	m_szValue: [256]u8,
}

servernetadr_t :: struct #packed {
	m_usConnectionPort: uint16,
	m_usQueryPort:      uint16,
	m_unIP:             uint32,
}

gameserveritem_t :: struct #packed {
	m_NetAdr:                 servernetadr_t,
	m_nPing:                  c.int,
	m_bHadSuccessfulResponse: bool,
	m_bDoNotRefresh:          bool,
	m_szGameDir:              [32]u8,
	m_szMap:                  [32]u8,
	m_szGameDescription:      [64]u8,
	m_nAppID:                 uint32,
	m_nPlayers:               c.int,
	m_nMaxPlayers:            c.int,
	m_nBotPlayers:            c.int,
	m_bPassword:              bool,
	m_bSecure:                bool,
	m_ulTimeLastPlayed:       uint32,
	m_nServerVersion:         c.int,
	m_szServerName:           [64]u8,
	m_szGameTags:             [128]u8,
	m_steamID:                CSteamID,
}

SteamPartyBeaconLocation_t :: struct #packed {
	m_eType:        ESteamPartyBeaconLocationType,
	m_ulLocationID: uint64,
}

SteamParamStringArray_t :: struct #packed {
	m_ppStrings:   ^cstring,
	m_nNumStrings: int32,
}

LeaderboardEntry_t :: struct #packed {
	m_steamIDUser: CSteamID,
	m_nGlobalRank: int32,
	m_nScore:      int32,
	m_cDetails:    int32,
	m_hUGC:        UGCHandle_t,
}

P2PSessionState_t :: struct #packed {
	m_bConnectionActive:     uint8,
	m_bConnecting:           uint8,
	m_eP2PSessionError:      uint8,
	m_bUsingRelay:           uint8,
	m_nBytesQueuedForSend:   int32,
	m_nPacketsQueuedForSend: int32,
	m_nRemoteIP:             uint32,
	m_nRemotePort:           uint16,
}

InputAnalogActionData_t :: struct #packed {
	eMode:   EInputSourceMode,
	x:       f32,
	y:       f32,
	bActive: bool,
}

InputDigitalActionData_t :: struct #packed {
	bState:  bool,
	bActive: bool,
}

InputMotionData_t :: struct #packed {
	rotQuatX:  f32,
	rotQuatY:  f32,
	rotQuatZ:  f32,
	rotQuatW:  f32,
	posAccelX: f32,
	posAccelY: f32,
	posAccelZ: f32,
	rotVelX:   f32,
	rotVelY:   f32,
	rotVelZ:   f32,
}

SteamUGCDetails_t :: struct #packed {
	m_nPublishedFileId:     PublishedFileId_t,
	m_eResult:              EResult,
	m_eFileType:            EWorkshopFileType,
	m_nCreatorAppID:        AppId_t,
	m_nConsumerAppID:       AppId_t,
	m_rgchTitle:            [129]u8,
	m_rgchDescription:      [8000]u8,
	m_ulSteamIDOwner:       uint64,
	m_rtimeCreated:         uint32,
	m_rtimeUpdated:         uint32,
	m_rtimeAddedToUserList: uint32,
	m_eVisibility:          ERemoteStoragePublishedFileVisibility,
	m_bBanned:              bool,
	m_bAcceptedForUse:      bool,
	m_bTagsTruncated:       bool,
	m_rgchTags:             [1025]u8,
	m_hFile:                UGCHandle_t,
	m_hPreviewFile:         UGCHandle_t,
	m_pchFileName:          [260]u8,
	m_nFileSize:            int32,
	m_nPreviewFileSize:     int32,
	m_rgchURL:              [256]u8,
	m_unVotesUp:            uint32,
	m_unVotesDown:          uint32,
	m_flScore:              f32,
	m_unNumChildren:        uint32,
}

SteamItemDetails_t :: struct #packed {
	m_itemId:      SteamItemInstanceID_t,
	m_iDefinition: SteamItemDef_t,
	m_unQuantity:  uint16,
	m_unFlags:     uint16,
}

SteamNetworkingIPAddr :: struct #packed {
	m_ipv6: [16]uint8,
	m_port: uint16,
}

SteamNetworkingIdentity :: struct #packed {
	m_eType:              ESteamNetworkingIdentityType,
	m_cbSize:             c.int,
	m_szUnknownRawString: [128]u8,
}

SteamNetConnectionInfo_t :: struct #packed {
	m_identityRemote:          SteamNetworkingIdentity,
	m_nUserData:               int64,
	m_hListenSocket:           HSteamListenSocket,
	m_addrRemote:              SteamNetworkingIPAddr,
	m__pad1:                   uint16,
	m_idPOPRemote:             SteamNetworkingPOPID,
	m_idPOPRelay:              SteamNetworkingPOPID,
	m_eState:                  ESteamNetworkingConnectionState,
	m_eEndReason:              c.int,
	m_szEndDebug:              [128]u8,
	m_szConnectionDescription: [128]u8,
	m_nFlags:                  c.int,
	reserved:                  [63]uint32,
}

SteamNetConnectionRealTimeStatus_t :: struct #packed {
	m_eState:                    ESteamNetworkingConnectionState,
	m_nPing:                     c.int,
	m_flConnectionQualityLocal:  f32,
	m_flConnectionQualityRemote: f32,
	m_flOutPacketsPerSec:        f32,
	m_flOutBytesPerSec:          f32,
	m_flInPacketsPerSec:         f32,
	m_flInBytesPerSec:           f32,
	m_nSendRateBytesPerSecond:   c.int,
	m_cbPendingUnreliable:       c.int,
	m_cbPendingReliable:         c.int,
	m_cbSentUnackedReliable:     c.int,
	m_usecQueueTime:             SteamNetworkingMicroseconds,
	reserved:                    [16]uint32,
}

SteamNetConnectionRealTimeLaneStatus_t :: struct #packed {
	m_cbPendingUnreliable:   c.int,
	m_cbPendingReliable:     c.int,
	m_cbSentUnackedReliable: c.int,
	_reservePad1:            c.int,
	m_usecQueueTime:         SteamNetworkingMicroseconds,
	reserved:                [10]uint32,
}

SteamNetworkPingLocation_t :: struct #packed {
	m_data: [512]uint8,
}

SteamNetworkingConfigValue_t :: struct #packed {
	m_eValue:    ESteamNetworkingConfigValue,
	m_eDataType: ESteamNetworkingConfigDataType,
	m_int64:     int64,
}

SteamDatagramHostedAddress :: struct #packed {
	m_cbSize: c.int,
	m_data:   [128]u8,
}

SteamDatagramGameCoordinatorServerLogin :: struct #packed {
	m_identity:  SteamNetworkingIdentity,
	m_routing:   SteamDatagramHostedAddress,
	m_nAppID:    AppId_t,
	m_rtime:     RTime32,
	m_cbAppData: c.int,
	m_appData:   [2048]u8,
}

SteamAPIWarningMessageHook_t :: proc "c" (_: c.int, _: cstring)


Client :: SteamClient
User: proc "c" () -> ^IUser : SteamUser_v021
Friends: proc "c" () -> ^IFriends : SteamFriends_v017
Utils: proc "c" () -> ^IUtils : SteamUtils_v010
Matchmaking: proc "c" () -> ^IMatchmaking : SteamMatchmaking_v009
MatchmakingServers: proc "c" () -> ^IMatchmakingServers : SteamMatchmakingServers_v002
GameSearch: proc "c" () -> ^IGameSearch : SteamGameSearch_v001
Parties: proc "c" () -> ^IParties : SteamParties_v002
RemoteStorage: proc "c" () -> ^IRemoteStorage : SteamRemoteStorage_v016
UserStats: proc "c" () -> ^IUserStats : SteamUserStats_v012
Apps: proc "c" () -> ^IApps : SteamApps_v008
Networking: proc "c" () -> ^INetworking : SteamNetworking_v006
Screenshots: proc "c" () -> ^IScreenshots : SteamScreenshots_v003
Music: proc "c" () -> ^IMusic : SteamMusic_v001
MusicRemote: proc "c" () -> ^IMusicRemote : SteamMusicRemote_v001
HTTP: proc "c" () -> ^IHTTP : SteamHTTP_v003
Input: proc "c" () -> ^IInput : SteamInput_v006
Controller: proc "c" () -> ^IController : SteamController_v008
UGC: proc "c" () -> ^IUGC : SteamUGC_v016
AppList: proc "c" () -> ^IAppList : SteamAppList_v001
HTMLSurface: proc "c" () -> ^IHTMLSurface : SteamHTMLSurface_v005
Inventory: proc "c" () -> ^IInventory : SteamInventory_v003
Video: proc "c" () -> ^IVideo : SteamVideo_v002
ParentalSettings: proc "c" () -> ^IParentalSettings : SteamParentalSettings_v001
RemotePlay: proc "c" () -> ^IRemotePlay : SteamRemotePlay_v001
NetworkingMessages_SteamAPI: proc "c" () -> ^INetworkingMessages : SteamNetworkingMessages_SteamAPI_v002
NetworkingSockets_SteamAPI: proc "c" () -> ^INetworkingSockets : SteamNetworkingSockets_SteamAPI_v012

IClient :: distinct rawptr
IUser :: distinct rawptr
IFriends :: distinct rawptr
IUtils :: distinct rawptr
IMatchmaking :: distinct rawptr
IMatchmakingServerListResponse :: distinct rawptr
IMatchmakingPingResponse :: distinct rawptr
IMatchmakingPlayersResponse :: distinct rawptr
IMatchmakingRulesResponse :: distinct rawptr
IMatchmakingServers :: distinct rawptr
IGameSearch :: distinct rawptr
IParties :: distinct rawptr
IRemoteStorage :: distinct rawptr
IUserStats :: distinct rawptr
IApps :: distinct rawptr
INetworking :: distinct rawptr
IScreenshots :: distinct rawptr
IMusic :: distinct rawptr
IMusicRemote :: distinct rawptr
IHTTP :: distinct rawptr
IInput :: distinct rawptr
IController :: distinct rawptr
IUGC :: distinct rawptr
IAppList :: distinct rawptr
IHTMLSurface :: distinct rawptr
IInventory :: distinct rawptr
IVideo :: distinct rawptr
IParentalSettings :: distinct rawptr
IRemotePlay :: distinct rawptr
INetworkingMessages :: distinct rawptr
INetworkingSockets :: distinct rawptr
INetworkingUtils :: distinct rawptr
IGameServer :: distinct rawptr
IGameServerStats :: distinct rawptr
INetworkingFakeUDPPort :: distinct rawptr


// No 'SteamAPI_' prefix
@(default_calling_convention = "c")
foreign lib {
	SteamClient :: proc() -> ^IClient ---
}

// --------------------------
// Global SteamAPI functionns
// --------------------------

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
	RestartAppIfNecessary :: proc "c" (unOwnAppID: uint32) -> bool ---

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

// ---------
// Accessors
// ---------

@(link_prefix = "SteamAPI_", default_calling_convention = "c")
foreign lib {
	SteamUser_v021 :: proc() -> ^IUser ---
	SteamFriends_v017 :: proc() -> ^IFriends ---
	SteamUtils_v010 :: proc() -> ^IUtils ---
	SteamMatchmaking_v009 :: proc() -> ^IMatchmaking ---
	SteamMatchmakingServers_v002 :: proc() -> ^IMatchmakingServers ---
	SteamGameSearch_v001 :: proc() -> ^IGameSearch ---
	SteamParties_v002 :: proc() -> ^IParties ---
	SteamRemoteStorage_v016 :: proc() -> ^IRemoteStorage ---
	SteamUserStats_v012 :: proc() -> ^IUserStats ---
	SteamApps_v008 :: proc() -> ^IApps ---
	SteamNetworking_v006 :: proc() -> ^INetworking ---
	SteamScreenshots_v003 :: proc() -> ^IScreenshots ---
	SteamMusic_v001 :: proc() -> ^IMusic ---
	SteamMusicRemote_v001 :: proc() -> ^IMusicRemote ---
	SteamHTTP_v003 :: proc() -> ^IHTTP ---
	SteamInput_v006 :: proc() -> ^IInput ---
	SteamController_v008 :: proc() -> ^IController ---
	SteamUGC_v016 :: proc() -> ^IUGC ---
	SteamAppList_v001 :: proc() -> ^IAppList ---
	SteamHTMLSurface_v005 :: proc() -> ^IHTMLSurface ---
	SteamInventory_v003 :: proc() -> ^IInventory ---
	SteamVideo_v002 :: proc() -> ^IVideo ---
	SteamParentalSettings_v001 :: proc() -> ^IParentalSettings ---
	SteamRemotePlay_v001 :: proc() -> ^IRemotePlay ---
	SteamNetworkingMessages_SteamAPI_v002 :: proc() -> ^INetworkingMessages ---
	SteamNetworkingSockets_SteamAPI_v012 :: proc() -> ^INetworkingSockets ---
}

// ----------
// Interfaces
// ----------

@(link_prefix = "SteamAPI_ISteam", default_calling_convention = "c")
foreign lib {
	Client_CreateSteamPipe :: proc(self: ^IClient) -> HSteamPipe ---
	Client_BReleaseSteamPipe :: proc(self: ^IClient, hSteamPipe: HSteamPipe) -> bool ---
	Client_ConnectToGlobalUser :: proc(self: ^IClient, hSteamPipe: HSteamPipe) -> HSteamUser ---
	Client_CreateLocalUser :: proc(self: ^IClient, phSteamPipe: ^HSteamPipe, eAccountType: EAccountType) -> HSteamUser ---
	Client_ReleaseUser :: proc(self: ^IClient, hSteamPipe: HSteamPipe, hUser: HSteamUser) ---
	Client_GetIUser :: proc(self: ^IClient, hSteamUser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: cstring) -> ^IUser ---
	Client_GetIGameServer :: proc(self: ^IClient, hSteamUser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: cstring) -> ^IGameServer ---
	Client_SetLocalIPBinding :: proc(self: ^IClient, unIP: ^SteamIPAddress_t, usPort: uint16) ---
	Client_GetIFriends :: proc(self: ^IClient, hSteamUser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: cstring) -> ^IFriends ---
	Client_GetIUtils :: proc(self: ^IClient, hSteamPipe: HSteamPipe, pchVersion: cstring) -> ^IUtils ---
	Client_GetIMatchmaking :: proc(self: ^IClient, hSteamUser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: cstring) -> ^IMatchmaking ---
	Client_GetIMatchmakingServers :: proc(self: ^IClient, hSteamUser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: cstring) -> ^IMatchmakingServers ---
	Client_GetIGenericInterface :: proc(self: ^IClient, hSteamUser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: cstring) -> rawptr ---
	Client_GetIUserStats :: proc(self: ^IClient, hSteamUser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: cstring) -> ^IUserStats ---
	Client_GetIGameServerStats :: proc(self: ^IClient, hSteamuser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: cstring) -> ^IGameServerStats ---
	Client_GetIApps :: proc(self: ^IClient, hSteamUser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: cstring) -> ^IApps ---
	Client_GetINetworking :: proc(self: ^IClient, hSteamUser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: cstring) -> ^INetworking ---
	Client_GetIRemoteStorage :: proc(self: ^IClient, hSteamuser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: cstring) -> ^IRemoteStorage ---
	Client_GetIScreenshots :: proc(self: ^IClient, hSteamuser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: cstring) -> ^IScreenshots ---
	Client_GetIGameSearch :: proc(self: ^IClient, hSteamuser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: cstring) -> ^IGameSearch ---
	Client_GetIPCCallCount :: proc(self: ^IClient) -> uint32 ---
	Client_SetWarningMessageHook :: proc(self: ^IClient, pFunction: SteamAPIWarningMessageHook_t) ---
	Client_BShutdownIfAllPipesClosed :: proc(self: ^IClient) -> bool ---
	Client_GetIHTTP :: proc(self: ^IClient, hSteamuser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: cstring) -> ^IHTTP ---
	Client_GetIController :: proc(self: ^IClient, hSteamUser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: cstring) -> ^IController ---
	Client_GetIUGC :: proc(self: ^IClient, hSteamUser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: cstring) -> ^IUGC ---
	Client_GetIAppList :: proc(self: ^IClient, hSteamUser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: cstring) -> ^IAppList ---
	Client_GetIMusic :: proc(self: ^IClient, hSteamuser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: cstring) -> ^IMusic ---
	Client_GetIMusicRemote :: proc(self: ^IClient, hSteamuser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: cstring) -> ^IMusicRemote ---
	Client_GetIHTMLSurface :: proc(self: ^IClient, hSteamuser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: cstring) -> ^IHTMLSurface ---
	Client_GetIInventory :: proc(self: ^IClient, hSteamuser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: cstring) -> ^IInventory ---
	Client_GetIVideo :: proc(self: ^IClient, hSteamuser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: cstring) -> ^IVideo ---
	Client_GetIParentalSettings :: proc(self: ^IClient, hSteamuser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: cstring) -> ^IParentalSettings ---
	Client_GetIInput :: proc(self: ^IClient, hSteamUser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: cstring) -> ^IInput ---
	Client_GetIParties :: proc(self: ^IClient, hSteamUser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: cstring) -> ^IParties ---
	Client_GetIRemotePlay :: proc(self: ^IClient, hSteamUser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: cstring) -> ^IRemotePlay ---

	User_GetHSteamUser :: proc(self: ^IUser) -> HSteamUser ---
	User_BLoggedOn :: proc(self: ^IUser) -> bool ---
	User_GetSteamID :: proc(self: ^IUser) -> CSteamID ---
	User_InitiateGameConnection_DEPRECATED :: proc(self: ^IUser, pAuthBlob: rawptr, cbMaxAuthBlob: c.int, steamIDGameServer: CSteamID, unIPServer: uint32, usPortServer: uint16, bSecure: bool) -> c.int ---
	User_TerminateGameConnection_DEPRECATED :: proc(self: ^IUser, unIPServer: uint32, usPortServer: uint16) ---
	User_TrackAppUsageEvent :: proc(self: ^IUser, gameID: CGameID, eAppUsageEvent: c.int, pchExtraInfo: cstring) ---
	User_GetUserDataFolder :: proc(self: ^IUser, pchBuffer: ^u8, cubBuffer: c.int) -> bool ---
	User_StartVoiceRecording :: proc(self: ^IUser) ---
	User_StopVoiceRecording :: proc(self: ^IUser) ---
	User_GetAvailableVoice :: proc(self: ^IUser, pcbCompressed: ^uint32, pcbUncompressed_Deprecated: ^uint32, nUncompressedVoiceDesiredSampleRate_Deprecated: uint32) -> EVoiceResult ---
	User_GetVoice :: proc(self: ^IUser, bWantCompressed: bool, pDestBuffer: rawptr, cbDestBufferSize: uint32, nBytesWritten: ^uint32, bWantUncompressed_Deprecated: bool, pUncompressedDestBuffer_Deprecated: rawptr, cbUncompressedDestBufferSize_Deprecated: uint32, nUncompressBytesWritten_Deprecated: ^uint32, nUncompressedVoiceDesiredSampleRate_Deprecated: uint32) -> EVoiceResult ---
	User_DecompressVoice :: proc(self: ^IUser, pCompressed: rawptr, cbCompressed: uint32, pDestBuffer: rawptr, cbDestBufferSize: uint32, nBytesWritten: ^uint32, nDesiredSampleRate: uint32) -> EVoiceResult ---
	User_GetVoiceOptimalSampleRate :: proc(self: ^IUser) -> uint32 ---
	User_GetAuthSessionTicket :: proc(self: ^IUser, pTicket: rawptr, cbMaxTicket: c.int, pcbTicket: ^uint32) -> HAuthTicket ---
	User_BeginAuthSession :: proc(self: ^IUser, pAuthTicket: rawptr, cbAuthTicket: c.int, steamID: CSteamID) -> EBeginAuthSessionResult ---
	User_EndAuthSession :: proc(self: ^IUser, steamID: CSteamID) ---
	User_CancelAuthTicket :: proc(self: ^IUser, hAuthTicket: HAuthTicket) ---
	User_UserHasLicenseForApp :: proc(self: ^IUser, steamID: CSteamID, appID: AppId_t) -> EUserHasLicenseForAppResult ---
	User_BIsBehindNAT :: proc(self: ^IUser) -> bool ---
	User_AdvertiseGame :: proc(self: ^IUser, steamIDGameServer: CSteamID, unIPServer: uint32, usPortServer: uint16) ---
	User_RequestEncryptedAppTicket :: proc(self: ^IUser, pDataToInclude: rawptr, cbDataToInclude: c.int) -> SteamAPICall_t ---
	User_GetEncryptedAppTicket :: proc(self: ^IUser, pTicket: rawptr, cbMaxTicket: c.int, pcbTicket: ^uint32) -> bool ---
	User_GetGameBadgeLevel :: proc(self: ^IUser, nSeries: c.int, bFoil: bool) -> c.int ---
	User_GetPlayerSteamLevel :: proc(self: ^IUser) -> c.int ---
	User_RequestStoreAuthURL :: proc(self: ^IUser, pchRedirectURL: cstring) -> SteamAPICall_t ---
	User_BIsPhoneVerified :: proc(self: ^IUser) -> bool ---
	User_BIsTwoFactorEnabled :: proc(self: ^IUser) -> bool ---
	User_BIsPhoneIdentifying :: proc(self: ^IUser) -> bool ---
	User_BIsPhoneRequiringVerification :: proc(self: ^IUser) -> bool ---
	User_GetMarketEligibility :: proc(self: ^IUser) -> SteamAPICall_t ---
	User_GetDurationControl :: proc(self: ^IUser) -> SteamAPICall_t ---
	User_BSetDurationControlOnlineState :: proc(self: ^IUser, eNewState: EDurationControlOnlineState) -> bool ---

	Friends_GetPersonaName :: proc(self: ^IFriends) -> cstring ---
	Friends_SetPersonaName :: proc(self: ^IFriends, pchPersonaName: cstring) -> SteamAPICall_t ---
	Friends_GetPersonaState :: proc(self: ^IFriends) -> EPersonaState ---
	Friends_GetFriendCount :: proc(self: ^IFriends, iFriendFlags: c.int) -> c.int ---
	Friends_GetFriendByIndex :: proc(self: ^IFriends, iFriend: c.int, iFriendFlags: c.int) -> CSteamID ---
	Friends_GetFriendRelationship :: proc(self: ^IFriends, steamIDFriend: CSteamID) -> EFriendRelationship ---
	Friends_GetFriendPersonaState :: proc(self: ^IFriends, steamIDFriend: CSteamID) -> EPersonaState ---
	Friends_GetFriendPersonaName :: proc(self: ^IFriends, steamIDFriend: CSteamID) -> cstring ---
	Friends_GetFriendGamePlayed :: proc(self: ^IFriends, steamIDFriend: CSteamID, pFriendGameInfo: ^FriendGameInfo_t) -> bool ---
	Friends_GetFriendPersonaNameHistory :: proc(self: ^IFriends, steamIDFriend: CSteamID, iPersonaName: c.int) -> cstring ---
	Friends_GetFriendSteamLevel :: proc(self: ^IFriends, steamIDFriend: CSteamID) -> c.int ---
	Friends_GetPlayerNickname :: proc(self: ^IFriends, steamIDPlayer: CSteamID) -> cstring ---
	Friends_GetFriendsGroupCount :: proc(self: ^IFriends) -> c.int ---
	Friends_GetFriendsGroupIDByIndex :: proc(self: ^IFriends, iFG: c.int) -> FriendsGroupID_t ---
	Friends_GetFriendsGroupName :: proc(self: ^IFriends, friendsGroupID: FriendsGroupID_t) -> cstring ---
	Friends_GetFriendsGroupMembersCount :: proc(self: ^IFriends, friendsGroupID: FriendsGroupID_t) -> c.int ---
	Friends_GetFriendsGroupMembersList :: proc(self: ^IFriends, friendsGroupID: FriendsGroupID_t, pOutSteamIDMembers: ^CSteamID, nMembersCount: c.int) ---
	Friends_HasFriend :: proc(self: ^IFriends, steamIDFriend: CSteamID, iFriendFlags: c.int) -> bool ---
	Friends_GetClanCount :: proc(self: ^IFriends) -> c.int ---
	Friends_GetClanByIndex :: proc(self: ^IFriends, iClan: c.int) -> CSteamID ---
	Friends_GetClanName :: proc(self: ^IFriends, steamIDClan: CSteamID) -> cstring ---
	Friends_GetClanTag :: proc(self: ^IFriends, steamIDClan: CSteamID) -> cstring ---
	Friends_GetClanActivityCounts :: proc(self: ^IFriends, steamIDClan: CSteamID, pnOnline: ^int, pnInGame: ^int, pnChatting: ^int) -> bool ---
	Friends_DownloadClanActivityCounts :: proc(self: ^IFriends, psteamIDClans: ^CSteamID, cClansToRequest: c.int) -> SteamAPICall_t ---
	Friends_GetFriendCountFromSource :: proc(self: ^IFriends, steamIDSource: CSteamID) -> c.int ---
	Friends_GetFriendFromSourceByIndex :: proc(self: ^IFriends, steamIDSource: CSteamID, iFriend: c.int) -> CSteamID ---
	Friends_IsUserInSource :: proc(self: ^IFriends, steamIDUser: CSteamID, steamIDSource: CSteamID) -> bool ---
	Friends_SetInGameVoiceSpeaking :: proc(self: ^IFriends, steamIDUser: CSteamID, bSpeaking: bool) ---
	Friends_ActivateGameOverlay :: proc(self: ^IFriends, pchDialog: cstring) ---
	Friends_ActivateGameOverlayToUser :: proc(self: ^IFriends, pchDialog: cstring, steamID: CSteamID) ---
	Friends_ActivateGameOverlayToWebPage :: proc(self: ^IFriends, pchURL: cstring, eMode: EActivateGameOverlayToWebPageMode) ---
	Friends_ActivateGameOverlayToStore :: proc(self: ^IFriends, nAppID: AppId_t, eFlag: EOverlayToStoreFlag) ---
	Friends_SetPlayedWith :: proc(self: ^IFriends, steamIDUserPlayedWith: CSteamID) ---
	Friends_ActivateGameOverlayInviteDialog :: proc(self: ^IFriends, steamIDLobby: CSteamID) ---
	Friends_GetSmallFriendAvatar :: proc(self: ^IFriends, steamIDFriend: CSteamID) -> c.int ---
	Friends_GetMediumFriendAvatar :: proc(self: ^IFriends, steamIDFriend: CSteamID) -> c.int ---
	Friends_GetLargeFriendAvatar :: proc(self: ^IFriends, steamIDFriend: CSteamID) -> c.int ---
	Friends_RequestUserInformation :: proc(self: ^IFriends, steamIDUser: CSteamID, bRequireNameOnly: bool) -> bool ---
	Friends_RequestClanOfficerList :: proc(self: ^IFriends, steamIDClan: CSteamID) -> SteamAPICall_t ---
	Friends_GetClanOwner :: proc(self: ^IFriends, steamIDClan: CSteamID) -> CSteamID ---
	Friends_GetClanOfficerCount :: proc(self: ^IFriends, steamIDClan: CSteamID) -> c.int ---
	Friends_GetClanOfficerByIndex :: proc(self: ^IFriends, steamIDClan: CSteamID, iOfficer: c.int) -> CSteamID ---
	Friends_GetUserRestrictions :: proc(self: ^IFriends) -> uint32 ---
	Friends_SetRichPresence :: proc(self: ^IFriends, pchKey: cstring, pchValue: cstring) -> bool ---
	Friends_ClearRichPresence :: proc(self: ^IFriends) ---
	Friends_GetFriendRichPresence :: proc(self: ^IFriends, steamIDFriend: CSteamID, pchKey: cstring) -> cstring ---
	Friends_GetFriendRichPresenceKeyCount :: proc(self: ^IFriends, steamIDFriend: CSteamID) -> c.int ---
	Friends_GetFriendRichPresenceKeyByIndex :: proc(self: ^IFriends, steamIDFriend: CSteamID, iKey: c.int) -> cstring ---
	Friends_RequestFriendRichPresence :: proc(self: ^IFriends, steamIDFriend: CSteamID) ---
	Friends_InviteUserToGame :: proc(self: ^IFriends, steamIDFriend: CSteamID, pchConnectString: cstring) -> bool ---
	Friends_GetCoplayFriendCount :: proc(self: ^IFriends) -> c.int ---
	Friends_GetCoplayFriend :: proc(self: ^IFriends, iCoplayFriend: c.int) -> CSteamID ---
	Friends_GetFriendCoplayTime :: proc(self: ^IFriends, steamIDFriend: CSteamID) -> c.int ---
	Friends_GetFriendCoplayGame :: proc(self: ^IFriends, steamIDFriend: CSteamID) -> AppId_t ---
	Friends_JoinClanChatRoom :: proc(self: ^IFriends, steamIDClan: CSteamID) -> SteamAPICall_t ---
	Friends_LeaveClanChatRoom :: proc(self: ^IFriends, steamIDClan: CSteamID) -> bool ---
	Friends_GetClanChatMemberCount :: proc(self: ^IFriends, steamIDClan: CSteamID) -> c.int ---
	Friends_GetChatMemberByIndex :: proc(self: ^IFriends, steamIDClan: CSteamID, iUser: c.int) -> CSteamID ---
	Friends_SendClanChatMessage :: proc(self: ^IFriends, steamIDClanChat: CSteamID, pchText: cstring) -> bool ---
	Friends_GetClanChatMessage :: proc(self: ^IFriends, steamIDClanChat: CSteamID, iMessage: c.int, prgchText: rawptr, cchTextMax: c.int, peChatEntryType: ^EChatEntryType, psteamidChatter: ^CSteamID) -> c.int ---
	Friends_IsClanChatAdmin :: proc(self: ^IFriends, steamIDClanChat: CSteamID, steamIDUser: CSteamID) -> bool ---
	Friends_IsClanChatWindowOpenInSteam :: proc(self: ^IFriends, steamIDClanChat: CSteamID) -> bool ---
	Friends_OpenClanChatWindowInSteam :: proc(self: ^IFriends, steamIDClanChat: CSteamID) -> bool ---
	Friends_CloseClanChatWindowInSteam :: proc(self: ^IFriends, steamIDClanChat: CSteamID) -> bool ---
	Friends_SetListenForFriendsMessages :: proc(self: ^IFriends, bInterceptEnabled: bool) -> bool ---
	Friends_ReplyToFriendMessage :: proc(self: ^IFriends, steamIDFriend: CSteamID, pchMsgToSend: cstring) -> bool ---
	Friends_GetFriendMessage :: proc(self: ^IFriends, steamIDFriend: CSteamID, iMessageID: c.int, pvData: rawptr, cubData: c.int, peChatEntryType: ^EChatEntryType) -> c.int ---
	Friends_GetFollowerCount :: proc(self: ^IFriends, steamID: CSteamID) -> SteamAPICall_t ---
	Friends_IsFollowing :: proc(self: ^IFriends, steamID: CSteamID) -> SteamAPICall_t ---
	Friends_EnumerateFollowingList :: proc(self: ^IFriends, unStartIndex: uint32) -> SteamAPICall_t ---
	Friends_IsClanPublic :: proc(self: ^IFriends, steamIDClan: CSteamID) -> bool ---
	Friends_IsClanOfficialGameGroup :: proc(self: ^IFriends, steamIDClan: CSteamID) -> bool ---
	Friends_GetNumChatsWithUnreadPriorityMessages :: proc(self: ^IFriends) -> c.int ---
	Friends_ActivateGameOverlayRemotePlayTogetherInviteDialog :: proc(self: ^IFriends, steamIDLobby: CSteamID) ---
	Friends_RegisterProtocolInOverlayBrowser :: proc(self: ^IFriends, pchProtocol: cstring) -> bool ---
	Friends_ActivateGameOverlayInviteDialogConnectString :: proc(self: ^IFriends, pchConnectString: cstring) ---
	Friends_RequestEquippedProfileItems :: proc(self: ^IFriends, steamID: CSteamID) -> SteamAPICall_t ---
	Friends_BHasEquippedProfileItem :: proc(self: ^IFriends, steamID: CSteamID, itemType: ECommunityProfileItemType) -> bool ---
	Friends_GetProfileItemPropertyString :: proc(self: ^IFriends, steamID: CSteamID, itemType: ECommunityProfileItemType, prop: ECommunityProfileItemProperty) -> cstring ---
	Friends_GetProfileItemPropertyUint :: proc(self: ^IFriends, steamID: CSteamID, itemType: ECommunityProfileItemType, prop: ECommunityProfileItemProperty) -> uint32 ---

	Utils_GetSecondsSinceAppActive :: proc(self: ^IUtils) -> uint32 ---
	Utils_GetSecondsSinceComputerActive :: proc(self: ^IUtils) -> uint32 ---
	Utils_GetConnectedUniverse :: proc(self: ^IUtils) -> EUniverse ---
	Utils_GetServerRealTime :: proc(self: ^IUtils) -> uint32 ---
	Utils_GetIPCountry :: proc(self: ^IUtils) -> cstring ---
	Utils_GetImageSize :: proc(self: ^IUtils, iImage: c.int, pnWidth: ^uint32, pnHeight: ^uint32) -> bool ---
	Utils_GetImageRGBA :: proc(self: ^IUtils, iImage: c.int, pubDest: ^uint8, nDestBufferSize: c.int) -> bool ---
	Utils_GetCurrentBatteryPower :: proc(self: ^IUtils) -> uint8 ---
	Utils_GetAppID :: proc(self: ^IUtils) -> uint32 ---
	Utils_SetOverlayNotificationPosition :: proc(self: ^IUtils, eNotificationPosition: ENotificationPosition) ---
	Utils_IsAPICallCompleted :: proc(self: ^IUtils, hSteamAPICall: SteamAPICall_t, pbFailed: ^bool) -> bool ---
	Utils_GetAPICallFailureReason :: proc(self: ^IUtils, hSteamAPICall: SteamAPICall_t) -> ESteamAPICallFailure ---
	Utils_GetAPICallResult :: proc(self: ^IUtils, hSteamAPICall: SteamAPICall_t, pCallback: rawptr, cubCallback: c.int, iCallbackExpected: c.int, pbFailed: ^bool) -> bool ---
	Utils_GetIPCCallCount :: proc(self: ^IUtils) -> uint32 ---
	Utils_SetWarningMessageHook :: proc(self: ^IUtils, pFunction: SteamAPIWarningMessageHook_t) ---
	Utils_IsOverlayEnabled :: proc(self: ^IUtils) -> bool ---
	Utils_BOverlayNeedsPresent :: proc(self: ^IUtils) -> bool ---
	Utils_CheckFileSignature :: proc(self: ^IUtils, szFileName: cstring) -> SteamAPICall_t ---
	Utils_ShowGamepadTextInput :: proc(self: ^IUtils, eInputMode: EGamepadTextInputMode, eLineInputMode: EGamepadTextInputLineMode, pchDescription: cstring, unCharMax: uint32, pchExistingText: cstring) -> bool ---
	Utils_GetEnteredGamepadTextLength :: proc(self: ^IUtils) -> uint32 ---
	Utils_GetEnteredGamepadTextInput :: proc(self: ^IUtils, pchText: u8, cchText: uint32) -> bool ---
	Utils_GetSteamUILanguage :: proc(self: ^IUtils) -> cstring ---
	Utils_IsSteamRunningInVR :: proc(self: ^IUtils) -> bool ---
	Utils_SetOverlayNotificationInset :: proc(self: ^IUtils, nHorizontalInset: c.int, nVerticalInset: c.int) ---
	Utils_IsSteamInBigPictureMode :: proc(self: ^IUtils) -> bool ---
	Utils_StartVRDashboard :: proc(self: ^IUtils) ---
	Utils_IsVRHeadsetStreamingEnabled :: proc(self: ^IUtils) -> bool ---
	Utils_SetVRHeadsetStreamingEnabled :: proc(self: ^IUtils, bEnabled: bool) ---
	Utils_IsSteamChinaLauncher :: proc(self: ^IUtils) -> bool ---
	Utils_InitFilterText :: proc(self: ^IUtils, unFilterOptions: uint32) -> bool ---
	Utils_FilterText :: proc(self: ^IUtils, eContext: ETextFilteringContext, sourceSteamID: CSteamID, pchInputMessage: cstring, pchOutFilteredText: ^u8, nByteSizeOutFilteredText: uint32) -> c.int ---
	Utils_GetIPv6ConnectivityState :: proc(self: ^IUtils, eProtocol: ESteamIPv6ConnectivityProtocol) -> ESteamIPv6ConnectivityState ---
	Utils_IsSteamRunningOnSteamDeck :: proc(self: ^IUtils) -> bool ---
	Utils_Showf32ingGamepadTextInput :: proc(self: ^IUtils, eKeyboardMode: Ef32ingGamepadTextInputMode, nTextFieldXPosition: c.int, nTextFieldYPosition: c.int, nTextFieldWidth: c.int, nTextFieldHeight: c.int) -> bool ---
	Utils_SetGameLauncherMode :: proc(self: ^IUtils, bLauncherMode: bool) ---
	Utils_Dismissf32ingGamepadTextInput :: proc(self: ^IUtils) -> bool ---

	Matchmaking_GetFavoriteGameCount :: proc(self: ^IMatchmaking) -> c.int ---
	Matchmaking_GetFavoriteGame :: proc(self: ^IMatchmaking, iGame: c.int, pnAppID: ^AppId_t, pnIP: ^uint32, pnConnPort: ^uint16, pnQueryPort: ^uint16, punFlags: ^uint32, pRTime32LastPlayedOnServer: ^uint32) -> bool ---
	Matchmaking_AddFavoriteGame :: proc(self: ^IMatchmaking, nAppID: AppId_t, nIP: uint32, nConnPort: uint16, nQueryPort: uint16, unFlags: uint32, rTime32LastPlayedOnServer: uint32) -> c.int ---
	Matchmaking_RemoveFavoriteGame :: proc(self: ^IMatchmaking, nAppID: AppId_t, nIP: uint32, nConnPort: uint16, nQueryPort: uint16, unFlags: uint32) -> bool ---
	Matchmaking_RequestLobbyList :: proc(self: ^IMatchmaking) -> SteamAPICall_t ---
	Matchmaking_AddRequestLobbyListStringFilter :: proc(self: ^IMatchmaking, pchKeyToMatch: cstring, pchValueToMatch: cstring, eComparisonType: ELobbyComparison) ---
	Matchmaking_AddRequestLobbyListNumericalFilter :: proc(self: ^IMatchmaking, pchKeyToMatch: cstring, nValueToMatch: c.int, eComparisonType: ELobbyComparison) ---
	Matchmaking_AddRequestLobbyListNearValueFilter :: proc(self: ^IMatchmaking, pchKeyToMatch: cstring, nValueToBeCloseTo: c.int) ---
	Matchmaking_AddRequestLobbyListFilterSlotsAvailable :: proc(self: ^IMatchmaking, nSlotsAvailable: c.int) ---
	Matchmaking_AddRequestLobbyListDistanceFilter :: proc(self: ^IMatchmaking, eLobbyDistanceFilter: ELobbyDistanceFilter) ---
	Matchmaking_AddRequestLobbyListResultCountFilter :: proc(self: ^IMatchmaking, cMaxResults: c.int) ---
	Matchmaking_AddRequestLobbyListCompatibleMembersFilter :: proc(self: ^IMatchmaking, steamIDLobby: CSteamID) ---
	Matchmaking_GetLobbyByIndex :: proc(self: ^IMatchmaking, iLobby: c.int) -> CSteamID ---
	Matchmaking_CreateLobby :: proc(self: ^IMatchmaking, eLobbyType: ELobbyType, cMaxMembers: c.int) -> SteamAPICall_t ---
	Matchmaking_JoinLobby :: proc(self: ^IMatchmaking, steamIDLobby: CSteamID) -> SteamAPICall_t ---
	Matchmaking_LeaveLobby :: proc(self: ^IMatchmaking, steamIDLobby: CSteamID) ---
	Matchmaking_InviteUserToLobby :: proc(self: ^IMatchmaking, steamIDLobby: CSteamID, steamIDInvitee: CSteamID) -> bool ---
	Matchmaking_GetNumLobbyMembers :: proc(self: ^IMatchmaking, steamIDLobby: CSteamID) -> c.int ---
	Matchmaking_GetLobbyMemberByIndex :: proc(self: ^IMatchmaking, steamIDLobby: CSteamID, iMember: c.int) -> CSteamID ---
	Matchmaking_GetLobbyData :: proc(self: ^IMatchmaking, steamIDLobby: CSteamID, pchKey: cstring) -> cstring ---
	Matchmaking_SetLobbyData :: proc(self: ^IMatchmaking, steamIDLobby: CSteamID, pchKey: cstring, pchValue: cstring) -> bool ---
	Matchmaking_GetLobbyDataCount :: proc(self: ^IMatchmaking, steamIDLobby: CSteamID) -> c.int ---
	Matchmaking_GetLobbyDataByIndex :: proc(self: ^IMatchmaking, steamIDLobby: CSteamID, iLobbyData: c.int, pchKey: ^u8, cchKeyBufferSize: c.int, pchValue: ^u8, cchValueBufferSize: c.int) -> bool ---
	Matchmaking_DeleteLobbyData :: proc(self: ^IMatchmaking, steamIDLobby: CSteamID, pchKey: cstring) -> bool ---
	Matchmaking_GetLobbyMemberData :: proc(self: ^IMatchmaking, steamIDLobby: CSteamID, steamIDUser: CSteamID, pchKey: cstring) -> cstring ---
	Matchmaking_SetLobbyMemberData :: proc(self: ^IMatchmaking, steamIDLobby: CSteamID, pchKey: cstring, pchValue: cstring) ---
	Matchmaking_SendLobbyChatMsg :: proc(self: ^IMatchmaking, steamIDLobby: CSteamID, pvMsgBody: rawptr, cubMsgBody: c.int) -> bool ---
	Matchmaking_GetLobbyChatEntry :: proc(self: ^IMatchmaking, steamIDLobby: CSteamID, iChatID: c.int, pSteamIDUser: ^CSteamID, pvData: rawptr, cubData: c.int, peChatEntryType: ^EChatEntryType) -> c.int ---
	Matchmaking_RequestLobbyData :: proc(self: ^IMatchmaking, steamIDLobby: CSteamID) -> bool ---
	Matchmaking_SetLobbyGameServer :: proc(self: ^IMatchmaking, steamIDLobby: CSteamID, unGameServerIP: uint32, unGameServerPort: uint16, steamIDGameServer: CSteamID) ---
	Matchmaking_GetLobbyGameServer :: proc(self: ^IMatchmaking, steamIDLobby: CSteamID, punGameServerIP: ^uint32, punGameServerPort: ^uint16, psteamIDGameServer: ^CSteamID) -> bool ---
	Matchmaking_SetLobbyMemberLimit :: proc(self: ^IMatchmaking, steamIDLobby: CSteamID, cMaxMembers: c.int) -> bool ---
	Matchmaking_GetLobbyMemberLimit :: proc(self: ^IMatchmaking, steamIDLobby: CSteamID) -> c.int ---
	Matchmaking_SetLobbyType :: proc(self: ^IMatchmaking, steamIDLobby: CSteamID, eLobbyType: ELobbyType) -> bool ---
	Matchmaking_SetLobbyJoinable :: proc(self: ^IMatchmaking, steamIDLobby: CSteamID, bLobbyJoinable: bool) -> bool ---
	Matchmaking_GetLobbyOwner :: proc(self: ^IMatchmaking, steamIDLobby: CSteamID) -> CSteamID ---
	Matchmaking_SetLobbyOwner :: proc(self: ^IMatchmaking, steamIDLobby: CSteamID, steamIDNewOwner: CSteamID) -> bool ---
	Matchmaking_SetLinkedLobby :: proc(self: ^IMatchmaking, steamIDLobby: CSteamID, steamIDLobbyDependent: CSteamID) -> bool ---

	MatchmakingServerListResponse_ServerResponded :: proc(self: ^IMatchmakingServerListResponse, hRequest: HServerListRequest, iServer: c.int) ---
	MatchmakingServerListResponse_ServerFailedToRespond :: proc(self: ^IMatchmakingServerListResponse, hRequest: HServerListRequest, iServer: c.int) ---
	MatchmakingServerListResponse_RefreshComplete :: proc(self: ^IMatchmakingServerListResponse, hRequest: HServerListRequest, response: EMatchMakingServerResponse) ---

	MatchmakingPingResponse_ServerResponded :: proc(self: ^IMatchmakingPingResponse, server: ^gameserveritem_t) ---
	MatchmakingPingResponse_ServerFailedToRespond :: proc(self: ^IMatchmakingPingResponse) ---

	MatchmakingPlayersResponse_AddPlayerToList :: proc(self: ^IMatchmakingPlayersResponse, pchName: cstring, nScore: c.int, flTimePlayed: f32) ---
	MatchmakingPlayersResponse_PlayersFailedToRespond :: proc(self: ^IMatchmakingPlayersResponse) ---
	MatchmakingPlayersResponse_PlayersRefreshComplete :: proc(self: ^IMatchmakingPlayersResponse) ---

	MatchmakingRulesResponse_RulesResponded :: proc(self: ^IMatchmakingRulesResponse, pchRule: cstring, pchValue: cstring) ---
	MatchmakingRulesResponse_RulesFailedToRespond :: proc(self: ^IMatchmakingRulesResponse) ---
	MatchmakingRulesResponse_RulesRefreshComplete :: proc(self: ^IMatchmakingRulesResponse) ---

	MatchmakingServers_RequestInternetServerList :: proc(self: ^IMatchmakingServers, iApp: AppId_t, ppchFilters: ^^MatchMakingKeyValuePair_t, nFilters: uint32, pRequestServersResponse: ^IMatchmakingServerListResponse) -> HServerListRequest ---
	MatchmakingServers_RequestLANServerList :: proc(self: ^IMatchmakingServers, iApp: AppId_t, pRequestServersResponse: ^IMatchmakingServerListResponse) -> HServerListRequest ---
	MatchmakingServers_RequestFriendsServerList :: proc(self: ^IMatchmakingServers, iApp: AppId_t, ppchFilters: ^^MatchMakingKeyValuePair_t, nFilters: uint32, pRequestServersResponse: ^IMatchmakingServerListResponse) -> HServerListRequest ---
	MatchmakingServers_RequestFavoritesServerList :: proc(self: ^IMatchmakingServers, iApp: AppId_t, ppchFilters: ^^MatchMakingKeyValuePair_t, nFilters: uint32, pRequestServersResponse: ^IMatchmakingServerListResponse) -> HServerListRequest ---
	MatchmakingServers_RequestHistoryServerList :: proc(self: ^IMatchmakingServers, iApp: AppId_t, ppchFilters: ^^MatchMakingKeyValuePair_t, nFilters: uint32, pRequestServersResponse: ^IMatchmakingServerListResponse) -> HServerListRequest ---
	MatchmakingServers_RequestSpectatorServerList :: proc(self: ^IMatchmakingServers, iApp: AppId_t, ppchFilters: ^^MatchMakingKeyValuePair_t, nFilters: uint32, pRequestServersResponse: ^IMatchmakingServerListResponse) -> HServerListRequest ---
	MatchmakingServers_ReleaseRequest :: proc(self: ^IMatchmakingServers, hServerListRequest: HServerListRequest) ---
	MatchmakingServers_GetServerDetails :: proc(self: ^IMatchmakingServers, hRequest: HServerListRequest, iServer: c.int) -> ^gameserveritem_t ---
	MatchmakingServers_CancelQuery :: proc(self: ^IMatchmakingServers, hRequest: HServerListRequest) ---
	MatchmakingServers_RefreshQuery :: proc(self: ^IMatchmakingServers, hRequest: HServerListRequest) ---
	MatchmakingServers_IsRefreshing :: proc(self: ^IMatchmakingServers, hRequest: HServerListRequest) -> bool ---
	MatchmakingServers_GetServerCount :: proc(self: ^IMatchmakingServers, hRequest: HServerListRequest) -> c.int ---
	MatchmakingServers_RefreshServer :: proc(self: ^IMatchmakingServers, hRequest: HServerListRequest, iServer: c.int) ---
	MatchmakingServers_PingServer :: proc(self: ^IMatchmakingServers, unIP: uint32, usPort: uint16, pRequestServersResponse: ^IMatchmakingPingResponse) -> HServerQuery ---
	MatchmakingServers_PlayerDetails :: proc(self: ^IMatchmakingServers, unIP: uint32, usPort: uint16, pRequestServersResponse: ^IMatchmakingPlayersResponse) -> HServerQuery ---
	MatchmakingServers_ServerRules :: proc(self: ^IMatchmakingServers, unIP: uint32, usPort: uint16, pRequestServersResponse: ^IMatchmakingRulesResponse) -> HServerQuery ---
	MatchmakingServers_CancelServerQuery :: proc(self: ^IMatchmakingServers, hServerQuery: HServerQuery) ---

	GameSearch_AddGameSearchParams :: proc(self: ^IGameSearch, pchKeyToFind: cstring, pchValuesToFind: cstring) -> EGameSearchErrorCode_t ---
	GameSearch_SearchForGameWithLobby :: proc(self: ^IGameSearch, steamIDLobby: CSteamID, nPlayerMin: c.int, nPlayerMax: c.int) -> EGameSearchErrorCode_t ---
	GameSearch_SearchForGameSolo :: proc(self: ^IGameSearch, nPlayerMin: c.int, nPlayerMax: c.int) -> EGameSearchErrorCode_t ---
	GameSearch_AcceptGame :: proc(self: ^IGameSearch) -> EGameSearchErrorCode_t ---
	GameSearch_DeclineGame :: proc(self: ^IGameSearch) -> EGameSearchErrorCode_t ---
	GameSearch_RetrieveConnectionDetails :: proc(self: ^IGameSearch, steamIDHost: CSteamID, pchConnectionDetails: ^u8, cubConnectionDetails: c.int) -> EGameSearchErrorCode_t ---
	GameSearch_EndGameSearch :: proc(self: ^IGameSearch) -> EGameSearchErrorCode_t ---
	GameSearch_SetGameHostParams :: proc(self: ^IGameSearch, pchKey: cstring, pchValue: cstring) -> EGameSearchErrorCode_t ---
	GameSearch_SetConnectionDetails :: proc(self: ^IGameSearch, pchConnectionDetails: cstring, cubConnectionDetails: c.int) -> EGameSearchErrorCode_t ---
	GameSearch_RequestPlayersForGame :: proc(self: ^IGameSearch, nPlayerMin: c.int, nPlayerMax: c.int, nMaxTeamSize: c.int) -> EGameSearchErrorCode_t ---
	GameSearch_HostConfirmGameStart :: proc(self: ^IGameSearch, ullUniqueGameID: uint64) -> EGameSearchErrorCode_t ---
	GameSearch_CancelRequestPlayersForGame :: proc(self: ^IGameSearch) -> EGameSearchErrorCode_t ---
	GameSearch_SubmitPlayerResult :: proc(self: ^IGameSearch, ullUniqueGameID: uint64, steamIDPlayer: CSteamID, EPlayerResult: EPlayerResult_t) -> EGameSearchErrorCode_t ---
	GameSearch_EndGame :: proc(self: ^IGameSearch, ullUniqueGameID: uint64) -> EGameSearchErrorCode_t ---

	Parties_GetNumActiveBeacons :: proc(self: ^IParties) -> uint32 ---
	Parties_GetBeaconByIndex :: proc(self: ^IParties, unIndex: uint32) -> PartyBeaconID_t ---
	Parties_GetBeaconDetails :: proc(self: ^IParties, ulBeaconID: PartyBeaconID_t, pSteamIDBeaconOwner: ^CSteamID, pLocation: ^SteamPartyBeaconLocation_t, pchMetadata: ^u8, cchMetadata: c.int) -> bool ---
	Parties_JoinParty :: proc(self: ^IParties, ulBeaconID: PartyBeaconID_t) -> SteamAPICall_t ---
	Parties_GetNumAvailableBeaconLocations :: proc(self: ^IParties, puNumLocations: ^uint32) -> bool ---
	Parties_GetAvailableBeaconLocations :: proc(self: ^IParties, pLocationList: ^SteamPartyBeaconLocation_t, uMaxNumLocations: uint32) -> bool ---
	Parties_CreateBeacon :: proc(self: ^IParties, unOpenSlots: uint32, pBeaconLocation: ^SteamPartyBeaconLocation_t, pchConnectString: cstring, pchMetadata: cstring) -> SteamAPICall_t ---
	Parties_OnReservationCompleted :: proc(self: ^IParties, ulBeacon: PartyBeaconID_t, steamIDUser: CSteamID) ---
	Parties_CancelReservation :: proc(self: ^IParties, ulBeacon: PartyBeaconID_t, steamIDUser: CSteamID) ---
	Parties_ChangeNumOpenSlots :: proc(self: ^IParties, ulBeacon: PartyBeaconID_t, unOpenSlots: uint32) -> SteamAPICall_t ---
	Parties_DestroyBeacon :: proc(self: ^IParties, ulBeacon: PartyBeaconID_t) -> bool ---
	Parties_GetBeaconLocationData :: proc(self: ^IParties, BeaconLocation: SteamPartyBeaconLocation_t, eData: ESteamPartyBeaconLocationData, pchDataStringOut: ^u8, cchDataStringOut: c.int) -> bool ---

	RemoteStorage_FileWrite :: proc(self: ^IRemoteStorage, pchFile: cstring, pvData: rawptr, cubData: int32) -> bool ---
	RemoteStorage_FileRead :: proc(self: ^IRemoteStorage, pchFile: cstring, pvData: rawptr, cubDataToRead: int32) -> int32 ---
	RemoteStorage_FileWriteAsync :: proc(self: ^IRemoteStorage, pchFile: cstring, pvData: rawptr, cubData: uint32) -> SteamAPICall_t ---
	RemoteStorage_FileReadAsync :: proc(self: ^IRemoteStorage, pchFile: cstring, nOffset: uint32, cubToRead: uint32) -> SteamAPICall_t ---
	RemoteStorage_FileReadAsyncComplete :: proc(self: ^IRemoteStorage, hReadCall: SteamAPICall_t, pvBuffer: rawptr, cubToRead: uint32) -> bool ---
	RemoteStorage_FileForget :: proc(self: ^IRemoteStorage, pchFile: cstring) -> bool ---
	RemoteStorage_FileDelete :: proc(self: ^IRemoteStorage, pchFile: cstring) -> bool ---
	RemoteStorage_FileShare :: proc(self: ^IRemoteStorage, pchFile: cstring) -> SteamAPICall_t ---
	RemoteStorage_SetSyncPlatforms :: proc(self: ^IRemoteStorage, pchFile: cstring, eRemoteStoragePlatform: ERemoteStoragePlatform) -> bool ---
	RemoteStorage_FileWriteStreamOpen :: proc(self: ^IRemoteStorage, pchFile: cstring) -> UGCFileWriteStreamHandle_t ---
	RemoteStorage_FileWriteStreamWriteChunk :: proc(self: ^IRemoteStorage, writeHandle: UGCFileWriteStreamHandle_t, pvData: rawptr, cubData: int32) -> bool ---
	RemoteStorage_FileWriteStreamClose :: proc(self: ^IRemoteStorage, writeHandle: UGCFileWriteStreamHandle_t) -> bool ---
	RemoteStorage_FileWriteStreamCancel :: proc(self: ^IRemoteStorage, writeHandle: UGCFileWriteStreamHandle_t) -> bool ---
	RemoteStorage_FileExists :: proc(self: ^IRemoteStorage, pchFile: cstring) -> bool ---
	RemoteStorage_FilePersisted :: proc(self: ^IRemoteStorage, pchFile: cstring) -> bool ---
	RemoteStorage_GetFileSize :: proc(self: ^IRemoteStorage, pchFile: cstring) -> int32 ---
	RemoteStorage_GetFileTimestamp :: proc(self: ^IRemoteStorage, pchFile: cstring) -> int64 ---
	RemoteStorage_GetSyncPlatforms :: proc(self: ^IRemoteStorage, pchFile: cstring) -> ERemoteStoragePlatform ---
	RemoteStorage_GetFileCount :: proc(self: ^IRemoteStorage) -> int32 ---
	RemoteStorage_GetFileNameAndSize :: proc(self: ^IRemoteStorage, iFile: c.int, pnFileSizeInBytes: ^int32) -> cstring ---
	RemoteStorage_GetQuota :: proc(self: ^IRemoteStorage, pnTotalBytes: ^uint64, puAvailableBytes: ^uint64) -> bool ---
	RemoteStorage_IsCloudEnabledForAccount :: proc(self: ^IRemoteStorage) -> bool ---
	RemoteStorage_IsCloudEnabledForApp :: proc(self: ^IRemoteStorage) -> bool ---
	RemoteStorage_SetCloudEnabledForApp :: proc(self: ^IRemoteStorage, bEnabled: bool) ---
	RemoteStorage_UGCDownload :: proc(self: ^IRemoteStorage, hContent: UGCHandle_t, unPriority: uint32) -> SteamAPICall_t ---
	RemoteStorage_GetUGCDownloadProgress :: proc(self: ^IRemoteStorage, hContent: UGCHandle_t, pnBytesDownloaded: ^int32, pnBytesExpected: ^int32) -> bool ---
	RemoteStorage_GetUGCDetails :: proc(self: ^IRemoteStorage, hContent: UGCHandle_t, pnAppID: ^AppId_t, ppchName: ^^u8, pnFileSizeInBytes: ^int32, pSteamIDOwner: ^CSteamID) -> bool ---
	RemoteStorage_UGCRead :: proc(self: ^IRemoteStorage, hContent: UGCHandle_t, pvData: rawptr, cubDataToRead: int32, cOffset: uint32, eAction: EUGCReadAction) -> int32 ---
	RemoteStorage_GetCachedUGCCount :: proc(self: ^IRemoteStorage) -> int32 ---
	RemoteStorage_GetCachedUGCHandle :: proc(self: ^IRemoteStorage, iCachedContent: int32) -> UGCHandle_t ---
	RemoteStorage_PublishWorkshopFile :: proc(self: ^IRemoteStorage, pchFile: cstring, pchPreviewFile: cstring, nConsumerAppId: AppId_t, pchTitle: cstring, pchDescription: cstring, eVisibility: ERemoteStoragePublishedFileVisibility, pTags: ^SteamParamStringArray_t, eWorkshopFileType: EWorkshopFileType) -> SteamAPICall_t ---
	RemoteStorage_CreatePublishedFileUpdateRequest :: proc(self: ^IRemoteStorage, unPublishedFileId: PublishedFileId_t) -> PublishedFileUpdateHandle_t ---
	RemoteStorage_UpdatePublishedFileFile :: proc(self: ^IRemoteStorage, updateHandle: PublishedFileUpdateHandle_t, pchFile: cstring) -> bool ---
	RemoteStorage_UpdatePublishedFilePreviewFile :: proc(self: ^IRemoteStorage, updateHandle: PublishedFileUpdateHandle_t, pchPreviewFile: cstring) -> bool ---
	RemoteStorage_UpdatePublishedFileTitle :: proc(self: ^IRemoteStorage, updateHandle: PublishedFileUpdateHandle_t, pchTitle: cstring) -> bool ---
	RemoteStorage_UpdatePublishedFileDescription :: proc(self: ^IRemoteStorage, updateHandle: PublishedFileUpdateHandle_t, pchDescription: cstring) -> bool ---
	RemoteStorage_UpdatePublishedFileVisibility :: proc(self: ^IRemoteStorage, updateHandle: PublishedFileUpdateHandle_t, eVisibility: ERemoteStoragePublishedFileVisibility) -> bool ---
	RemoteStorage_UpdatePublishedFileTags :: proc(self: ^IRemoteStorage, updateHandle: PublishedFileUpdateHandle_t, pTags: ^SteamParamStringArray_t) -> bool ---
	RemoteStorage_CommitPublishedFileUpdate :: proc(self: ^IRemoteStorage, updateHandle: PublishedFileUpdateHandle_t) -> SteamAPICall_t ---
	RemoteStorage_GetPublishedFileDetails :: proc(self: ^IRemoteStorage, unPublishedFileId: PublishedFileId_t, unMaxSecondsOld: uint32) -> SteamAPICall_t ---
	RemoteStorage_DeletePublishedFile :: proc(self: ^IRemoteStorage, unPublishedFileId: PublishedFileId_t) -> SteamAPICall_t ---
	RemoteStorage_EnumerateUserPublishedFiles :: proc(self: ^IRemoteStorage, unStartIndex: uint32) -> SteamAPICall_t ---
	RemoteStorage_SubscribePublishedFile :: proc(self: ^IRemoteStorage, unPublishedFileId: PublishedFileId_t) -> SteamAPICall_t ---
	RemoteStorage_EnumerateUserSubscribedFiles :: proc(self: ^IRemoteStorage, unStartIndex: uint32) -> SteamAPICall_t ---
	RemoteStorage_UnsubscribePublishedFile :: proc(self: ^IRemoteStorage, unPublishedFileId: PublishedFileId_t) -> SteamAPICall_t ---
	RemoteStorage_UpdatePublishedFileSetChangeDescription :: proc(self: ^IRemoteStorage, updateHandle: PublishedFileUpdateHandle_t, pchChangeDescription: cstring) -> bool ---
	RemoteStorage_GetPublishedItemVoteDetails :: proc(self: ^IRemoteStorage, unPublishedFileId: PublishedFileId_t) -> SteamAPICall_t ---
	RemoteStorage_UpdateUserPublishedItemVote :: proc(self: ^IRemoteStorage, unPublishedFileId: PublishedFileId_t, bVoteUp: bool) -> SteamAPICall_t ---
	RemoteStorage_GetUserPublishedItemVoteDetails :: proc(self: ^IRemoteStorage, unPublishedFileId: PublishedFileId_t) -> SteamAPICall_t ---
	RemoteStorage_EnumerateUserSharedWorkshopFiles :: proc(self: ^IRemoteStorage, steamId: CSteamID, unStartIndex: uint32, pRequiredTags: ^SteamParamStringArray_t, pExcludedTags: ^SteamParamStringArray_t) -> SteamAPICall_t ---
	RemoteStorage_PublishVideo :: proc(self: ^IRemoteStorage, eVideoProvider: EWorkshopVideoProvider, pchVideoAccount: cstring, pchVideoIdentifier: cstring, pchPreviewFile: cstring, nConsumerAppId: AppId_t, pchTitle: cstring, pchDescription: cstring, eVisibility: ERemoteStoragePublishedFileVisibility, pTags: ^SteamParamStringArray_t) -> SteamAPICall_t ---
	RemoteStorage_SetUserPublishedFileAction :: proc(self: ^IRemoteStorage, unPublishedFileId: PublishedFileId_t, eAction: EWorkshopFileAction) -> SteamAPICall_t ---
	RemoteStorage_EnumeratePublishedFilesByUserAction :: proc(self: ^IRemoteStorage, eAction: EWorkshopFileAction, unStartIndex: uint32) -> SteamAPICall_t ---
	RemoteStorage_EnumeratePublishedWorkshopFiles :: proc(self: ^IRemoteStorage, eEnumerationType: EWorkshopEnumerationType, unStartIndex: uint32, unCount: uint32, unDays: uint32, pTags: ^SteamParamStringArray_t, pUserTags: ^SteamParamStringArray_t) -> SteamAPICall_t ---
	RemoteStorage_UGCDownloadToLocation :: proc(self: ^IRemoteStorage, hContent: UGCHandle_t, pchLocation: cstring, unPriority: uint32) -> SteamAPICall_t ---
	RemoteStorage_GetLocalFileChangeCount :: proc(self: ^IRemoteStorage) -> int32 ---
	RemoteStorage_GetLocalFileChange :: proc(self: ^IRemoteStorage, iFile: c.int, pEChangeType: ^ERemoteStorageLocalFileChange, pEFilePathType: ^ERemoteStorageFilePathType) -> cstring ---
	RemoteStorage_BeginFileWriteBatch :: proc(self: ^IRemoteStorage) -> bool ---
	RemoteStorage_EndFileWriteBatch :: proc(self: ^IRemoteStorage) -> bool ---

	UserStats_RequestCurrentStats :: proc(self: ^IUserStats) -> bool ---
	UserStats_GetStatInt32 :: proc(self: ^IUserStats, pchName: cstring, pData: ^int32) -> bool ---
	UserStats_GetStatFloat :: proc(self: ^IUserStats, pchName: cstring, pData: ^f32) -> bool ---
	UserStats_SetStatInt32 :: proc(self: ^IUserStats, pchName: cstring, nData: int32) -> bool ---
	UserStats_SetStatFloat :: proc(self: ^IUserStats, pchName: cstring, fData: f32) -> bool ---
	UserStats_UpdateAvgRateStat :: proc(self: ^IUserStats, pchName: cstring, flCountThisSession: f32, dSessionLength: f64) -> bool ---
	UserStats_GetAchievement :: proc(self: ^IUserStats, pchName: cstring, pbAchieved: ^bool) -> bool ---
	UserStats_SetAchievement :: proc(self: ^IUserStats, pchName: cstring) -> bool ---
	UserStats_ClearAchievement :: proc(self: ^IUserStats, pchName: cstring) -> bool ---
	UserStats_GetAchievementAndUnlockTime :: proc(self: ^IUserStats, pchName: cstring, pbAchieved: ^bool, punUnlockTime: ^uint32) -> bool ---
	UserStats_StoreStats :: proc(self: ^IUserStats) -> bool ---
	UserStats_GetAchievementIcon :: proc(self: ^IUserStats, pchName: cstring) -> c.int ---
	UserStats_GetAchievementDisplayAttribute :: proc(self: ^IUserStats, pchName: cstring, pchKey: cstring) -> cstring ---
	UserStats_IndicateAchievementProgress :: proc(self: ^IUserStats, pchName: cstring, nCurProgress: uint32, nMaxProgress: uint32) -> bool ---
	UserStats_GetNumAchievements :: proc(self: ^IUserStats) -> uint32 ---
	UserStats_GetAchievementName :: proc(self: ^IUserStats, iAchievement: uint32) -> cstring ---
	UserStats_RequestUserStats :: proc(self: ^IUserStats, steamIDUser: CSteamID) -> SteamAPICall_t ---
	UserStats_GetUserStatInt32 :: proc(self: ^IUserStats, steamIDUser: CSteamID, pchName: cstring, pData: ^int32) -> bool ---
	UserStats_GetUserStatFloat :: proc(self: ^IUserStats, steamIDUser: CSteamID, pchName: cstring, pData: ^f32) -> bool ---
	UserStats_GetUserAchievement :: proc(self: ^IUserStats, steamIDUser: CSteamID, pchName: cstring, pbAchieved: ^bool) -> bool ---
	UserStats_GetUserAchievementAndUnlockTime :: proc(self: ^IUserStats, steamIDUser: CSteamID, pchName: cstring, pbAchieved: ^bool, punUnlockTime: ^uint32) -> bool ---
	UserStats_ResetAllStats :: proc(self: ^IUserStats, bAchievementsToo: bool) -> bool ---
	UserStats_FindOrCreateLeaderboard :: proc(self: ^IUserStats, pchLeaderboardName: cstring, eLeaderboardSortMethod: ELeaderboardSortMethod, eLeaderboardDisplayType: ELeaderboardDisplayType) -> SteamAPICall_t ---
	UserStats_FindLeaderboard :: proc(self: ^IUserStats, pchLeaderboardName: cstring) -> SteamAPICall_t ---
	UserStats_GetLeaderboardName :: proc(self: ^IUserStats, hSteamLeaderboard: SteamLeaderboard_t) -> cstring ---
	UserStats_GetLeaderboardEntryCount :: proc(self: ^IUserStats, hSteamLeaderboard: SteamLeaderboard_t) -> c.int ---
	UserStats_GetLeaderboardSortMethod :: proc(self: ^IUserStats, hSteamLeaderboard: SteamLeaderboard_t) -> ELeaderboardSortMethod ---
	UserStats_GetLeaderboardDisplayType :: proc(self: ^IUserStats, hSteamLeaderboard: SteamLeaderboard_t) -> ELeaderboardDisplayType ---
	UserStats_DownloadLeaderboardEntries :: proc(self: ^IUserStats, hSteamLeaderboard: SteamLeaderboard_t, eLeaderboardDataRequest: ELeaderboardDataRequest, nRangeStart: c.int, nRangeEnd: c.int) -> SteamAPICall_t ---
	UserStats_DownloadLeaderboardEntriesForUsers :: proc(self: ^IUserStats, hSteamLeaderboard: SteamLeaderboard_t, prgUsers: ^CSteamID, cUsers: c.int) -> SteamAPICall_t ---
	UserStats_GetDownloadedLeaderboardEntry :: proc(self: ^IUserStats, hSteamLeaderboardEntries: SteamLeaderboardEntries_t, index: c.int, pLeaderboardEntry: ^LeaderboardEntry_t, pDetails: ^int32, cDetailsMax: c.int) -> bool ---
	UserStats_UploadLeaderboardScore :: proc(self: ^IUserStats, hSteamLeaderboard: SteamLeaderboard_t, eLeaderboardUploadScoreMethod: ELeaderboardUploadScoreMethod, nScore: int32, pScoreDetails: ^int32, cScoreDetailsCount: c.int) -> SteamAPICall_t ---
	UserStats_AttachLeaderboardUGC :: proc(self: ^IUserStats, hSteamLeaderboard: SteamLeaderboard_t, hUGC: UGCHandle_t) -> SteamAPICall_t ---
	UserStats_GetNumberOfCurrentPlayers :: proc(self: ^IUserStats) -> SteamAPICall_t ---
	UserStats_RequestGlobalAchievementPercentages :: proc(self: ^IUserStats) -> SteamAPICall_t ---
	UserStats_GetMostAchievedAchievementInfo :: proc(self: ^IUserStats, pchName: ^u8, unNameBufLen: uint32, pflPercent: ^f32, pbAchieved: ^bool) -> c.int ---
	UserStats_GetNextMostAchievedAchievementInfo :: proc(self: ^IUserStats, iIteratorPrevious: c.int, pchName: ^u8, unNameBufLen: uint32, pflPercent: ^f32, pbAchieved: ^bool) -> c.int ---
	UserStats_GetAchievementAchievedPercent :: proc(self: ^IUserStats, pchName: cstring, pflPercent: ^f32) -> bool ---
	UserStats_RequestGlobalStats :: proc(self: ^IUserStats, nHistoryDays: c.int) -> SteamAPICall_t ---
	UserStats_GetGlobalStatInt64 :: proc(self: ^IUserStats, pchStatName: cstring, pData: ^int64) -> bool ---
	UserStats_GetGlobalStatFloat64 :: proc(self: ^IUserStats, pchStatName: cstring, pData: ^f64) -> bool ---
	UserStats_GetGlobalStatHistoryInt64 :: proc(self: ^IUserStats, pchStatName: cstring, pData: ^int64, cubData: uint32) -> int32 ---
	UserStats_GetGlobalStatHistoryFloat64 :: proc(self: ^IUserStats, pchStatName: cstring, pData: ^f64, cubData: uint32) -> int32 ---
	UserStats_GetAchievementProgressLimitsInt32 :: proc(self: ^IUserStats, pchName: cstring, pnMinProgress: ^int32, pnMaxProgress: ^int32) -> bool ---
	UserStats_GetAchievementProgressLimitsFloat :: proc(self: ^IUserStats, pchName: cstring, pfMinProgress: ^f32, pfMaxProgress: ^f32) -> bool ---

	Apps_BIsSubscribed :: proc(self: ^IApps) -> bool ---
	Apps_BIsLowViolence :: proc(self: ^IApps) -> bool ---
	Apps_BIsCybercafe :: proc(self: ^IApps) -> bool ---
	Apps_BIsVACBanned :: proc(self: ^IApps) -> bool ---
	Apps_GetCurrentGameLanguage :: proc(self: ^IApps) -> cstring ---
	Apps_GetAvailableGameLanguages :: proc(self: ^IApps) -> cstring ---
	Apps_BIsSubscribedApp :: proc(self: ^IApps, appID: AppId_t) -> bool ---
	Apps_BIsDlcInstalled :: proc(self: ^IApps, appID: AppId_t) -> bool ---
	Apps_GetEarliestPurchaseUnixTime :: proc(self: ^IApps, nAppID: AppId_t) -> uint32 ---
	Apps_BIsSubscribedFromFreeWeekend :: proc(self: ^IApps) -> bool ---
	Apps_GetDLCCount :: proc(self: ^IApps) -> c.int ---
	Apps_BGetDLCDataByIndex :: proc(self: ^IApps, iDLC: c.int, pAppID: ^AppId_t, pbAvailable: ^bool, pchName: ^u8, cchNameBufferSize: c.int) -> bool ---
	Apps_InstallDLC :: proc(self: ^IApps, nAppID: AppId_t) ---
	Apps_UninstallDLC :: proc(self: ^IApps, nAppID: AppId_t) ---
	Apps_RequestAppProofOfPurchaseKey :: proc(self: ^IApps, nAppID: AppId_t) ---
	Apps_GetCurrentBetaName :: proc(self: ^IApps, pchName: ^u8, cchNameBufferSize: c.int) -> bool ---
	Apps_MarkContentCorrupt :: proc(self: ^IApps, bMissingFilesOnly: bool) -> bool ---
	Apps_GetInstalledDepots :: proc(self: ^IApps, appID: AppId_t, pvecDepots: ^DepotId_t, cMaxDepots: uint32) -> uint32 ---
	Apps_GetAppInstallDir :: proc(self: ^IApps, appID: AppId_t, pchFolder: ^u8, cchFolderBufferSize: uint32) -> uint32 ---
	Apps_BIsAppInstalled :: proc(self: ^IApps, appID: AppId_t) -> bool ---
	Apps_GetAppOwner :: proc(self: ^IApps) -> CSteamID ---
	Apps_GetLaunchQueryParam :: proc(self: ^IApps, pchKey: cstring) -> cstring ---
	Apps_GetDlcDownloadProgress :: proc(self: ^IApps, nAppID: AppId_t, punBytesDownloaded: ^uint64, punBytesTotal: ^uint64) -> bool ---
	Apps_GetAppBuildId :: proc(self: ^IApps) -> c.int ---
	Apps_RequestAllProofOfPurchaseKeys :: proc(self: ^IApps) ---
	Apps_GetFileDetails :: proc(self: ^IApps, pszFileName: cstring) -> SteamAPICall_t ---
	Apps_GetLaunchCommandLine :: proc(self: ^IApps, pszCommandLine: ^u8, cubCommandLine: c.int) -> c.int ---
	Apps_BIsSubscribedFromFamilySharing :: proc(self: ^IApps) -> bool ---
	Apps_BIsTimedTrial :: proc(self: ^IApps, punSecondsAllowed: ^uint32, punSecondsPlayed: ^uint32) -> bool ---
	Apps_SetDlcContext :: proc(self: ^IApps, nAppID: AppId_t) -> bool ---

	Networking_SendP2PPacket :: proc(self: ^INetworking, steamIDRemote: CSteamID, pubData: rawptr, cubData: uint32, eP2PSendType: EP2PSend, nChannel: c.int) -> bool ---
	Networking_IsP2PPacketAvailable :: proc(self: ^INetworking, pcubMsgSize: ^uint32, nChannel: c.int) -> bool ---
	Networking_ReadP2PPacket :: proc(self: ^INetworking, pubDest: rawptr, cubDest: uint32, pcubMsgSize: ^uint32, psteamIDRemote: ^CSteamID, nChannel: c.int) -> bool ---
	Networking_AcceptP2PSessionWithUser :: proc(self: ^INetworking, steamIDRemote: CSteamID) -> bool ---
	Networking_CloseP2PSessionWithUser :: proc(self: ^INetworking, steamIDRemote: CSteamID) -> bool ---
	Networking_CloseP2PChannelWithUser :: proc(self: ^INetworking, steamIDRemote: CSteamID, nChannel: c.int) -> bool ---
	Networking_GetP2PSessionState :: proc(self: ^INetworking, steamIDRemote: CSteamID, pConnectionState: ^P2PSessionState_t) -> bool ---
	Networking_AllowP2PPacketRelay :: proc(self: ^INetworking, bAllow: bool) -> bool ---
	Networking_CreateListenSocket :: proc(self: ^INetworking, nVirtualP2PPort: c.int, nIP: SteamIPAddress_t, nPort: uint16, bAllowUseOfPacketRelay: bool) -> SNetListenSocket_t ---
	Networking_CreateP2PConnectionSocket :: proc(self: ^INetworking, steamIDTarget: CSteamID, nVirtualPort: c.int, nTimeoutSec: c.int, bAllowUseOfPacketRelay: bool) -> SNetSocket_t ---
	Networking_CreateConnectionSocket :: proc(self: ^INetworking, nIP: SteamIPAddress_t, nPort: uint16, nTimeoutSec: c.int) -> SNetSocket_t ---
	Networking_DestroySocket :: proc(self: ^INetworking, hSocket: SNetSocket_t, bNotifyRemoteEnd: bool) -> bool ---
	Networking_DestroyListenSocket :: proc(self: ^INetworking, hSocket: SNetListenSocket_t, bNotifyRemoteEnd: bool) -> bool ---
	Networking_SendDataOnSocket :: proc(self: ^INetworking, hSocket: SNetSocket_t, pubData: rawptr, cubData: uint32, bReliable: bool) -> bool ---
	Networking_IsDataAvailableOnSocket :: proc(self: ^INetworking, hSocket: SNetSocket_t, pcubMsgSize: ^uint32) -> bool ---
	Networking_RetrieveDataFromSocket :: proc(self: ^INetworking, hSocket: SNetSocket_t, pubDest: rawptr, cubDest: uint32, pcubMsgSize: ^uint32) -> bool ---
	Networking_IsDataAvailable :: proc(self: ^INetworking, hListenSocket: SNetListenSocket_t, pcubMsgSize: ^uint32, phSocket: ^SNetSocket_t) -> bool ---
	Networking_RetrieveData :: proc(self: ^INetworking, hListenSocket: SNetListenSocket_t, pubDest: rawptr, cubDest: uint32, pcubMsgSize: ^uint32, phSocket: ^SNetSocket_t) -> bool ---
	Networking_GetSocketInfo :: proc(self: ^INetworking, hSocket: SNetSocket_t, pSteamIDRemote: ^CSteamID, peSocketStatus: ^int, punIPRemote: ^SteamIPAddress_t, punPortRemote: ^uint16) -> bool ---
	Networking_GetListenSocketInfo :: proc(self: ^INetworking, hListenSocket: SNetListenSocket_t, pnIP: ^SteamIPAddress_t, pnPort: ^uint16) -> bool ---
	Networking_GetSocketConnectionType :: proc(self: ^INetworking, hSocket: SNetSocket_t) -> ESNetSocketConnectionType ---
	Networking_GetMaxPacketSize :: proc(self: ^INetworking, hSocket: SNetSocket_t) -> c.int ---

	Screenshots_WriteScreenshot :: proc(self: ^IScreenshots, pubRGB: rawptr, cubRGB: uint32, nWidth: c.int, nHeight: c.int) -> ScreenshotHandle ---
	Screenshots_AddScreenshotToLibrary :: proc(self: ^IScreenshots, pchFilename: cstring, pchThumbnailFilename: cstring, nWidth: c.int, nHeight: c.int) -> ScreenshotHandle ---
	Screenshots_TriggerScreenshot :: proc(self: ^IScreenshots) ---
	Screenshots_HookScreenshots :: proc(self: ^IScreenshots, bHook: bool) ---
	Screenshots_SetLocation :: proc(self: ^IScreenshots, hScreenshot: ScreenshotHandle, pchLocation: cstring) -> bool ---
	Screenshots_TagUser :: proc(self: ^IScreenshots, hScreenshot: ScreenshotHandle, steamID: CSteamID) -> bool ---
	Screenshots_TagPublishedFile :: proc(self: ^IScreenshots, hScreenshot: ScreenshotHandle, unPublishedFileID: PublishedFileId_t) -> bool ---
	Screenshots_IsScreenshotsHooked :: proc(self: ^IScreenshots) -> bool ---
	Screenshots_AddVRScreenshotToLibrary :: proc(self: ^IScreenshots, eType: EVRScreenshotType, pchFilename: cstring, pchVRFilename: cstring) -> ScreenshotHandle ---

	Music_BIsEnabled :: proc(self: ^IMusic) -> bool ---
	Music_BIsPlaying :: proc(self: ^IMusic) -> bool ---
	Music_GetPlaybackStatus :: proc(self: ^IMusic) -> AudioPlayback_Status ---
	Music_Play :: proc(self: ^IMusic) ---
	Music_Pause :: proc(self: ^IMusic) ---
	Music_PlayPrevious :: proc(self: ^IMusic) ---
	Music_PlayNext :: proc(self: ^IMusic) ---
	Music_SetVolume :: proc(self: ^IMusic, flVolume: f32) ---
	Music_GetVolume :: proc(self: ^IMusic) -> f32 ---

	MusicRemote_RegisterSteamMusicRemote :: proc(self: ^IMusicRemote, pchName: cstring) -> bool ---
	MusicRemote_DeregisterSteamMusicRemote :: proc(self: ^IMusicRemote) -> bool ---
	MusicRemote_BIsCurrentMusicRemote :: proc(self: ^IMusicRemote) -> bool ---
	MusicRemote_BActivationSuccess :: proc(self: ^IMusicRemote, bValue: bool) -> bool ---
	MusicRemote_SetDisplayName :: proc(self: ^IMusicRemote, pchDisplayName: cstring) -> bool ---
	MusicRemote_SetPNGIcon_64x64 :: proc(self: ^IMusicRemote, pvBuffer: rawptr, cbBufferLength: uint32) -> bool ---
	MusicRemote_EnablePlayPrevious :: proc(self: ^IMusicRemote, bValue: bool) -> bool ---
	MusicRemote_EnablePlayNext :: proc(self: ^IMusicRemote, bValue: bool) -> bool ---
	MusicRemote_EnableShuffled :: proc(self: ^IMusicRemote, bValue: bool) -> bool ---
	MusicRemote_EnableLooped :: proc(self: ^IMusicRemote, bValue: bool) -> bool ---
	MusicRemote_EnableQueue :: proc(self: ^IMusicRemote, bValue: bool) -> bool ---
	MusicRemote_EnablePlaylists :: proc(self: ^IMusicRemote, bValue: bool) -> bool ---
	MusicRemote_UpdatePlaybackStatus :: proc(self: ^IMusicRemote, nStatus: AudioPlayback_Status) -> bool ---
	MusicRemote_UpdateShuffled :: proc(self: ^IMusicRemote, bValue: bool) -> bool ---
	MusicRemote_UpdateLooped :: proc(self: ^IMusicRemote, bValue: bool) -> bool ---
	MusicRemote_UpdateVolume :: proc(self: ^IMusicRemote, flValue: f32) -> bool ---
	MusicRemote_CurrentEntryWillChange :: proc(self: ^IMusicRemote) -> bool ---
	MusicRemote_CurrentEntryIsAvailable :: proc(self: ^IMusicRemote, bAvailable: bool) -> bool ---
	MusicRemote_UpdateCurrentEntryText :: proc(self: ^IMusicRemote, pchText: cstring) -> bool ---
	MusicRemote_UpdateCurrentEntryElapsedSeconds :: proc(self: ^IMusicRemote, nValue: c.int) -> bool ---
	MusicRemote_UpdateCurrentEntryCoverArt :: proc(self: ^IMusicRemote, pvBuffer: rawptr, cbBufferLength: uint32) -> bool ---
	MusicRemote_CurrentEntryDidChange :: proc(self: ^IMusicRemote) -> bool ---
	MusicRemote_QueueWillChange :: proc(self: ^IMusicRemote) -> bool ---
	MusicRemote_ResetQueueEntries :: proc(self: ^IMusicRemote) -> bool ---
	MusicRemote_SetQueueEntry :: proc(self: ^IMusicRemote, nID: c.int, nPosition: c.int, pchEntryText: cstring) -> bool ---
	MusicRemote_SetCurrentQueueEntry :: proc(self: ^IMusicRemote, nID: c.int) -> bool ---
	MusicRemote_QueueDidChange :: proc(self: ^IMusicRemote) -> bool ---
	MusicRemote_PlaylistWillChange :: proc(self: ^IMusicRemote) -> bool ---
	MusicRemote_ResetPlaylistEntries :: proc(self: ^IMusicRemote) -> bool ---
	MusicRemote_SetPlaylistEntry :: proc(self: ^IMusicRemote, nID: c.int, nPosition: c.int, pchEntryText: cstring) -> bool ---
	MusicRemote_SetCurrentPlaylistEntry :: proc(self: ^IMusicRemote, nID: c.int) -> bool ---
	MusicRemote_PlaylistDidChange :: proc(self: ^IMusicRemote) -> bool ---

	HTTP_CreateHTTPRequest :: proc(self: ^IHTTP, eHTTPRequestMethod: EHTTPMethod, pchAbsoluteURL: cstring) -> HTTPRequestHandle ---
	HTTP_SetHTTPRequestContextValue :: proc(self: ^IHTTP, hRequest: HTTPRequestHandle, ulContextValue: uint64) -> bool ---
	HTTP_SetHTTPRequestNetworkActivityTimeout :: proc(self: ^IHTTP, hRequest: HTTPRequestHandle, unTimeoutSeconds: uint32) -> bool ---
	HTTP_SetHTTPRequestHeaderValue :: proc(self: ^IHTTP, hRequest: HTTPRequestHandle, pchHeaderName: cstring, pchHeaderValue: cstring) -> bool ---
	HTTP_SetHTTPRequestGetOrPostParameter :: proc(self: ^IHTTP, hRequest: HTTPRequestHandle, pchParamName: cstring, pchParamValue: cstring) -> bool ---
	HTTP_SendHTTPRequest :: proc(self: ^IHTTP, hRequest: HTTPRequestHandle, pCallHandle: ^SteamAPICall_t) -> bool ---
	HTTP_SendHTTPRequestAndStreamResponse :: proc(self: ^IHTTP, hRequest: HTTPRequestHandle, pCallHandle: ^SteamAPICall_t) -> bool ---
	HTTP_DeferHTTPRequest :: proc(self: ^IHTTP, hRequest: HTTPRequestHandle) -> bool ---
	HTTP_PrioritizeHTTPRequest :: proc(self: ^IHTTP, hRequest: HTTPRequestHandle) -> bool ---
	HTTP_GetHTTPResponseHeaderSize :: proc(self: ^IHTTP, hRequest: HTTPRequestHandle, pchHeaderName: cstring, unResponseHeaderSize: ^uint32) -> bool ---
	HTTP_GetHTTPResponseHeaderValue :: proc(self: ^IHTTP, hRequest: HTTPRequestHandle, pchHeaderName: cstring, pHeaderValueBuffer: ^uint8, unBufferSize: uint32) -> bool ---
	HTTP_GetHTTPResponseBodySize :: proc(self: ^IHTTP, hRequest: HTTPRequestHandle, unBodySize: ^uint32) -> bool ---
	HTTP_GetHTTPResponseBodyData :: proc(self: ^IHTTP, hRequest: HTTPRequestHandle, pBodyDataBuffer: ^uint8, unBufferSize: uint32) -> bool ---
	HTTP_GetHTTPStreamingResponseBodyData :: proc(self: ^IHTTP, hRequest: HTTPRequestHandle, cOffset: uint32, pBodyDataBuffer: ^uint8, unBufferSize: uint32) -> bool ---
	HTTP_ReleaseHTTPRequest :: proc(self: ^IHTTP, hRequest: HTTPRequestHandle) -> bool ---
	HTTP_GetHTTPDownloadProgressPct :: proc(self: ^IHTTP, hRequest: HTTPRequestHandle, pflPercentOut: ^f32) -> bool ---
	HTTP_SetHTTPRequestRawPostBody :: proc(self: ^IHTTP, hRequest: HTTPRequestHandle, pchContentType: cstring, pubBody: ^uint8, unBodyLen: uint32) -> bool ---
	HTTP_CreateCookieContainer :: proc(self: ^IHTTP, bAllowResponsesToModify: bool) -> HTTPCookieContainerHandle ---
	HTTP_ReleaseCookieContainer :: proc(self: ^IHTTP, hCookieContainer: HTTPCookieContainerHandle) -> bool ---
	HTTP_SetCookie :: proc(self: ^IHTTP, hCookieContainer: HTTPCookieContainerHandle, pchHost: cstring, pchUrl: cstring, pchCookie: cstring) -> bool ---
	HTTP_SetHTTPRequestCookieContainer :: proc(self: ^IHTTP, hRequest: HTTPRequestHandle, hCookieContainer: HTTPCookieContainerHandle) -> bool ---
	HTTP_SetHTTPRequestUserAgentInfo :: proc(self: ^IHTTP, hRequest: HTTPRequestHandle, pchUserAgentInfo: cstring) -> bool ---
	HTTP_SetHTTPRequestRequiresVerifiedCertificate :: proc(self: ^IHTTP, hRequest: HTTPRequestHandle, bRequireVerifiedCertificate: bool) -> bool ---
	HTTP_SetHTTPRequestAbsoluteTimeoutMS :: proc(self: ^IHTTP, hRequest: HTTPRequestHandle, unMilliseconds: uint32) -> bool ---
	HTTP_GetHTTPRequestWasTimedOut :: proc(self: ^IHTTP, hRequest: HTTPRequestHandle, pbWasTimedOut: ^bool) -> bool ---

	Input_Init :: proc(self: ^IInput, bExplicitlyCallRunFrame: bool) -> bool ---
	Input_Shutdown :: proc(self: ^IInput) -> bool ---
	Input_SetInputActionManifestFilePath :: proc(self: ^IInput, pchInputActionManifestAbsolutePath: cstring) -> bool ---
	Input_RunFrame :: proc(self: ^IInput, bReservedValue: bool) ---
	Input_BWaitForData :: proc(self: ^IInput, bWaitForever: bool, unTimeout: uint32) -> bool ---
	Input_BNewDataAvailable :: proc(self: ^IInput) -> bool ---
	Input_GetConnectedControllers :: proc(self: ^IInput, handlesOut: ^InputHandle_t) -> c.int ---
	Input_EnableDeviceCallbacks :: proc(self: ^IInput) ---
	Input_EnableActionEventCallbacks :: proc(self: ^IInput, pCallback: SteamInputActionEventCallbackPointer) ---
	Input_GetActionSetHandle :: proc(self: ^IInput, pszActionSetName: cstring) -> InputActionSetHandle_t ---
	Input_ActivateActionSet :: proc(self: ^IInput, inputHandle: InputHandle_t, actionSetHandle: InputActionSetHandle_t) ---
	Input_GetCurrentActionSet :: proc(self: ^IInput, inputHandle: InputHandle_t) -> InputActionSetHandle_t ---
	Input_ActivateActionSetLayer :: proc(self: ^IInput, inputHandle: InputHandle_t, actionSetLayerHandle: InputActionSetHandle_t) ---
	Input_DeactivateActionSetLayer :: proc(self: ^IInput, inputHandle: InputHandle_t, actionSetLayerHandle: InputActionSetHandle_t) ---
	Input_DeactivateAllActionSetLayers :: proc(self: ^IInput, inputHandle: InputHandle_t) ---
	Input_GetActiveActionSetLayers :: proc(self: ^IInput, inputHandle: InputHandle_t, handlesOut: ^InputActionSetHandle_t) -> c.int ---
	Input_GetDigitalActionHandle :: proc(self: ^IInput, pszActionName: cstring) -> InputDigitalActionHandle_t ---
	Input_GetDigitalActionData :: proc(self: ^IInput, inputHandle: InputHandle_t, digitalActionHandle: InputDigitalActionHandle_t) -> InputDigitalActionData_t ---
	Input_GetDigitalActionOrigins :: proc(self: ^IInput, inputHandle: InputHandle_t, actionSetHandle: InputActionSetHandle_t, digitalActionHandle: InputDigitalActionHandle_t, originsOut: ^EInputActionOrigin) -> c.int ---
	Input_GetStringForDigitalActionName :: proc(self: ^IInput, eActionHandle: InputDigitalActionHandle_t) -> cstring ---
	Input_GetAnalogActionHandle :: proc(self: ^IInput, pszActionName: cstring) -> InputAnalogActionHandle_t ---
	Input_GetAnalogActionData :: proc(self: ^IInput, inputHandle: InputHandle_t, analogActionHandle: InputAnalogActionHandle_t) -> InputAnalogActionData_t ---
	Input_GetAnalogActionOrigins :: proc(self: ^IInput, inputHandle: InputHandle_t, actionSetHandle: InputActionSetHandle_t, analogActionHandle: InputAnalogActionHandle_t, originsOut: ^EInputActionOrigin) -> c.int ---
	Input_GetGlyphPNGForActionOrigin :: proc(self: ^IInput, eOrigin: EInputActionOrigin, eSize: ESteamInputGlyphSize, unFlags: uint32) -> cstring ---
	Input_GetGlyphSVGForActionOrigin :: proc(self: ^IInput, eOrigin: EInputActionOrigin, unFlags: uint32) -> cstring ---
	Input_GetGlyphForActionOrigin_Legacy :: proc(self: ^IInput, eOrigin: EInputActionOrigin) -> cstring ---
	Input_GetStringForActionOrigin :: proc(self: ^IInput, eOrigin: EInputActionOrigin) -> cstring ---
	Input_GetStringForAnalogActionName :: proc(self: ^IInput, eActionHandle: InputAnalogActionHandle_t) -> cstring ---
	Input_StopAnalogActionMomentum :: proc(self: ^IInput, inputHandle: InputHandle_t, eAction: InputAnalogActionHandle_t) ---
	Input_GetMotionData :: proc(self: ^IInput, inputHandle: InputHandle_t) -> InputMotionData_t ---
	Input_TriggerVibration :: proc(self: ^IInput, inputHandle: InputHandle_t, usLeftSpeed: c.ushort, usRightSpeed: c.ushort) ---
	Input_TriggerVibrationExtended :: proc(self: ^IInput, inputHandle: InputHandle_t, usLeftSpeed: c.ushort, usRightSpeed: c.ushort, usLeftTriggerSpeed: c.ushort, usRightTriggerSpeed: c.ushort) ---
	Input_TriggerSimpleHapticEvent :: proc(self: ^IInput, inputHandle: InputHandle_t, eHapticLocation: EControllerHapticLocation, nIntensity: uint8, nGainDB: i8, nOtherIntensity: uint8, nOtherGainDB: i8) ---
	Input_SetLEDColor :: proc(self: ^IInput, inputHandle: InputHandle_t, nColorR: uint8, nColorG: uint8, nColorB: uint8, nFlags: c.uint) ---
	Input_Legacy_TriggerHapticPulse :: proc(self: ^IInput, inputHandle: InputHandle_t, eTargetPad: ESteamControllerPad, usDurationMicroSec: c.ushort) ---
	Input_Legacy_TriggerRepeatedHapticPulse :: proc(self: ^IInput, inputHandle: InputHandle_t, eTargetPad: ESteamControllerPad, usDurationMicroSec: c.ushort, usOffMicroSec: c.ushort, unRepeat: c.ushort, nFlags: c.uint) ---
	Input_ShowBindingPanel :: proc(self: ^IInput, inputHandle: InputHandle_t) -> bool ---
	Input_GetInputTypeForHandle :: proc(self: ^IInput, inputHandle: InputHandle_t) -> ESteamInputType ---
	Input_GetControllerForGamepadIndex :: proc(self: ^IInput, nIndex: c.int) -> InputHandle_t ---
	Input_GetGamepadIndexForController :: proc(self: ^IInput, ulinputHandle: InputHandle_t) -> c.int ---
	Input_GetStringForXboxOrigin :: proc(self: ^IInput, eOrigin: EXboxOrigin) -> cstring ---
	Input_GetGlyphForXboxOrigin :: proc(self: ^IInput, eOrigin: EXboxOrigin) -> cstring ---
	Input_GetActionOriginFromXboxOrigin :: proc(self: ^IInput, inputHandle: InputHandle_t, eOrigin: EXboxOrigin) -> EInputActionOrigin ---
	Input_TranslateActionOrigin :: proc(self: ^IInput, eDestinationInputType: ESteamInputType, eSourceOrigin: EInputActionOrigin) -> EInputActionOrigin ---
	Input_GetDeviceBindingRevision :: proc(self: ^IInput, inputHandle: InputHandle_t, pMajor: ^int, pMinor: ^int) -> bool ---
	Input_GetRemotePlaySessionID :: proc(self: ^IInput, inputHandle: InputHandle_t) -> uint32 ---
	Input_GetSessionInputConfigurationSettings :: proc(self: ^IInput) -> uint16 ---
	// IInput_SetDualSenseTriggerEffect :: proc(self: ^IInput, inputHandle: InputHandle_t, pParam: ^ScePadTriggerEffectParam) ---

	Controller_Init :: proc(self: ^IController) -> bool ---
	Controller_Shutdown :: proc(self: ^IController) -> bool ---
	Controller_RunFrame :: proc(self: ^IController) ---
	Controller_GetConnectedControllers :: proc(self: ^IController, handlesOut: ^ControllerHandle_t) -> c.int ---
	Controller_GetActionSetHandle :: proc(self: ^IController, pszActionSetName: cstring) -> ControllerActionSetHandle_t ---
	Controller_ActivateActionSet :: proc(self: ^IController, controllerHandle: ControllerHandle_t, actionSetHandle: ControllerActionSetHandle_t) ---
	Controller_GetCurrentActionSet :: proc(self: ^IController, controllerHandle: ControllerHandle_t) -> ControllerActionSetHandle_t ---
	Controller_ActivateActionSetLayer :: proc(self: ^IController, controllerHandle: ControllerHandle_t, actionSetLayerHandle: ControllerActionSetHandle_t) ---
	Controller_DeactivateActionSetLayer :: proc(self: ^IController, controllerHandle: ControllerHandle_t, actionSetLayerHandle: ControllerActionSetHandle_t) ---
	Controller_DeactivateAllActionSetLayers :: proc(self: ^IController, controllerHandle: ControllerHandle_t) ---
	Controller_GetActiveActionSetLayers :: proc(self: ^IController, controllerHandle: ControllerHandle_t, handlesOut: ^ControllerActionSetHandle_t) -> c.int ---
	Controller_GetDigitalActionHandle :: proc(self: ^IController, pszActionName: cstring) -> ControllerDigitalActionHandle_t ---
	Controller_GetDigitalActionData :: proc(self: ^IController, controllerHandle: ControllerHandle_t, digitalActionHandle: ControllerDigitalActionHandle_t) -> InputDigitalActionData_t ---
	Controller_GetDigitalActionOrigins :: proc(self: ^IController, controllerHandle: ControllerHandle_t, actionSetHandle: ControllerActionSetHandle_t, digitalActionHandle: ControllerDigitalActionHandle_t, originsOut: ^EControllerActionOrigin) -> c.int ---
	Controller_GetAnalogActionHandle :: proc(self: ^IController, pszActionName: cstring) -> ControllerAnalogActionHandle_t ---
	Controller_GetAnalogActionData :: proc(self: ^IController, controllerHandle: ControllerHandle_t, analogActionHandle: ControllerAnalogActionHandle_t) -> InputAnalogActionData_t ---
	Controller_GetAnalogActionOrigins :: proc(self: ^IController, controllerHandle: ControllerHandle_t, actionSetHandle: ControllerActionSetHandle_t, analogActionHandle: ControllerAnalogActionHandle_t, originsOut: ^EControllerActionOrigin) -> c.int ---
	Controller_GetGlyphForActionOrigin :: proc(self: ^IController, eOrigin: EControllerActionOrigin) -> cstring ---
	Controller_GetStringForActionOrigin :: proc(self: ^IController, eOrigin: EControllerActionOrigin) -> cstring ---
	Controller_StopAnalogActionMomentum :: proc(self: ^IController, controllerHandle: ControllerHandle_t, eAction: ControllerAnalogActionHandle_t) ---
	Controller_GetMotionData :: proc(self: ^IController, controllerHandle: ControllerHandle_t) -> InputMotionData_t ---
	Controller_TriggerHapticPulse :: proc(self: ^IController, controllerHandle: ControllerHandle_t, eTargetPad: ESteamControllerPad, usDurationMicroSec: c.ushort) ---
	Controller_TriggerRepeatedHapticPulse :: proc(self: ^IController, controllerHandle: ControllerHandle_t, eTargetPad: ESteamControllerPad, usDurationMicroSec: c.ushort, usOffMicroSec: c.ushort, unRepeat: c.ushort, nFlags: c.uint) ---
	Controller_TriggerVibration :: proc(self: ^IController, controllerHandle: ControllerHandle_t, usLeftSpeed: c.ushort, usRightSpeed: c.ushort) ---
	Controller_SetLEDColor :: proc(self: ^IController, controllerHandle: ControllerHandle_t, nColorR: uint8, nColorG: uint8, nColorB: uint8, nFlags: c.uint) ---
	Controller_ShowBindingPanel :: proc(self: ^IController, controllerHandle: ControllerHandle_t) -> bool ---
	Controller_GetInputTypeForHandle :: proc(self: ^IController, controllerHandle: ControllerHandle_t) -> ESteamInputType ---
	Controller_GetControllerForGamepadIndex :: proc(self: ^IController, nIndex: c.int) -> ControllerHandle_t ---
	Controller_GetGamepadIndexForController :: proc(self: ^IController, ulControllerHandle: ControllerHandle_t) -> c.int ---
	Controller_GetStringForXboxOrigin :: proc(self: ^IController, eOrigin: EXboxOrigin) -> cstring ---
	Controller_GetGlyphForXboxOrigin :: proc(self: ^IController, eOrigin: EXboxOrigin) -> cstring ---
	Controller_GetActionOriginFromXboxOrigin :: proc(self: ^IController, controllerHandle: ControllerHandle_t, eOrigin: EXboxOrigin) -> EControllerActionOrigin ---
	Controller_TranslateActionOrigin :: proc(self: ^IController, eDestinationInputType: ESteamInputType, eSourceOrigin: EControllerActionOrigin) -> EControllerActionOrigin ---
	Controller_GetControllerBindingRevision :: proc(self: ^IController, controllerHandle: ControllerHandle_t, pMajor: ^int, pMinor: ^int) -> bool ---

	UGC_CreateQueryUserUGCRequest :: proc(self: ^IUGC, unAccountID: AccountID_t, eListType: EUserUGCList, eMatchingUGCType: EUGCMatchingUGCType, eSortOrder: EUserUGCListSortOrder, nCreatorAppID: AppId_t, nConsumerAppID: AppId_t, unPage: uint32) -> UGCQueryHandle_t ---
	UGC_CreateQueryAllUGCRequestByPage :: proc(self: ^IUGC, eQueryType: EUGCQuery, eMatchingeMatchingUGCTypeFileType: EUGCMatchingUGCType, nCreatorAppID: AppId_t, nConsumerAppID: AppId_t, unPage: uint32) -> UGCQueryHandle_t ---
	UGC_CreateQueryAllUGCRequestByCursor :: proc(self: ^IUGC, eQueryType: EUGCQuery, eMatchingeMatchingUGCTypeFileType: EUGCMatchingUGCType, nCreatorAppID: AppId_t, nConsumerAppID: AppId_t, pchCursor: cstring) -> UGCQueryHandle_t ---
	UGC_CreateQueryUGCDetailsRequest :: proc(self: ^IUGC, pvecPublishedFileID: ^PublishedFileId_t, unNumPublishedFileIDs: uint32) -> UGCQueryHandle_t ---
	UGC_SendQueryUGCRequest :: proc(self: ^IUGC, handle: UGCQueryHandle_t) -> SteamAPICall_t ---
	UGC_GetQueryUGCResult :: proc(self: ^IUGC, handle: UGCQueryHandle_t, index: uint32, pDetails: ^SteamUGCDetails_t) -> bool ---
	UGC_GetQueryUGCNumTags :: proc(self: ^IUGC, handle: UGCQueryHandle_t, index: uint32) -> uint32 ---
	UGC_GetQueryUGCTag :: proc(self: ^IUGC, handle: UGCQueryHandle_t, index: uint32, indexTag: uint32, pchValue: ^u8, cchValueSize: uint32) -> bool ---
	UGC_GetQueryUGCTagDisplayName :: proc(self: ^IUGC, handle: UGCQueryHandle_t, index: uint32, indexTag: uint32, pchValue: ^u8, cchValueSize: uint32) -> bool ---
	UGC_GetQueryUGCPreviewURL :: proc(self: ^IUGC, handle: UGCQueryHandle_t, index: uint32, pchURL: ^u8, cchURLSize: uint32) -> bool ---
	UGC_GetQueryUGCMetadata :: proc(self: ^IUGC, handle: UGCQueryHandle_t, index: uint32, pchMetadata: ^u8, cchMetadatasize: uint32) -> bool ---
	UGC_GetQueryUGCChildren :: proc(self: ^IUGC, handle: UGCQueryHandle_t, index: uint32, pvecPublishedFileID: ^PublishedFileId_t, cMaxEntries: uint32) -> bool ---
	UGC_GetQueryUGCStatistic :: proc(self: ^IUGC, handle: UGCQueryHandle_t, index: uint32, eStatType: EItemStatistic, pStatValue: ^uint64) -> bool ---
	UGC_GetQueryUGCNumAdditionalPreviews :: proc(self: ^IUGC, handle: UGCQueryHandle_t, index: uint32) -> uint32 ---
	UGC_GetQueryUGCAdditionalPreview :: proc(self: ^IUGC, handle: UGCQueryHandle_t, index: uint32, previewIndex: uint32, pchURLOrVideoID: ^u8, cchURLSize: uint32, pchOriginalFileName: ^u8, cchOriginalFileNameSize: uint32, pPreviewType: ^EItemPreviewType) -> bool ---
	UGC_GetQueryUGCNumKeyValueTags :: proc(self: ^IUGC, handle: UGCQueryHandle_t, index: uint32) -> uint32 ---
	UGC_GetQueryUGCKeyValueTag :: proc(self: ^IUGC, handle: UGCQueryHandle_t, index: uint32, pchKey: cstring, pchValue: ^u8, cchValueSize: uint32) -> bool ---
	UGC_ReleaseQueryUGCRequest :: proc(self: ^IUGC, handle: UGCQueryHandle_t) -> bool ---
	UGC_AddRequiredTag :: proc(self: ^IUGC, handle: UGCQueryHandle_t, pTagName: cstring) -> bool ---
	UGC_AddRequiredTagGroup :: proc(self: ^IUGC, handle: UGCQueryHandle_t, pTagGroups: ^SteamParamStringArray_t) -> bool ---
	UGC_AddExcludedTag :: proc(self: ^IUGC, handle: UGCQueryHandle_t, pTagName: cstring) -> bool ---
	UGC_SetReturnOnlyIDs :: proc(self: ^IUGC, handle: UGCQueryHandle_t, bReturnOnlyIDs: bool) -> bool ---
	UGC_SetReturnKeyValueTags :: proc(self: ^IUGC, handle: UGCQueryHandle_t, bReturnKeyValueTags: bool) -> bool ---
	UGC_SetReturnLongDescription :: proc(self: ^IUGC, handle: UGCQueryHandle_t, bReturnLongDescription: bool) -> bool ---
	UGC_SetReturnMetadata :: proc(self: ^IUGC, handle: UGCQueryHandle_t, bReturnMetadata: bool) -> bool ---
	UGC_SetReturnChildren :: proc(self: ^IUGC, handle: UGCQueryHandle_t, bReturnChildren: bool) -> bool ---
	UGC_SetReturnAdditionalPreviews :: proc(self: ^IUGC, handle: UGCQueryHandle_t, bReturnAdditionalPreviews: bool) -> bool ---
	UGC_SetReturnTotalOnly :: proc(self: ^IUGC, handle: UGCQueryHandle_t, bReturnTotalOnly: bool) -> bool ---
	UGC_SetReturnPlaytimeStats :: proc(self: ^IUGC, handle: UGCQueryHandle_t, unDays: uint32) -> bool ---
	UGC_SetLanguage :: proc(self: ^IUGC, handle: UGCQueryHandle_t, pchLanguage: cstring) -> bool ---
	UGC_SetAllowCachedResponse :: proc(self: ^IUGC, handle: UGCQueryHandle_t, unMaxAgeSeconds: uint32) -> bool ---
	UGC_SetCloudFileNameFilter :: proc(self: ^IUGC, handle: UGCQueryHandle_t, pMatchCloudFileName: cstring) -> bool ---
	UGC_SetMatchAnyTag :: proc(self: ^IUGC, handle: UGCQueryHandle_t, bMatchAnyTag: bool) -> bool ---
	UGC_SetSearchText :: proc(self: ^IUGC, handle: UGCQueryHandle_t, pSearchText: cstring) -> bool ---
	UGC_SetRankedByTrendDays :: proc(self: ^IUGC, handle: UGCQueryHandle_t, unDays: uint32) -> bool ---
	UGC_SetTimeCreatedDateRange :: proc(self: ^IUGC, handle: UGCQueryHandle_t, rtStart: RTime32, rtEnd: RTime32) -> bool ---
	UGC_SetTimeUpdatedDateRange :: proc(self: ^IUGC, handle: UGCQueryHandle_t, rtStart: RTime32, rtEnd: RTime32) -> bool ---
	UGC_AddRequiredKeyValueTag :: proc(self: ^IUGC, handle: UGCQueryHandle_t, pKey: cstring, pValue: cstring) -> bool ---
	UGC_RequestUGCDetails :: proc(self: ^IUGC, nPublishedFileID: PublishedFileId_t, unMaxAgeSeconds: uint32) -> SteamAPICall_t ---
	UGC_CreateItem :: proc(self: ^IUGC, nConsumerAppId: AppId_t, eFileType: EWorkshopFileType) -> SteamAPICall_t ---
	UGC_StartItemUpdate :: proc(self: ^IUGC, nConsumerAppId: AppId_t, nPublishedFileID: PublishedFileId_t) -> UGCUpdateHandle_t ---
	UGC_SetItemTitle :: proc(self: ^IUGC, handle: UGCUpdateHandle_t, pchTitle: cstring) -> bool ---
	UGC_SetItemDescription :: proc(self: ^IUGC, handle: UGCUpdateHandle_t, pchDescription: cstring) -> bool ---
	UGC_SetItemUpdateLanguage :: proc(self: ^IUGC, handle: UGCUpdateHandle_t, pchLanguage: cstring) -> bool ---
	UGC_SetItemMetadata :: proc(self: ^IUGC, handle: UGCUpdateHandle_t, pchMetaData: cstring) -> bool ---
	UGC_SetItemVisibility :: proc(self: ^IUGC, handle: UGCUpdateHandle_t, eVisibility: ERemoteStoragePublishedFileVisibility) -> bool ---
	UGC_SetItemTags :: proc(self: ^IUGC, updateHandle: UGCUpdateHandle_t, pTags: ^SteamParamStringArray_t) -> bool ---
	UGC_SetItemContent :: proc(self: ^IUGC, handle: UGCUpdateHandle_t, pszContentFolder: cstring) -> bool ---
	UGC_SetItemPreview :: proc(self: ^IUGC, handle: UGCUpdateHandle_t, pszPreviewFile: cstring) -> bool ---
	UGC_SetAllowLegacyUpload :: proc(self: ^IUGC, handle: UGCUpdateHandle_t, bAllowLegacyUpload: bool) -> bool ---
	UGC_RemoveAllItemKeyValueTags :: proc(self: ^IUGC, handle: UGCUpdateHandle_t) -> bool ---
	UGC_RemoveItemKeyValueTags :: proc(self: ^IUGC, handle: UGCUpdateHandle_t, pchKey: cstring) -> bool ---
	UGC_AddItemKeyValueTag :: proc(self: ^IUGC, handle: UGCUpdateHandle_t, pchKey: cstring, pchValue: cstring) -> bool ---
	UGC_AddItemPreviewFile :: proc(self: ^IUGC, handle: UGCUpdateHandle_t, pszPreviewFile: cstring, type: EItemPreviewType) -> bool ---
	UGC_AddItemPreviewVideo :: proc(self: ^IUGC, handle: UGCUpdateHandle_t, pszVideoID: cstring) -> bool ---
	UGC_UpdateItemPreviewFile :: proc(self: ^IUGC, handle: UGCUpdateHandle_t, index: uint32, pszPreviewFile: cstring) -> bool ---
	UGC_UpdateItemPreviewVideo :: proc(self: ^IUGC, handle: UGCUpdateHandle_t, index: uint32, pszVideoID: cstring) -> bool ---
	UGC_RemoveItemPreview :: proc(self: ^IUGC, handle: UGCUpdateHandle_t, index: uint32) -> bool ---
	UGC_SubmitItemUpdate :: proc(self: ^IUGC, handle: UGCUpdateHandle_t, pchChangeNote: cstring) -> SteamAPICall_t ---
	UGC_GetItemUpdateProgress :: proc(self: ^IUGC, handle: UGCUpdateHandle_t, punBytesProcessed: ^uint64, punBytesTotal: ^uint64) -> EItemUpdateStatus ---
	UGC_SetUserItemVote :: proc(self: ^IUGC, nPublishedFileID: PublishedFileId_t, bVoteUp: bool) -> SteamAPICall_t ---
	UGC_GetUserItemVote :: proc(self: ^IUGC, nPublishedFileID: PublishedFileId_t) -> SteamAPICall_t ---
	UGC_AddItemToFavorites :: proc(self: ^IUGC, nAppId: AppId_t, nPublishedFileID: PublishedFileId_t) -> SteamAPICall_t ---
	UGC_RemoveItemFromFavorites :: proc(self: ^IUGC, nAppId: AppId_t, nPublishedFileID: PublishedFileId_t) -> SteamAPICall_t ---
	UGC_SubscribeItem :: proc(self: ^IUGC, nPublishedFileID: PublishedFileId_t) -> SteamAPICall_t ---
	UGC_UnsubscribeItem :: proc(self: ^IUGC, nPublishedFileID: PublishedFileId_t) -> SteamAPICall_t ---
	UGC_GetNumSubscribedItems :: proc(self: ^IUGC) -> uint32 ---
	UGC_GetSubscribedItems :: proc(self: ^IUGC, pvecPublishedFileID: ^PublishedFileId_t, cMaxEntries: uint32) -> uint32 ---
	UGC_GetItemState :: proc(self: ^IUGC, nPublishedFileID: PublishedFileId_t) -> uint32 ---
	UGC_GetItemInstallInfo :: proc(self: ^IUGC, nPublishedFileID: PublishedFileId_t, punSizeOnDisk: ^uint64, pchFolder: ^u8, cchFolderSize: uint32, punTimeStamp: ^uint32) -> bool ---
	UGC_GetItemDownloadInfo :: proc(self: ^IUGC, nPublishedFileID: PublishedFileId_t, punBytesDownloaded: ^uint64, punBytesTotal: ^uint64) -> bool ---
	UGC_DownloadItem :: proc(self: ^IUGC, nPublishedFileID: PublishedFileId_t, bHighPriority: bool) -> bool ---
	UGC_BInitWorkshopForGameServer :: proc(self: ^IUGC, unWorkshopDepotID: DepotId_t, pszFolder: cstring) -> bool ---
	UGC_SuspendDownloads :: proc(self: ^IUGC, bSuspend: bool) ---
	UGC_StartPlaytimeTracking :: proc(self: ^IUGC, pvecPublishedFileID: ^PublishedFileId_t, unNumPublishedFileIDs: uint32) -> SteamAPICall_t ---
	UGC_StopPlaytimeTracking :: proc(self: ^IUGC, pvecPublishedFileID: ^PublishedFileId_t, unNumPublishedFileIDs: uint32) -> SteamAPICall_t ---
	UGC_StopPlaytimeTrackingForAllItems :: proc(self: ^IUGC) -> SteamAPICall_t ---
	UGC_AddDependency :: proc(self: ^IUGC, nParentPublishedFileID: PublishedFileId_t, nChildPublishedFileID: PublishedFileId_t) -> SteamAPICall_t ---
	UGC_RemoveDependency :: proc(self: ^IUGC, nParentPublishedFileID: PublishedFileId_t, nChildPublishedFileID: PublishedFileId_t) -> SteamAPICall_t ---
	UGC_AddAppDependency :: proc(self: ^IUGC, nPublishedFileID: PublishedFileId_t, nAppID: AppId_t) -> SteamAPICall_t ---
	UGC_RemoveAppDependency :: proc(self: ^IUGC, nPublishedFileID: PublishedFileId_t, nAppID: AppId_t) -> SteamAPICall_t ---
	UGC_GetAppDependencies :: proc(self: ^IUGC, nPublishedFileID: PublishedFileId_t) -> SteamAPICall_t ---
	UGC_DeleteItem :: proc(self: ^IUGC, nPublishedFileID: PublishedFileId_t) -> SteamAPICall_t ---
	UGC_ShowWorkshopEULA :: proc(self: ^IUGC) -> bool ---
	UGC_GetWorkshopEULAStatus :: proc(self: ^IUGC) -> SteamAPICall_t ---

	AppList_GetNumInstalledApps :: proc(self: ^IAppList) -> uint32 ---
	AppList_GetInstalledApps :: proc(self: ^IAppList, pvecAppID: ^AppId_t, unMaxAppIDs: uint32) -> uint32 ---
	AppList_GetAppName :: proc(self: ^IAppList, nAppID: AppId_t, pchName: ^u8, cchNameMax: c.int) -> c.int ---
	AppList_GetAppInstallDir :: proc(self: ^IAppList, nAppID: AppId_t, pchDirectory: ^u8, cchNameMax: c.int) -> c.int ---
	AppList_GetAppBuildId :: proc(self: ^IAppList, nAppID: AppId_t) -> c.int ---

	HTMLSurface_Init :: proc(self: ^IHTMLSurface) -> bool ---
	HTMLSurface_Shutdown :: proc(self: ^IHTMLSurface) -> bool ---
	HTMLSurface_CreateBrowser :: proc(self: ^IHTMLSurface, pchUserAgent: cstring, pchUserCSS: cstring) -> SteamAPICall_t ---
	HTMLSurface_RemoveBrowser :: proc(self: ^IHTMLSurface, unBrowserHandle: HHTMLBrowser) ---
	HTMLSurface_LoadURL :: proc(self: ^IHTMLSurface, unBrowserHandle: HHTMLBrowser, pchURL: cstring, pchPostData: cstring) ---
	HTMLSurface_SetSize :: proc(self: ^IHTMLSurface, unBrowserHandle: HHTMLBrowser, unWidth: uint32, unHeight: uint32) ---
	HTMLSurface_StopLoad :: proc(self: ^IHTMLSurface, unBrowserHandle: HHTMLBrowser) ---
	HTMLSurface_Reload :: proc(self: ^IHTMLSurface, unBrowserHandle: HHTMLBrowser) ---
	HTMLSurface_GoBack :: proc(self: ^IHTMLSurface, unBrowserHandle: HHTMLBrowser) ---
	HTMLSurface_GoForward :: proc(self: ^IHTMLSurface, unBrowserHandle: HHTMLBrowser) ---
	HTMLSurface_AddHeader :: proc(self: ^IHTMLSurface, unBrowserHandle: HHTMLBrowser, pchKey: cstring, pchValue: cstring) ---
	HTMLSurface_ExecuteJavascript :: proc(self: ^IHTMLSurface, unBrowserHandle: HHTMLBrowser, pchScript: cstring) ---
	HTMLSurface_MouseUp :: proc(self: ^IHTMLSurface, unBrowserHandle: HHTMLBrowser, eMouseButton: IHTMLSurface_EHTMLMouseButton) ---
	HTMLSurface_MouseDown :: proc(self: ^IHTMLSurface, unBrowserHandle: HHTMLBrowser, eMouseButton: IHTMLSurface_EHTMLMouseButton) ---
	HTMLSurface_MouseDoubleClick :: proc(self: ^IHTMLSurface, unBrowserHandle: HHTMLBrowser, eMouseButton: IHTMLSurface_EHTMLMouseButton) ---
	HTMLSurface_MouseMove :: proc(self: ^IHTMLSurface, unBrowserHandle: HHTMLBrowser, x: c.int, y: c.int) ---
	HTMLSurface_MouseWheel :: proc(self: ^IHTMLSurface, unBrowserHandle: HHTMLBrowser, nDelta: int32) ---
	HTMLSurface_KeyDown :: proc(self: ^IHTMLSurface, unBrowserHandle: HHTMLBrowser, nNativeKeyCode: uint32, eHTMLKeyModifiers: IHTMLSurface_EHTMLKeyModifiers, bIsSystemKey: bool) ---
	HTMLSurface_KeyUp :: proc(self: ^IHTMLSurface, unBrowserHandle: HHTMLBrowser, nNativeKeyCode: uint32, eHTMLKeyModifiers: IHTMLSurface_EHTMLKeyModifiers) ---
	HTMLSurface_KeyChar :: proc(self: ^IHTMLSurface, unBrowserHandle: HHTMLBrowser, cUnicodeChar: uint32, eHTMLKeyModifiers: IHTMLSurface_EHTMLKeyModifiers) ---
	HTMLSurface_SetHorizontalScroll :: proc(self: ^IHTMLSurface, unBrowserHandle: HHTMLBrowser, nAbsolutePixelScroll: uint32) ---
	HTMLSurface_SetVerticalScroll :: proc(self: ^IHTMLSurface, unBrowserHandle: HHTMLBrowser, nAbsolutePixelScroll: uint32) ---
	HTMLSurface_SetKeyFocus :: proc(self: ^IHTMLSurface, unBrowserHandle: HHTMLBrowser, bHasKeyFocus: bool) ---
	HTMLSurface_ViewSource :: proc(self: ^IHTMLSurface, unBrowserHandle: HHTMLBrowser) ---
	HTMLSurface_CopyToClipboard :: proc(self: ^IHTMLSurface, unBrowserHandle: HHTMLBrowser) ---
	HTMLSurface_PasteFromClipboard :: proc(self: ^IHTMLSurface, unBrowserHandle: HHTMLBrowser) ---
	HTMLSurface_Find :: proc(self: ^IHTMLSurface, unBrowserHandle: HHTMLBrowser, pchSearchStr: cstring, bCurrentlyInFind: bool, bReverse: bool) ---
	HTMLSurface_StopFind :: proc(self: ^IHTMLSurface, unBrowserHandle: HHTMLBrowser) ---
	HTMLSurface_GetLinkAtPosition :: proc(self: ^IHTMLSurface, unBrowserHandle: HHTMLBrowser, x: c.int, y: c.int) ---
	HTMLSurface_SetCookie :: proc(self: ^IHTMLSurface, pchHostname: cstring, pchKey: cstring, pchValue: cstring, pchPath: cstring, nExpires: RTime32, bSecure: bool, bHTTPOnly: bool) ---
	HTMLSurface_SetPageScaleFactor :: proc(self: ^IHTMLSurface, unBrowserHandle: HHTMLBrowser, flZoom: f32, nPointX: c.int, nPointY: c.int) ---
	HTMLSurface_SetBackgroundMode :: proc(self: ^IHTMLSurface, unBrowserHandle: HHTMLBrowser, bBackgroundMode: bool) ---
	HTMLSurface_SetDPIScalingFactor :: proc(self: ^IHTMLSurface, unBrowserHandle: HHTMLBrowser, flDPIScaling: f32) ---
	HTMLSurface_OpenDeveloperTools :: proc(self: ^IHTMLSurface, unBrowserHandle: HHTMLBrowser) ---
	HTMLSurface_AllowStartRequest :: proc(self: ^IHTMLSurface, unBrowserHandle: HHTMLBrowser, bAllowed: bool) ---
	HTMLSurface_JSDialogResponse :: proc(self: ^IHTMLSurface, unBrowserHandle: HHTMLBrowser, bResult: bool) ---
	HTMLSurface_FileLoadDialogResponse :: proc(self: ^IHTMLSurface, unBrowserHandle: HHTMLBrowser, pchSelectedFiles: ^cstring) ---

	Inventory_GetResultStatus :: proc(self: ^IInventory, resultHandle: SteamInventoryResult_t) -> EResult ---
	Inventory_GetResultItems :: proc(self: ^IInventory, resultHandle: SteamInventoryResult_t, pOutItemsArray: ^SteamItemDetails_t, punOutItemsArraySize: ^uint32) -> bool ---
	Inventory_GetResultItemProperty :: proc(self: ^IInventory, resultHandle: SteamInventoryResult_t, unItemIndex: uint32, pchPropertyName: cstring, pchValueBuffer: ^u8, punValueBufferSizeOut: ^uint32) -> bool ---
	Inventory_GetResultTimestamp :: proc(self: ^IInventory, resultHandle: SteamInventoryResult_t) -> uint32 ---
	Inventory_CheckResultSteamID :: proc(self: ^IInventory, resultHandle: SteamInventoryResult_t, steamIDExpected: CSteamID) -> bool ---
	Inventory_DestroyResult :: proc(self: ^IInventory, resultHandle: SteamInventoryResult_t) ---
	Inventory_GetAllItems :: proc(self: ^IInventory, pResultHandle: ^SteamInventoryResult_t) -> bool ---
	Inventory_GetItemsByID :: proc(self: ^IInventory, pResultHandle: ^SteamInventoryResult_t, pInstanceIDs: ^SteamItemInstanceID_t, unCountInstanceIDs: uint32) -> bool ---
	Inventory_SerializeResult :: proc(self: ^IInventory, resultHandle: SteamInventoryResult_t, pOutBuffer: rawptr, punOutBufferSize: ^uint32) -> bool ---
	Inventory_DeserializeResult :: proc(self: ^IInventory, pOutResultHandle: ^SteamInventoryResult_t, pBuffer: rawptr, unBufferSize: uint32, bRESERVED_MUST_BE_FALSE: bool) -> bool ---
	Inventory_GenerateItems :: proc(self: ^IInventory, pResultHandle: ^SteamInventoryResult_t, pArrayItemDefs: ^SteamItemDef_t, punArrayQuantity: ^uint32, unArrayLength: uint32) -> bool ---
	Inventory_GrantPromoItems :: proc(self: ^IInventory, pResultHandle: ^SteamInventoryResult_t) -> bool ---
	Inventory_AddPromoItem :: proc(self: ^IInventory, pResultHandle: ^SteamInventoryResult_t, itemDef: SteamItemDef_t) -> bool ---
	Inventory_AddPromoItems :: proc(self: ^IInventory, pResultHandle: ^SteamInventoryResult_t, pArrayItemDefs: ^SteamItemDef_t, unArrayLength: uint32) -> bool ---
	Inventory_ConsumeItem :: proc(self: ^IInventory, pResultHandle: ^SteamInventoryResult_t, itemConsume: SteamItemInstanceID_t, unQuantity: uint32) -> bool ---
	Inventory_ExchangeItems :: proc(self: ^IInventory, pResultHandle: ^SteamInventoryResult_t, pArrayGenerate: ^SteamItemDef_t, punArrayGenerateQuantity: ^uint32, unArrayGenerateLength: uint32, pArrayDestroy: ^SteamItemInstanceID_t, punArrayDestroyQuantity: ^uint32, unArrayDestroyLength: uint32) -> bool ---
	Inventory_TransferItemQuantity :: proc(self: ^IInventory, pResultHandle: ^SteamInventoryResult_t, itemIdSource: SteamItemInstanceID_t, unQuantity: uint32, itemIdDest: SteamItemInstanceID_t) -> bool ---
	Inventory_SendItemDropHeartbeat :: proc(self: ^IInventory) ---
	Inventory_TriggerItemDrop :: proc(self: ^IInventory, pResultHandle: ^SteamInventoryResult_t, dropListDefinition: SteamItemDef_t) -> bool ---
	Inventory_TradeItems :: proc(self: ^IInventory, pResultHandle: ^SteamInventoryResult_t, steamIDTradePartner: CSteamID, pArrayGive: ^SteamItemInstanceID_t, pArrayGiveQuantity: ^uint32, nArrayGiveLength: uint32, pArrayGet: ^SteamItemInstanceID_t, pArrayGetQuantity: ^uint32, nArrayGetLength: uint32) -> bool ---
	Inventory_LoadItemDefinitions :: proc(self: ^IInventory) -> bool ---
	Inventory_GetItemDefinitionIDs :: proc(self: ^IInventory, pItemDefIDs: ^SteamItemDef_t, punItemDefIDsArraySize: ^uint32) -> bool ---
	Inventory_GetItemDefinitionProperty :: proc(self: ^IInventory, iDefinition: SteamItemDef_t, pchPropertyName: cstring, pchValueBuffer: ^u8, punValueBufferSizeOut: ^uint32) -> bool ---
	Inventory_RequestEligiblePromoItemDefinitionsIDs :: proc(self: ^IInventory, steamID: CSteamID) -> SteamAPICall_t ---
	Inventory_GetEligiblePromoItemDefinitionIDs :: proc(self: ^IInventory, steamID: CSteamID, pItemDefIDs: ^SteamItemDef_t, punItemDefIDsArraySize: ^uint32) -> bool ---
	Inventory_StartPurchase :: proc(self: ^IInventory, pArrayItemDefs: ^SteamItemDef_t, punArrayQuantity: ^uint32, unArrayLength: uint32) -> SteamAPICall_t ---
	Inventory_RequestPrices :: proc(self: ^IInventory) -> SteamAPICall_t ---
	Inventory_GetNumItemsWithPrices :: proc(self: ^IInventory) -> uint32 ---
	Inventory_GetItemsWithPrices :: proc(self: ^IInventory, pArrayItemDefs: ^SteamItemDef_t, pCurrentPrices: ^uint64, pBasePrices: ^uint64, unArrayLength: uint32) -> bool ---
	Inventory_GetItemPrice :: proc(self: ^IInventory, iDefinition: SteamItemDef_t, pCurrentPrice: ^uint64, pBasePrice: ^uint64) -> bool ---
	Inventory_StartUpdateProperties :: proc(self: ^IInventory) -> SteamInventoryUpdateHandle_t ---
	Inventory_RemoveProperty :: proc(self: ^IInventory, handle: SteamInventoryUpdateHandle_t, nItemID: SteamItemInstanceID_t, pchPropertyName: cstring) -> bool ---
	Inventory_SetProperty :: proc(self: ^IInventory, handle: SteamInventoryUpdateHandle_t, nItemID: SteamItemInstanceID_t, pchPropertyName: cstring, pchPropertyValue: cstring) -> bool ---
	Inventory_SetPropertyBool :: proc(self: ^IInventory, handle: SteamInventoryUpdateHandle_t, nItemID: SteamItemInstanceID_t, pchPropertyName: cstring, bValue: bool) -> bool ---
	Inventory_SetPropertyInt64 :: proc(self: ^IInventory, handle: SteamInventoryUpdateHandle_t, nItemID: SteamItemInstanceID_t, pchPropertyName: cstring, nValue: int64) -> bool ---
	Inventory_SetPropertyFloat :: proc(self: ^IInventory, handle: SteamInventoryUpdateHandle_t, nItemID: SteamItemInstanceID_t, pchPropertyName: cstring, flValue: f32) -> bool ---
	Inventory_SubmitUpdateProperties :: proc(self: ^IInventory, handle: SteamInventoryUpdateHandle_t, pResultHandle: ^SteamInventoryResult_t) -> bool ---
	Inventory_InspectItem :: proc(self: ^IInventory, pResultHandle: ^SteamInventoryResult_t, pchItemToken: cstring) -> bool ---

	Video_GetVideoURL :: proc(self: ^IVideo, unVideoAppID: AppId_t) ---
	Video_IsBroadcasting :: proc(self: ^IVideo, pnNumViewers: ^int) -> bool ---
	Video_GetOPFSettings :: proc(self: ^IVideo, unVideoAppID: AppId_t) ---
	Video_GetOPFStringForApp :: proc(self: ^IVideo, unVideoAppID: AppId_t, pchBuffer: ^u8, pnBufferSize: ^int32) -> bool ---

	ParentalSettings_BIsParentalLockEnabled :: proc(self: ^IParentalSettings) -> bool ---
	ParentalSettings_BIsParentalLockLocked :: proc(self: ^IParentalSettings) -> bool ---
	ParentalSettings_BIsAppBlocked :: proc(self: ^IParentalSettings, nAppID: AppId_t) -> bool ---
	ParentalSettings_BIsAppInBlockList :: proc(self: ^IParentalSettings, nAppID: AppId_t) -> bool ---
	ParentalSettings_BIsFeatureBlocked :: proc(self: ^IParentalSettings, eFeature: EParentalFeature) -> bool ---
	ParentalSettings_BIsFeatureInBlockList :: proc(self: ^IParentalSettings, eFeature: EParentalFeature) -> bool ---

	RemotePlay_GetSessionCount :: proc(self: ^IRemotePlay) -> uint32 ---
	RemotePlay_GetSessionID :: proc(self: ^IRemotePlay, iSessionIndex: c.int) -> RemotePlaySessionID_t ---
	RemotePlay_GetSessionSteamID :: proc(self: ^IRemotePlay, unSessionID: RemotePlaySessionID_t) -> CSteamID ---
	RemotePlay_GetSessionClientName :: proc(self: ^IRemotePlay, unSessionID: RemotePlaySessionID_t) -> cstring ---
	RemotePlay_GetSessionClientFormFactor :: proc(self: ^IRemotePlay, unSessionID: RemotePlaySessionID_t) -> ESteamDeviceFormFactor ---
	RemotePlay_BGetSessionClientResolution :: proc(self: ^IRemotePlay, unSessionID: RemotePlaySessionID_t, pnResolutionX: ^int, pnResolutionY: ^int) -> bool ---
	RemotePlay_BSendRemotePlayTogetherInvite :: proc(self: ^IRemotePlay, steamIDFriend: CSteamID) -> bool ---

	NetworkingMessages_SendMessageToUser :: proc(self: ^INetworkingMessages, identityRemote: ^SteamNetworkingIdentity, pubData: rawptr, cubData: uint32, nSendFlags: c.int, nRemoteChannel: c.int) -> EResult ---
	NetworkingMessages_ReceiveMessagesOnChannel :: proc(self: ^INetworkingMessages, nLocalChannel: c.int, ppOutMessages: ^^SteamNetworkingMessage_t, nMaxMessages: c.int) -> c.int ---
	NetworkingMessages_AcceptSessionWithUser :: proc(self: ^INetworkingMessages, identityRemote: ^SteamNetworkingIdentity) -> bool ---
	NetworkingMessages_CloseSessionWithUser :: proc(self: ^INetworkingMessages, identityRemote: ^SteamNetworkingIdentity) -> bool ---
	NetworkingMessages_CloseChannelWithUser :: proc(self: ^INetworkingMessages, identityRemote: ^SteamNetworkingIdentity, nLocalChannel: c.int) -> bool ---
	NetworkingMessages_GetSessionConnectionInfo :: proc(self: ^INetworkingMessages, identityRemote: ^SteamNetworkingIdentity, pConnectionInfo: ^SteamNetConnectionInfo_t, pQuickStatus: ^SteamNetConnectionRealTimeStatus_t) -> ESteamNetworkingConnectionState ---

	NetworkingSockets_CreateListenSocketIP :: proc(self: ^INetworkingSockets, localAddress: ^SteamNetworkingIPAddr, nOptions: c.int, pOptions: ^SteamNetworkingConfigValue_t) -> HSteamListenSocket ---
	NetworkingSockets_ConnectByIPAddress :: proc(self: ^INetworkingSockets, address: ^SteamNetworkingIPAddr, nOptions: c.int, pOptions: ^SteamNetworkingConfigValue_t) -> HSteamNetConnection ---
	NetworkingSockets_CreateListenSocketP2P :: proc(self: ^INetworkingSockets, nLocalVirtualPort: c.int, nOptions: c.int, pOptions: ^SteamNetworkingConfigValue_t) -> HSteamListenSocket ---
	NetworkingSockets_ConnectP2P :: proc(self: ^INetworkingSockets, identityRemote: ^SteamNetworkingIdentity, nRemoteVirtualPort: c.int, nOptions: c.int, pOptions: ^SteamNetworkingConfigValue_t) -> HSteamNetConnection ---
	NetworkingSockets_AcceptConnection :: proc(self: ^INetworkingSockets, hConn: HSteamNetConnection) -> EResult ---
	NetworkingSockets_CloseConnection :: proc(self: ^INetworkingSockets, hPeer: HSteamNetConnection, nReason: c.int, pszDebug: cstring, bEnableLinger: bool) -> bool ---
	NetworkingSockets_CloseListenSocket :: proc(self: ^INetworkingSockets, hSocket: HSteamListenSocket) -> bool ---
	NetworkingSockets_SetConnectionUserData :: proc(self: ^INetworkingSockets, hPeer: HSteamNetConnection, nUserData: int64) -> bool ---
	NetworkingSockets_GetConnectionUserData :: proc(self: ^INetworkingSockets, hPeer: HSteamNetConnection) -> int64 ---
	NetworkingSockets_SetConnectionName :: proc(self: ^INetworkingSockets, hPeer: HSteamNetConnection, pszName: cstring) ---
	NetworkingSockets_GetConnectionName :: proc(self: ^INetworkingSockets, hPeer: HSteamNetConnection, pszName: ^u8, nMaxLen: c.int) -> bool ---
	NetworkingSockets_SendMessageToConnection :: proc(self: ^INetworkingSockets, hConn: HSteamNetConnection, pData: rawptr, cbData: uint32, nSendFlags: c.int, pOutMessageNumber: ^int64) -> EResult ---
	NetworkingSockets_FlushMessagesOnConnection :: proc(self: ^INetworkingSockets, hConn: HSteamNetConnection) -> EResult ---
	NetworkingSockets_ReceiveMessagesOnConnection :: proc(self: ^INetworkingSockets, hConn: HSteamNetConnection, ppOutMessages: ^^SteamNetworkingMessage_t, nMaxMessages: c.int) -> c.int ---
	NetworkingSockets_GetConnectionInfo :: proc(self: ^INetworkingSockets, hConn: HSteamNetConnection, pInfo: ^SteamNetConnectionInfo_t) -> bool ---
	NetworkingSockets_GetConnectionRealTimeStatus :: proc(self: ^INetworkingSockets, hConn: HSteamNetConnection, pStatus: ^SteamNetConnectionRealTimeStatus_t, nLanes: c.int, pLanes: ^SteamNetConnectionRealTimeLaneStatus_t) -> EResult ---
	NetworkingSockets_GetDetailedConnectionStatus :: proc(self: ^INetworkingSockets, hConn: HSteamNetConnection, pszBuf: ^u8, cbBuf: c.int) -> c.int ---
	NetworkingSockets_GetListenSocketAddress :: proc(self: ^INetworkingSockets, hSocket: HSteamListenSocket, address: ^SteamNetworkingIPAddr) -> bool ---
	NetworkingSockets_CreateSocketPair :: proc(self: ^INetworkingSockets, pOutConnection1: ^HSteamNetConnection, pOutConnection2: ^HSteamNetConnection, bUseNetworkLoopback: bool, pIdentity1: ^SteamNetworkingIdentity, pIdentity2: ^SteamNetworkingIdentity) -> bool ---
	NetworkingSockets_ConfigureConnectionLanes :: proc(self: ^INetworkingSockets, hConn: HSteamNetConnection, nNumLanes: c.int, pLanePriorities: ^int, pLaneWeights: ^uint16) -> EResult ---
	NetworkingSockets_GetIdentity :: proc(self: ^INetworkingSockets, pIdentity: ^SteamNetworkingIdentity) -> bool ---
	NetworkingSockets_InitAuthentication :: proc(self: ^INetworkingSockets) -> ESteamNetworkingAvailability ---
	NetworkingSockets_GetAuthenticationStatus :: proc(self: ^INetworkingSockets, pDetails: ^SteamNetAuthenticationStatus_t) -> ESteamNetworkingAvailability ---
	NetworkingSockets_CreatePollGroup :: proc(self: ^INetworkingSockets) -> HSteamNetPollGroup ---
	NetworkingSockets_DestroyPollGroup :: proc(self: ^INetworkingSockets, hPollGroup: HSteamNetPollGroup) -> bool ---
	NetworkingSockets_SetConnectionPollGroup :: proc(self: ^INetworkingSockets, hConn: HSteamNetConnection, hPollGroup: HSteamNetPollGroup) -> bool ---
	NetworkingSockets_ReceiveMessagesOnPollGroup :: proc(self: ^INetworkingSockets, hPollGroup: HSteamNetPollGroup, ppOutMessages: ^^SteamNetworkingMessage_t, nMaxMessages: c.int) -> c.int ---
	NetworkingSockets_ReceivedRelayAuthTicket :: proc(self: ^INetworkingSockets, pvTicket: rawptr, cbTicket: c.int, pOutParsedTicket: SteamDatagramRelayAuthTicketPtr) -> bool ---
	NetworkingSockets_FindRelayAuthTicketForServer :: proc(self: ^INetworkingSockets, identityGameServer: ^SteamNetworkingIdentity, nRemoteVirtualPort: c.int, pOutParsedTicket: SteamDatagramRelayAuthTicketPtr) -> c.int ---
	NetworkingSockets_ConnectToHostedDedicatedServer :: proc(self: ^INetworkingSockets, identityTarget: ^SteamNetworkingIdentity, nRemoteVirtualPort: c.int, nOptions: c.int, pOptions: ^SteamNetworkingConfigValue_t) -> HSteamNetConnection ---
	NetworkingSockets_GetHostedDedicatedServerPort :: proc(self: ^INetworkingSockets) -> uint16 ---
	NetworkingSockets_GetHostedDedicatedServerPOPID :: proc(self: ^INetworkingSockets) -> SteamNetworkingPOPID ---
	NetworkingSockets_GetHostedDedicatedServerAddress :: proc(self: ^INetworkingSockets, pRouting: ^SteamDatagramHostedAddress) -> EResult ---
	NetworkingSockets_CreateHostedDedicatedServerListenSocket :: proc(self: ^INetworkingSockets, nLocalVirtualPort: c.int, nOptions: c.int, pOptions: ^SteamNetworkingConfigValue_t) -> HSteamListenSocket ---
	NetworkingSockets_GetGameCoordinatorServerLogin :: proc(self: ^INetworkingSockets, pLoginInfo: ^SteamDatagramGameCoordinatorServerLogin, pcbSignedBlob: ^int, pBlob: rawptr) -> EResult ---
	NetworkingSockets_ConnectP2PCustomSignaling :: proc(self: ^INetworkingSockets, pSignaling: SteamDatagramRelayAuthTicketPtr, pPeerIdentity: ^SteamNetworkingIdentity, nRemoteVirtualPort: c.int, nOptions: c.int, pOptions: ^SteamNetworkingConfigValue_t) -> HSteamNetConnection ---
	NetworkingSockets_ReceivedP2PCustomSignal :: proc(self: ^INetworkingSockets, pMsg: rawptr, cbMsg: c.int, pContext: INetworkingSignalingRecvContextPtr) -> bool ---
	NetworkingSockets_GetCertificateRequest :: proc(self: ^INetworkingSockets, pcbBlob: ^int, pBlob: rawptr, errMsg: ^SteamNetworkingErrMsg) -> bool ---
	NetworkingSockets_SetCertificate :: proc(self: ^INetworkingSockets, pCertificate: rawptr, cbCertificate: c.int, errMsg: ^SteamNetworkingErrMsg) -> bool ---
	NetworkingSockets_ResetIdentity :: proc(self: ^INetworkingSockets, pIdentity: ^SteamNetworkingIdentity) ---
	NetworkingSockets_RunCallbacks :: proc(self: ^INetworkingSockets) ---
	NetworkingSockets_BeginAsyncRequestFakeIP :: proc(self: ^INetworkingSockets, nNumPorts: c.int) -> bool ---
	NetworkingSockets_GetFakeIP :: proc(self: ^INetworkingSockets, idxFirstPort: c.int, pInfo: ^SteamNetworkingFakeIPResult_t) ---
	NetworkingSockets_CreateListenSocketP2PFakeIP :: proc(self: ^INetworkingSockets, idxFakePort: c.int, nOptions: c.int, pOptions: ^SteamNetworkingConfigValue_t) -> HSteamListenSocket ---
	NetworkingSockets_GetRemoteFakeIPForConnection :: proc(self: ^INetworkingSockets, hConn: HSteamNetConnection, pOutAddr: ^SteamNetworkingIPAddr) -> EResult ---
	NetworkingSockets_CreateFakeUDPPort :: proc(self: ^INetworkingSockets, idxFakeServerPort: c.int) -> ^INetworkingFakeUDPPort ---

	NetworkingUtils_AllocateMessage :: proc(self: ^INetworkingUtils, cbAllocateBuffer: c.int) -> ^SteamNetworkingMessage_t ---
	NetworkingUtils_InitRelayNetworkAccess :: proc(self: ^INetworkingUtils) ---
	NetworkingUtils_GetRelayNetworkStatus :: proc(self: ^INetworkingUtils, pDetails: ^SteamRelayNetworkStatus_t) -> ESteamNetworkingAvailability ---
	NetworkingUtils_GetLocalPingLocation :: proc(self: ^INetworkingUtils, result: ^SteamNetworkPingLocation_t) -> f32 ---
	NetworkingUtils_EstimatePingTimeBetweenTwoLocations :: proc(self: ^INetworkingUtils, location1: ^SteamNetworkPingLocation_t, location2: ^SteamNetworkPingLocation_t) -> c.int ---
	NetworkingUtils_EstimatePingTimeFromLocalHost :: proc(self: ^INetworkingUtils, remoteLocation: ^SteamNetworkPingLocation_t) -> c.int ---
	NetworkingUtils_ConvertPingLocationToString :: proc(self: ^INetworkingUtils, location: ^SteamNetworkPingLocation_t, pszBuf: ^u8, cchBufSize: c.int) ---
	NetworkingUtils_ParsePingLocationString :: proc(self: ^INetworkingUtils, pszString: cstring, result: ^SteamNetworkPingLocation_t) -> bool ---
	NetworkingUtils_CheckPingDataUpToDate :: proc(self: ^INetworkingUtils, flMaxAgeSeconds: f32) -> bool ---
	NetworkingUtils_GetPingToDataCenter :: proc(self: ^INetworkingUtils, popID: SteamNetworkingPOPID, pViaRelayPoP: ^SteamNetworkingPOPID) -> c.int ---
	NetworkingUtils_GetDirectPingToPOP :: proc(self: ^INetworkingUtils, popID: SteamNetworkingPOPID) -> c.int ---
	NetworkingUtils_GetPOPCount :: proc(self: ^INetworkingUtils) -> c.int ---
	NetworkingUtils_GetPOPList :: proc(self: ^INetworkingUtils, list: ^SteamNetworkingPOPID, nListSz: c.int) -> c.int ---
	NetworkingUtils_GetLocalTimestamp :: proc(self: ^INetworkingUtils) -> SteamNetworkingMicroseconds ---
	NetworkingUtils_SetDebugOutputFunction :: proc(self: ^INetworkingUtils, eDetailLevel: ESteamNetworkingSocketsDebugOutputType, pfnFunc: FSteamNetworkingSocketsDebugOutput) ---
	NetworkingUtils_IsFakeIPv4 :: proc(self: ^INetworkingUtils, nIPv4: uint32) -> bool ---
	NetworkingUtils_GetIPv4FakeIPType :: proc(self: ^INetworkingUtils, nIPv4: uint32) -> ESteamNetworkingFakeIPType ---
	NetworkingUtils_GetRealIdentityForFakeIP :: proc(self: ^INetworkingUtils, fakeIP: ^SteamNetworkingIPAddr, pOutRealIdentity: ^SteamNetworkingIdentity) -> EResult ---
	NetworkingUtils_SetGlobalConfigValueInt32 :: proc(self: ^INetworkingUtils, eValue: ESteamNetworkingConfigValue, val: int32) -> bool ---
	NetworkingUtils_SetGlobalConfigValueFloat :: proc(self: ^INetworkingUtils, eValue: ESteamNetworkingConfigValue, val: f32) -> bool ---
	NetworkingUtils_SetGlobalConfigValueString :: proc(self: ^INetworkingUtils, eValue: ESteamNetworkingConfigValue, val: cstring) -> bool ---
	NetworkingUtils_SetGlobalConfigValuePtr :: proc(self: ^INetworkingUtils, eValue: ESteamNetworkingConfigValue, val: rawptr) -> bool ---
	NetworkingUtils_SetConnectionConfigValueInt32 :: proc(self: ^INetworkingUtils, hConn: HSteamNetConnection, eValue: ESteamNetworkingConfigValue, val: int32) -> bool ---
	NetworkingUtils_SetConnectionConfigValueFloat :: proc(self: ^INetworkingUtils, hConn: HSteamNetConnection, eValue: ESteamNetworkingConfigValue, val: f32) -> bool ---
	NetworkingUtils_SetConnectionConfigValueString :: proc(self: ^INetworkingUtils, hConn: HSteamNetConnection, eValue: ESteamNetworkingConfigValue, val: cstring) -> bool ---
	NetworkingUtils_SetGlobalCallback_SteamNetConnectionStatusChanged :: proc(self: ^INetworkingUtils, fnCallback: FnSteamNetConnectionStatusChanged) -> bool ---
	NetworkingUtils_SetGlobalCallback_SteamNetAuthenticationStatusChanged :: proc(self: ^INetworkingUtils, fnCallback: FnSteamNetAuthenticationStatusChanged) -> bool ---
	NetworkingUtils_SetGlobalCallback_SteamRelayNetworkStatusChanged :: proc(self: ^INetworkingUtils, fnCallback: FnSteamRelayNetworkStatusChanged) -> bool ---
	NetworkingUtils_SetGlobalCallback_FakeIPResult :: proc(self: ^INetworkingUtils, fnCallback: FnSteamNetworkingFakeIPResult) -> bool ---
	NetworkingUtils_SetGlobalCallback_MessagesSessionRequest :: proc(self: ^INetworkingUtils, fnCallback: FnSteamNetworkingMessagesSessionRequest) -> bool ---
	NetworkingUtils_SetGlobalCallback_MessagesSessionFailed :: proc(self: ^INetworkingUtils, fnCallback: FnSteamNetworkingMessagesSessionFailed) -> bool ---
	NetworkingUtils_SetConfigValue :: proc(self: ^INetworkingUtils, eValue: ESteamNetworkingConfigValue, eScopeType: ESteamNetworkingConfigScope, scopeObj: intptr, eDataType: ESteamNetworkingConfigDataType, pArg: rawptr) -> bool ---
	NetworkingUtils_SetConfigValueStruct :: proc(self: ^INetworkingUtils, opt: ^SteamNetworkingConfigValue_t, eScopeType: ESteamNetworkingConfigScope, scopeObj: intptr) -> bool ---
	NetworkingUtils_GetConfigValue :: proc(self: ^INetworkingUtils, eValue: ESteamNetworkingConfigValue, eScopeType: ESteamNetworkingConfigScope, scopeObj: intptr, pOutDataType: ^ESteamNetworkingConfigDataType, pResult: rawptr, cbResult: ^int) -> ESteamNetworkingGetConfigValueResult ---
	NetworkingUtils_GetConfigValueInfo :: proc(self: ^INetworkingUtils, eValue: ESteamNetworkingConfigValue, pOutDataType: ^ESteamNetworkingConfigDataType, pOutScope: ^ESteamNetworkingConfigScope) -> cstring ---
	NetworkingUtils_IterateGenericEditableConfigValues :: proc(self: ^INetworkingUtils, eCurrent: ESteamNetworkingConfigValue, bEnumerateDevVars: bool) -> ESteamNetworkingConfigValue ---
	NetworkingUtils_SteamNetworkingIPAddr_ToString :: proc(self: ^INetworkingUtils, addr: ^SteamNetworkingIPAddr, buf: ^u8, cbBuf: uint32, bWithPort: bool) ---
	NetworkingUtils_SteamNetworkingIPAddr_ParseString :: proc(self: ^INetworkingUtils, pAddr: ^SteamNetworkingIPAddr, pszStr: cstring) -> bool ---
	NetworkingUtils_SteamNetworkingIPAddr_GetFakeIPType :: proc(self: ^INetworkingUtils, addr: ^SteamNetworkingIPAddr) -> ESteamNetworkingFakeIPType ---
	NetworkingUtils_SteamNetworkingIdentity_ToString :: proc(self: ^INetworkingUtils, identity: ^SteamNetworkingIdentity, buf: ^u8, cbBuf: uint32) ---
	NetworkingUtils_SteamNetworkingIdentity_ParseString :: proc(self: ^INetworkingUtils, pIdentity: ^SteamNetworkingIdentity, pszStr: cstring) -> bool ---

	GameServer_SetProduct :: proc(self: ^IGameServer, pszProduct: cstring) ---
	GameServer_SetGameDescription :: proc(self: ^IGameServer, pszGameDescription: cstring) ---
	GameServer_SetModDir :: proc(self: ^IGameServer, pszModDir: cstring) ---
	GameServer_SetDedicatedServer :: proc(self: ^IGameServer, bDedicated: bool) ---
	GameServer_LogOn :: proc(self: ^IGameServer, pszToken: cstring) ---
	GameServer_LogOnAnonymous :: proc(self: ^IGameServer) ---
	GameServer_LogOff :: proc(self: ^IGameServer) ---
	GameServer_BLoggedOn :: proc(self: ^IGameServer) -> bool ---
	GameServer_BSecure :: proc(self: ^IGameServer) -> bool ---
	GameServer_GetSteamID :: proc(self: ^IGameServer) -> CSteamID ---
	GameServer_WasRestartRequested :: proc(self: ^IGameServer) -> bool ---
	GameServer_SetMaxPlayerCount :: proc(self: ^IGameServer, cPlayersMax: c.int) ---
	GameServer_SetBotPlayerCount :: proc(self: ^IGameServer, cBotplayers: c.int) ---
	GameServer_SetServerName :: proc(self: ^IGameServer, pszServerName: cstring) ---
	GameServer_SetMapName :: proc(self: ^IGameServer, pszMapName: cstring) ---
	GameServer_SetPasswordProtected :: proc(self: ^IGameServer, bPasswordProtected: bool) ---
	GameServer_SetSpectatorPort :: proc(self: ^IGameServer, unSpectatorPort: uint16) ---
	GameServer_SetSpectatorServerName :: proc(self: ^IGameServer, pszSpectatorServerName: cstring) ---
	GameServer_ClearAllKeyValues :: proc(self: ^IGameServer) ---
	GameServer_SetKeyValue :: proc(self: ^IGameServer, pKey: cstring, pValue: cstring) ---
	GameServer_SetGameTags :: proc(self: ^IGameServer, pchGameTags: cstring) ---
	GameServer_SetGameData :: proc(self: ^IGameServer, pchGameData: cstring) ---
	GameServer_SetRegion :: proc(self: ^IGameServer, pszRegion: cstring) ---
	GameServer_SetAdvertiseServerActive :: proc(self: ^IGameServer, bActive: bool) ---
	GameServer_GetAuthSessionTicket :: proc(self: ^IGameServer, pTicket: rawptr, cbMaxTicket: c.int, pcbTicket: ^uint32) -> HAuthTicket ---
	GameServer_BeginAuthSession :: proc(self: ^IGameServer, pAuthTicket: rawptr, cbAuthTicket: c.int, steamID: CSteamID) -> EBeginAuthSessionResult ---
	GameServer_EndAuthSession :: proc(self: ^IGameServer, steamID: CSteamID) ---
	GameServer_CancelAuthTicket :: proc(self: ^IGameServer, hAuthTicket: HAuthTicket) ---
	GameServer_UserHasLicenseForApp :: proc(self: ^IGameServer, steamID: CSteamID, appID: AppId_t) -> EUserHasLicenseForAppResult ---
	GameServer_RequestUserGroupStatus :: proc(self: ^IGameServer, steamIDUser: CSteamID, steamIDGroup: CSteamID) -> bool ---
	GameServer_GetGameplayStats :: proc(self: ^IGameServer) ---
	GameServer_GetServerReputation :: proc(self: ^IGameServer) -> SteamAPICall_t ---
	GameServer_GetPublicIP :: proc(self: ^IGameServer) -> SteamIPAddress_t ---
	GameServer_HandleIncomingPacket :: proc(self: ^IGameServer, pData: rawptr, cbData: c.int, srcIP: uint32, srcPort: uint16) -> bool ---
	GameServer_GetNextOutgoingPacket :: proc(self: ^IGameServer, pOut: rawptr, cbMaxOut: c.int, pNetAdr: ^uint32, pPort: ^uint16) -> c.int ---
	GameServer_AssociateWithClan :: proc(self: ^IGameServer, steamIDClan: CSteamID) -> SteamAPICall_t ---
	GameServer_ComputeNewPlayerCompatibility :: proc(self: ^IGameServer, steamIDNewPlayer: CSteamID) -> SteamAPICall_t ---
	GameServer_SendUserConnectAndAuthenticate_DEPRECATED :: proc(self: ^IGameServer, unIPClient: uint32, pvAuthBlob: rawptr, cubAuthBlobSize: uint32, pSteamIDUser: ^CSteamID) -> bool ---
	GameServer_CreateUnauthenticatedUserConnection :: proc(self: ^IGameServer) -> CSteamID ---
	GameServer_SendUserDisconnect_DEPRECATED :: proc(self: ^IGameServer, steamIDUser: CSteamID) ---
	GameServer_BUpdateUserData :: proc(self: ^IGameServer, steamIDUser: CSteamID, pchPlayerName: cstring, uScore: uint32) -> bool ---

	GameServerStats_RequestUserStats :: proc(self: ^IGameServerStats, steamIDUser: CSteamID) -> SteamAPICall_t ---
	GameServerStats_GetUserStatInt32 :: proc(self: ^IGameServerStats, steamIDUser: CSteamID, pchName: cstring, pData: ^int32) -> bool ---
	GameServerStats_GetUserStatFloat :: proc(self: ^IGameServerStats, steamIDUser: CSteamID, pchName: cstring, pData: ^f32) -> bool ---
	GameServerStats_GetUserAchievement :: proc(self: ^IGameServerStats, steamIDUser: CSteamID, pchName: cstring, pbAchieved: ^bool) -> bool ---
	GameServerStats_SetUserStatInt32 :: proc(self: ^IGameServerStats, steamIDUser: CSteamID, pchName: cstring, nData: int32) -> bool ---
	GameServerStats_SetUserStatFloat :: proc(self: ^IGameServerStats, steamIDUser: CSteamID, pchName: cstring, fData: f32) -> bool ---
	GameServerStats_UpdateUserAvgRateStat :: proc(self: ^IGameServerStats, steamIDUser: CSteamID, pchName: cstring, flCountThisSession: f32, dSessionLength: f64) -> bool ---
	GameServerStats_SetUserAchievement :: proc(self: ^IGameServerStats, steamIDUser: CSteamID, pchName: cstring) -> bool ---
	GameServerStats_ClearUserAchievement :: proc(self: ^IGameServerStats, steamIDUser: CSteamID, pchName: cstring) -> bool ---
	GameServerStats_StoreUserStats :: proc(self: ^IGameServerStats, steamIDUser: CSteamID) -> SteamAPICall_t ---

	NetworkingFakeUDPPort_DestroyFakeUDPPort :: proc(self: ^INetworkingFakeUDPPort) ---
	NetworkingFakeUDPPort_SendMessageToFakeIP :: proc(self: ^INetworkingFakeUDPPort, remoteAddress: ^SteamNetworkingIPAddr, pData: rawptr, cbData: uint32, nSendFlags: c.int) -> EResult ---
	NetworkingFakeUDPPort_ReceiveMessages :: proc(self: ^INetworkingFakeUDPPort, ppOutMessages: ^^SteamNetworkingMessage_t, nMaxMessages: c.int) -> c.int ---
	NetworkingFakeUDPPort_ScheduleCleanup :: proc(self: ^INetworkingFakeUDPPort, remoteAddress: ^SteamNetworkingIPAddr) ---

	SteamIPAddress_t_IsSet :: proc(self: ^SteamIPAddress_t) -> bool ---
	MatchMakingKeyValuePair_t_Construct :: proc(self: ^MatchMakingKeyValuePair_t) ---
	servernetadr_t_Construct :: proc(self: ^servernetadr_t) ---
	servernetadr_t_Init :: proc(self: ^servernetadr_t, ip: c.uint, usQueryPort: uint16, usConnectionPort: uint16) ---
	servernetadr_t_GetQueryPort :: proc(self: ^servernetadr_t) -> uint16 ---
	servernetadr_t_SetQueryPort :: proc(self: ^servernetadr_t, usPort: uint16) ---
	servernetadr_t_GetConnectionPort :: proc(self: ^servernetadr_t) -> uint16 ---
	servernetadr_t_SetConnectionPort :: proc(self: ^servernetadr_t, usPort: uint16) ---
	servernetadr_t_GetIP :: proc(self: ^servernetadr_t) -> uint32 ---
	servernetadr_t_SetIP :: proc(self: ^servernetadr_t, unIP: uint32) ---
	servernetadr_t_GetConnectionAddressString :: proc(self: ^servernetadr_t) -> cstring ---
	servernetadr_t_GetQueryAddressString :: proc(self: ^servernetadr_t) -> cstring ---
	gameserveritem_t_Construct :: proc(self: ^gameserveritem_t) ---
	gameserveritem_t_GetName :: proc(self: ^gameserveritem_t) -> cstring ---
	gameserveritem_t_SetName :: proc(self: ^gameserveritem_t, pName: cstring) ---
	SteamNetworkingIPAddr_Clear :: proc(self: ^SteamNetworkingIPAddr) ---
	SteamNetworkingIPAddr_IsIPv6AllZeros :: proc(self: ^SteamNetworkingIPAddr) -> bool ---
	SteamNetworkingIPAddr_SetIPv6 :: proc(self: ^SteamNetworkingIPAddr, ipv6: ^uint8, nPort: uint16) ---
	SteamNetworkingIPAddr_SetIPv4 :: proc(self: ^SteamNetworkingIPAddr, nIP: uint32, nPort: uint16) ---
	SteamNetworkingIPAddr_IsIPv4 :: proc(self: ^SteamNetworkingIPAddr) -> bool ---
	SteamNetworkingIPAddr_GetIPv4 :: proc(self: ^SteamNetworkingIPAddr) -> uint32 ---
	SteamNetworkingIPAddr_SetIPv6LocalHost :: proc(self: ^SteamNetworkingIPAddr, nPort: uint16) ---
	SteamNetworkingIPAddr_IsLocalHost :: proc(self: ^SteamNetworkingIPAddr) -> bool ---
	SteamNetworkingIPAddr_ToString :: proc(self: ^SteamNetworkingIPAddr, buf: ^u8, cbBuf: uint32, bWithPort: bool) ---
	SteamNetworkingIPAddr_ParseString :: proc(self: ^SteamNetworkingIPAddr, pszStr: cstring) -> bool ---
	SteamNetworkingIPAddr_GetFakeIPType :: proc(self: ^SteamNetworkingIPAddr) -> ESteamNetworkingFakeIPType ---
	SteamNetworkingIPAddr_IsFakeIP :: proc(self: ^SteamNetworkingIPAddr) -> bool ---
	SteamNetworkingIdentity_Clear :: proc(self: ^SteamNetworkingIdentity) ---
	SteamNetworkingIdentity_IsInvalid :: proc(self: ^SteamNetworkingIdentity) -> bool ---
	SteamNetworkingIdentity_SetSteamID :: proc(self: ^SteamNetworkingIdentity, steamID: CSteamID) ---
	SteamNetworkingIdentity_GetSteamID :: proc(self: ^SteamNetworkingIdentity) -> CSteamID ---
	SteamNetworkingIdentity_SetSteamID64 :: proc(self: ^SteamNetworkingIdentity, steamID: uint64) ---
	SteamNetworkingIdentity_GetSteamID64 :: proc(self: ^SteamNetworkingIdentity) -> uint64 ---
	SteamNetworkingIdentity_SetXboxPairwiseID :: proc(self: ^SteamNetworkingIdentity, pszString: cstring) -> bool ---
	SteamNetworkingIdentity_GetXboxPairwiseID :: proc(self: ^SteamNetworkingIdentity) -> cstring ---
	SteamNetworkingIdentity_SetPSNID :: proc(self: ^SteamNetworkingIdentity, id: uint64) ---
	SteamNetworkingIdentity_GetPSNID :: proc(self: ^SteamNetworkingIdentity) -> uint64 ---
	SteamNetworkingIdentity_SetStadiaID :: proc(self: ^SteamNetworkingIdentity, id: uint64) ---
	SteamNetworkingIdentity_GetStadiaID :: proc(self: ^SteamNetworkingIdentity) -> uint64 ---
	SteamNetworkingIdentity_SetIPAddr :: proc(self: ^SteamNetworkingIdentity, addr: ^SteamNetworkingIPAddr) ---
	SteamNetworkingIdentity_GetIPAddr :: proc(self: ^SteamNetworkingIdentity) -> ^SteamNetworkingIPAddr ---
	SteamNetworkingIdentity_SetIPv4Addr :: proc(self: ^SteamNetworkingIdentity, nIPv4: uint32, nPort: uint16) ---
	SteamNetworkingIdentity_GetIPv4 :: proc(self: ^SteamNetworkingIdentity) -> uint32 ---
	SteamNetworkingIdentity_GetFakeIPType :: proc(self: ^SteamNetworkingIdentity) -> ESteamNetworkingFakeIPType ---
	SteamNetworkingIdentity_IsFakeIP :: proc(self: ^SteamNetworkingIdentity) -> bool ---
	SteamNetworkingIdentity_SetLocalHost :: proc(self: ^SteamNetworkingIdentity) ---
	SteamNetworkingIdentity_IsLocalHost :: proc(self: ^SteamNetworkingIdentity) -> bool ---
	SteamNetworkingIdentity_SetGenericString :: proc(self: ^SteamNetworkingIdentity, pszString: cstring) -> bool ---
	SteamNetworkingIdentity_GetGenericString :: proc(self: ^SteamNetworkingIdentity) -> cstring ---
	SteamNetworkingIdentity_SetGenericBytes :: proc(self: ^SteamNetworkingIdentity, data: rawptr, cbLen: uint32) -> bool ---
	SteamNetworkingIdentity_GetGenericBytes :: proc(self: ^SteamNetworkingIdentity, cbLen: ^int) -> ^uint8 ---
	SteamNetworkingIdentity_ToString :: proc(self: ^SteamNetworkingIdentity, buf: ^u8, cbBuf: uint32) ---
	SteamNetworkingIdentity_ParseString :: proc(self: ^SteamNetworkingIdentity, pszStr: cstring) -> bool ---
	SteamNetworkingMessage_t_Release :: proc(self: ^SteamNetworkingMessage_t) ---
	SteamNetworkingConfigValue_t_SetInt32 :: proc(self: ^SteamNetworkingConfigValue_t, eVal: ESteamNetworkingConfigValue, data: int32) ---
	SteamNetworkingConfigValue_t_SetInt64 :: proc(self: ^SteamNetworkingConfigValue_t, eVal: ESteamNetworkingConfigValue, data: int64) ---
	SteamNetworkingConfigValue_t_SetFloat :: proc(self: ^SteamNetworkingConfigValue_t, eVal: ESteamNetworkingConfigValue, data: f32) ---
	SteamNetworkingConfigValue_t_SetPtr :: proc(self: ^SteamNetworkingConfigValue_t, eVal: ESteamNetworkingConfigValue, data: rawptr) ---
	SteamNetworkingConfigValue_t_SetString :: proc(self: ^SteamNetworkingConfigValue_t, eVal: ESteamNetworkingConfigValue, data: cstring) ---
	SteamDatagramHostedAddress_Clear :: proc(self: ^SteamDatagramHostedAddress) ---
	SteamDatagramHostedAddress_GetPopID :: proc(self: ^SteamDatagramHostedAddress) -> SteamNetworkingPOPID ---
	SteamDatagramHostedAddress_SetDevAddress :: proc(self: ^SteamDatagramHostedAddress, nIP: uint32, nPort: uint16, popid: SteamNetworkingPOPID) ---
} // foreign lib

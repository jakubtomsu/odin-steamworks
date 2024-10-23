package steamworks

// TODO: 32-bit support?

when ODIN_OS == .Windows {
    foreign import lib "redistributable_bin/win64/steam_api64.lib"
} else when ODIN_OS == .Linux {
    foreign import lib "redistributable_bin/linux64/libsteam_api.so"
} else when ODIN_OS == .Darwin {
    foreign import lib "redistributable_bin/osx/libsteam_api.dylib"
}

// VALVE_CALLBACK_PACK_SMALL / VALVE_CALLBACK_PACK_LARGE
CALLBACK_PACK_LARGE :: #config(STEAMWORKS_CALLBACK_PACK_LARGE, true)
CALLBACK_ALIGN :: 8 when CALLBACK_PACK_LARGE else 4

CGameID :: struct #raw_union {
    ulGameID: u64,
    gameID:   GameID,
}

when ODIN_ENDIAN == .Big {
    GameID :: struct #raw_union {
        nModID: u32,
        nType:  u8,
        nAppID: [3]u8,
    }
} else {
    GameID :: struct #raw_union {
        nAppID: [3]u8,
        nType:  u8,
        nModID: u32,
    }
}

cgameid_is_valid :: proc(id: CGameID) -> bool {
    switch id.gameID.nType {
    case u8(CGameID_EGameIDType.App):
        return id.gameID.nAppID != 0
    case u8(CGameID_EGameIDType.GameMod):
        return id.gameID.nAppID != 0 && bool(id.gameID.nModID & 0x80000000)
    case u8(CGameID_EGameIDType.Shortcut):
        return id.gameID.nAppID == 0 && bool(id.gameID.nModID & 0x80000000) && id.gameID.nModID >= (5000 | 0x80000000)
    case u8(CGameID_EGameIDType.P2P):
        return id.gameID.nAppID == 0 && bool(id.gameID.nModID & 0x80000000)
    }
    return false
}

// HACK
CSteamID :: u64

SteamDatagramRelayAuthTicketPtr :: distinct rawptr
INetworkingConnectionSignalingPtr :: distinct rawptr
INetworkingSignalingRecvContextPtr :: distinct rawptr

// ---------
// Constants
// ---------

AppId :: u32
DepotId :: u32
RTime32 :: u32
SteamAPICall :: u64
AccountID :: u32
PartyBeaconID :: u64
HAuthTicket :: u32
PFNPreMinidumpCallback :: #type proc "c" (_: rawptr)
HSteamPipe :: i32
HSteamUser :: i32
FriendsGroupID :: i64
HServerListRequest :: rawptr
HServerQuery :: i32
UGCHandle :: u64
PublishedFileUpdateHandle :: u64
PublishedFileId :: u64
UGCFileWriteStreamHandle :: u64
SteamLeaderboard :: u64
SteamLeaderboardEntries :: u64
SNetSocket :: u32
SNetListenSocket :: u32
ScreenshotHandle :: u32
HTTPRequestHandle :: u32
HTTPCookieContainerHandle :: u32

// InputHandle_t is used to refer to a specific controller.
// This handle will consistently identify a controller, even if it is disconnected and re-connected
InputHandle :: u64

// These handles are used to refer to a specific in-game action or action set
// All action handles should be queried during initialization for performance reasons
InputActionSetHandle :: u64
InputDigitalActionHandle :: u64
InputAnalogActionHandle :: u64

SteamInputActionEventCallbackPointer :: #type proc "c" (_: ^SteamInputActionEvent)
ControllerHandle :: u64
ControllerActionSetHandle :: u64
ControllerDigitalActionHandle :: u64
ControllerAnalogActionHandle :: u64
UGCQueryHandle :: u64
UGCUpdateHandle :: u64
HHTMLBrowser :: u32
SteamItemInstanceID :: u64
SteamItemDef :: int
SteamInventoryResult :: int
SteamInventoryUpdateHandle :: u64
RemotePlaySessionID :: u32
FnSteamNetConnectionStatusChanged :: #type proc "c" (_: ^SteamNetConnectionStatusChangedCallback)
FnSteamNetAuthenticationStatusChanged :: #type proc "c" (_: ^SteamNetAuthenticationStatus)
FnSteamRelayNetworkStatusChanged :: #type proc "c" (_: ^SteamRelayNetworkStatus)
FnSteamNetworkingMessagesSessionRequest :: #type proc "c" (_: ^SteamNetworkingMessagesSessionRequest)
FnSteamNetworkingMessagesSessionFailed :: #type proc "c" (_: ^SteamNetworkingMessagesSessionFailed)
FnSteamNetworkingFakeIPResult :: #type proc "c" (_: ^SteamNetworkingFakeIPResult)
HSteamNetConnection :: distinct u32
HSteamListenSocket :: distinct u32
HSteamNetPollGroup :: distinct u32
SteamNetworkingErrMsg :: [1024]u8
SteamNetworkingPOPID :: u32
SteamNetworkingMicroseconds :: i64 // c.longlong
FSteamNetworkingSocketsDebugOutput :: #type proc "c" (_: ESteamNetworkingSocketsDebugOutputType, _: cstring)

uAppIdInvalid: AppId : 0x0
uDepotIdInvalid: DepotId : 0x0
uAPICallInvalid: SteamAPICall : 0x0
ulPartyBeaconIdInvalid: PartyBeaconID : 0
HAuthTicketInvalid: HAuthTicket : 0
unSteamAccountIDMask: u32 : 0xFFFFFFFF
unSteamAccountInstanceMask: u32 : 0x000FFFFF
unSteamUserDefaultInstance: u32 : 1
cchGameExtraInfoMax: i32 : 64
cchMaxFriendsGroupName: i32 : 64
cFriendsGroupLimit: i32 : 100
FriendsGroupID_Invalid: FriendsGroupID : -1
cEnumerateFollowersMax: i32 : 50
cubChatMetadataMax: u32 : 8192
cbMaxGameServerGameDir: i32 : 32
cbMaxGameServerMapName: i32 : 32
cbMaxGameServerGameDescription: i32 : 64
cbMaxGameServerName: i32 : 64
cbMaxGameServerTags: i32 : 128
cbMaxGameServerGameData: i32 : 2048
HSERVERQUERY_INVALID: u32 : 0xffffffff
unFavoriteFlagNone: u32 : 0x00
unFavoriteFlagFavorite: u32 : 0x01
unFavoriteFlagHistory: u32 : 0x02
unMaxCloudFileChunkSize: u32 : 100 * 1024 * 1024
PublishedFileIdInvalid: PublishedFileId : 0
cchPublishedDocumentTitleMax: u32 : 128 + 1
cchPublishedDocumentDescriptionMax: u32 : 8000
cchPublishedDocumentChangeDescriptionMax: u32 : 8000
unEnumeratePublishedFilesMaxResults: u32 : 50
cchTagListMax: u32 : 1024 + 1
cchFilenameMax: u32 : 260
cchPublishedFileURLMax: u32 : 256
cubAppProofOfPurchaseKeyMax: i32 : 240
nScreenshotMaxTaggedUsers: u32 : 32
nScreenshotMaxTaggedPublishedFiles: u32 : 32
cubUFSTagTypeMax: i32 : 255
cubUFSTagValueMax: i32 : 255
ScreenshotThumbWidth: i32 : 200
kNumUGCResultsPerPage: u32 : 50
cchDeveloperMetadataMax: u32 : 5000
INVALID_HTMLBROWSER: u32 : 0
SteamItemInstanceIDInvalid: SteamItemInstanceID : ~SteamItemInstanceID(0)
SteamInventoryResultInvalid: SteamInventoryResult : -1
HSteamNetConnection_Invalid: HSteamNetConnection : 0
HSteamListenSocket_Invalid: HSteamListenSocket : 0
HSteamNetPollGroup_Invalid: HSteamNetPollGroup : 0
cchMaxSteamNetworkingErrMsg: i32 : 1024
cchSteamNetworkingMaxConnectionCloseReason: i32 : 128
cchSteamNetworkingMaxConnectionDescription: i32 : 128
cchSteamNetworkingMaxConnectionAppName: i32 : 32
nSteamNetworkConnectionInfoFlags_Unauthenticated: i32 : 1
nSteamNetworkConnectionInfoFlags_Unencrypted: i32 : 2
nSteamNetworkConnectionInfoFlags_LoopbackBuffers: i32 : 4
nSteamNetworkConnectionInfoFlags_Fast: i32 : 8
nSteamNetworkConnectionInfoFlags_Relayed: i32 : 16
nSteamNetworkConnectionInfoFlags_DualWifi: i32 : 32
cbMaxSteamNetworkingSocketsMessageSizeSend: i32 : 512 * 1024
nSteamNetworkingSend_Unreliable: i32 : 0
nSteamNetworkingSend_NoNagle: i32 : 1
nSteamNetworkingSend_UnreliableNoNagle: i32 : nSteamNetworkingSend_Unreliable | nSteamNetworkingSend_NoNagle
nSteamNetworkingSend_NoDelay: i32 : 4
nSteamNetworkingSend_UnreliableNoDelay :: i32(nSteamNetworkingSend_Unreliable | nSteamNetworkingSend_NoDelay | nSteamNetworkingSend_NoNagle)
nSteamNetworkingSend_Reliable: i32 : 8
nSteamNetworkingSend_ReliableNoNagle: i32 : nSteamNetworkingSend_Reliable | nSteamNetworkingSend_NoNagle
nSteamNetworkingSend_UseCurrentThread: i32 : 16
nSteamNetworkingSend_AutoRestartBrokenSession: i32 : 32
cchMaxSteamNetworkingPingLocationString: i32 : 1024
nSteamNetworkingPing_Failed: i32 : -1
nSteamNetworkingPing_Unknown: i32 : -2
nSteamNetworkingConfig_P2P_Transport_ICE_Enable_Default: i32 : -1
nSteamNetworkingConfig_P2P_Transport_ICE_Enable_Disable: i32 : 0
nSteamNetworkingConfig_P2P_Transport_ICE_Enable_Relay: i32 : 1
nSteamNetworkingConfig_P2P_Transport_ICE_Enable_Private: i32 : 2
nSteamNetworkingConfig_P2P_Transport_ICE_Enable_Public: i32 : 4
nSteamNetworkingConfig_P2P_Transport_ICE_Enable_All: i32 : 0x7fffffff
STEAMGAMESERVER_QUERY_PORT_SHARED: u16 : 0xffff
MASTERSERVERUPDATERPORT_USEGAMESOCKETSHARE: u16 : STEAMGAMESERVER_QUERY_PORT_SHARED
cbSteamDatagramMaxSerializedTicket: u32 : 512
cbMaxSteamDatagramGameCoordinatorServerLoginAppData: u32 : 2048
cbMaxSteamDatagramGameCoordinatorServerLoginSerialized: u32 : 4096
cbSteamNetworkingSocketsFakeUDPPortRecommendedMTU: i32 : 1200
cbSteamNetworkingSocketsFakeUDPPortMaxMessageSize: i32 : 4096

UGCHandleInvalid: UGCHandle : 0xffffffffffffffff
PublishedFileUpdateHandleInvalid: PublishedFileUpdateHandle : 0xffffffffffffffff
UGCFileStreamHandleInvalid: UGCFileWriteStreamHandle : 0xffffffffffffffff
UGCQueryHandleInvalid: UGCQueryHandle : 0xffffffffffffffff
UGCUpdateHandleInvalid: UGCUpdateHandle : 0xffffffffffffffff
SteamInventoryUpdateHandleInvalid: SteamInventoryUpdateHandle : 0xffffffffffffffff
SteamDatagramPOPID_dev: SteamNetworkingPOPID : (u32('d') << 16) | (u32('e') << 8) | u32('v')

// A fixed size buffer to receive an error message that is returned by some API
// calls.
cchMaxSteamErrMsg :: 1024
SteamErrMsg :: distinct [cchMaxSteamErrMsg]u8

INPUT_MAX_COUNT :: 16
INPUT_MAX_ANALOG_ACTIONS :: 24
INPUT_MAX_DIGITAL_ACTIONS :: 256
INPUT_MAX_ORIGINS :: 8
INPUT_MAX_ACTIVE_LAYERS :: 16
// When sending an option to a specific controller handle, you can send to all devices via this command
INPUT_HANDLE_ALL_CONTROLLERS :: max(u64)
INPUT_MIN_ANALOG_ACTION_DATA :: -1.0
INPUT_MAX_ANALOG_ACTION_DATA :: 1.0


MAX_TIMELINE_PRIORITY :: 1000
MAX_TIMELINE_EVENT_DURATION :: 600



// -------
// Structs
// -------

SteamNetworkingMessage :: struct #align (CALLBACK_ALIGN) {
    pData:            rawptr,
    cbSize:           i32,
    conn:             HSteamNetConnection,
    identityPeer:     SteamNetworkingIdentity,
    nConnUserData:    i64,
    usecTimeReceived: SteamNetworkingMicroseconds,
    nMessageNumber:   i64,
    pfnFreeData:      #type proc "c" (_: ^SteamNetworkingMessage),
    pfnRelease:       #type proc "c" (_: ^SteamNetworkingMessage),
    nChannel:         i32,
    nFlags:           i32,
    nUserData:        i64,
    idxLane:          u16,
    _pad1__:          u16,
}

SteamInputActionEvent_AnalogAction :: struct #align (CALLBACK_ALIGN) {
    actionHandle:     InputAnalogActionHandle,
    analogActionData: InputAnalogActionData,
}

SteamInputActionEvent_DigitalAction :: struct #align (CALLBACK_ALIGN) {
    actionHandle:      InputDigitalActionHandle,
    digitalActionData: InputDigitalActionData,
}

SteamInputActionEvent :: struct #align (CALLBACK_ALIGN) {
    controllerHandle: InputHandle,
    eEventType:       ESteamInputActionEventType,
    using actions:    struct #raw_union {
        analogAction:  SteamInputActionEvent_AnalogAction,
        digitalAction: SteamInputActionEvent_DigitalAction,
    },
}


SteamServersConnected :: struct #align (CALLBACK_ALIGN) {}

SteamServerConnectFailure :: struct #align (CALLBACK_ALIGN) {
    eResult:        EResult,
    bStillRetrying: bool,
}

SteamServersDisconnected :: struct #align (CALLBACK_ALIGN) {
    eResult: EResult,
}

ClientGameServerDeny :: struct #align (CALLBACK_ALIGN) {
    uAppID:           u32,
    unGameServerIP:   u32,
    usGameServerPort: u16,
    bSecure:          u16,
    uReason:          u32,
}

IPCFailure :: struct #align (CALLBACK_ALIGN) {
    eFailureType: u8,
}

LicensesUpdated :: struct #align (CALLBACK_ALIGN) {}

ValidateAuthTicketResponse :: struct #align (CALLBACK_ALIGN) {
    SteamID:              CSteamID,
    eAuthSessionResponse: EAuthSessionResponse,
    OwnerSteamID:         CSteamID,
}

MicroTxnAuthorizationResponse :: struct #align (CALLBACK_ALIGN) {
    unAppID:     u32,
    ulOrderID:   u64,
    bAuthorized: u8,
}

EncryptedAppTicketResponse :: struct #align (CALLBACK_ALIGN) {
    eResult: EResult,
}

GetAuthSessionTicketResponse :: struct #align (CALLBACK_ALIGN) {
    hAuthTicket: HAuthTicket,
    eResult:     EResult,
}

GameWebCallback :: struct #align (CALLBACK_ALIGN) {
    szURL: [256]u8,
}

StoreAuthURLResponse :: struct #align (CALLBACK_ALIGN) {
    szURL: [512]u8,
}

MarketEligibilityResponse :: struct #align (CALLBACK_ALIGN) {
    bAllowed:                   bool,
    eNotAllowedReason:          EMarketNotAllowedReasonFlags,
    rtAllowedAtTime:            RTime32,
    cdaySteamGuardRequiredDays: i32,
    cdayNewDeviceCooldown:      i32,
}

DurationControl :: struct #align (CALLBACK_ALIGN) {
    eResult:        EResult,
    appid:          AppId,
    bApplicable:    bool,
    csecsLast5h:    i32,
    progress:       EDurationControlProgress,
    notification:   EDurationControlNotification,
    csecsToday:     i32,
    csecsRemaining: i32,
}

PersonaStateChange :: struct #align (CALLBACK_ALIGN) {
    ulSteamID:    u64,
    nChangeFlags: i32,
}

GameOverlayActivated :: struct #align (CALLBACK_ALIGN) {
    bActive: u8,
}

GameServerChangeRequested :: struct #align (CALLBACK_ALIGN) {
    rgchServer:   [64]u8,
    rgchPassword: [64]u8,
}

GameLobbyJoinRequested :: struct #align (CALLBACK_ALIGN) {
    steamIDLobby:  CSteamID,
    steamIDFriend: CSteamID,
}

AvatarImageLoaded :: struct #align (CALLBACK_ALIGN) {
    steamID: CSteamID,
    iImage:  i32,
    iWide:   i32,
    iTall:   i32,
}

ClanOfficerListResponse :: struct #align (CALLBACK_ALIGN) {
    steamIDClan: CSteamID,
    cOfficers:   i32,
    bSuccess:    u8,
}

FriendRichPresenceUpdate :: struct #align (CALLBACK_ALIGN) {
    steamIDFriend: CSteamID,
    nAppID:        AppId,
}

GameRichPresenceJoinRequested :: struct #align (CALLBACK_ALIGN) {
    steamIDFriend: CSteamID,
    rgchConnect:   [256]u8,
}

GameConnectedClanChatMsg :: struct #align (CALLBACK_ALIGN) {
    steamIDClanChat: CSteamID,
    steamIDUser:     CSteamID,
    iMessageID:      i32,
}

GameConnectedChatJoin :: struct #align (CALLBACK_ALIGN) {
    steamIDClanChat: CSteamID,
    steamIDUser:     CSteamID,
}

GameConnectedChatLeave :: struct #align (CALLBACK_ALIGN) {
    steamIDClanChat: CSteamID,
    steamIDUser:     CSteamID,
    bKicked:         bool,
    bDropped:        bool,
}

DownloadClanActivityCountsResult :: struct #align (CALLBACK_ALIGN) {
    bSuccess: bool,
}

JoinClanChatRoomCompletionResult :: struct #align (CALLBACK_ALIGN) {
    steamIDClanChat:        CSteamID,
    eChatRoomEnterResponse: EChatRoomEnterResponse,
}

GameConnectedFriendChatMsg :: struct #align (CALLBACK_ALIGN) {
    steamIDUser: CSteamID,
    iMessageID:  i32,
}

FriendsGetFollowerCount :: struct #align (CALLBACK_ALIGN) {
    eResult: EResult,
    steamID: CSteamID,
    nCount:  i32,
}

FriendsIsFollowing :: struct #align (CALLBACK_ALIGN) {
    eResult:      EResult,
    steamID:      CSteamID,
    bIsFollowing: bool,
}

FriendsEnumerateFollowingList :: struct #align (CALLBACK_ALIGN) {
    eResult:           EResult,
    rgSteamID:         [50]CSteamID,
    nResultsReturned:  i32,
    nTotalResultCount: i32,
}

SetPersonaNameResponse :: struct #align (CALLBACK_ALIGN) {
    bSuccess:      bool,
    bLocalSuccess: bool,
    result:        EResult,
}

UnreadChatMessagesChanged :: struct #align (CALLBACK_ALIGN) {}

OverlayBrowserProtocolNavigation :: struct #align (CALLBACK_ALIGN) {
    rgchURI: [1024]u8,
}

EquippedProfileItemsChanged :: struct #align (CALLBACK_ALIGN) {
    steamID: CSteamID,
}

EquippedProfileItems :: struct #align (CALLBACK_ALIGN) {
    eResult:                   EResult,
    steamID:                   CSteamID,
    bHasAnimatedAvatar:        bool,
    bHasAvatarFrame:           bool,
    bHasProfileModifier:       bool,
    bHasProfileBackground:     bool,
    bHasMiniProfileBackground: bool,
}

IPCountry :: struct #align (CALLBACK_ALIGN) {}

LowBatteryPower :: struct #align (CALLBACK_ALIGN) {
    nMinutesBatteryLeft: u8,
}

SteamAPICallCompleted :: struct #align (CALLBACK_ALIGN) {
    hAsyncCall: SteamAPICall,
    iCallback:  ICallback,
    cubParam:   u32,
}

SteamShutdown :: struct #align (CALLBACK_ALIGN) {}

CheckFileSignature :: struct #align (CALLBACK_ALIGN) {
    eCheckFileSignature: ECheckFileSignature,
}

GamepadTextInputDismissed :: struct #align (CALLBACK_ALIGN) {
    bSubmitted:      bool,
    unSubmittedText: u32,
}

AppResumingFromSuspend :: struct #align (CALLBACK_ALIGN) {}

FloatingGamepadTextInputDismissed :: struct #align (CALLBACK_ALIGN) {}

FavoritesListChanged :: struct #align (CALLBACK_ALIGN) {
    nIP:         u32,
    nQueryPort:  u32,
    nConnPort:   u32,
    nAppID:      u32,
    nFlags:      u32,
    bAdd:        bool,
    unAccountId: AccountID,
}

LobbyInvite :: struct #align (CALLBACK_ALIGN) {
    ulSteamIDUser:  u64,
    ulSteamIDLobby: u64,
    ulGameID:       u64,
}

LobbyEnter :: struct #align (CALLBACK_ALIGN) {
    ulSteamIDLobby:         u64,
    rgfChatPermissions:     u32,
    bLocked:                bool,
    EChatRoomEnterResponse: u32,
}

LobbyDataUpdate :: struct #align (CALLBACK_ALIGN) {
    ulSteamIDLobby:  u64,
    ulSteamIDMember: u64,
    bSuccess:        u8,
}

LobbyChatUpdate :: struct #align (CALLBACK_ALIGN) {
    ulSteamIDLobby:           u64,
    ulSteamIDUserChanged:     u64,
    ulSteamIDMakingChange:    u64,
    rgfChatMemberStateChange: u32,
}

LobbyChatMsg :: struct #align (CALLBACK_ALIGN) {
    ulSteamIDLobby: u64,
    ulSteamIDUser:  u64,
    eChatEntryType: u8,
    iChatID:        u32,
}

LobbyGameCreated :: struct #align (CALLBACK_ALIGN) {
    ulSteamIDLobby:      u64,
    ulSteamIDGameServer: u64,
    unIP:                u32,
    usPort:              u16,
}

LobbyMatchList :: struct #align (CALLBACK_ALIGN) {
    nLobbiesMatching: u32,
}

LobbyKicked :: struct #align (CALLBACK_ALIGN) {
    ulSteamIDLobby:         u64,
    ulSteamIDAdmin:         u64,
    bKickedDueToDisconnect: u8,
}

LobbyCreated :: struct #align (CALLBACK_ALIGN) {
    eResult:        EResult,
    ulSteamIDLobby: u64,
}

PSNGameBootInviteResult :: struct #align (CALLBACK_ALIGN) {
    bGameBootInviteExists: bool,
    steamIDLobby:          CSteamID,
}

FavoritesListAccountsUpdated :: struct #align (CALLBACK_ALIGN) {
    eResult: EResult,
}

SearchForGameProgressCallback :: struct #align (CALLBACK_ALIGN) {
    ullSearchID:               u64,
    eResult:                   EResult,
    lobbyID:                   CSteamID,
    steamIDEndedSearch:        CSteamID,
    nSecondsRemainingEstimate: i32,
    cPlayersSearching:         i32,
}

SearchForGameResultCallback :: struct #align (CALLBACK_ALIGN) {
    ullSearchID:         u64,
    eResult:             EResult,
    nCountPlayersInGame: i32,
    nCountAcceptedGame:  i32,
    steamIDHost:         CSteamID,
    bFinalCallback:      bool,
}

RequestPlayersForGameProgressCallback :: struct #align (CALLBACK_ALIGN) {
    eResult:     EResult,
    ullSearchID: u64,
}

RequestPlayersForGameResultCallback :: struct #align (CALLBACK_ALIGN) {
    eResult:                   EResult,
    ullSearchID:               u64,
    SteamIDPlayerFound:        CSteamID,
    SteamIDLobby:              CSteamID,
    ePlayerAcceptState:        RequestPlayersForGameResultCallbact_PlayerAcceptState,
    nPlayerIndex:              i32,
    nTotalPlayersFound:        i32,
    nTotalPlayersAcceptedGame: i32,
    nSuggestedTeamIndex:       i32,
    ullUniqueGameID:           u64,
}

RequestPlayersForGameResultCallbact_PlayerAcceptState :: enum i32 {
    EStateUnknown        = 0,
    EStatePlayerAccepted = 1,
    EStatePlayerDeclined = 2,
}

RequestPlayersForGameFinalResultCallback :: struct #align (CALLBACK_ALIGN) {
    eResult:         EResult,
    ullSearchID:     u64,
    ullUniqueGameID: u64,
}

SubmitPlayerResultResultCallback :: struct #align (CALLBACK_ALIGN) {
    eResult:         EResult,
    ullUniqueGameID: u64,
    steamIDPlayer:   CSteamID,
}

EndGameResultCallback :: struct #align (CALLBACK_ALIGN) {
    eResult:         EResult,
    ullUniqueGameID: u64,
}

JoinPartyCallback :: struct #align (CALLBACK_ALIGN) {
    eResult:            EResult,
    ulBeaconID:         PartyBeaconID,
    SteamIDBeaconOwner: CSteamID,
    rgchConnectString:  [256]u8,
}

CreateBeaconCallback :: struct #align (CALLBACK_ALIGN) {
    eResult:    EResult,
    ulBeaconID: PartyBeaconID,
}

ReservationNotificationCallback :: struct #align (CALLBACK_ALIGN) {
    ulBeaconID:    PartyBeaconID,
    steamIDJoiner: CSteamID,
}

ChangeNumOpenSlotsCallback :: struct #align (CALLBACK_ALIGN) {
    eResult: EResult,
}

AvailableBeaconLocationsUpdated :: struct #align (CALLBACK_ALIGN) {}

ActiveBeaconsUpdated :: struct #align (CALLBACK_ALIGN) {}

RemoteStorageFileShareResult :: struct #align (CALLBACK_ALIGN) {
    eResult:      EResult,
    hFile:        UGCHandle,
    rgchFilename: [260]u8,
}

RemoteStoragePublishFileResult :: struct #align (CALLBACK_ALIGN) {
    eResult:                                  EResult,
    nPublishedFileId:                         PublishedFileId,
    bUserNeedsToAcceptWorkshopLegalAgreement: bool,
}

RemoteStorageDeletePublishedFileResult :: struct #align (CALLBACK_ALIGN) {
    eResult:          EResult,
    nPublishedFileId: PublishedFileId,
}

RemoteStorageEnumerateUserPublishedFilesResult :: struct #align (CALLBACK_ALIGN) {
    eResult:           EResult,
    nResultsReturned:  i32,
    nTotalResultCount: i32,
    rgPublishedFileId: [50]PublishedFileId,
}

RemoteStorageSubscribePublishedFileResult :: struct #align (CALLBACK_ALIGN) {
    eResult:          EResult,
    nPublishedFileId: PublishedFileId,
}

RemoteStorageEnumerateUserSubscribedFilesResult :: struct #align (CALLBACK_ALIGN) {
    eResult:           EResult,
    nResultsReturned:  i32,
    nTotalResultCount: i32,
    rgPublishedFileId: [50]PublishedFileId,
    rgRTimeSubscribed: [50]u32,
}

RemoteStorageUnsubscribePublishedFileResult :: struct #align (CALLBACK_ALIGN) {
    eResult:          EResult,
    nPublishedFileId: PublishedFileId,
}

RemoteStorageUpdatePublishedFileResult :: struct #align (CALLBACK_ALIGN) {
    eResult:                                  EResult,
    nPublishedFileId:                         PublishedFileId,
    bUserNeedsToAcceptWorkshopLegalAgreement: bool,
}

RemoteStorageDownloadUGCResult :: struct #align (CALLBACK_ALIGN) {
    eResult:        EResult,
    hFile:          UGCHandle,
    nAppID:         AppId,
    nSizeInBytes:   i32,
    pchFileName:    [260]u8,
    ulSteamIDOwner: u64,
}

RemoteStorageGetPublishedFileDetailsResult :: struct #align (CALLBACK_ALIGN) {
    eResult:          EResult,
    nPublishedFileId: PublishedFileId,
    nCreatorAppID:    AppId,
    nConsumerAppID:   AppId,
    rgchTitle:        [129]u8,
    rgchDescription:  [8000]u8,
    hFile:            UGCHandle,
    hPreviewFile:     UGCHandle,
    ulSteamIDOwner:   u64,
    rtimeCreated:     u32,
    rtimeUpdated:     u32,
    eVisibility:      ERemoteStoragePublishedFileVisibility,
    bBanned:          bool,
    rgchTags:         [1025]u8,
    bTagsTruncated:   bool,
    pchFileName:      [260]u8,
    nFileSize:        i32,
    nPreviewFileSize: i32,
    rgchURL:          [256]u8,
    eFileType:        EWorkshopFileType,
    bAcceptedForUse:  bool,
}

RemoteStorageEnumerateWorkshopFilesResult :: struct #align (CALLBACK_ALIGN) {
    eResult:           EResult,
    nResultsReturned:  i32,
    nTotalResultCount: i32,
    rgPublishedFileId: [50]PublishedFileId,
    rgScore:           [50]f32,
    nAppId:            AppId,
    unStartIndex:      u32,
}

RemoteStorageGetPublishedItemVoteDetailsResult :: struct #align (CALLBACK_ALIGN) {
    eResult:           EResult,
    unPublishedFileId: PublishedFileId,
    nVotesFor:         i32,
    nVotesAgainst:     i32,
    nReports:          i32,
    fScore:            f32,
}

RemoteStoragePublishedFileSubscribed :: struct #align (CALLBACK_ALIGN) {
    nPublishedFileId: PublishedFileId,
    nAppID:           AppId,
}

RemoteStoragePublishedFileUnsubscribed :: struct #align (CALLBACK_ALIGN) {
    nPublishedFileId: PublishedFileId,
    nAppID:           AppId,
}

RemoteStoragePublishedFileDeleted :: struct #align (CALLBACK_ALIGN) {
    nPublishedFileId: PublishedFileId,
    nAppID:           AppId,
}

RemoteStorageUpdateUserPublishedItemVoteResult :: struct #align (CALLBACK_ALIGN) {
    eResult:          EResult,
    nPublishedFileId: PublishedFileId,
}

RemoteStorageUserVoteDetails :: struct #align (CALLBACK_ALIGN) {
    eResult:          EResult,
    nPublishedFileId: PublishedFileId,
    eVote:            EWorkshopVote,
}

RemoteStorageEnumerateUserSharedWorkshopFilesResult :: struct #align (CALLBACK_ALIGN) {
    eResult:           EResult,
    nResultsReturned:  i32,
    nTotalResultCount: i32,
    rgPublishedFileId: [50]PublishedFileId,
}

RemoteStorageSetUserPublishedFileActionResult :: struct #align (CALLBACK_ALIGN) {
    eResult:          EResult,
    nPublishedFileId: PublishedFileId,
    eAction:          EWorkshopFileAction,
}

RemoteStorageEnumeratePublishedFilesByUserActionResult :: struct #align (CALLBACK_ALIGN) {
    eResult:           EResult,
    eAction:           EWorkshopFileAction,
    nResultsReturned:  i32,
    nTotalResultCount: i32,
    rgPublishedFileId: [50]PublishedFileId,
    rgRTimeUpdated:    [50]u32,
}

RemoteStoragePublishFileProgress :: struct #align (CALLBACK_ALIGN) {
    dPercentFile: f64,
    bPreview:     bool,
}

RemoteStoragePublishedFileUpdated :: struct #align (CALLBACK_ALIGN) {
    nPublishedFileId: PublishedFileId,
    nAppID:           AppId,
    ulUnused:         u64,
}

RemoteStorageFileWriteAsyncComplete :: struct #align (CALLBACK_ALIGN) {
    eResult: EResult,
}

RemoteStorageFileReadAsyncComplete :: struct #align (CALLBACK_ALIGN) {
    hFileReadAsync: SteamAPICall,
    eResult:        EResult,
    nOffset:        u32,
    cubRead:        u32,
}

RemoteStorageLocalFileChange :: struct #align (CALLBACK_ALIGN) {}

UserStatsReceived :: struct #align (CALLBACK_ALIGN) {
    nGameID:     u64,
    eResult:     EResult,
    steamIDUser: CSteamID,
}

UserStatsStored :: struct #align (CALLBACK_ALIGN) {
    nGameID: u64,
    eResult: EResult,
}

UserAchievementStored :: struct #align (CALLBACK_ALIGN) {
    nGameID:             u64,
    bGroupAchievement:   bool,
    rgchAchievementName: [128]u8,
    nCurProgress:        u32,
    nMaxProgress:        u32,
}

LeaderboardFindResult :: struct #align (CALLBACK_ALIGN) {
    hSteamLeaderboard: SteamLeaderboard,
    bLeaderboardFound: u8,
}

LeaderboardScoresDownloaded :: struct #align (CALLBACK_ALIGN) {
    hSteamLeaderboard:        SteamLeaderboard,
    hSteamLeaderboardEntries: SteamLeaderboardEntries,
    cEntryCount:              i32,
}

LeaderboardScoreUploaded :: struct #align (CALLBACK_ALIGN) {
    bSuccess:            u8,
    hSteamLeaderboard:   SteamLeaderboard,
    nScore:              i32,
    bScoreChanged:       u8,
    nGlobalRankNew:      i32,
    nGlobalRankPrevious: i32,
}

NumberOfCurrentPlayers :: struct #align (CALLBACK_ALIGN) {
    bSuccess: u8,
    cPlayers: i32,
}

UserStatsUnloaded :: struct #align (CALLBACK_ALIGN) {
    steamIDUser: CSteamID,
}

UserAchievementIconFetched :: struct #align (CALLBACK_ALIGN) {
    nGameID:             CGameID,
    rgchAchievementName: [128]u8,
    bAchieved:           bool,
    nIconHandle:         i32,
}

GlobalAchievementPercentagesReady :: struct #align (CALLBACK_ALIGN) {
    nGameID: u64,
    eResult: EResult,
}

LeaderboardUGCSet :: struct #align (CALLBACK_ALIGN) {
    eResult:           EResult,
    hSteamLeaderboard: SteamLeaderboard,
}

PS3TrophiesInstalled :: struct #align (CALLBACK_ALIGN) {
    nGameID:             u64,
    eResult:             EResult,
    ulRequiredDiskSpace: u64,
}

GlobalStatsReceived :: struct #align (CALLBACK_ALIGN) {
    nGameID: u64,
    eResult: EResult,
}

DlcInstalled :: struct #align (CALLBACK_ALIGN) {
    nAppID: AppId,
}

RegisterActivationCodeResponse :: struct #align (CALLBACK_ALIGN) {
    eResult:             ERegisterActivationCodeResult,
    unPackageRegistered: u32,
}

NewUrlLaunchParameters :: struct #align (CALLBACK_ALIGN) {}

AppProofOfPurchaseKeyResponse :: struct #align (CALLBACK_ALIGN) {
    eResult:      EResult,
    nAppID:       u32,
    cchKeyLength: u32,
    rgchKey:      [240]u8,
}

FileDetailsResult :: struct #align (CALLBACK_ALIGN) {
    eResult:    EResult,
    ulFileSize: u64,
    FileSHA:    [20]u8,
    unFlags:    u32,
}

TimedTrialStatus :: struct #align (CALLBACK_ALIGN) {
    unAppID:          AppId,
    bIsOffline:       bool,
    unSecondsAllowed: u32,
    unSecondsPlayed:  u32,
}

P2PSessionRequest :: struct #align (CALLBACK_ALIGN) {
    steamIDRemote: CSteamID,
}

P2PSessionConnectFail :: struct #align (CALLBACK_ALIGN) {
    steamIDRemote:    CSteamID,
    eP2PSessionError: u8,
}

SocketStatusCallback :: struct #align (CALLBACK_ALIGN) {
    hSocket:          SNetSocket,
    hListenSocket:    SNetListenSocket,
    steamIDRemote:    CSteamID,
    eSNetSocketState: i32,
}

ScreenshotReady :: struct #align (CALLBACK_ALIGN) {
    hLocal:  ScreenshotHandle,
    eResult: EResult,
}

ScreenshotRequested :: struct #align (CALLBACK_ALIGN) {}

PlaybackStatusHasChanged :: struct #align (CALLBACK_ALIGN) {}

VolumeHasChanged :: struct #align (CALLBACK_ALIGN) {
    flNewVolume: f32,
}

MusicPlayerRemoteWillActivate :: struct #align (CALLBACK_ALIGN) {}

MusicPlayerRemoteWillDeactivate :: struct #align (CALLBACK_ALIGN) {}

MusicPlayerRemoteToFront :: struct #align (CALLBACK_ALIGN) {}

MusicPlayerWillQuit :: struct #align (CALLBACK_ALIGN) {}

MusicPlayerWantsPlay :: struct #align (CALLBACK_ALIGN) {}

MusicPlayerWantsPause :: struct #align (CALLBACK_ALIGN) {}

MusicPlayerWantsPlayPrevious :: struct #align (CALLBACK_ALIGN) {}

MusicPlayerWantsPlayNext :: struct #align (CALLBACK_ALIGN) {}

MusicPlayerWantsShuffled :: struct #align (CALLBACK_ALIGN) {
    bShuffled: bool,
}

MusicPlayerWantsLooped :: struct #align (CALLBACK_ALIGN) {
    bLooped: bool,
}

MusicPlayerWantsVolume :: struct #align (CALLBACK_ALIGN) {
    flNewVolume: f32,
}

MusicPlayerSelectsQueueEntry :: struct #align (CALLBACK_ALIGN) {
    nID: i32,
}

MusicPlayerSelectsPlaylistEntry :: struct #align (CALLBACK_ALIGN) {
    nID: i32,
}

MusicPlayerWantsPlayingRepeatStatus :: struct #align (CALLBACK_ALIGN) {
    nPlayingRepeatStatus: i32,
}

HTTPRequestCompleted :: struct #align (CALLBACK_ALIGN) {
    hRequest:           HTTPRequestHandle,
    ulContextValue:     u64,
    bRequestSuccessful: bool,
    eStatusCode:        EHTTPStatusCode,
    unBodySize:         u32,
}

HTTPRequestHeadersReceived :: struct #align (CALLBACK_ALIGN) {
    hRequest:       HTTPRequestHandle,
    ulContextValue: u64,
}

HTTPRequestDataReceived :: struct #align (CALLBACK_ALIGN) {
    hRequest:       HTTPRequestHandle,
    ulContextValue: u64,
    cOffset:        u32,
    cBytesReceived: u32,
}

SteamInputDeviceConnected :: struct #align (CALLBACK_ALIGN) {
    ulConnectedDeviceHandle: InputHandle,
}

SteamInputDeviceDisconnected :: struct #align (CALLBACK_ALIGN) {
    ulDisconnectedDeviceHandle: InputHandle,
}

SteamInputConfigurationLoaded :: struct #align (CALLBACK_ALIGN) {
    unAppID:            AppId,
    ulDeviceHandle:     InputHandle,
    ulMappingCreator:   CSteamID,
    unMajorRevision:    u32,
    unMinorRevision:    u32,
    bUsesSteamInputAPI: bool,
    bUsesGamepadAPI:    bool,
}

SteamUGCQueryCompleted :: struct #align (CALLBACK_ALIGN) {
    handle:                 UGCQueryHandle,
    eResult:                EResult,
    unNumResultsReturned:   u32,
    unTotalMatchingResults: u32,
    bCachedData:            bool,
    rgchNextCursor:         [256]u8,
}

SteamUGCRequestUGCDetailsResult :: struct #align (CALLBACK_ALIGN) {
    details:     SteamUGCDetails,
    bCachedData: bool,
}

CreateItemResult :: struct #align (CALLBACK_ALIGN) {
    eResult:                                  EResult,
    nPublishedFileId:                         PublishedFileId,
    bUserNeedsToAcceptWorkshopLegalAgreement: bool,
}

SubmitItemUpdateResult :: struct #align (CALLBACK_ALIGN) {
    eResult:                                  EResult,
    bUserNeedsToAcceptWorkshopLegalAgreement: bool,
    nPublishedFileId:                         PublishedFileId,
}

ItemInstalled :: struct #align (CALLBACK_ALIGN) {
    unAppID:          AppId,
    nPublishedFileId: PublishedFileId,
}

DownloadItemResult :: struct #align (CALLBACK_ALIGN) {
    unAppID:          AppId,
    nPublishedFileId: PublishedFileId,
    eResult:          EResult,
}

UserFavoriteItemsListChanged :: struct #align (CALLBACK_ALIGN) {
    nPublishedFileId: PublishedFileId,
    eResult:          EResult,
    bWasAddRequest:   bool,
}

SetUserItemVoteResult :: struct #align (CALLBACK_ALIGN) {
    nPublishedFileId: PublishedFileId,
    eResult:          EResult,
    bVoteUp:          bool,
}

GetUserItemVoteResult :: struct #align (CALLBACK_ALIGN) {
    nPublishedFileId: PublishedFileId,
    eResult:          EResult,
    bVotedUp:         bool,
    bVotedDown:       bool,
    bVoteSkipped:     bool,
}

StartPlaytimeTrackingResult :: struct #align (CALLBACK_ALIGN) {
    eResult: EResult,
}

StopPlaytimeTrackingResult :: struct #align (CALLBACK_ALIGN) {
    eResult: EResult,
}

AddUGCDependencyResult :: struct #align (CALLBACK_ALIGN) {
    eResult:               EResult,
    nPublishedFileId:      PublishedFileId,
    nChildPublishedFileId: PublishedFileId,
}

RemoveUGCDependencyResult :: struct #align (CALLBACK_ALIGN) {
    eResult:               EResult,
    nPublishedFileId:      PublishedFileId,
    nChildPublishedFileId: PublishedFileId,
}

AddAppDependencyResult :: struct #align (CALLBACK_ALIGN) {
    eResult:          EResult,
    nPublishedFileId: PublishedFileId,
    nAppID:           AppId,
}

RemoveAppDependencyResult :: struct #align (CALLBACK_ALIGN) {
    eResult:          EResult,
    nPublishedFileId: PublishedFileId,
    nAppID:           AppId,
}

GetAppDependenciesResult :: struct #align (CALLBACK_ALIGN) {
    eResult:                  EResult,
    nPublishedFileId:         PublishedFileId,
    rgAppIDs:                 [32]AppId,
    nNumAppDependencies:      u32,
    nTotalNumAppDependencies: u32,
}

DeleteItemResult :: struct #align (CALLBACK_ALIGN) {
    eResult:          EResult,
    nPublishedFileId: PublishedFileId,
}

UserSubscribedItemsListChanged :: struct #align (CALLBACK_ALIGN) {
    nAppID: AppId,
}

WorkshopEULAStatus :: struct #align (CALLBACK_ALIGN) {
    eResult:      EResult,
    nAppID:       AppId,
    unVersion:    u32,
    rtAction:     RTime32,
    bAccepted:    bool,
    bNeedsAction: bool,
}

SteamAppInstalled :: struct #align (CALLBACK_ALIGN) {
    nAppID:              AppId,
    iInstallFolderIndex: i32,
}

SteamAppUninstalled :: struct #align (CALLBACK_ALIGN) {
    nAppID:              AppId,
    iInstallFolderIndex: i32,
}

HTML_BrowserReady :: struct #align (CALLBACK_ALIGN) {
    unBrowserHandle: HHTMLBrowser,
}

HTML_NeedsPaint :: struct #align (CALLBACK_ALIGN) {
    unBrowserHandle: HHTMLBrowser,
    pBGRA:           cstring,
    unWide:          u32,
    unTall:          u32,
    unUpdateX:       u32,
    unUpdateY:       u32,
    unUpdateWide:    u32,
    unUpdateTall:    u32,
    unScrollX:       u32,
    unScrollY:       u32,
    flPageScale:     f32,
    unPageSerial:    u32,
}

HTML_StartRequest :: struct #align (CALLBACK_ALIGN) {
    unBrowserHandle: HHTMLBrowser,
    pchURL:          cstring,
    pchTarget:       cstring,
    pchPostData:     cstring,
    bIsRedirect:     bool,
}

HTML_CloseBrowser :: struct #align (CALLBACK_ALIGN) {
    unBrowserHandle: HHTMLBrowser,
}

HTML_URLChanged :: struct #align (CALLBACK_ALIGN) {
    unBrowserHandle: HHTMLBrowser,
    pchURL:          cstring,
    pchPostData:     cstring,
    bIsRedirect:     bool,
    pchPageTitle:    cstring,
    bNewNavigation:  bool,
}

HTML_FinishedRequest :: struct #align (CALLBACK_ALIGN) {
    unBrowserHandle: HHTMLBrowser,
    pchURL:          cstring,
    pchPageTitle:    cstring,
}

HTML_OpenLinkInNewTab :: struct #align (CALLBACK_ALIGN) {
    unBrowserHandle: HHTMLBrowser,
    pchURL:          cstring,
}

HTML_ChangedTitle :: struct #align (CALLBACK_ALIGN) {
    unBrowserHandle: HHTMLBrowser,
    pchTitle:        cstring,
}

HTML_SearchResults :: struct #align (CALLBACK_ALIGN) {
    unBrowserHandle: HHTMLBrowser,
    unResults:       u32,
    unCurrentMatch:  u32,
}

HTML_CanGoBackAndForward :: struct #align (CALLBACK_ALIGN) {
    unBrowserHandle: HHTMLBrowser,
    bCanGoBack:      bool,
    bCanGoForward:   bool,
}

HTML_HorizontalScroll :: struct #align (CALLBACK_ALIGN) {
    unBrowserHandle: HHTMLBrowser,
    unScrollMax:     u32,
    unScrollCurrent: u32,
    flPageScale:     f32,
    bVisible:        bool,
    unPageSize:      u32,
}

HTML_VerticalScroll :: struct #align (CALLBACK_ALIGN) {
    unBrowserHandle: HHTMLBrowser,
    unScrollMax:     u32,
    unScrollCurrent: u32,
    flPageScale:     f32,
    bVisible:        bool,
    unPageSize:      u32,
}

HTML_LinkAtPosition :: struct #align (CALLBACK_ALIGN) {
    unBrowserHandle: HHTMLBrowser,
    x:               u32,
    y:               u32,
    pchURL:          cstring,
    bInput:          bool,
    bLiveLink:       bool,
}

HTML_JSAlert :: struct #align (CALLBACK_ALIGN) {
    unBrowserHandle: HHTMLBrowser,
    pchMessage:      cstring,
}

HTML_JSConfirt :: struct #align (CALLBACK_ALIGN) {
    unBrowserHandle: HHTMLBrowser,
    pchMessage:      cstring,
}

HTML_FileOpenDialog :: struct #align (CALLBACK_ALIGN) {
    unBrowserHandle: HHTMLBrowser,
    pchTitle:        cstring,
    pchInitialFile:  cstring,
}

HTML_NewWindow :: struct #align (CALLBACK_ALIGN) {
    unBrowserHandle:                  HHTMLBrowser,
    pchURL:                           cstring,
    unX:                              u32,
    unY:                              u32,
    unWide:                           u32,
    unTall:                           u32,
    unNewWindow_BrowserHandle_IGNORE: HHTMLBrowser,
}

HTML_SetCursor :: struct #align (CALLBACK_ALIGN) {
    unBrowserHandle: HHTMLBrowser,
    eMouseCursor:    u32,
}

HTML_StatusText :: struct #align (CALLBACK_ALIGN) {
    unBrowserHandle: HHTMLBrowser,
    pchMsg:          cstring,
}

HTML_ShowToolTip :: struct #align (CALLBACK_ALIGN) {
    unBrowserHandle: HHTMLBrowser,
    pchMsg:          cstring,
}

HTML_UpdateToolTip :: struct #align (CALLBACK_ALIGN) {
    unBrowserHandle: HHTMLBrowser,
    pchMsg:          cstring,
}

HTML_HideToolTip :: struct #align (CALLBACK_ALIGN) {
    unBrowserHandle: HHTMLBrowser,
}

HTML_BrowserRestarted :: struct #align (CALLBACK_ALIGN) {
    unBrowserHandle:    HHTMLBrowser,
    unOldBrowserHandle: HHTMLBrowser,
}

SteamInventoryResultReady :: struct #align (CALLBACK_ALIGN) {
    handle: SteamInventoryResult,
    result: EResult,
}

SteamInventoryFullUpdate :: struct #align (CALLBACK_ALIGN) {
    handle: SteamInventoryResult,
}

SteamInventoryDefinitionUpdate :: struct #align (CALLBACK_ALIGN) {}

SteamInventoryEligiblePromoItemDefIDs :: struct #align (CALLBACK_ALIGN) {
    result:                   EResult,
    steamID:                  CSteamID,
    numEligiblePromoItemDefs: i32,
    bCachedData:              bool,
}

SteamInventoryStartPurchaseResult :: struct #align (CALLBACK_ALIGN) {
    result:    EResult,
    ulOrderID: u64,
    ulTransID: u64,
}

SteamInventoryRequestPricesResult :: struct #align (CALLBACK_ALIGN) {
    result:       EResult,
    rgchCurrency: [4]u8,
}

GetVideoURLResult :: struct #align (CALLBACK_ALIGN) {
    eResult:      EResult,
    unVideoAppID: AppId,
    rgchURL:      [256]u8,
}

GetOPFSettingsResult :: struct #align (CALLBACK_ALIGN) {
    eResult:      EResult,
    unVideoAppID: AppId,
}

SteamParentalSettingsChanged :: struct #align (CALLBACK_ALIGN) {}

SteamRemotePlaySessionConnected :: struct #align (CALLBACK_ALIGN) {
    unSessionID: RemotePlaySessionID,
}

SteamRemotePlaySessionDisconnected :: struct #align (CALLBACK_ALIGN) {
    unSessionID: RemotePlaySessionID,
}

SteamNetworkingMessagesSessionRequest :: struct #align (CALLBACK_ALIGN) {
    identityRemote: SteamNetworkingIdentity,
}

SteamNetworkingMessagesSessionFailed :: struct #align (CALLBACK_ALIGN) {
    info: SteamNetConnectionInfo,
}

SteamNetConnectionStatusChangedCallback :: struct #align (CALLBACK_ALIGN) {
    hConn:     HSteamNetConnection,
    info:      SteamNetConnectionInfo,
    eOldState: ESteamNetworkingConnectionState,
}

SteamNetAuthenticationStatus :: struct #align (CALLBACK_ALIGN) {
    eAvail:   ESteamNetworkingAvailability,
    debugMsg: [256]u8,
}

SteamRelayNetworkStatus :: struct #align (CALLBACK_ALIGN) {
    eAvail:                     ESteamNetworkingAvailability,
    bPingMeasurementInProgress: i32,
    eAvailNetworkConfig:        ESteamNetworkingAvailability,
    eAvailAnyRelay:             ESteamNetworkingAvailability,
    debugMsg:                   [256]u8,
}

GSClientApprove :: struct #align (CALLBACK_ALIGN) {
    SteamID:      CSteamID,
    OwnerSteamID: CSteamID,
}

GSClientDeny :: struct #align (CALLBACK_ALIGN) {
    SteamID:          CSteamID,
    eDenyReason:      EDenyReason,
    rgchOptionalText: [128]u8,
}

GSClientKick :: struct #align (CALLBACK_ALIGN) {
    SteamID:     CSteamID,
    eDenyReason: EDenyReason,
}

GSClientAchievementStatus :: struct #align (CALLBACK_ALIGN) {
    SteamID:        u64,
    pchAchievement: [128]u8,
    bUnlocked:      bool,
}

GSPolicyResponse :: struct #align (CALLBACK_ALIGN) {
    bSecure: u8,
}

GSGameplayStats :: struct #align (CALLBACK_ALIGN) {
    eResult:              EResult,
    nRank:                i32,
    unTotalConnects:      u32,
    unTotalMinutesPlayed: u32,
}

GSClientGroupStatus :: struct #align (CALLBACK_ALIGN) {
    SteamIDUser:  CSteamID,
    SteamIDGroup: CSteamID,
    bMember:      bool,
    bOfficer:     bool,
}

GSReputation :: struct #align (CALLBACK_ALIGN) {
    eResult:           EResult,
    unReputationScore: u32,
    bBanned:           bool,
    unBannedIP:        u32,
    usBannedPort:      u16,
    ulBannedGameID:    u64,
    unBanExpires:      u32,
}

AssociateWithClanResult :: struct #align (CALLBACK_ALIGN) {
    eResult: EResult,
}

ComputeNewPlayerCompatibilityResult :: struct #align (CALLBACK_ALIGN) {
    eResult:                           EResult,
    cPlayersThatDontLikeCandidate:     i32,
    cPlayersThatCandidateDoesntLike:   i32,
    cClanPlayersThatDontLikeCandidate: i32,
    SteamIDCandidate:                  CSteamID,
}

GSStatsReceived :: struct #align (CALLBACK_ALIGN) {
    eResult:     EResult,
    steamIDUser: CSteamID,
}

GSStatsStored :: struct #align (CALLBACK_ALIGN) {
    eResult:     EResult,
    steamIDUser: CSteamID,
}

GSStatsUnloaded :: struct #align (CALLBACK_ALIGN) {
    steamIDUser: CSteamID,
}

SteamNetworkingFakeIPResult :: struct #align (CALLBACK_ALIGN) {
    eResult:  EResult,
    identity: SteamNetworkingIdentity,
    unIP:     u32,
    unPorts:  [8]u16,
}

// -----
// Enums
// -----

CGameID_EGameIDType :: enum i32 {
    App      = 0,
    GameMod  = 1,
    Shortcut = 2,
    P2P      = 3,
}

ESteamIPType :: enum i32 {
    IPv4 = 0,
    IPv6 = 1,
}

EUniverse :: enum i32 {
    Invalid  = 0,
    Public   = 1,
    Beta     = 2,
    Internal = 3,
    Dev      = 4,
    Max      = 5,
}

EResult :: enum i32 {
    None                                    = 0,
    OK                                      = 1,
    Fail                                    = 2,
    NoConnection                            = 3,
    InvalidPassword                         = 5,
    LoggedInElsewhere                       = 6,
    InvalidProtocolVer                      = 7,
    InvalidParam                            = 8,
    FileNotFound                            = 9,
    Busy                                    = 10,
    InvalidState                            = 11,
    InvalidName                             = 12,
    InvalidEmail                            = 13,
    DuplicateName                           = 14,
    AccessDenied                            = 15,
    Timeout                                 = 16,
    Banned                                  = 17,
    AccountNotFound                         = 18,
    InvalidSteamID                          = 19,
    ServiceUnavailable                      = 20,
    NotLoggedOn                             = 21,
    Pending                                 = 22,
    EncryptionFailure                       = 23,
    InsufficientPrivilege                   = 24,
    LimitExceeded                           = 25,
    Revoked                                 = 26,
    Expired                                 = 27,
    AlreadyRedeemed                         = 28,
    DuplicateRequest                        = 29,
    AlreadyOwned                            = 30,
    IPNotFound                              = 31,
    PersistFailed                           = 32,
    LockingFailed                           = 33,
    LogonSessionReplaced                    = 34,
    ConnectFailed                           = 35,
    HandshakeFailed                         = 36,
    IOFailure                               = 37,
    RemoteDisconnect                        = 38,
    ShoppingCartNotFound                    = 39,
    Blocked                                 = 40,
    Ignored                                 = 41,
    NoMatch                                 = 42,
    AccountDisabled                         = 43,
    ServiceReadOnly                         = 44,
    AccountNotFeatured                      = 45,
    AdministratorOK                         = 46,
    ContentVersion                          = 47,
    TryAnotherCM                            = 48,
    PasswordRequiredToKickSession           = 49,
    AlreadyLoggedInElsewhere                = 50,
    Suspended                               = 51,
    Cancelled                               = 52,
    DataCorruption                          = 53,
    DiskFull                                = 54,
    RemoteCallFailed                        = 55,
    PasswordUnset                           = 56,
    ExternalAccountUnlinked                 = 57,
    PSNTicketInvalid                        = 58,
    ExternalAccountAlreadyLinked            = 59,
    RemoteFileConflict                      = 60,
    IllegalPassword                         = 61,
    SameAsPreviousValue                     = 62,
    AccountLogonDenied                      = 63,
    CannotUseOldPassword                    = 64,
    InvalidLoginAuthCode                    = 65,
    AccountLogonDeniedNoMail                = 66,
    HardwareNotCapableOfIPT                 = 67,
    IPTInitError                            = 68,
    ParentalControlRestricted               = 69,
    FacebookQueryError                      = 70,
    ExpiredLoginAuthCode                    = 71,
    IPLoginRestrictionFailed                = 72,
    AccountLockedDown                       = 73,
    AccountLogonDeniedVerifiedEmailRequired = 74,
    NoMatchingURL                           = 75,
    BadResponse                             = 76,
    RequirePasswordReEntry                  = 77,
    ValueOutOfRange                         = 78,
    UnexpectedError                         = 79,
    Disabled                                = 80,
    InvalidCEGSubmission                    = 81,
    RestrictedDevice                        = 82,
    RegionLocked                            = 83,
    RateLimitExceeded                       = 84,
    AccountLoginDeniedNeedTwoFactor         = 85,
    ItemDeleted                             = 86,
    AccountLoginDeniedThrottle              = 87,
    TwoFactorCodeMismatch                   = 88,
    TwoFactorActivationCodeMismatch         = 89,
    AccountAssociatedToMultiplePartners     = 90,
    NotModified                             = 91,
    NoMobileDevice                          = 92,
    TimeNotSynced                           = 93,
    SmsCodeFailed                           = 94,
    AccountLimitExceeded                    = 95,
    AccountActivityLimitExceeded            = 96,
    PhoneActivityLimitExceeded              = 97,
    RefundToWallet                          = 98,
    EmailSendFailure                        = 99,
    NotSettled                              = 100,
    NeedCaptcha                             = 101,
    GSLTDenied                              = 102,
    GSOwnerDenied                           = 103,
    InvalidItemType                         = 104,
    IPBanned                                = 105,
    GSLTExpired                             = 106,
    InsufficientFunds                       = 107,
    TooManyPending                          = 108,
    NoSiteLicensesFound                     = 109,
    WGNetworkSendExceeded                   = 110,
    AccountNotFriends                       = 111,
    LimitedUserAccount                      = 112,
    CantRemoveItem                          = 113,
    AccountDeleted                          = 114,
    ExistingUserCancelledLicense            = 115,
    CommunityCooldown                       = 116,
    NoLauncherSpecified                     = 117,
    MustAgreeToSSA                          = 118,
    LauncherMigrated                        = 119,
    SteamRealmMismatch                      = 120,
    InvalidSignature                        = 121,
    ParseFailure                            = 122,
    NoVerifiedPhone                         = 123,
    InsufficientBattery                     = 124,
    ChargerRequired                         = 125,
    CachedCredentialInvalid                 = 126,
    PhoneNumberIsVOIP                       = 127,
}

EVoiceResult :: enum i32 {
    OK                   = 0,
    NotInitialized       = 1,
    NotRecording         = 2,
    NoData               = 3,
    BufferTooSmall       = 4,
    DataCorrupted        = 5,
    Restricted           = 6,
    UnsupportedCodec     = 7,
    ReceiverOutOfDate    = 8,
    ReceiverDidNotAnswer = 9,
}

EDenyReason :: enum i32 {
    Invalid                 = 0,
    InvalidVersion          = 1,
    Generic                 = 2,
    NotLoggedOn             = 3,
    NoLicense               = 4,
    Cheater                 = 5,
    LoggedInElseWhere       = 6,
    UnknownText             = 7,
    IncompatibleAnticheat   = 8,
    MemoryCorruption        = 9,
    IncompatibleSoftware    = 10,
    SteamConnectionLost     = 11,
    SteamConnectionError    = 12,
    SteamResponseTimedOut   = 13,
    SteamValidationStalled  = 14,
    SteamOwnerLeftGuestUser = 15,
}

EBeginAuthSessionResult :: enum i32 {
    OK               = 0,
    InvalidTicket    = 1,
    DuplicateRequest = 2,
    InvalidVersion   = 3,
    GameMismatch     = 4,
    ExpiredTicket    = 5,
}

EAuthSessionResponse :: enum i32 {
    OK                           = 0,
    UserNotConnectedToSteam      = 1,
    NoLicenseOrExpired           = 2,
    VACBanned                    = 3,
    LoggedInElseWhere            = 4,
    VACCheckTimedOut             = 5,
    AuthTicketCanceled           = 6,
    AuthTicketInvalidAlreadyUsed = 7,
    AuthTicketInvalid            = 8,
    PublisherIssuedBan           = 9,
}

EUserHasLicenseForAppResult :: enum i32 {
    HasLicense         = 0,
    DoesNotHaveLicense = 1,
    NoAuth             = 2,
}

EAccountType :: enum i32 {
    Invalid        = 0,
    Individual     = 1,
    Multiseat      = 2,
    GameServer     = 3,
    AnonGameServer = 4,
    Pending        = 5,
    ContentServer  = 6,
    Clan           = 7,
    Chat           = 8,
    ConsoleUser    = 9,
    AnonUser       = 10,
    Max            = 11,
}

EChatEntryType :: enum i32 {
    Invalid          = 0,
    ChatMsg          = 1,
    Typing           = 2,
    InviteGame       = 3,
    Emote            = 4,
    LeftConversation = 6,
    Entered          = 7,
    WasKicked        = 8,
    WasBanned        = 9,
    Disconnected     = 10,
    HistoricalChat   = 11,
    LinkBlocked      = 14,
}

EChatRoomEnterResponse :: enum i32 {
    Success           = 1,
    DoesntExist       = 2,
    NotAllowed        = 3,
    Full              = 4,
    Error             = 5,
    Banned            = 6,
    Limited           = 7,
    ClanDisabled      = 8,
    CommunityBan      = 9,
    MemberBlockedYou  = 10,
    YouBlockedMember  = 11,
    RatelimitExceeded = 15,
}

EChatSteamIDInstanceFlags :: enum i32 {
    AccountInstanceMask  = 4095,
    InstanceFlagClan     = 524288,
    InstanceFlagLobby    = 262144,
    InstanceFlagMMSLobby = 131072,
}

ENotificationPosition :: enum i32 {
    TopLeft     = 0,
    TopRight    = 1,
    BottomLeft  = 2,
    BottomRight = 3,
}

EBroadcastUploadResult :: enum i32 {
    None              = 0,
    OK                = 1,
    InitFailed        = 2,
    FrameFailed       = 3,
    Timeout           = 4,
    BandwidthExceeded = 5,
    LowFPS            = 6,
    MissingKeyFrames  = 7,
    NoConnection      = 8,
    RelayFailed       = 9,
    SettingsChanged   = 10,
    MissingAudio      = 11,
    TooFarBehind      = 12,
    TranscodeBehind   = 13,
    NotAllowedToPlay  = 14,
    Busy              = 15,
    Banned            = 16,
    AlreadyActive     = 17,
    ForcedOff         = 18,
    AudioBehind       = 19,
    Shutdown          = 20,
    Disconnect        = 21,
    VideoInitFailed   = 22,
    AudioInitFailed   = 23,
}

EMarketNotAllowedReasonFlags :: enum i32 {
    None                             = 0,
    TemporaryFailure                 = 1,
    AccountDisabled                  = 2,
    AccountLockedDown                = 4,
    AccountLimited                   = 8,
    TradeBanned                      = 16,
    AccountNotTrusted                = 32,
    SteamGuardNotEnabled             = 64,
    SteamGuardOnlyRecentlyEnabled    = 128,
    RecentPasswordReset              = 256,
    NewPaymentMethod                 = 512,
    InvalidCookie                    = 1024,
    UsingNewDevice                   = 2048,
    RecentSelfRefund                 = 4096,
    NewPaymentMethodCannotBeVerified = 8192,
    NoRecentPurchases                = 16384,
    AcceptedWalletGift               = 32768,
}

EDurationControlProgress :: enum i32 {
    Progress_Full  = 0,
    Progress_Half  = 1,
    Progress_None  = 2,
    ExitSoon_3h    = 3,
    ExitSoon_5h    = 4,
    ExitSoon_Night = 5,
}

EDurationControlNotification :: enum i32 {
    None           = 0,
    OneHour        = 1,
    ThreeHours     = 2,
    HalfProgress   = 3,
    NoProgress     = 4,
    ExitSoon_3h    = 5,
    ExitSoon_5h    = 6,
    ExitSoon_Night = 7,
}

EDurationControlOnlineState :: enum i32 {
    Invalid       = 0,
    Offline       = 1,
    Online        = 2,
    OnlineHighPri = 3,
}

EGameSearchErrorCode :: enum i32 {
    OK                                = 1,
    Failed_Search_Already_In_Progress = 2,
    Failed_No_Search_In_Progress      = 3,
    Failed_Not_Lobby_Leader           = 4,
    Failed_No_Host_Available          = 5,
    Failed_Search_Params_Invalid      = 6,
    Failed_Offline                    = 7,
    Failed_NotAuthorized              = 8,
    Failed_Unknown_Error              = 9,
}

EPlayerResult :: enum i32 {
    FailedToConnect = 1,
    Abandoned       = 2,
    Kicked          = 3,
    Incomplete      = 4,
    Completed       = 5,
}

ESteamIPv6ConnectivityProtocol :: enum i32 {
    Invalid = 0,
    HTTP    = 1,
    UDP     = 2,
}

ESteamIPv6ConnectivityState :: enum i32 {
    Unknown = 0,
    Good    = 1,
    Bad     = 2,
}

EFriendRelationship :: enum i32 {
    None                 = 0,
    Blocked              = 1,
    RequestRecipient     = 2,
    Friend               = 3,
    RequestInitiator     = 4,
    Ignored              = 5,
    IgnoredFriend        = 6,
    Suggested_DEPRECATED = 7,
    Max                  = 8,
}

EPersonaState :: enum i32 {
    Offline        = 0,
    Online         = 1,
    Busy           = 2,
    Away           = 3,
    Snooze         = 4,
    LookingToTrade = 5,
    LookingToPlay  = 6,
    Invisible      = 7,
    Max            = 8,
}

EFriendFlags :: enum i32 {
    None                 = 0,
    Blocked              = 1,
    FriendshipRequested  = 2,
    Immediate            = 4,
    ClanMember           = 8,
    OnGameServer         = 16,
    RequestingFriendship = 128,
    RequestingInfo       = 256,
    Ignored              = 512,
    IgnoredFriend        = 1024,
    ChatMember           = 4096,
    All                  = 65535,
}

EUserRestriction :: enum i32 {
    None        = 0,
    Unknown     = 1,
    AnyChat     = 2,
    VoiceChat   = 4,
    GroupChat   = 8,
    Rating      = 16,
    GameInvites = 32,
    Trading     = 64,
}

EOverlayToStoreFlag :: enum i32 {
    None             = 0,
    AddToCart        = 1,
    AddToCartAndShow = 2,
}

EActivateGameOverlayToWebPageMode :: enum i32 {
    Default = 0,
    Modal   = 1,
}

ECommunityProfileItemType :: enum i32 {
    AnimatedAvatar        = 0,
    AvatarFrame           = 1,
    ProfileModifier       = 2,
    ProfileBackground     = 3,
    MiniProfileBackground = 4,
}

ECommunityProfileItemProperty :: enum i32 {
    ImageSmall     = 0,
    ImageLarge     = 1,
    InternalName   = 2,
    Title          = 3,
    Description    = 4,
    AppID          = 5,
    TypeID         = 6,
    Class          = 7,
    MovieWebM      = 8,
    MovieMP4       = 9,
    MovieWebMSmall = 10,
    MovieMP4Small  = 11,
}

// used in PersonaStateChange_t::m_nChangeFlags to describe what's changed about a user
// these flags describe what the client has learned has changed recently, so on startup you'll see a name, avatar & relationship change for every friend
EPersonaChange :: enum i32 {
    Name                = 1,
    Status              = 2,
    ComeOnline          = 4,
    GoneOffline         = 8,
    GamePlayed          = 16,
    GameServer          = 32,
    Avatar              = 64,
    JoinedSource        = 128,
    LeftSource          = 256,
    RelationshipChanged = 512,
    NameFirstSet        = 1024,
    Broadcast           = 2048,
    Nickname            = 4096,
    SteamLevel          = 8192,
    RichPresence        = 16384,
}

ESteamAPICallFailure :: enum i32 {
    None               = -1,
    SteamGone          = 0,
    NetworkFailure     = 1,
    InvalidHandle      = 2,
    MismatchedCallback = 3,
}

EGamepadTextInputMode :: enum i32 {
    Normal   = 0,
    Password = 1,
}

EGamepadTextInputLineMode :: enum i32 {
    SingleLine    = 0,
    MultipleLines = 1,
}

EFloatingGamepadTextInputMode :: enum i32 {
    SingleLine    = 0,
    MultipleLines = 1,
    Email         = 2,
    Numeric       = 3,
}

ETextFilteringContext :: enum i32 {
    Unknown     = 0,
    GameContent = 1,
    Chat        = 2,
    Name        = 3,
}

ECheckFileSignature :: enum i32 {
    InvalidSignature             = 0,
    ValidSignature               = 1,
    FileNotFound                 = 2,
    NoSignaturesFoundForThisApp  = 3,
    NoSignaturesFoundForThisFile = 4,
}

EMatchMakingServerResponse :: enum i32 {
    ServerResponded               = 0,
    ServerFailedToRespond         = 1,
    NoServersListedOnMasterServer = 2,
}

ELobbyType :: enum i32 {
    Private       = 0,
    FriendsOnly   = 1,
    Public        = 2,
    Invisible     = 3,
    PrivateUnique = 4,
}

ELobbyComparison :: enum i32 {
    EqualToOrLessThan    = -2,
    LessThan             = -1,
    Equal                = 0,
    GreaterThan          = 1,
    EqualToOrGreaterThan = 2,
    NotEqual             = 3,
}

ELobbyDistanceFilter :: enum i32 {
    Close     = 0,
    Default   = 1,
    Far       = 2,
    Worldwide = 3,
}

EChatMemberStateChange :: enum i32 {
    Entered      = 1,
    Left         = 2,
    Disconnected = 4,
    Kicked       = 8,
    Banned       = 16,
}

ESteamPartyBeaconLocationType :: enum i32 {
    Invalid   = 0,
    ChatGroup = 1,
    Max       = 2,
}

ESteamPartyBeaconLocationData :: enum i32 {
    Invalid       = 0,
    Name          = 1,
    IconURLSmall  = 2,
    IconURLMedium = 3,
    IconURLLarge  = 4,
}

ERemoteStoragePlatform :: enum i32 {
    None    = 0,
    Windows = 1,
    OSX     = 2,
    PS3     = 4,
    Linux   = 8,
    Switch  = 16,
    Android = 32,
    IOS     = 64,
    All     = -1,
}

ERemoteStoragePublishedFileVisibility :: enum i32 {
    Public      = 0,
    FriendsOnly = 1,
    Private     = 2,
    Unlisted    = 3,
}

EWorkshopFileType :: enum i32 {
    First                  = 0,
    Community              = 0,
    Microtransaction       = 1,
    Collection             = 2,
    Art                    = 3,
    Video                  = 4,
    Screenshot             = 5,
    Game                   = 6,
    Software               = 7,
    Concept                = 8,
    WebGuide               = 9,
    IntegratedGuide        = 10,
    Merch                  = 11,
    ControllerBinding      = 12,
    SteamworksAccessInvite = 13,
    SteamVideo             = 14,
    GameManagedItem        = 15,
    Max                    = 16,
}

EWorkshopVote :: enum i32 {
    Unvoted = 0,
    For     = 1,
    Against = 2,
    Later   = 3,
}

EWorkshopFileAction :: enum i32 {
    Played    = 0,
    Completed = 1,
}

EWorkshopEnumerationType :: enum i32 {
    RankedByVote            = 0,
    Recent                  = 1,
    Trending                = 2,
    FavoritesOfFriends      = 3,
    VotedByFriends          = 4,
    ContentByFriends        = 5,
    RecentFromFollowedUsers = 6,
}

EWorkshopVideoProvider :: enum i32 {
    None    = 0,
    Youtube = 1,
}

EUGCReadAction :: enum i32 {
    ContinueReadingUntilFinished = 0,
    ContinueReading              = 1,
    Close                        = 2,
}

ERemoteStorageLocalFileChange :: enum i32 {
    Invalid     = 0,
    FileUpdated = 1,
    FileDeleted = 2,
}

ERemoteStorageFilePathType :: enum i32 {
    Invalid     = 0,
    Absolute    = 1,
    APIFilename = 2,
}

ELeaderboardDataRequest :: enum i32 {
    Global           = 0,
    GlobalAroundUser = 1,
    Friends          = 2,
    Users            = 3,
}

ELeaderboardSortMethod :: enum i32 {
    MethodNone       = 0,
    MethodAscending  = 1,
    MethodDescending = 2,
}

ELeaderboardDisplayType :: enum i32 {
    None             = 0,
    Numeric          = 1,
    TimeSeconds      = 2,
    TimeMilliSeconds = 3,
}

ELeaderboardUploadScoreMethod :: enum i32 {
    None        = 0,
    KeepBest    = 1,
    ForceUpdate = 2,
}

ERegisterActivationCodeResult :: enum i32 {
    OK                = 0,
    Fail              = 1,
    AlreadyRegistered = 2,
    Timeout           = 3,
    AlreadyOwned      = 4,
}

EP2PSessionError :: enum i32 {
    None                           = 0,
    NoRightsToApp                  = 2,
    Timeout                        = 4,
    NotRunningApp_DELETED          = 1,
    DestinationNotLoggedIn_DELETED = 3,
    Max                            = 5,
}

EP2PSend :: enum i32 {
    Unreliable            = 0,
    UnreliableNoDelay     = 1,
    Reliable              = 2,
    ReliableWithBuffering = 3,
}

ESNetSocketState :: enum i32 {
    Invalid                  = 0,
    Connected                = 1,
    Initiated                = 10,
    LocalCandidatesFound     = 11,
    ReceivedRemoteCandidates = 12,
    ChallengeHandshake       = 15,
    Disconnecting            = 21,
    LocalDisconnect          = 22,
    TimeoutDuringConnect     = 23,
    RemoteEndDisconnected    = 24,
    ConnectionBroken         = 25,
}

ESNetSocketConnectionType :: enum i32 {
    NotConnected = 0,
    UDP          = 1,
    UDPRelay     = 2,
}

EVRScreenshotType :: enum i32 {
    None           = 0,
    Mono           = 1,
    Stereo         = 2,
    MonoCubemap    = 3,
    MonoPanorama   = 4,
    StereoPanorama = 5,
}

AudioPlaybacStatus :: enum i32 {
    Undefined = 0,
    Playing   = 1,
    Paused    = 2,
    Idle      = 3,
}

EHTTPMethod :: enum i32 {
    Invalid = 0,
    GET     = 1,
    HEAD    = 2,
    POST    = 3,
    PUT     = 4,
    DELETE  = 5,
    OPTIONS = 6,
    PATCH   = 7,
}

EHTTPStatusCode :: enum i32 {
    CodeInvalid                         = 0,
    Code100Continue                     = 100,
    Code101SwitchingProtocols           = 101,
    Code200OK                           = 200,
    Code201Created                      = 201,
    Code202Accepted                     = 202,
    Code203NonAuthoritative             = 203,
    Code204NoContent                    = 204,
    Code205ResetContent                 = 205,
    Code206PartialContent               = 206,
    Code300MultipleChoices              = 300,
    Code301MovedPermanently             = 301,
    Code302Found                        = 302,
    Code303SeeOther                     = 303,
    Code304NotModified                  = 304,
    Code305UseProxy                     = 305,
    Code307TemporaryRedirect            = 307,
    Code400BadRequest                   = 400,
    Code401Unauthorized                 = 401,
    Code402PaymentRequired              = 402,
    Code403Forbidden                    = 403,
    Code404NotFound                     = 404,
    Code405MethodNotAllowed             = 405,
    Code406NotAcceptable                = 406,
    Code407ProxyAuthRequired            = 407,
    Code408RequestTimeout               = 408,
    Code409Conflict                     = 409,
    Code410Gone                         = 410,
    Code411LengthRequired               = 411,
    Code412PreconditionFailed           = 412,
    Code413RequestEntityTooLarge        = 413,
    Code414RequestURITooLong            = 414,
    Code415UnsupportedMediaType         = 415,
    Code416RequestedRangeNotSatisfiable = 416,
    Code417ExpectationFailed            = 417,
    Code4xxUnknown                      = 418,
    Code429TooManyRequests              = 429,
    Code444ConnectionClosed             = 444,
    Code500InternalServerError          = 500,
    Code501NotImplemented               = 501,
    Code502BadGateway                   = 502,
    Code503ServiceUnavailable           = 503,
    Code504GatewayTimeout               = 504,
    Code505HTTPVersionNotSupported      = 505,
    Code5xxUnknown                      = 599,
}

EInputSourceMode :: enum i32 {
    None           = 0,
    Dpad           = 1,
    Buttons        = 2,
    FourButtons    = 3,
    AbsoluteMouse  = 4,
    RelativeMouse  = 5,
    JoystickMove   = 6,
    JoystickMouse  = 7,
    JoystickCamera = 8,
    ScrollWheel    = 9,
    Trigger        = 10,
    TouchMenu      = 11,
    MouseJoystick  = 12,
    MouseRegion    = 13,
    RadialMenu     = 14,
    SingleButton   = 15,
    Switches       = 16,
}

EInputActionOrigin :: enum i32 {
    None                               = 0,
    SteamController_A                  = 1,
    SteamController_B                  = 2,
    SteamController_X                  = 3,
    SteamController_Y                  = 4,
    SteamController_LeftBumper         = 5,
    SteamController_RightBumper        = 6,
    SteamController_LeftGrip           = 7,
    SteamController_RightGrip          = 8,
    SteamController_Start              = 9,
    SteamController_Back               = 10,
    SteamController_LeftPad_Touch      = 11,
    SteamController_LeftPad_Swipe      = 12,
    SteamController_LeftPad_Click      = 13,
    SteamController_LeftPad_DPadNorth  = 14,
    SteamController_LeftPad_DPadSouth  = 15,
    SteamController_LeftPad_DPadWest   = 16,
    SteamController_LeftPad_DPadEast   = 17,
    SteamController_RightPad_Touch     = 18,
    SteamController_RightPad_Swipe     = 19,
    SteamController_RightPad_Click     = 20,
    SteamController_RightPad_DPadNorth = 21,
    SteamController_RightPad_DPadSouth = 22,
    SteamController_RightPad_DPadWest  = 23,
    SteamController_RightPad_DPadEast  = 24,
    SteamController_LeftTrigger_Pull   = 25,
    SteamController_LeftTrigger_Click  = 26,
    SteamController_RightTrigger_Pull  = 27,
    SteamController_RightTrigger_Click = 28,
    SteamController_LeftSticMove       = 29,
    SteamController_LeftSticClick      = 30,
    SteamController_LeftSticDPadNorth  = 31,
    SteamController_LeftSticDPadSouth  = 32,
    SteamController_LeftSticDPadWest   = 33,
    SteamController_LeftSticDPadEast   = 34,
    SteamController_Gyro_Move          = 35,
    SteamController_Gyro_Pitch         = 36,
    SteamController_Gyro_Yaw           = 37,
    SteamController_Gyro_Roll          = 38,
    SteamController_Reserved0          = 39,
    SteamController_Reserved1          = 40,
    SteamController_Reserved2          = 41,
    SteamController_Reserved3          = 42,
    SteamController_Reserved4          = 43,
    SteamController_Reserved5          = 44,
    SteamController_Reserved6          = 45,
    SteamController_Reserved7          = 46,
    SteamController_Reserved8          = 47,
    SteamController_Reserved9          = 48,
    SteamController_Reserved10         = 49,
    PS4_X                              = 50,
    PS4_Circle                         = 51,
    PS4_Triangle                       = 52,
    PS4_Square                         = 53,
    PS4_LeftBumper                     = 54,
    PS4_RightBumper                    = 55,
    PS4_Options                        = 56,
    PS4_Share                          = 57,
    PS4_LeftPad_Touch                  = 58,
    PS4_LeftPad_Swipe                  = 59,
    PS4_LeftPad_Click                  = 60,
    PS4_LeftPad_DPadNorth              = 61,
    PS4_LeftPad_DPadSouth              = 62,
    PS4_LeftPad_DPadWest               = 63,
    PS4_LeftPad_DPadEast               = 64,
    PS4_RightPad_Touch                 = 65,
    PS4_RightPad_Swipe                 = 66,
    PS4_RightPad_Click                 = 67,
    PS4_RightPad_DPadNorth             = 68,
    PS4_RightPad_DPadSouth             = 69,
    PS4_RightPad_DPadWest              = 70,
    PS4_RightPad_DPadEast              = 71,
    PS4_CenterPad_Touch                = 72,
    PS4_CenterPad_Swipe                = 73,
    PS4_CenterPad_Click                = 74,
    PS4_CenterPad_DPadNorth            = 75,
    PS4_CenterPad_DPadSouth            = 76,
    PS4_CenterPad_DPadWest             = 77,
    PS4_CenterPad_DPadEast             = 78,
    PS4_LeftTrigger_Pull               = 79,
    PS4_LeftTrigger_Click              = 80,
    PS4_RightTrigger_Pull              = 81,
    PS4_RightTrigger_Click             = 82,
    PS4_LeftSticMove                   = 83,
    PS4_LeftSticClick                  = 84,
    PS4_LeftSticDPadNorth              = 85,
    PS4_LeftSticDPadSouth              = 86,
    PS4_LeftSticDPadWest               = 87,
    PS4_LeftSticDPadEast               = 88,
    PS4_RightSticMove                  = 89,
    PS4_RightSticClick                 = 90,
    PS4_RightSticDPadNorth             = 91,
    PS4_RightSticDPadSouth             = 92,
    PS4_RightSticDPadWest              = 93,
    PS4_RightSticDPadEast              = 94,
    PS4_DPad_North                     = 95,
    PS4_DPad_South                     = 96,
    PS4_DPad_West                      = 97,
    PS4_DPad_East                      = 98,
    PS4_Gyro_Move                      = 99,
    PS4_Gyro_Pitch                     = 100,
    PS4_Gyro_Yaw                       = 101,
    PS4_Gyro_Roll                      = 102,
    PS4_DPad_Move                      = 103,
    PS4_Reserved1                      = 104,
    PS4_Reserved2                      = 105,
    PS4_Reserved3                      = 106,
    PS4_Reserved4                      = 107,
    PS4_Reserved5                      = 108,
    PS4_Reserved6                      = 109,
    PS4_Reserved7                      = 110,
    PS4_Reserved8                      = 111,
    PS4_Reserved9                      = 112,
    PS4_Reserved10                     = 113,
    XBoxOne_A                          = 114,
    XBoxOne_B                          = 115,
    XBoxOne_X                          = 116,
    XBoxOne_Y                          = 117,
    XBoxOne_LeftBumper                 = 118,
    XBoxOne_RightBumper                = 119,
    XBoxOne_Menu                       = 120,
    XBoxOne_View                       = 121,
    XBoxOne_LeftTrigger_Pull           = 122,
    XBoxOne_LeftTrigger_Click          = 123,
    XBoxOne_RightTrigger_Pull          = 124,
    XBoxOne_RightTrigger_Click         = 125,
    XBoxOne_LeftSticMove               = 126,
    XBoxOne_LeftSticClick              = 127,
    XBoxOne_LeftSticDPadNorth          = 128,
    XBoxOne_LeftSticDPadSouth          = 129,
    XBoxOne_LeftSticDPadWest           = 130,
    XBoxOne_LeftSticDPadEast           = 131,
    XBoxOne_RightSticMove              = 132,
    XBoxOne_RightSticClick             = 133,
    XBoxOne_RightSticDPadNorth         = 134,
    XBoxOne_RightSticDPadSouth         = 135,
    XBoxOne_RightSticDPadWest          = 136,
    XBoxOne_RightSticDPadEast          = 137,
    XBoxOne_DPad_North                 = 138,
    XBoxOne_DPad_South                 = 139,
    XBoxOne_DPad_West                  = 140,
    XBoxOne_DPad_East                  = 141,
    XBoxOne_DPad_Move                  = 142,
    XBoxOne_LeftGrip_Lower             = 143,
    XBoxOne_LeftGrip_Upper             = 144,
    XBoxOne_RightGrip_Lower            = 145,
    XBoxOne_RightGrip_Upper            = 146,
    XBoxOne_Share                      = 147,
    XBoxOne_Reserved6                  = 148,
    XBoxOne_Reserved7                  = 149,
    XBoxOne_Reserved8                  = 150,
    XBoxOne_Reserved9                  = 151,
    XBoxOne_Reserved10                 = 152,
    XBox360_A                          = 153,
    XBox360_B                          = 154,
    XBox360_X                          = 155,
    XBox360_Y                          = 156,
    XBox360_LeftBumper                 = 157,
    XBox360_RightBumper                = 158,
    XBox360_Start                      = 159,
    XBox360_Back                       = 160,
    XBox360_LeftTrigger_Pull           = 161,
    XBox360_LeftTrigger_Click          = 162,
    XBox360_RightTrigger_Pull          = 163,
    XBox360_RightTrigger_Click         = 164,
    XBox360_LeftSticMove               = 165,
    XBox360_LeftSticClick              = 166,
    XBox360_LeftSticDPadNorth          = 167,
    XBox360_LeftSticDPadSouth          = 168,
    XBox360_LeftSticDPadWest           = 169,
    XBox360_LeftSticDPadEast           = 170,
    XBox360_RightSticMove              = 171,
    XBox360_RightSticClick             = 172,
    XBox360_RightSticDPadNorth         = 173,
    XBox360_RightSticDPadSouth         = 174,
    XBox360_RightSticDPadWest          = 175,
    XBox360_RightSticDPadEast          = 176,
    XBox360_DPad_North                 = 177,
    XBox360_DPad_South                 = 178,
    XBox360_DPad_West                  = 179,
    XBox360_DPad_East                  = 180,
    XBox360_DPad_Move                  = 181,
    XBox360_Reserved1                  = 182,
    XBox360_Reserved2                  = 183,
    XBox360_Reserved3                  = 184,
    XBox360_Reserved4                  = 185,
    XBox360_Reserved5                  = 186,
    XBox360_Reserved6                  = 187,
    XBox360_Reserved7                  = 188,
    XBox360_Reserved8                  = 189,
    XBox360_Reserved9                  = 190,
    XBox360_Reserved10                 = 191,
    Switch_A                           = 192,
    Switch_B                           = 193,
    Switch_X                           = 194,
    Switch_Y                           = 195,
    Switch_LeftBumper                  = 196,
    Switch_RightBumper                 = 197,
    Switch_Plus                        = 198,
    Switch_Minus                       = 199,
    Switch_Capture                     = 200,
    Switch_LeftTrigger_Pull            = 201,
    Switch_LeftTrigger_Click           = 202,
    Switch_RightTrigger_Pull           = 203,
    Switch_RightTrigger_Click          = 204,
    Switch_LeftSticMove                = 205,
    Switch_LeftSticClick               = 206,
    Switch_LeftSticDPadNorth           = 207,
    Switch_LeftSticDPadSouth           = 208,
    Switch_LeftSticDPadWest            = 209,
    Switch_LeftSticDPadEast            = 210,
    Switch_RightSticMove               = 211,
    Switch_RightSticClick              = 212,
    Switch_RightSticDPadNorth          = 213,
    Switch_RightSticDPadSouth          = 214,
    Switch_RightSticDPadWest           = 215,
    Switch_RightSticDPadEast           = 216,
    Switch_DPad_North                  = 217,
    Switch_DPad_South                  = 218,
    Switch_DPad_West                   = 219,
    Switch_DPad_East                   = 220,
    Switch_ProGyro_Move                = 221,
    Switch_ProGyro_Pitch               = 222,
    Switch_ProGyro_Yaw                 = 223,
    Switch_ProGyro_Roll                = 224,
    Switch_DPad_Move                   = 225,
    Switch_Reserved1                   = 226,
    Switch_Reserved2                   = 227,
    Switch_Reserved3                   = 228,
    Switch_Reserved4                   = 229,
    Switch_Reserved5                   = 230,
    Switch_Reserved6                   = 231,
    Switch_Reserved7                   = 232,
    Switch_Reserved8                   = 233,
    Switch_Reserved9                   = 234,
    Switch_Reserved10                  = 235,
    Switch_RightGyro_Move              = 236,
    Switch_RightGyro_Pitch             = 237,
    Switch_RightGyro_Yaw               = 238,
    Switch_RightGyro_Roll              = 239,
    Switch_LeftGyro_Move               = 240,
    Switch_LeftGyro_Pitch              = 241,
    Switch_LeftGyro_Yaw                = 242,
    Switch_LeftGyro_Roll               = 243,
    Switch_LeftGrip_Lower              = 244,
    Switch_LeftGrip_Upper              = 245,
    Switch_RightGrip_Lower             = 246,
    Switch_RightGrip_Upper             = 247,
    Switch_Reserved11                  = 248,
    Switch_Reserved12                  = 249,
    Switch_Reserved13                  = 250,
    Switch_Reserved14                  = 251,
    Switch_Reserved15                  = 252,
    Switch_Reserved16                  = 253,
    Switch_Reserved17                  = 254,
    Switch_Reserved18                  = 255,
    Switch_Reserved19                  = 256,
    Switch_Reserved20                  = 257,
    PS5_X                              = 258,
    PS5_Circle                         = 259,
    PS5_Triangle                       = 260,
    PS5_Square                         = 261,
    PS5_LeftBumper                     = 262,
    PS5_RightBumper                    = 263,
    PS5_Option                         = 264,
    PS5_Create                         = 265,
    PS5_Mute                           = 266,
    PS5_LeftPad_Touch                  = 267,
    PS5_LeftPad_Swipe                  = 268,
    PS5_LeftPad_Click                  = 269,
    PS5_LeftPad_DPadNorth              = 270,
    PS5_LeftPad_DPadSouth              = 271,
    PS5_LeftPad_DPadWest               = 272,
    PS5_LeftPad_DPadEast               = 273,
    PS5_RightPad_Touch                 = 274,
    PS5_RightPad_Swipe                 = 275,
    PS5_RightPad_Click                 = 276,
    PS5_RightPad_DPadNorth             = 277,
    PS5_RightPad_DPadSouth             = 278,
    PS5_RightPad_DPadWest              = 279,
    PS5_RightPad_DPadEast              = 280,
    PS5_CenterPad_Touch                = 281,
    PS5_CenterPad_Swipe                = 282,
    PS5_CenterPad_Click                = 283,
    PS5_CenterPad_DPadNorth            = 284,
    PS5_CenterPad_DPadSouth            = 285,
    PS5_CenterPad_DPadWest             = 286,
    PS5_CenterPad_DPadEast             = 287,
    PS5_LeftTrigger_Pull               = 288,
    PS5_LeftTrigger_Click              = 289,
    PS5_RightTrigger_Pull              = 290,
    PS5_RightTrigger_Click             = 291,
    PS5_LeftSticMove                   = 292,
    PS5_LeftSticClick                  = 293,
    PS5_LeftSticDPadNorth              = 294,
    PS5_LeftSticDPadSouth              = 295,
    PS5_LeftSticDPadWest               = 296,
    PS5_LeftSticDPadEast               = 297,
    PS5_RightSticMove                  = 298,
    PS5_RightSticClick                 = 299,
    PS5_RightSticDPadNorth             = 300,
    PS5_RightSticDPadSouth             = 301,
    PS5_RightSticDPadWest              = 302,
    PS5_RightSticDPadEast              = 303,
    PS5_DPad_North                     = 304,
    PS5_DPad_South                     = 305,
    PS5_DPad_West                      = 306,
    PS5_DPad_East                      = 307,
    PS5_Gyro_Move                      = 308,
    PS5_Gyro_Pitch                     = 309,
    PS5_Gyro_Yaw                       = 310,
    PS5_Gyro_Roll                      = 311,
    PS5_DPad_Move                      = 312,
    PS5_Reserved1                      = 313,
    PS5_Reserved2                      = 314,
    PS5_Reserved3                      = 315,
    PS5_Reserved4                      = 316,
    PS5_Reserved5                      = 317,
    PS5_Reserved6                      = 318,
    PS5_Reserved7                      = 319,
    PS5_Reserved8                      = 320,
    PS5_Reserved9                      = 321,
    PS5_Reserved10                     = 322,
    PS5_Reserved11                     = 323,
    PS5_Reserved12                     = 324,
    PS5_Reserved13                     = 325,
    PS5_Reserved14                     = 326,
    PS5_Reserved15                     = 327,
    PS5_Reserved16                     = 328,
    PS5_Reserved17                     = 329,
    PS5_Reserved18                     = 330,
    PS5_Reserved19                     = 331,
    PS5_Reserved20                     = 332,
    SteamDecA                          = 333,
    SteamDecB                          = 334,
    SteamDecX                          = 335,
    SteamDecY                          = 336,
    SteamDecL1                         = 337,
    SteamDecR1                         = 338,
    SteamDecMenu                       = 339,
    SteamDecView                       = 340,
    SteamDecLeftPad_Touch              = 341,
    SteamDecLeftPad_Swipe              = 342,
    SteamDecLeftPad_Click              = 343,
    SteamDecLeftPad_DPadNorth          = 344,
    SteamDecLeftPad_DPadSouth          = 345,
    SteamDecLeftPad_DPadWest           = 346,
    SteamDecLeftPad_DPadEast           = 347,
    SteamDecRightPad_Touch             = 348,
    SteamDecRightPad_Swipe             = 349,
    SteamDecRightPad_Click             = 350,
    SteamDecRightPad_DPadNorth         = 351,
    SteamDecRightPad_DPadSouth         = 352,
    SteamDecRightPad_DPadWest          = 353,
    SteamDecRightPad_DPadEast          = 354,
    SteamDecL2_SoftPull                = 355,
    SteamDecL2                         = 356,
    SteamDecR2_SoftPull                = 357,
    SteamDecR2                         = 358,
    SteamDecLeftSticMove               = 359,
    SteamDecL3                         = 360,
    SteamDecLeftSticDPadNorth          = 361,
    SteamDecLeftSticDPadSouth          = 362,
    SteamDecLeftSticDPadWest           = 363,
    SteamDecLeftSticDPadEast           = 364,
    SteamDecLeftSticTouch              = 365,
    SteamDecRightSticMove              = 366,
    SteamDecR3                         = 367,
    SteamDecRightSticDPadNorth         = 368,
    SteamDecRightSticDPadSouth         = 369,
    SteamDecRightSticDPadWest          = 370,
    SteamDecRightSticDPadEast          = 371,
    SteamDecRightSticTouch             = 372,
    SteamDecL4                         = 373,
    SteamDecR4                         = 374,
    SteamDecL5                         = 375,
    SteamDecR5                         = 376,
    SteamDecDPad_Move                  = 377,
    SteamDecDPad_North                 = 378,
    SteamDecDPad_South                 = 379,
    SteamDecDPad_West                  = 380,
    SteamDecDPad_East                  = 381,
    SteamDecGyro_Move                  = 382,
    SteamDecGyro_Pitch                 = 383,
    SteamDecGyro_Yaw                   = 384,
    SteamDecGyro_Roll                  = 385,
    SteamDecReserved1                  = 386,
    SteamDecReserved2                  = 387,
    SteamDecReserved3                  = 388,
    SteamDecReserved4                  = 389,
    SteamDecReserved5                  = 390,
    SteamDecReserved6                  = 391,
    SteamDecReserved7                  = 392,
    SteamDecReserved8                  = 393,
    SteamDecReserved9                  = 394,
    SteamDecReserved10                 = 395,
    SteamDecReserved11                 = 396,
    SteamDecReserved12                 = 397,
    SteamDecReserved13                 = 398,
    SteamDecReserved14                 = 399,
    SteamDecReserved15                 = 400,
    SteamDecReserved16                 = 401,
    SteamDecReserved17                 = 402,
    SteamDecReserved18                 = 403,
    SteamDecReserved19                 = 404,
    SteamDecReserved20                 = 405,
    Count                              = 406,
    MaximumPossibleValue               = 32767,
}

EXboxOrigin :: enum i32 {
    A                  = 0,
    B                  = 1,
    X                  = 2,
    Y                  = 3,
    LeftBumper         = 4,
    RightBumper        = 5,
    Menu               = 6,
    View               = 7,
    LeftTrigger_Pull   = 8,
    LeftTrigger_Click  = 9,
    RightTrigger_Pull  = 10,
    RightTrigger_Click = 11,
    LeftSticMove       = 12,
    LeftSticClick      = 13,
    LeftSticDPadNorth  = 14,
    LeftSticDPadSouth  = 15,
    LeftSticDPadWest   = 16,
    LeftSticDPadEast   = 17,
    RightSticMove      = 18,
    RightSticClick     = 19,
    RightSticDPadNorth = 20,
    RightSticDPadSouth = 21,
    RightSticDPadWest  = 22,
    RightSticDPadEast  = 23,
    DPad_North         = 24,
    DPad_South         = 25,
    DPad_West          = 26,
    DPad_East          = 27,
    Count              = 28,
}

ESteamControllerPad :: enum i32 {
    Left  = 0,
    Right = 1,
}

EControllerHapticLocation :: enum i32 {
    Left  = 1,
    Right = 2,
    Both  = 3,
}

EControllerHapticType :: enum i32 {
    Off   = 0,
    Tick  = 1,
    Click = 2,
}

ESteamInputType :: enum i32 {
    Unknown              = 0,
    SteamController      = 1,
    XBox360Controller    = 2,
    XBoxOneController    = 3,
    GenericGamepad       = 4,
    PS4Controller        = 5,
    AppleMFiController   = 6,
    AndroidController    = 7,
    SwitchJoyConPair     = 8,
    SwitchJoyConSingle   = 9,
    SwitchProController  = 10,
    MobileTouch          = 11,
    PS3Controller        = 12,
    PS5Controller        = 13,
    SteamDeckController  = 14,
    Count                = 15,
    MaximumPossibleValue = 255,
}

ESteamInputConfigurationEnableType :: enum i32 {
    None        = 0,
    Playstation = 1,
    Xbox        = 2,
    Generic     = 4,
    Switch      = 8,
}

ESteamInputLEDFlag :: enum i32 {
    SetColor           = 0,
    RestoreUserDefault = 1,
}

ESteamInputGlyphSize :: enum i32 {
    Small  = 0,
    Medium = 1,
    Large  = 2,
    Count  = 3,
}

ESteamInputGlyphStyle :: enum i32 {
    Knockout         = 0,
    Light            = 1,
    Dark             = 2,
    NeutralColorABXY = 16,
    SolidABXY        = 32,
}

ESteamInputActionEventType :: enum i32 {
    DigitalAction = 0,
    AnalogAction  = 1,
}

EControllerActionOrigin :: enum i32 {
    None                             = 0,
    A                                = 1,
    B                                = 2,
    X                                = 3,
    Y                                = 4,
    LeftBumper                       = 5,
    RightBumper                      = 6,
    LeftGrip                         = 7,
    RightGrip                        = 8,
    Start                            = 9,
    Back                             = 10,
    LeftPad_Touch                    = 11,
    LeftPad_Swipe                    = 12,
    LeftPad_Click                    = 13,
    LeftPad_DPadNorth                = 14,
    LeftPad_DPadSouth                = 15,
    LeftPad_DPadWest                 = 16,
    LeftPad_DPadEast                 = 17,
    RightPad_Touch                   = 18,
    RightPad_Swipe                   = 19,
    RightPad_Click                   = 20,
    RightPad_DPadNorth               = 21,
    RightPad_DPadSouth               = 22,
    RightPad_DPadWest                = 23,
    RightPad_DPadEast                = 24,
    LeftTrigger_Pull                 = 25,
    LeftTrigger_Click                = 26,
    RightTrigger_Pull                = 27,
    RightTrigger_Click               = 28,
    LeftSticMove                     = 29,
    LeftSticClick                    = 30,
    LeftSticDPadNorth                = 31,
    LeftSticDPadSouth                = 32,
    LeftSticDPadWest                 = 33,
    LeftSticDPadEast                 = 34,
    Gyro_Move                        = 35,
    Gyro_Pitch                       = 36,
    Gyro_Yaw                         = 37,
    Gyro_Roll                        = 38,
    PS4_X                            = 39,
    PS4_Circle                       = 40,
    PS4_Triangle                     = 41,
    PS4_Square                       = 42,
    PS4_LeftBumper                   = 43,
    PS4_RightBumper                  = 44,
    PS4_Options                      = 45,
    PS4_Share                        = 46,
    PS4_LeftPad_Touch                = 47,
    PS4_LeftPad_Swipe                = 48,
    PS4_LeftPad_Click                = 49,
    PS4_LeftPad_DPadNorth            = 50,
    PS4_LeftPad_DPadSouth            = 51,
    PS4_LeftPad_DPadWest             = 52,
    PS4_LeftPad_DPadEast             = 53,
    PS4_RightPad_Touch               = 54,
    PS4_RightPad_Swipe               = 55,
    PS4_RightPad_Click               = 56,
    PS4_RightPad_DPadNorth           = 57,
    PS4_RightPad_DPadSouth           = 58,
    PS4_RightPad_DPadWest            = 59,
    PS4_RightPad_DPadEast            = 60,
    PS4_CenterPad_Touch              = 61,
    PS4_CenterPad_Swipe              = 62,
    PS4_CenterPad_Click              = 63,
    PS4_CenterPad_DPadNorth          = 64,
    PS4_CenterPad_DPadSouth          = 65,
    PS4_CenterPad_DPadWest           = 66,
    PS4_CenterPad_DPadEast           = 67,
    PS4_LeftTrigger_Pull             = 68,
    PS4_LeftTrigger_Click            = 69,
    PS4_RightTrigger_Pull            = 70,
    PS4_RightTrigger_Click           = 71,
    PS4_LeftSticMove                 = 72,
    PS4_LeftSticClick                = 73,
    PS4_LeftSticDPadNorth            = 74,
    PS4_LeftSticDPadSouth            = 75,
    PS4_LeftSticDPadWest             = 76,
    PS4_LeftSticDPadEast             = 77,
    PS4_RightSticMove                = 78,
    PS4_RightSticClick               = 79,
    PS4_RightSticDPadNorth           = 80,
    PS4_RightSticDPadSouth           = 81,
    PS4_RightSticDPadWest            = 82,
    PS4_RightSticDPadEast            = 83,
    PS4_DPad_North                   = 84,
    PS4_DPad_South                   = 85,
    PS4_DPad_West                    = 86,
    PS4_DPad_East                    = 87,
    PS4_Gyro_Move                    = 88,
    PS4_Gyro_Pitch                   = 89,
    PS4_Gyro_Yaw                     = 90,
    PS4_Gyro_Roll                    = 91,
    XBoxOne_A                        = 92,
    XBoxOne_B                        = 93,
    XBoxOne_X                        = 94,
    XBoxOne_Y                        = 95,
    XBoxOne_LeftBumper               = 96,
    XBoxOne_RightBumper              = 97,
    XBoxOne_Menu                     = 98,
    XBoxOne_View                     = 99,
    XBoxOne_LeftTrigger_Pull         = 100,
    XBoxOne_LeftTrigger_Click        = 101,
    XBoxOne_RightTrigger_Pull        = 102,
    XBoxOne_RightTrigger_Click       = 103,
    XBoxOne_LeftSticMove             = 104,
    XBoxOne_LeftSticClick            = 105,
    XBoxOne_LeftSticDPadNorth        = 106,
    XBoxOne_LeftSticDPadSouth        = 107,
    XBoxOne_LeftSticDPadWest         = 108,
    XBoxOne_LeftSticDPadEast         = 109,
    XBoxOne_RightSticMove            = 110,
    XBoxOne_RightSticClick           = 111,
    XBoxOne_RightSticDPadNorth       = 112,
    XBoxOne_RightSticDPadSouth       = 113,
    XBoxOne_RightSticDPadWest        = 114,
    XBoxOne_RightSticDPadEast        = 115,
    XBoxOne_DPad_North               = 116,
    XBoxOne_DPad_South               = 117,
    XBoxOne_DPad_West                = 118,
    XBoxOne_DPad_East                = 119,
    XBox360_A                        = 120,
    XBox360_B                        = 121,
    XBox360_X                        = 122,
    XBox360_Y                        = 123,
    XBox360_LeftBumper               = 124,
    XBox360_RightBumper              = 125,
    XBox360_Start                    = 126,
    XBox360_Back                     = 127,
    XBox360_LeftTrigger_Pull         = 128,
    XBox360_LeftTrigger_Click        = 129,
    XBox360_RightTrigger_Pull        = 130,
    XBox360_RightTrigger_Click       = 131,
    XBox360_LeftSticMove             = 132,
    XBox360_LeftSticClick            = 133,
    XBox360_LeftSticDPadNorth        = 134,
    XBox360_LeftSticDPadSouth        = 135,
    XBox360_LeftSticDPadWest         = 136,
    XBox360_LeftSticDPadEast         = 137,
    XBox360_RightSticMove            = 138,
    XBox360_RightSticClick           = 139,
    XBox360_RightSticDPadNorth       = 140,
    XBox360_RightSticDPadSouth       = 141,
    XBox360_RightSticDPadWest        = 142,
    XBox360_RightSticDPadEast        = 143,
    XBox360_DPad_North               = 144,
    XBox360_DPad_South               = 145,
    XBox360_DPad_West                = 146,
    XBox360_DPad_East                = 147,
    SteamV2_A                        = 148,
    SteamV2_B                        = 149,
    SteamV2_X                        = 150,
    SteamV2_Y                        = 151,
    SteamV2_LeftBumper               = 152,
    SteamV2_RightBumper              = 153,
    SteamV2_LeftGrip_Lower           = 154,
    SteamV2_LeftGrip_Upper           = 155,
    SteamV2_RightGrip_Lower          = 156,
    SteamV2_RightGrip_Upper          = 157,
    SteamV2_LeftBumper_Pressure      = 158,
    SteamV2_RightBumper_Pressure     = 159,
    SteamV2_LeftGrip_Pressure        = 160,
    SteamV2_RightGrip_Pressure       = 161,
    SteamV2_LeftGrip_Upper_Pressure  = 162,
    SteamV2_RightGrip_Upper_Pressure = 163,
    SteamV2_Start                    = 164,
    SteamV2_Back                     = 165,
    SteamV2_LeftPad_Touch            = 166,
    SteamV2_LeftPad_Swipe            = 167,
    SteamV2_LeftPad_Click            = 168,
    SteamV2_LeftPad_Pressure         = 169,
    SteamV2_LeftPad_DPadNorth        = 170,
    SteamV2_LeftPad_DPadSouth        = 171,
    SteamV2_LeftPad_DPadWest         = 172,
    SteamV2_LeftPad_DPadEast         = 173,
    SteamV2_RightPad_Touch           = 174,
    SteamV2_RightPad_Swipe           = 175,
    SteamV2_RightPad_Click           = 176,
    SteamV2_RightPad_Pressure        = 177,
    SteamV2_RightPad_DPadNorth       = 178,
    SteamV2_RightPad_DPadSouth       = 179,
    SteamV2_RightPad_DPadWest        = 180,
    SteamV2_RightPad_DPadEast        = 181,
    SteamV2_LeftTrigger_Pull         = 182,
    SteamV2_LeftTrigger_Click        = 183,
    SteamV2_RightTrigger_Pull        = 184,
    SteamV2_RightTrigger_Click       = 185,
    SteamV2_LeftSticMove             = 186,
    SteamV2_LeftSticClick            = 187,
    SteamV2_LeftSticDPadNorth        = 188,
    SteamV2_LeftSticDPadSouth        = 189,
    SteamV2_LeftSticDPadWest         = 190,
    SteamV2_LeftSticDPadEast         = 191,
    SteamV2_Gyro_Move                = 192,
    SteamV2_Gyro_Pitch               = 193,
    SteamV2_Gyro_Yaw                 = 194,
    SteamV2_Gyro_Roll                = 195,
    Switch_A                         = 196,
    Switch_B                         = 197,
    Switch_X                         = 198,
    Switch_Y                         = 199,
    Switch_LeftBumper                = 200,
    Switch_RightBumper               = 201,
    Switch_Plus                      = 202,
    Switch_Minus                     = 203,
    Switch_Capture                   = 204,
    Switch_LeftTrigger_Pull          = 205,
    Switch_LeftTrigger_Click         = 206,
    Switch_RightTrigger_Pull         = 207,
    Switch_RightTrigger_Click        = 208,
    Switch_LeftSticMove              = 209,
    Switch_LeftSticClick             = 210,
    Switch_LeftSticDPadNorth         = 211,
    Switch_LeftSticDPadSouth         = 212,
    Switch_LeftSticDPadWest          = 213,
    Switch_LeftSticDPadEast          = 214,
    Switch_RightSticMove             = 215,
    Switch_RightSticClick            = 216,
    Switch_RightSticDPadNorth        = 217,
    Switch_RightSticDPadSouth        = 218,
    Switch_RightSticDPadWest         = 219,
    Switch_RightSticDPadEast         = 220,
    Switch_DPad_North                = 221,
    Switch_DPad_South                = 222,
    Switch_DPad_West                 = 223,
    Switch_DPad_East                 = 224,
    Switch_ProGyro_Move              = 225,
    Switch_ProGyro_Pitch             = 226,
    Switch_ProGyro_Yaw               = 227,
    Switch_ProGyro_Roll              = 228,
    Switch_RightGyro_Move            = 229,
    Switch_RightGyro_Pitch           = 230,
    Switch_RightGyro_Yaw             = 231,
    Switch_RightGyro_Roll            = 232,
    Switch_LeftGyro_Move             = 233,
    Switch_LeftGyro_Pitch            = 234,
    Switch_LeftGyro_Yaw              = 235,
    Switch_LeftGyro_Roll             = 236,
    Switch_LeftGrip_Lower            = 237,
    Switch_LeftGrip_Upper            = 238,
    Switch_RightGrip_Lower           = 239,
    Switch_RightGrip_Upper           = 240,
    PS4_DPad_Move                    = 241,
    XBoxOne_DPad_Move                = 242,
    XBox360_DPad_Move                = 243,
    Switch_DPad_Move                 = 244,
    PS5_X                            = 245,
    PS5_Circle                       = 246,
    PS5_Triangle                     = 247,
    PS5_Square                       = 248,
    PS5_LeftBumper                   = 249,
    PS5_RightBumper                  = 250,
    PS5_Option                       = 251,
    PS5_Create                       = 252,
    PS5_Mute                         = 253,
    PS5_LeftPad_Touch                = 254,
    PS5_LeftPad_Swipe                = 255,
    PS5_LeftPad_Click                = 256,
    PS5_LeftPad_DPadNorth            = 257,
    PS5_LeftPad_DPadSouth            = 258,
    PS5_LeftPad_DPadWest             = 259,
    PS5_LeftPad_DPadEast             = 260,
    PS5_RightPad_Touch               = 261,
    PS5_RightPad_Swipe               = 262,
    PS5_RightPad_Click               = 263,
    PS5_RightPad_DPadNorth           = 264,
    PS5_RightPad_DPadSouth           = 265,
    PS5_RightPad_DPadWest            = 266,
    PS5_RightPad_DPadEast            = 267,
    PS5_CenterPad_Touch              = 268,
    PS5_CenterPad_Swipe              = 269,
    PS5_CenterPad_Click              = 270,
    PS5_CenterPad_DPadNorth          = 271,
    PS5_CenterPad_DPadSouth          = 272,
    PS5_CenterPad_DPadWest           = 273,
    PS5_CenterPad_DPadEast           = 274,
    PS5_LeftTrigger_Pull             = 275,
    PS5_LeftTrigger_Click            = 276,
    PS5_RightTrigger_Pull            = 277,
    PS5_RightTrigger_Click           = 278,
    PS5_LeftSticMove                 = 279,
    PS5_LeftSticClick                = 280,
    PS5_LeftSticDPadNorth            = 281,
    PS5_LeftSticDPadSouth            = 282,
    PS5_LeftSticDPadWest             = 283,
    PS5_LeftSticDPadEast             = 284,
    PS5_RightSticMove                = 285,
    PS5_RightSticClick               = 286,
    PS5_RightSticDPadNorth           = 287,
    PS5_RightSticDPadSouth           = 288,
    PS5_RightSticDPadWest            = 289,
    PS5_RightSticDPadEast            = 290,
    PS5_DPad_Move                    = 291,
    PS5_DPad_North                   = 292,
    PS5_DPad_South                   = 293,
    PS5_DPad_West                    = 294,
    PS5_DPad_East                    = 295,
    PS5_Gyro_Move                    = 296,
    PS5_Gyro_Pitch                   = 297,
    PS5_Gyro_Yaw                     = 298,
    PS5_Gyro_Roll                    = 299,
    XBoxOne_LeftGrip_Lower           = 300,
    XBoxOne_LeftGrip_Upper           = 301,
    XBoxOne_RightGrip_Lower          = 302,
    XBoxOne_RightGrip_Upper          = 303,
    XBoxOne_Share                    = 304,
    SteamDecA                        = 305,
    SteamDecB                        = 306,
    SteamDecX                        = 307,
    SteamDecY                        = 308,
    SteamDecL1                       = 309,
    SteamDecR1                       = 310,
    SteamDecMenu                     = 311,
    SteamDecView                     = 312,
    SteamDecLeftPad_Touch            = 313,
    SteamDecLeftPad_Swipe            = 314,
    SteamDecLeftPad_Click            = 315,
    SteamDecLeftPad_DPadNorth        = 316,
    SteamDecLeftPad_DPadSouth        = 317,
    SteamDecLeftPad_DPadWest         = 318,
    SteamDecLeftPad_DPadEast         = 319,
    SteamDecRightPad_Touch           = 320,
    SteamDecRightPad_Swipe           = 321,
    SteamDecRightPad_Click           = 322,
    SteamDecRightPad_DPadNorth       = 323,
    SteamDecRightPad_DPadSouth       = 324,
    SteamDecRightPad_DPadWest        = 325,
    SteamDecRightPad_DPadEast        = 326,
    SteamDecL2_SoftPull              = 327,
    SteamDecL2                       = 328,
    SteamDecR2_SoftPull              = 329,
    SteamDecR2                       = 330,
    SteamDecLeftSticMove             = 331,
    SteamDecL3                       = 332,
    SteamDecLeftSticDPadNorth        = 333,
    SteamDecLeftSticDPadSouth        = 334,
    SteamDecLeftSticDPadWest         = 335,
    SteamDecLeftSticDPadEast         = 336,
    SteamDecLeftSticTouch            = 337,
    SteamDecRightSticMove            = 338,
    SteamDecR3                       = 339,
    SteamDecRightSticDPadNorth       = 340,
    SteamDecRightSticDPadSouth       = 341,
    SteamDecRightSticDPadWest        = 342,
    SteamDecRightSticDPadEast        = 343,
    SteamDecRightSticTouch           = 344,
    SteamDecL4                       = 345,
    SteamDecR4                       = 346,
    SteamDecL5                       = 347,
    SteamDecR5                       = 348,
    SteamDecDPad_Move                = 349,
    SteamDecDPad_North               = 350,
    SteamDecDPad_South               = 351,
    SteamDecDPad_West                = 352,
    SteamDecDPad_East                = 353,
    SteamDecGyro_Move                = 354,
    SteamDecGyro_Pitch               = 355,
    SteamDecGyro_Yaw                 = 356,
    SteamDecGyro_Roll                = 357,
    SteamDecReserved1                = 358,
    SteamDecReserved2                = 359,
    SteamDecReserved3                = 360,
    SteamDecReserved4                = 361,
    SteamDecReserved5                = 362,
    SteamDecReserved6                = 363,
    SteamDecReserved7                = 364,
    SteamDecReserved8                = 365,
    SteamDecReserved9                = 366,
    SteamDecReserved10               = 367,
    SteamDecReserved11               = 368,
    SteamDecReserved12               = 369,
    SteamDecReserved13               = 370,
    SteamDecReserved14               = 371,
    SteamDecReserved15               = 372,
    SteamDecReserved16               = 373,
    SteamDecReserved17               = 374,
    SteamDecReserved18               = 375,
    SteamDecReserved19               = 376,
    SteamDecReserved20               = 377,
    Count                            = 378,
    MaximumPossibleValue             = 32767,
}

ESteamControllerLEDFlag :: enum i32 {
    SetColor           = 0,
    RestoreUserDefault = 1,
}

EUGCMatchingUGCType :: enum i32 {
    Items              = 0,
    Items_Mtx          = 1,
    Items_ReadyToUse   = 2,
    Collections        = 3,
    Artwork            = 4,
    Videos             = 5,
    Screenshots        = 6,
    AllGuides          = 7,
    WebGuides          = 8,
    IntegratedGuides   = 9,
    UsableInGame       = 10,
    ControllerBindings = 11,
    GameManagedItems   = 12,
    All                = -1,
}

EUserUGCList :: enum i32 {
    Published     = 0,
    VotedOn       = 1,
    VotedUp       = 2,
    VotedDown     = 3,
    WillVoteLater = 4,
    Favorited     = 5,
    Subscribed    = 6,
    UsedOrPlayed  = 7,
    Followed      = 8,
}

EUserUGCListSortOrder :: enum i32 {
    CreationOrderDesc    = 0,
    CreationOrderAsc     = 1,
    TitleAsc             = 2,
    LastUpdatedDesc      = 3,
    SubscriptionDateDesc = 4,
    VoteScoreDesc        = 5,
    ForModeration        = 6,
}

EUGCQuery :: enum i32 {
    RankedByVote                                  = 0,
    RankedByPublicationDate                       = 1,
    AcceptedForGameRankedByAcceptanceDate         = 2,
    RankedByTrend                                 = 3,
    FavoritedByFriendsRankedByPublicationDate     = 4,
    CreatedByFriendsRankedByPublicationDate       = 5,
    RankedByNumTimesReported                      = 6,
    CreatedByFollowedUsersRankedByPublicationDate = 7,
    NotYetRated                                   = 8,
    RankedByTotalVotesAsc                         = 9,
    RankedByVotesUp                               = 10,
    RankedByTextSearch                            = 11,
    RankedByTotalUniqueSubscriptions              = 12,
    RankedByPlaytimeTrend                         = 13,
    RankedByTotalPlaytime                         = 14,
    RankedByAveragePlaytimeTrend                  = 15,
    RankedByLifetimeAveragePlaytime               = 16,
    RankedByPlaytimeSessionsTrend                 = 17,
    RankedByLifetimePlaytimeSessions              = 18,
    RankedByLastUpdatedDate                       = 19,
}

EItemUpdateStatus :: enum i32 {
    Invalid              = 0,
    PreparingConfig      = 1,
    PreparingContent     = 2,
    UploadingContent     = 3,
    UploadingPreviewFile = 4,
    CommittingChanges    = 5,
}

EItemState :: enum i32 {
    None            = 0,
    Subscribed      = 1,
    LegacyItem      = 2,
    Installed       = 4,
    NeedsUpdate     = 8,
    Downloading     = 16,
    DownloadPending = 32,
}

EItemStatistic :: enum i32 {
    NumSubscriptions                    = 0,
    NumFavorites                        = 1,
    NumFollowers                        = 2,
    NumUniqueSubscriptions              = 3,
    NumUniqueFavorites                  = 4,
    NumUniqueFollowers                  = 5,
    NumUniqueWebsiteViews               = 6,
    ReportScore                         = 7,
    NumSecondsPlayed                    = 8,
    NumPlaytimeSessions                 = 9,
    NumComments                         = 10,
    NumSecondsPlayedDuringTimePeriod    = 11,
    NumPlaytimeSessionsDuringTimePeriod = 12,
}

EItemPreviewType :: enum i32 {
    Image                          = 0,
    YouTubeVideo                   = 1,
    Sketchfab                      = 2,
    EnvironmentMap_HorizontalCross = 3,
    EnvironmentMap_LatLong         = 4,
    ReservedMax                    = 255,
}

EUGCContentDescriptorID :: enum i32 {
    NudityOrSexualContent   = 1,
    FrequentViolenceOrGore  = 2,
    AdultOnlySexualContent  = 3,
    GratuitousSexualContent = 4,
    AnyMatureContent        = 5,
}

ESteamItemFlags :: enum i32 {
    NoTrade  = 1,
    Removed  = 256,
    Consumed = 512,
}

EParentalFeature :: enum i32 {
    Invalid       = 0,
    Store         = 1,
    Community     = 2,
    Profile       = 3,
    Friends       = 4,
    News          = 5,
    Trading       = 6,
    Settings      = 7,
    Console       = 8,
    Browser       = 9,
    ParentalSetup = 10,
    Library       = 11,
    Test          = 12,
    SiteLicense   = 13,
    Max           = 14,
}

ESteamDeviceFormFactor :: enum i32 {
    Unknown  = 0,
    Phone    = 1,
    Tablet   = 2,
    Computer = 3,
    TV       = 4,
}

ESteamNetworkingAvailability :: enum i32 {
    CannotTry   = -102,
    Failed      = -101,
    Previously  = -100,
    Retrying    = -10,
    NeverTried  = 1,
    Waiting     = 2,
    Attempting  = 3,
    Current     = 100,
    Unknown     = 0,
    _Force32bit = 2147483647,
}

ESteamNetworkingIdentityType :: enum i32 {
    Invalid        = 0,
    SteamID        = 16,
    XboxPairwiseID = 17,
    SonyPSN        = 18,
    GoogleStadia   = 19,
    IPAddress      = 1,
    GenericString  = 2,
    GenericBytes   = 3,
    UnknownType    = 4,
    _Force32bit    = 2147483647,
}

ESteamNetworkingFakeIPType :: enum i32 {
    Invalid     = 0,
    NotFake     = 1,
    GlobalIPv4  = 2,
    LocalIPv4   = 3,
    _Force32Bit = 2147483647,
}

ESteamNetworkingConnectionState :: enum i32 {
    None                   = 0,
    Connecting             = 1,
    FindingRoute           = 2,
    Connected              = 3,
    ClosedByPeer           = 4,
    ProblemDetectedLocally = 5,
    FinWait                = -1,
    Linger                 = -2,
    Dead                   = -3,
    _Force32Bit            = 2147483647,
}

ESteamNetConnectionEnd :: enum i32 {
    Invalid                          = 0,
    App_Min                          = 1000,
    App_Generic                      = 1000,
    App_Max                          = 1999,
    AppException_Min                 = 2000,
    AppException_Generic             = 2000,
    AppException_Max                 = 2999,
    Local_Min                        = 3000,
    Local_OfflineMode                = 3001,
    Local_ManyRelayConnectivity      = 3002,
    Local_HostedServerPrimaryRelay   = 3003,
    Local_NetworkConfig              = 3004,
    Local_Rights                     = 3005,
    Local_P2P_ICE_NoPublicAddresses  = 3006,
    Local_Max                        = 3999,
    Remote_Min                       = 4000,
    Remote_Timeout                   = 4001,
    Remote_BadCrypt                  = 4002,
    Remote_BadCert                   = 4003,
    Remote_BadProtocolVersion        = 4006,
    Remote_P2P_ICE_NoPublicAddresses = 4007,
    Remote_Max                       = 4999,
    Misc_Min                         = 5000,
    Misc_Generic                     = 5001,
    Misc_InternalError               = 5002,
    Misc_Timeout                     = 5003,
    Misc_SteamConnectivity           = 5005,
    Misc_NoRelaySessionsToClient     = 5006,
    Misc_P2P_Rendezvous              = 5008,
    Misc_P2P_NAT_Firewall            = 5009,
    Misc_PeerSentNoConnection        = 5010,
    Misc_Max                         = 5999,
    _Force32Bit                      = 2147483647,
}

ESteamNetworkingConfigScope :: enum i32 {
    Global           = 1,
    SocketsInterface = 2,
    ListenSocket     = 3,
    Connection       = 4,
    _Force32Bit      = 2147483647,
}

ESteamNetworkingConfigDataType :: enum i32 {
    Int32       = 1,
    Int64       = 2,
    Float       = 3,
    String      = 4,
    Ptr         = 5,
    _Force32Bit = 2147483647,
}

ESteamNetworkingConfigValue :: enum i32 {
    Invalid                                        = 0,
    TimeoutInitial                                 = 24,
    TimeoutConnected                               = 25,
    SendBufferSize                                 = 9,
    ConnectionUserData                             = 40,
    SendRateMin                                    = 10,
    SendRateMax                                    = 11,
    NagleTime                                      = 12,
    IP_AllowWithoutAuth                            = 23,
    MTU_PacketSize                                 = 32,
    MTU_DataSize                                   = 33,
    Unencrypted                                    = 34,
    SymmetricConnect                               = 37,
    LocalVirtualPort                               = 38,
    DualWifi_Enable                                = 39,
    EnableDiagnosticsUI                            = 46,
    FakePacketLoss_Send                            = 2,
    FakePacketLoss_Recv                            = 3,
    FakePacketLag_Send                             = 4,
    FakePacketLag_Recv                             = 5,
    FakePacketReorder_Send                         = 6,
    FakePacketReorder_Recv                         = 7,
    FakePacketReorder_Time                         = 8,
    FakePacketDup_Send                             = 26,
    FakePacketDup_Recv                             = 27,
    FakePacketDup_TimeMax                          = 28,
    PacketTraceMaxBytes                            = 41,
    FakeRateLimit_Send_Rate                        = 42,
    FakeRateLimit_Send_Burst                       = 43,
    FakeRateLimit_Recv_Rate                        = 44,
    FakeRateLimit_Recv_Burst                       = 45,
    CallbacConnectionStatusChanged                 = 201,
    CallbacAuthStatusChanged                       = 202,
    CallbacRelayNetworkStatusChanged               = 203,
    CallbacMessagesSessionRequest                  = 204,
    CallbacMessagesSessionFailed                   = 205,
    CallbacCreateConnectionSignaling               = 206,
    CallbacFakeIPResult                            = 207,
    P2P_STUN_ServerList                            = 103,
    P2P_Transport_ICE_Enable                       = 104,
    P2P_Transport_ICE_Penalty                      = 105,
    P2P_Transport_SDR_Penalty                      = 106,
    P2P_TURN_ServerList                            = 107,
    P2P_TURN_UserList                              = 108,
    P2P_TURN_PassList                              = 109,
    P2P_Transport_ICE_Implementation               = 110,
    SDRClient_ConsecutitivePingTimeoutsFailInitial = 19,
    SDRClient_ConsecutitivePingTimeoutsFail        = 20,
    SDRClient_MinPingsBeforePingAccurate           = 21,
    SDRClient_SingleSocket                         = 22,
    SDRClient_ForceRelayCluster                    = 29,
    SDRClient_DebugTicketAddress                   = 30,
    SDRClient_ForceProxyAddr                       = 31,
    SDRClient_FakeClusterPing                      = 36,
    LogLevel_AckRTT                                = 13,
    LogLevel_PacketDecode                          = 14,
    LogLevel_Message                               = 15,
    LogLevel_PacketGaps                            = 16,
    LogLevel_P2PRendezvous                         = 17,
    LogLevel_SDRRelayPings                         = 18,
    DELETED_EnumerateDevVars                       = 35,
    _Force32Bit                                    = 2147483647,
}

ESteamNetworkingGetConfigValueResult :: enum i32 {
    BadValue           = -1,
    BadScopeObj        = -2,
    BufferTooSmall     = -3,
    OK                 = 1,
    OKInherited        = 2,
    Result__Force32Bit = 2147483647,
}

ESteamNetworkingSocketsDebugOutputType :: enum i32 {
    None        = 0,
    Bug         = 1,
    Error       = 2,
    Important   = 3,
    Warning     = 4,
    Msg         = 5,
    Verbose     = 6,
    Debug       = 7,
    Everything  = 8,
    _Force32Bit = 2147483647,
}

EServerMode :: enum i32 {
    Invalid                 = 0,
    NoAuthentication        = 1,
    Authentication          = 2,
    AuthenticationAndSecure = 3,
}

IHTMLSurface_EHTMLMouseButton :: enum i32 {
    Left   = 0,
    Right  = 1,
    Middle = 2,
}

IHTMLSurface_EMouseCursor :: enum i32 {
    user           = 0,
    none           = 1,
    arrow          = 2,
    ibeam          = 3,
    hourglass      = 4,
    waitarrow      = 5,
    crosshair      = 6,
    up             = 7,
    sizenw         = 8,
    sizese         = 9,
    sizene         = 10,
    sizesw         = 11,
    sizew          = 12,
    sizee          = 13,
    sizen          = 14,
    sizes          = 15,
    sizewe         = 16,
    sizens         = 17,
    sizeall        = 18,
    no             = 19,
    hand           = 20,
    blank          = 21,
    middle_pan     = 22,
    north_pan      = 23,
    north_east_pan = 24,
    east_pan       = 25,
    south_east_pan = 26,
    south_pan      = 27,
    south_west_pan = 28,
    west_pan       = 29,
    north_west_pan = 30,
    alias          = 31,
    cell           = 32,
    colresize      = 33,
    copycur        = 34,
    verticaltext   = 35,
    rowresize      = 36,
    zoomin         = 37,
    zoomout        = 38,
    help           = 39,
    custom         = 40,
    last           = 41,
}

IHTMLSurface_EHTMLKeyModifiers :: enum i32 {
    None      = 0,
    AltDown   = 1,
    CtrlDown  = 2,
    ShiftDown = 4,
}

ESteamAPIInitResult :: enum i32 {
    OK              = 0,
    FailedGeneric   = 1, // Some other failure
    NoSteamClient   = 2, // We cannot connect to Steam, steam probably isn't running
    VersionMismatch = 3, // Steam client appears to be out of date
}



// Controls the color of the timeline bar segments. The value names listed here map to a multiplayer game, where
// the user starts a game (in menus), then joins a multiplayer session that first has a character selection lobby
// then finally the multiplayer session starts. However, you can also map these values to any type of game. In a single
// player game where you visit towns & dungeons, you could set k_ETimelineGameMode_Menus when the player is in a town
// buying items, k_ETimelineGameMode_Staging for when a dungeon is loading and k_ETimelineGameMode_Playing for when
// inside the dungeon fighting monsters.
ETimelineGameMode :: enum i32 {
    Invalid = 0,
    Playing = 1,
    Staging = 2,
    Menus = 3,
    LoadingScreen = 4,
    Max, // one past the last valid value
}

// Used in AddTimelineEvent, where Featured events will be offered before Standard events
ETimelineEventClipPriority :: enum i32 {
    Invalid  = 0,
    None     = 1,
    Standard = 2,
    Featured = 3,
}



SteamIPAddress :: struct #align (CALLBACK_ALIGN) {
    rgubIPv6: [16]u8,
    eType:    ESteamIPType,
}

FriendGameInfo :: struct #align (CALLBACK_ALIGN) {
    gameID:       CGameID,
    unGameIP:     u32,
    usGamePort:   u16,
    usQueryPort:  u16,
    steamIDLobby: CSteamID,
}

MatchMakingKeyValuePair :: struct #align (CALLBACK_ALIGN) {
    szKey:   [256]u8,
    szValue: [256]u8,
}

servernetadr :: struct #align (CALLBACK_ALIGN) {
    usConnectionPort: u16,
    usQueryPort:      u16,
    unIP:             u32,
}

gameserveritet :: struct #align (CALLBACK_ALIGN) {
    NetAdr:                 servernetadr,
    nPing:                  i32,
    bHadSuccessfulResponse: bool,
    bDoNotRefresh:          bool,
    szGameDir:              [32]u8,
    szMap:                  [32]u8,
    szGameDescription:      [64]u8,
    nAppID:                 u32,
    nPlayers:               i32,
    nMaxPlayers:            i32,
    nBotPlayers:            i32,
    bPassword:              bool,
    bSecure:                bool,
    ulTimeLastPlayed:       u32,
    nServerVersion:         i32,
    szServerName:           [64]u8,
    szGameTags:             [128]u8,
    steamID:                CSteamID,
}

SteamPartyBeaconLocation :: struct #align (CALLBACK_ALIGN) {
    eType:        ESteamPartyBeaconLocationType,
    ulLocationID: u64,
}

SteamParamStringArray :: struct #align (CALLBACK_ALIGN) {
    ppStrings:   ^cstring,
    nNumStrings: i32,
}

LeaderboardEntry :: struct #align (CALLBACK_ALIGN) {
    steamIDUser: CSteamID,
    nGlobalRank: i32,
    nScore:      i32,
    cDetails:    i32,
    hUGC:        UGCHandle,
}

P2PSessionState :: struct #align (CALLBACK_ALIGN) {
    bConnectionActive:     u8,
    bConnecting:           u8,
    eP2PSessionError:      u8,
    bUsingRelay:           u8,
    nBytesQueuedForSend:   i32,
    nPacketsQueuedForSend: i32,
    nRemoteIP:             u32,
    nRemotePort:           u16,
}

InputAnalogActionData :: struct #align (CALLBACK_ALIGN) {
    eMode:   EInputSourceMode,
    x:       f32,
    y:       f32,
    bActive: bool,
}

InputDigitalActionData :: struct #align (CALLBACK_ALIGN) {
    bState:  bool,
    bActive: bool,
}

InputMotionData :: struct #align (CALLBACK_ALIGN) {
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

SteamUGCDetails :: struct #align (CALLBACK_ALIGN) {
    nPublishedFileId:     PublishedFileId,
    eResult:              EResult,
    eFileType:            EWorkshopFileType,
    nCreatorAppID:        AppId,
    nConsumerAppID:       AppId,
    rgchTitle:            [129]u8,
    rgchDescription:      [8000]u8,
    ulSteamIDOwner:       u64,
    rtimeCreated:         u32,
    rtimeUpdated:         u32,
    rtimeAddedToUserList: u32,
    eVisibility:          ERemoteStoragePublishedFileVisibility,
    bBanned:              bool,
    bAcceptedForUse:      bool,
    bTagsTruncated:       bool,
    rgchTags:             [1025]u8,
    hFile:                UGCHandle,
    hPreviewFile:         UGCHandle,
    pchFileName:          [260]u8,
    nFileSize:            i32,
    nPreviewFileSize:     i32,
    rgchURL:              [256]u8,
    unVotesUp:            u32,
    unVotesDown:          u32,
    flScore:              f32,
    unNumChildren:        u32,
    ulTotalFilesSize:     u64,
}

SteamItemDetails :: struct #align (CALLBACK_ALIGN) {
    itemId:      SteamItemInstanceID,
    iDefinition: SteamItemDef,
    unQuantity:  u16,
    unFlags:     u16,
}

SteamNetworkingIPAddr :: struct #align (CALLBACK_ALIGN) {
    ipv6: [16]u8,
    port: u16,
}

SteamNetworkingIdentity :: struct #align (CALLBACK_ALIGN) {
    eType:              ESteamNetworkingIdentityType,
    cbSize:             i32,
    szUnknownRawString: [128]u8,
}

SteamNetConnectionInfo :: struct #align (CALLBACK_ALIGN) {
    identityRemote:          SteamNetworkingIdentity,
    nUserData:               i64,
    hListenSocket:           HSteamListenSocket,
    addrRemote:              SteamNetworkingIPAddr,
    _pad1:                   u16,
    idPOPRemote:             SteamNetworkingPOPID,
    idPOPRelay:              SteamNetworkingPOPID,
    eState:                  ESteamNetworkingConnectionState,
    eEndReason:              i32,
    szEndDebug:              [128]u8,
    szConnectionDescription: [128]u8,
    nFlags:                  i32,
    reserved:                [63]u32,
}

SteamNetConnectionRealTimeStatus :: struct #align (CALLBACK_ALIGN) {
    eState:                    ESteamNetworkingConnectionState,
    nPing:                     i32,
    flConnectionQualityLocal:  f32,
    flConnectionQualityRemote: f32,
    flOutPacketsPerSec:        f32,
    flOutBytesPerSec:          f32,
    flInPacketsPerSec:         f32,
    flInBytesPerSec:           f32,
    nSendRateBytesPerSecond:   i32,
    cbPendingUnreliable:       i32,
    cbPendingReliable:         i32,
    cbSentUnackedReliable:     i32,
    usecQueueTime:             SteamNetworkingMicroseconds,
    reserved:                  [16]u32,
}

SteamNetConnectionRealTimeLaneStatus :: struct #align (CALLBACK_ALIGN) {
    cbPendingUnreliable:   i32,
    cbPendingReliable:     i32,
    cbSentUnackedReliable: i32,
    _reservePad1:          i32,
    usecQueueTime:         SteamNetworkingMicroseconds,
    reserved:              [10]u32,
}

SteamNetworkPingLocation :: struct #align (CALLBACK_ALIGN) {
    data: [512]u8,
}

SteamNetworkingConfigValue :: struct #align (CALLBACK_ALIGN) {
    eValue:    ESteamNetworkingConfigValue,
    eDataType: ESteamNetworkingConfigDataType,
    i64:       i64,
}

SteamDatagramHostedAddress :: struct #align (CALLBACK_ALIGN) {
    cbSize: i32,
    data:   [128]u8,
}

SteamDatagramGameCoordinatorServerLogin :: struct #align (CALLBACK_ALIGN) {
    identity:  SteamNetworkingIdentity,
    routing:   SteamDatagramHostedAddress,
    nAppID:    AppId,
    rtime:     RTime32,
    cbAppData: i32,
    appData:   [2048]u8,
}

SteamAPIWarningMessageHook :: #type proc "c" (_: i32, _: cstring)

// ----------------
// Accessor Aliases
// ----------------

Client :: SteamClient
User :: SteamUser_v023
Friends :: SteamFriends_v017
Utils :: SteamUtils_v010
Matchmaking :: SteamMatchmaking_v009
MatchmakingServers :: SteamMatchmakingServers_v002
GameSearch :: SteamGameSearch_v001
Parties :: SteamParties_v002
RemoteStorage :: SteamRemoteStorage_v016
UserStats :: SteamUserStats_v012
Apps :: SteamApps_v008
Networking :: SteamNetworking_v006
Screenshots :: SteamScreenshots_v003
Music :: SteamMusic_v001
MusicRemote :: SteamMusicRemote_v001
HTTP :: SteamHTTP_v003
Input :: SteamInput_v006
Controller :: SteamController_v008
UGC :: SteamUGC_v020
HTMLSurface :: SteamHTMLSurface_v005
Inventory :: SteamInventory_v003
Video :: SteamVideo_v007
ParentalSettings :: SteamParentalSettings_v001
RemotePlay :: SteamRemotePlay_v002
NetworkingMessages_SteamAPI :: SteamNetworkingMessages_SteamAPI_v002
NetworkingSockets_SteamAPI :: SteamNetworkingSockets_SteamAPI_v012
NetworkingUtils_SteamAPI :: SteamNetworkingUtils_SteamAPI_v004
Timeline :: SteamTimeline_v001

// ---------------
// Interface types
// ---------------

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
ITimeline :: distinct rawptr


// No 'SteamAPI_' prefix
foreign lib {
    SteamClient :: proc() -> ^IClient ---

    // Internal implementation of SteamAPI_InitEx.  This is done in a way that checks
    // all of the versions of interfaces from headers being compiled into this code.
    // If you are not using any of the C++ interfaces and do not need this version checking
    // (for example if you are only using the "flat" interfaces, which have a different type
    // of version checking), you can pass a NULL interface version string.
    SteamInternal_SteamAPI_Init :: proc(pszInternalCheckInterfaceVersions: cstring, pOutErrMsg: ^SteamErrMsg) -> ESteamAPIInitResult ---


    // Shutdown SteamGameSeverXxx interfaces, log out, and free resources.
    SteamGameServer_Shutdown :: proc() ---

    SteamGameServer_BSecure :: proc() -> bool ---
    SteamGameServer_GetSteamID :: proc() -> u64 ---

    // Older SDKs exported this global pointer, but it is no longer supported.
    // You should use SteamGameServerClient() or CSteamGameServerAPIContext to
    // safely access the ISteamClient APIs from your game server application.
    //S_API ISteamClient *g_pSteamClientGameServer;

    // SteamGameServer_InitSafe has been replaced with SteamGameServer_Init and
    // is no longer supported. Use SteamGameServer_Init instead.
    //S_API void S_CALLTYPE SteamGameServer_InitSafe();

    SteamInternal_GameServer_Init_V2 :: proc(unIP: u32, usGamePort: u16, usQueryPort: u16, eServerMode: EServerMode, pchVersionString: cstring, pszInternalCheckInterfaceVersions: cstring, pOutErrMsg: ^SteamErrMsg) -> ESteamAPIInitResult ---

}


// --------------------------
// Global SteamAPI functionns
// --------------------------

// Initializing the Steamworks SDK
// -----------------------------
// 
// There are three different methods you can use to initialize the Steamworks SDK, depending on
// your project's environment. You should only use one method in your project.
// 
// If you are able to include this C++ header in your project, we recommend using the following
// initialization methods. They will ensure that all ISteam* interfaces defined in other
// C++ header files have versions that are supported by the user's Steam Client:
// - SteamAPI_InitEx() for new projects so you can show a detailed error message to the user
// - SteamAPI_Init() for existing projects that only display a generic error message
// 
// If you are unable to include this C++ header in your project and are dynamically loading
// Steamworks SDK methods from dll/so, you can use the following method:
// - SteamAPI_InitFlat()

// Initialize the SDK, without worrying about the cause of failure.
// This function is included for compatibility with older SDK.
// You can use it if you don't care about decent error handling
Init :: proc() -> bool {
    return InitEx(nil) == .OK
}


// Initialize the Steamworks SDK.
// On success k_ESteamAPIInitResult_OK is returned.  Otherwise, if pOutErrMsg is non-NULL,
// it will receive a non-localized message that explains the reason for the failure
//
// Example usage:
// 
//   SteamErrMsg errMsg;
//   if ( SteamAPI_Init(&errMsg) != k_ESteamAPIInitResult_OK )
//       FatalError( "Failed to init Steam.  %s", errMsg );
InitEx :: proc(pOutErrMsg: ^SteamErrMsg) -> ESteamAPIInitResult {
    return SteamInternal_SteamAPI_Init(nil, pOutErrMsg)
}

// This function is included for compatibility with older SDK.
// You can use it if you don't care about decent error handling
SteamGameServer_Init :: proc(unIP: u32, usGamePort: u16, usQueryPort: u16, eServerMode: EServerMode, pchVersionString: cstring) -> bool {
    return SteamGameServer_InitEx(unIP, usGamePort, usQueryPort, eServerMode, pchVersionString, nil) == .OK
}

// Initialize SteamGameServer client and interface objects, and set server properties which may not be changed.
//
// After calling this function, you should set any additional server parameters, and then
// call ISteamGameServer::LogOnAnonymous() or ISteamGameServer::LogOn()
//
// - unIP will usually be zero.  If you are on a machine with multiple IP addresses, you can pass a non-zero
//   value here and the relevant sockets will be bound to that IP.  This can be used to ensure that
//   the IP you desire is the one used in the server browser.
// - usGamePort is the port that clients will connect to for gameplay.  You will usually open up your
//   own socket bound to this port.
// - usQueryPort is the port that will manage server browser related duties and info
//		pings from clients.  If you pass STEAMGAMESERVER_QUERY_PORT_SHARED for usQueryPort, then it
//		will use "GameSocketShare" mode, which means that the game is responsible for sending and receiving
//		UDP packets for the master  server updater.  (See ISteamGameServer::HandleIncomingPacket and
//		ISteamGameServer::GetNextOutgoingPacket.)
// - The version string should be in the form x.x.x.x, and is used by the master server to detect when the
//		server is out of date.  (Only servers with the latest version will be listed.)
//
// On success k_ESteamAPIInitResult_OK is returned.  Otherwise, if pOutErrMsg is non-NULL,
// it will receive a non-localized message that explains the reason for the failure
SteamGameServer_InitEx :: proc(unIP: u32, usGamePort: u16, usQueryPort: u16, eServerMode: EServerMode, pchVersionString: cstring, pOutErrMsg: ^SteamErrMsg) -> ESteamAPIInitResult {
    // NOTE: can we pass null to pszInternalCheckInterfaceVersions??
    pszInternalCheckInterfaceVersions: cstring = nil
    // 	STEAMUTILS_INTERFACE_VERSION "\0"
    // 	STEAMNETWORKINGUTILS_INTERFACE_VERSION "\0"

    // 	STEAMGAMESERVER_INTERFACE_VERSION "\0"
    // 	STEAMGAMESERVERSTATS_INTERFACE_VERSION "\0"
    // 	STEAMHTTP_INTERFACE_VERSION "\0"
    // 	STEAMINVENTORY_INTERFACE_VERSION "\0"
    // 	STEAMNETWORKING_INTERFACE_VERSION "\0"
    // 	STEAMNETWORKINGMESSAGES_INTERFACE_VERSION "\0"
    // 	STEAMNETWORKINGSOCKETS_INTERFACE_VERSION "\0"
    // 	STEAMUGC_INTERFACE_VERSION "\0"
    // 	"\0";
    return SteamInternal_GameServer_Init_V2(unIP, usGamePort, usQueryPort, eServerMode, pchVersionString, pszInternalCheckInterfaceVersions, pOutErrMsg)
}

// Most Steam API functions allocate some amount of thread-local memory for
// parameter storage. Calling SteamGameServer_ReleaseCurrentThreadMemory()
// will free all API-related memory associated with the calling thread.
// This memory is released automatically by SteamGameServer_RunCallbacks(),
// so single-threaded servers do not need to explicitly call this function.
SteamGameServer_ReleaseCurrentThreadMemory :: proc() {
    ReleaseCurrentThreadMemory()
}


@(link_prefix = "SteamAPI_")
foreign lib {
    //----------------------------------------------------------------------------------------------------------------------------------------------------------//
    //	Steam API setup & shutdown
    //
    //	These functions manage loading, initializing and shutdown of the steamclient.dll
    //
    //----------------------------------------------------------------------------------------------------------------------------------------------------------//

    // See "Initializing the Steamworks SDK" above for how to choose an init method.
    // Same usage as SteamAPI_InitEx(), however does not verify ISteam* interfaces are
    // supported by the user's client and is exported from the dll
    InitFlat :: proc(pOutErrMsg: ^SteamErrMsg) -> ESteamAPIInitResult ---


    // SteamAPI_Shutdown should be called during process shutdown if possible.
    Shutdown :: proc() ---

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
    RestartAppIfNecessary :: proc(unOwnAppID: u32) -> bool ---

    // Many Steam API functions allocate a small amount of thread-local memory for parameter storage.
    // SteamAPI_ReleaseCurrentThreadMemory() will free API memory associated with the calling thread.
    // This function is also called automatically by SteamAPI_RunCallbacks(), so a single-threaded
    // program never needs to explicitly call this function.
    ReleaseCurrentThreadMemory :: proc() ---


    // crash dump recording functions
    WriteMiniDump :: proc(uStructuredExceptionCode: u32, pvExceptionInfo: rawptr, uBuildID: u32) ---
    SetMiniDumpComment :: proc(pchMsg: cstring) ---

    //----------------------------------------------------------------------------------------------------------------------------------------------------------//
    //	steamclient.dll private wrapper functions
    //
    //	The following functions are part of abstracting API access to the steamclient.dll, but should only be used in very specific cases
    //----------------------------------------------------------------------------------------------------------------------------------------------------------//

    // SteamAPI_IsSteamRunning() returns true if Steam is currently running
    IsSteamRunning :: proc() -> bool ---

    // returns the filename path of the current running Steam process, used if you need to load an explicit steam dll by name.
    // DEPRECATED - implementation is Windows only, and the path returned is a UTF-8 string which must be converted to UTF-16 for use with Win32 APIs
    SteamAPI_GetSteamInstallPath :: proc() -> cstring ---

    // sets whether or not SteaRunCallbacks() should do a try {} catch (...) {} around calls to issuing callbacks
    // This is ignored if you are using the manual callback dispatch method
    bTryCatchCallbacks :: proc() ---

    // exists only for backwards compat with code written against older SDKs
    InitSafe :: proc() -> bool ---

    // this should be called before the game initialized the steam APIs
    // pchDate should be of the format "Mmm dd yyyy" (such as from the __ DATE __ macro )
    // pchTime should be of the format "hh:mm:ss" (such as from the __ TIME __ macro )
    // bFullMemoryDumps (Win32 only) -- writes out a uuid-full.dmp in the client/dumps folder
    // pvContext-- can be NULL, will be the void * context passed into pfnPreMinidumpCallback
    // PFNPreMinidumpCallback pfnPreMinidumpCallback   -- optional callback which occurs just before a .dmp file is written during a crash.  Applications can hook this to allow adding additional information into the .dmp comment stream.
    UseBreakpadCrashHandler :: proc(pchVersion: cstring, pchDate: cstring, pchTime: cstring, bFullMemoryDumps: bool, pvContext: rawptr, pfnPreMinidumpCallback: PFNPreMinidumpCallback) ---
    SetBreakpadAppID :: proc(unAppID: u32) ---


    /// Inform the API that you wish to use manual event dispatch.  This must be called after SteamAPI_Init, but before
    /// you use any of the other manual dispatch functions below.
    ManualDispatch_Init :: proc() ---

    /// Perform certain periodic actions that need to be performed.
    ManualDispatch_RunFrame :: proc(hSteamPipe: HSteamPipe) ---

    /// Fetch the next pending callback on the given pipe, if any.  If a callback is available, true is returned
    /// and the structure is populated.  In this case, you MUST call SteamAPI_ManualDispatch_FreeLastCallback
    /// (after dispatching the callback) before calling SteamAPI_ManualDispatch_GetNextCallback again.
    ManualDispatch_GetNextCallback :: proc(hSteamPipe: HSteamPipe, pCallbackMsg: ^CallbackMsg) -> bool ---

    /// You must call this after dispatching the callback, if SteamAPI_ManualDispatch_GetNextCallback returns true.
    ManualDispatch_FreeLastCallback :: proc(hSteamPipe: HSteamPipe) ---

    /// Return the call result for the specified call on the specified pipe.  You really should
    /// only call this in a handler for SteamAPICallCompletedcallback.
    ManualDispatch_GetAPICallResult :: proc(hSteamPipe: HSteamPipe, hSteamAPICall: SteamAPICall, pCallback: rawptr, cubCallback: i32, iCallbackExpected: ICallback, pbFailed: ^bool) -> bool ---


    GetHSteamPipe :: proc() -> HSteamPipe ---
}

// -------------------------------------------
// Versioned accessors
// -------------------------------------------

@(link_prefix = "SteamAPI_")
foreign lib {
    SteamUser_v023 :: proc() -> ^IUser ---
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
    SteamUGC_v020 :: proc() -> ^IUGC ---
    SteamHTMLSurface_v005 :: proc() -> ^IHTMLSurface ---
    SteamInventory_v003 :: proc() -> ^IInventory ---
    SteamVideo_v007 :: proc() -> ^IVideo ---
    SteamParentalSettings_v001 :: proc() -> ^IParentalSettings ---
    SteamRemotePlay_v002 :: proc() -> ^IRemotePlay ---
    SteamNetworkingMessages_SteamAPI_v002 :: proc() -> ^INetworkingMessages ---
    SteamNetworkingSockets_SteamAPI_v012 :: proc() -> ^INetworkingSockets ---
    SteamNetworkingUtils_SteamAPI_v004 :: proc() -> ^INetworkingUtils ---
    SteamTimeline_v001 :: proc() -> ^ITimeline ---
}

// -------------------------------------------
// Interfaces
// -------------------------------------------

@(link_prefix = "SteamAPI_") 
foreign lib {
    servernetadr_t_Assign :: proc(self: ^servernetadr, that: ^servernetadr) ---
    servernetadr_t_Construct :: proc(self: ^servernetadr) ---
    servernetadr_t_Init :: proc(self: ^servernetadr, ip: u32, usQueryPort: u16, usConnectionPort: u16) ---
    servernetadr_t_GetQueryPort :: proc(self: ^servernetadr) -> u16 ---
    servernetadr_t_SetQueryPort :: proc(self: ^servernetadr, usPort: u16) ---
    servernetadr_t_GetConnectionPort :: proc(self: ^servernetadr) -> u16 ---
    servernetadr_t_SetConnectionPort :: proc(self: ^servernetadr, usPort: u16) ---
    servernetadr_t_GetIP :: proc(self: ^servernetadr) -> u32 ---
    servernetadr_t_SetIP :: proc(self: ^servernetadr, unIP: u32) ---
    servernetadr_t_GetConnectionAddressString :: proc(self: ^servernetadr) -> cstring ---
    servernetadr_t_GetQueryAddressString :: proc(self: ^servernetadr) -> cstring ---
    servernetadr_t_IsLessThan :: proc(self: ^servernetadr, that: ^servernetadr) ---
    gameserveritem_t_Construct :: proc(self: ^gameserveritet) ---
    gameserveritem_t_GetName :: proc(self: ^gameserveritet) -> cstring ---
    gameserveritem_t_SetName :: proc(self: ^gameserveritet, pName: cstring) ---
}

@(link_prefix = "SteamAPI_Steam") 
foreign lib {
    NetworkingIdentity_Clear :: proc(self: ^SteamNetworkingIdentity) ---
    NetworkingIdentity_IsInvalid :: proc(self: ^SteamNetworkingIdentity) -> bool ---
    NetworkingIdentity_SetSteamID :: proc(self: ^SteamNetworkingIdentity, steamID: CSteamID) ---
    NetworkingIdentity_GetSteamID :: proc(self: ^SteamNetworkingIdentity) -> CSteamID ---
    NetworkingIdentity_SetSteamID64 :: proc(self: ^SteamNetworkingIdentity, steamID: u64) ---
    NetworkingIdentity_GetSteamID64 :: proc(self: ^SteamNetworkingIdentity) -> u64 ---
    NetworkingIdentity_SetXboxPairwiseID :: proc(self: ^SteamNetworkingIdentity, pszString: cstring) -> bool ---
    NetworkingIdentity_GetXboxPairwiseID :: proc(self: ^SteamNetworkingIdentity) -> cstring ---
    NetworkingIdentity_SetPSNID :: proc(self: ^SteamNetworkingIdentity, id: u64) ---
    NetworkingIdentity_GetPSNID :: proc(self: ^SteamNetworkingIdentity) -> u64 ---
    NetworkingIdentity_SetStadiaID :: proc(self: ^SteamNetworkingIdentity, id: u64) ---
    NetworkingIdentity_GetStadiaID :: proc(self: ^SteamNetworkingIdentity) -> u64 ---
    NetworkingIdentity_SetIPAddr :: proc(self: ^SteamNetworkingIdentity, addr: ^SteamNetworkingIPAddr) ---
    NetworkingIdentity_GetIPAddr :: proc(self: ^SteamNetworkingIdentity) -> ^SteamNetworkingIPAddr ---
    NetworkingIdentity_SetIPv4Addr :: proc(self: ^SteamNetworkingIdentity, nIPv4: u32, nPort: u16) ---
    NetworkingIdentity_GetIPv4 :: proc(self: ^SteamNetworkingIdentity) -> u32 ---
    NetworkingIdentity_GetFakeIPType :: proc(self: ^SteamNetworkingIdentity) -> ESteamNetworkingFakeIPType ---
    NetworkingIdentity_IsFakeIP :: proc(self: ^SteamNetworkingIdentity) -> bool ---
    NetworkingIdentity_SetLocalHost :: proc(self: ^SteamNetworkingIdentity) ---
    NetworkingIdentity_IsLocalHost :: proc(self: ^SteamNetworkingIdentity) -> bool ---
    NetworkingIdentity_SetGenericString :: proc(self: ^SteamNetworkingIdentity, pszString: cstring) -> bool ---
    NetworkingIdentity_GetGenericString :: proc(self: ^SteamNetworkingIdentity) -> cstring ---
    NetworkingIdentity_SetGenericBytes :: proc(self: ^SteamNetworkingIdentity, data: rawptr, cbLen: u32) -> bool ---
    NetworkingIdentity_GetGenericBytes :: proc(self: ^SteamNetworkingIdentity, cbLen: ^int) -> ^u8 ---
    NetworkingIdentity_ToString :: proc(self: ^SteamNetworkingIdentity, buf: ^u8, cbBuf: u32) ---
    NetworkingIdentity_ParseString :: proc(self: ^SteamNetworkingIdentity, pszStr: cstring) -> bool ---

    NetworkingIPAddr_Clear :: proc(self: ^SteamNetworkingIPAddr) ---
    NetworkingIPAddr_IsIPv6AllZeros :: proc(self: ^SteamNetworkingIPAddr) -> bool ---
    NetworkingIPAddr_SetIPv6 :: proc(self: ^SteamNetworkingIPAddr, ipv6: ^u8, nPort: u16) ---
    NetworkingIPAddr_SetIPv4 :: proc(self: ^SteamNetworkingIPAddr, nIP: u32, nPort: u16) ---
    NetworkingIPAddr_IsIPv4 :: proc(self: ^SteamNetworkingIPAddr) -> bool ---
    NetworkingIPAddr_GetIPv4 :: proc(self: ^SteamNetworkingIPAddr) -> u32 ---
    NetworkingIPAddr_SetIPv6LocalHost :: proc(self: ^SteamNetworkingIPAddr, nPort: u16) ---
    NetworkingIPAddr_IsLocalHost :: proc(self: ^SteamNetworkingIPAddr) -> bool ---
    NetworkingIPAddr_ToString :: proc(self: ^SteamNetworkingIPAddr, buf: ^u8, cbBuf: u32, bWithPort: bool) ---
    NetworkingIPAddr_ParseString :: proc(self: ^SteamNetworkingIPAddr, pszStr: cstring) -> bool ---
    NetworkingIPAddr_GetFakeIPType :: proc(self: ^SteamNetworkingIPAddr) -> ESteamNetworkingFakeIPType ---
    NetworkingIPAddr_IsFakeIP :: proc(self: ^SteamNetworkingIPAddr) -> bool ---
    
    NetworkingMessage_t_Release :: proc(self: ^SteamNetworkingMessage) ---
    
    NetworkingConfigValue_t_SetInt32 :: proc(self: ^SteamNetworkingConfigValue, eVal: ESteamNetworkingConfigValue, data: i32) ---
    NetworkingConfigValue_t_SetInt64 :: proc(self: ^SteamNetworkingConfigValue, eVal: ESteamNetworkingConfigValue, data: i64) ---
    NetworkingConfigValue_t_SetFloat :: proc(self: ^SteamNetworkingConfigValue, eVal: ESteamNetworkingConfigValue, data: f32) ---
    NetworkingConfigValue_t_SetPtr :: proc(self: ^SteamNetworkingConfigValue, eVal: ESteamNetworkingConfigValue, data: rawptr) ---
    NetworkingConfigValue_t_SetString :: proc(self: ^SteamNetworkingConfigValue, eVal: ESteamNetworkingConfigValue, data: cstring) ---
    
    DatagramHostedAddress_Clear :: proc(self: ^SteamDatagramHostedAddress) ---
    DatagramHostedAddress_GetPopID :: proc(self: ^SteamDatagramHostedAddress) -> SteamNetworkingPOPID ---
    DatagramHostedAddress_SetDevAddress :: proc(self: ^SteamDatagramHostedAddress, nIP: u32, nPort: u16, popid: SteamNetworkingPOPID) ---

    IPAddress_t_IsSet :: proc(self: ^SteamIPAddress) -> bool ---
}

@(link_prefix = "SteamAPI_ISteam")
foreign lib {
    Client_CreateSteamPipe :: proc(self: ^IClient) -> HSteamPipe ---
    Client_BReleaseSteamPipe :: proc(self: ^IClient, hSteamPipe: HSteamPipe) -> bool ---
    Client_ConnectToGlobalUser :: proc(self: ^IClient, hSteamPipe: HSteamPipe) -> HSteamUser ---
    Client_CreateLocalUser :: proc(self: ^IClient, phSteamPipe: ^HSteamPipe, eAccountType: EAccountType) -> HSteamUser ---
    Client_ReleaseUser :: proc(self: ^IClient, hSteamPipe: HSteamPipe, hUser: HSteamUser) ---
    Client_GetIUser :: proc(self: ^IClient, hSteamUser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: cstring) -> ^IUser ---
    Client_GetIGameServer :: proc(self: ^IClient, hSteamUser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: cstring) -> ^IGameServer ---
    Client_SetLocalIPBinding :: proc(self: ^IClient, unIP: ^SteamIPAddress, usPort: u16) ---
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
    Client_GetIPCCallCount :: proc(self: ^IClient) -> u32 ---
    Client_SetWarningMessageHook :: proc(self: ^IClient, pFunction: SteamAPIWarningMessageHook) ---
    Client_BShutdownIfAllPipesClosed :: proc(self: ^IClient) -> bool ---
    Client_GetIHTTP :: proc(self: ^IClient, hSteamuser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: cstring) -> ^IHTTP ---
    Client_GetIController :: proc(self: ^IClient, hSteamUser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: cstring) -> ^IController ---
    Client_GetIUGC :: proc(self: ^IClient, hSteamUser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: cstring) -> ^IUGC ---
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
    User_InitiateGameConnection_DEPRECATED :: proc(self: ^IUser, pAuthBlob: rawptr, cbMaxAuthBlob: i32, steamIDGameServer: CSteamID, unIPServer: u32, usPortServer: u16, bSecure: bool) -> i32 ---
    User_TerminateGameConnection_DEPRECATED :: proc(self: ^IUser, unIPServer: u32, usPortServer: u16) ---
    User_TrackAppUsageEvent :: proc(self: ^IUser, gameID: CGameID, eAppUsageEvent: i32, pchExtraInfo: cstring) ---
    User_GetUserDataFolder :: proc(self: ^IUser, pchBuffer: ^u8, cubBuffer: i32) -> bool ---
    User_StartVoiceRecording :: proc(self: ^IUser) ---
    User_StopVoiceRecording :: proc(self: ^IUser) ---
    User_GetAvailableVoice :: proc(self: ^IUser, pcbCompressed: ^u32, pcbUncompressed_Deprecated: ^u32, nUncompressedVoiceDesiredSampleRate_Deprecated: u32) -> EVoiceResult ---
    User_GetVoice :: proc(self: ^IUser, bWantCompressed: bool, pDestBuffer: rawptr, cbDestBufferSize: u32, nBytesWritten: ^u32, bWantUncompressed_Deprecated: bool, pUncompressedDestBuffer_Deprecated: rawptr, cbUncompressedDestBufferSize_Deprecated: u32, nUncompressBytesWritten_Deprecated: ^u32, nUncompressedVoiceDesiredSampleRate_Deprecated: u32) -> EVoiceResult ---
    User_DecompressVoice :: proc(self: ^IUser, pCompressed: rawptr, cbCompressed: u32, pDestBuffer: rawptr, cbDestBufferSize: u32, nBytesWritten: ^u32, nDesiredSampleRate: u32) -> EVoiceResult ---
    User_GetVoiceOptimalSampleRate :: proc(self: ^IUser) -> u32 ---
    User_GetAuthSessionTicket :: proc(self: ^IUser, pTicket: rawptr, cbMaxTicket: i32, pcbTicket: ^u32, #by_ptr pSteamNetworkingIdentity: SteamNetworkingIdentity) -> HAuthTicket ---
    User_GetAuthTicketForWebApi :: proc(self: ^IUser, pchIdentity: cstring) -> HAuthTicket ---
    User_BeginAuthSession :: proc(self: ^IUser, pAuthTicket: rawptr, cbAuthTicket: i32, steamID: CSteamID) -> EBeginAuthSessionResult ---
    User_EndAuthSession :: proc(self: ^IUser, steamID: CSteamID) ---
    User_CancelAuthTicket :: proc(self: ^IUser, hAuthTicket: HAuthTicket) ---
    User_UserHasLicenseForApp :: proc(self: ^IUser, steamID: CSteamID, appID: AppId) -> EUserHasLicenseForAppResult ---
    User_BIsBehindNAT :: proc(self: ^IUser) -> bool ---
    User_AdvertiseGame :: proc(self: ^IUser, steamIDGameServer: CSteamID, unIPServer: u32, usPortServer: u16) ---
    User_RequestEncryptedAppTicket :: proc(self: ^IUser, pDataToInclude: rawptr, cbDataToInclude: i32) -> SteamAPICall ---
    User_GetEncryptedAppTicket :: proc(self: ^IUser, pTicket: rawptr, cbMaxTicket: i32, pcbTicket: ^u32) -> bool ---
    User_GetGameBadgeLevel :: proc(self: ^IUser, nSeries: i32, bFoil: bool) -> i32 ---
    User_GetPlayerSteamLevel :: proc(self: ^IUser) -> i32 ---
    User_RequestStoreAuthURL :: proc(self: ^IUser, pchRedirectURL: cstring) -> SteamAPICall ---
    User_BIsPhoneVerified :: proc(self: ^IUser) -> bool ---
    User_BIsTwoFactorEnabled :: proc(self: ^IUser) -> bool ---
    User_BIsPhoneIdentifying :: proc(self: ^IUser) -> bool ---
    User_BIsPhoneRequiringVerification :: proc(self: ^IUser) -> bool ---
    User_GetMarketEligibility :: proc(self: ^IUser) -> SteamAPICall ---
    User_GetDurationControl :: proc(self: ^IUser) -> SteamAPICall ---
    User_BSetDurationControlOnlineState :: proc(self: ^IUser, eNewState: EDurationControlOnlineState) -> bool ---

    Friends_GetPersonaName :: proc(self: ^IFriends) -> cstring ---
    Friends_SetPersonaName :: proc(self: ^IFriends, pchPersonaName: cstring) -> SteamAPICall ---
    Friends_GetPersonaState :: proc(self: ^IFriends) -> EPersonaState ---
    Friends_GetFriendCount :: proc(self: ^IFriends, iFriendFlags: i32) -> i32 ---
    Friends_GetFriendByIndex :: proc(self: ^IFriends, iFriend: i32, iFriendFlags: i32) -> CSteamID ---
    Friends_GetFriendRelationship :: proc(self: ^IFriends, steamIDFriend: CSteamID) -> EFriendRelationship ---
    Friends_GetFriendPersonaState :: proc(self: ^IFriends, steamIDFriend: CSteamID) -> EPersonaState ---
    Friends_GetFriendPersonaName :: proc(self: ^IFriends, steamIDFriend: CSteamID) -> cstring ---
    Friends_GetFriendGamePlayed :: proc(self: ^IFriends, steamIDFriend: CSteamID, pFriendGameInfo: ^FriendGameInfo) -> bool ---
    Friends_GetFriendPersonaNameHistory :: proc(self: ^IFriends, steamIDFriend: CSteamID, iPersonaName: i32) -> cstring ---
    Friends_GetFriendSteamLevel :: proc(self: ^IFriends, steamIDFriend: CSteamID) -> i32 ---
    Friends_GetPlayerNickname :: proc(self: ^IFriends, steamIDPlayer: CSteamID) -> cstring ---
    Friends_GetFriendsGroupCount :: proc(self: ^IFriends) -> i32 ---
    Friends_GetFriendsGroupIDByIndex :: proc(self: ^IFriends, iFG: i32) -> FriendsGroupID ---
    Friends_GetFriendsGroupName :: proc(self: ^IFriends, friendsGroupID: FriendsGroupID) -> cstring ---
    Friends_GetFriendsGroupMembersCount :: proc(self: ^IFriends, friendsGroupID: FriendsGroupID) -> i32 ---
    Friends_GetFriendsGroupMembersList :: proc(self: ^IFriends, friendsGroupID: FriendsGroupID, pOutSteamIDMembers: ^CSteamID, nMembersCount: i32) ---
    Friends_HasFriend :: proc(self: ^IFriends, steamIDFriend: CSteamID, iFriendFlags: i32) -> bool ---
    Friends_GetClanCount :: proc(self: ^IFriends) -> i32 ---
    Friends_GetClanByIndex :: proc(self: ^IFriends, iClan: i32) -> CSteamID ---
    Friends_GetClanName :: proc(self: ^IFriends, steamIDClan: CSteamID) -> cstring ---
    Friends_GetClanTag :: proc(self: ^IFriends, steamIDClan: CSteamID) -> cstring ---
    Friends_GetClanActivityCounts :: proc(self: ^IFriends, steamIDClan: CSteamID, pnOnline: ^int, pnInGame: ^int, pnChatting: ^int) -> bool ---
    Friends_DownloadClanActivityCounts :: proc(self: ^IFriends, psteamIDClans: ^CSteamID, cClansToRequest: i32) -> SteamAPICall ---
    Friends_GetFriendCountFromSource :: proc(self: ^IFriends, steamIDSource: CSteamID) -> i32 ---
    Friends_GetFriendFromSourceByIndex :: proc(self: ^IFriends, steamIDSource: CSteamID, iFriend: i32) -> CSteamID ---
    Friends_IsUserInSource :: proc(self: ^IFriends, steamIDUser: CSteamID, steamIDSource: CSteamID) -> bool ---
    Friends_SetInGameVoiceSpeaking :: proc(self: ^IFriends, steamIDUser: CSteamID, bSpeaking: bool) ---
    Friends_ActivateGameOverlay :: proc(self: ^IFriends, pchDialog: cstring) ---
    Friends_ActivateGameOverlayToUser :: proc(self: ^IFriends, pchDialog: cstring, steamID: CSteamID) ---
    Friends_ActivateGameOverlayToWebPage :: proc(self: ^IFriends, pchURL: cstring, eMode: EActivateGameOverlayToWebPageMode) ---
    Friends_ActivateGameOverlayToStore :: proc(self: ^IFriends, nAppID: AppId, eFlag: EOverlayToStoreFlag) ---
    Friends_SetPlayedWith :: proc(self: ^IFriends, steamIDUserPlayedWith: CSteamID) ---
    Friends_ActivateGameOverlayInviteDialog :: proc(self: ^IFriends, steamIDLobby: CSteamID) ---
    Friends_GetSmallFriendAvatar :: proc(self: ^IFriends, steamIDFriend: CSteamID) -> i32 ---
    Friends_GetMediumFriendAvatar :: proc(self: ^IFriends, steamIDFriend: CSteamID) -> i32 ---
    Friends_GetLargeFriendAvatar :: proc(self: ^IFriends, steamIDFriend: CSteamID) -> i32 ---
    Friends_RequestUserInformation :: proc(self: ^IFriends, steamIDUser: CSteamID, bRequireNameOnly: bool) -> bool ---
    Friends_RequestClanOfficerList :: proc(self: ^IFriends, steamIDClan: CSteamID) -> SteamAPICall ---
    Friends_GetClanOwner :: proc(self: ^IFriends, steamIDClan: CSteamID) -> CSteamID ---
    Friends_GetClanOfficerCount :: proc(self: ^IFriends, steamIDClan: CSteamID) -> i32 ---
    Friends_GetClanOfficerByIndex :: proc(self: ^IFriends, steamIDClan: CSteamID, iOfficer: i32) -> CSteamID ---
    Friends_GetUserRestrictions :: proc(self: ^IFriends) -> u32 ---
    Friends_SetRichPresence :: proc(self: ^IFriends, pchKey: cstring, pchValue: cstring) -> bool ---
    Friends_ClearRichPresence :: proc(self: ^IFriends) ---
    Friends_GetFriendRichPresence :: proc(self: ^IFriends, steamIDFriend: CSteamID, pchKey: cstring) -> cstring ---
    Friends_GetFriendRichPresenceKeyCount :: proc(self: ^IFriends, steamIDFriend: CSteamID) -> i32 ---
    Friends_GetFriendRichPresenceKeyByIndex :: proc(self: ^IFriends, steamIDFriend: CSteamID, iKey: i32) -> cstring ---
    Friends_RequestFriendRichPresence :: proc(self: ^IFriends, steamIDFriend: CSteamID) ---
    Friends_InviteUserToGame :: proc(self: ^IFriends, steamIDFriend: CSteamID, pchConnectString: cstring) -> bool ---
    Friends_GetCoplayFriendCount :: proc(self: ^IFriends) -> i32 ---
    Friends_GetCoplayFriend :: proc(self: ^IFriends, iCoplayFriend: i32) -> CSteamID ---
    Friends_GetFriendCoplayTime :: proc(self: ^IFriends, steamIDFriend: CSteamID) -> i32 ---
    Friends_GetFriendCoplayGame :: proc(self: ^IFriends, steamIDFriend: CSteamID) -> AppId ---
    Friends_JoinClanChatRoom :: proc(self: ^IFriends, steamIDClan: CSteamID) -> SteamAPICall ---
    Friends_LeaveClanChatRoom :: proc(self: ^IFriends, steamIDClan: CSteamID) -> bool ---
    Friends_GetClanChatMemberCount :: proc(self: ^IFriends, steamIDClan: CSteamID) -> i32 ---
    Friends_GetChatMemberByIndex :: proc(self: ^IFriends, steamIDClan: CSteamID, iUser: i32) -> CSteamID ---
    Friends_SendClanChatMessage :: proc(self: ^IFriends, steamIDClanChat: CSteamID, pchText: cstring) -> bool ---
    Friends_GetClanChatMessage :: proc(self: ^IFriends, steamIDClanChat: CSteamID, iMessage: i32, prgchText: rawptr, cchTextMax: i32, peChatEntryType: ^EChatEntryType, psteamidChatter: ^CSteamID) -> i32 ---
    Friends_IsClanChatAdmin :: proc(self: ^IFriends, steamIDClanChat: CSteamID, steamIDUser: CSteamID) -> bool ---
    Friends_IsClanChatWindowOpenInSteam :: proc(self: ^IFriends, steamIDClanChat: CSteamID) -> bool ---
    Friends_OpenClanChatWindowInSteam :: proc(self: ^IFriends, steamIDClanChat: CSteamID) -> bool ---
    Friends_CloseClanChatWindowInSteam :: proc(self: ^IFriends, steamIDClanChat: CSteamID) -> bool ---
    Friends_SetListenForFriendsMessages :: proc(self: ^IFriends, bInterceptEnabled: bool) -> bool ---
    Friends_ReplyToFriendMessage :: proc(self: ^IFriends, steamIDFriend: CSteamID, pchMsgToSend: cstring) -> bool ---
    Friends_GetFriendMessage :: proc(self: ^IFriends, steamIDFriend: CSteamID, iMessageID: i32, pvData: rawptr, cubData: i32, peChatEntryType: ^EChatEntryType) -> i32 ---
    Friends_GetFollowerCount :: proc(self: ^IFriends, steamID: CSteamID) -> SteamAPICall ---
    Friends_IsFollowing :: proc(self: ^IFriends, steamID: CSteamID) -> SteamAPICall ---
    Friends_EnumerateFollowingList :: proc(self: ^IFriends, unStartIndex: u32) -> SteamAPICall ---
    Friends_IsClanPublic :: proc(self: ^IFriends, steamIDClan: CSteamID) -> bool ---
    Friends_IsClanOfficialGameGroup :: proc(self: ^IFriends, steamIDClan: CSteamID) -> bool ---
    Friends_GetNumChatsWithUnreadPriorityMessages :: proc(self: ^IFriends) -> i32 ---
    Friends_ActivateGameOverlayRemotePlayTogetherInviteDialog :: proc(self: ^IFriends, steamIDLobby: CSteamID) ---
    Friends_RegisterProtocolInOverlayBrowser :: proc(self: ^IFriends, pchProtocol: cstring) -> bool ---
    Friends_ActivateGameOverlayInviteDialogConnectString :: proc(self: ^IFriends, pchConnectString: cstring) ---
    Friends_RequestEquippedProfileItems :: proc(self: ^IFriends, steamID: CSteamID) -> SteamAPICall ---
    Friends_BHasEquippedProfileItem :: proc(self: ^IFriends, steamID: CSteamID, itemType: ECommunityProfileItemType) -> bool ---
    Friends_GetProfileItemPropertyString :: proc(self: ^IFriends, steamID: CSteamID, itemType: ECommunityProfileItemType, prop: ECommunityProfileItemProperty) -> cstring ---
    Friends_GetProfileItemPropertyUint :: proc(self: ^IFriends, steamID: CSteamID, itemType: ECommunityProfileItemType, prop: ECommunityProfileItemProperty) -> u32 ---

    Utils_GetSecondsSinceAppActive :: proc(self: ^IUtils) -> u32 ---
    Utils_GetSecondsSinceComputerActive :: proc(self: ^IUtils) -> u32 ---
    Utils_GetConnectedUniverse :: proc(self: ^IUtils) -> EUniverse ---
    Utils_GetServerRealTime :: proc(self: ^IUtils) -> u32 ---
    Utils_GetIPCountry :: proc(self: ^IUtils) -> cstring ---
    Utils_GetImageSize :: proc(self: ^IUtils, iImage: i32, pnWidth: ^u32, pnHeight: ^u32) -> bool ---
    Utils_GetImageRGBA :: proc(self: ^IUtils, iImage: i32, pubDest: ^u8, nDestBufferSize: i32) -> bool ---
    Utils_GetCurrentBatteryPower :: proc(self: ^IUtils) -> u8 ---
    Utils_GetAppID :: proc(self: ^IUtils) -> u32 ---
    Utils_SetOverlayNotificationPosition :: proc(self: ^IUtils, eNotificationPosition: ENotificationPosition) ---
    Utils_IsAPICallCompleted :: proc(self: ^IUtils, hSteamAPICall: SteamAPICall, pbFailed: ^bool) -> bool ---
    Utils_GetAPICallFailureReason :: proc(self: ^IUtils, hSteamAPICall: SteamAPICall) -> ESteamAPICallFailure ---
    Utils_GetAPICallResult :: proc(self: ^IUtils, hSteamAPICall: SteamAPICall, pCallback: rawptr, cubCallback: i32, iCallbackExpected: ICallback, pbFailed: ^bool) -> bool ---
    Utils_GetIPCCallCount :: proc(self: ^IUtils) -> u32 ---
    Utils_SetWarningMessageHook :: proc(self: ^IUtils, pFunction: SteamAPIWarningMessageHook) ---
    Utils_IsOverlayEnabled :: proc(self: ^IUtils) -> bool ---
    Utils_BOverlayNeedsPresent :: proc(self: ^IUtils) -> bool ---
    Utils_CheckFileSignature :: proc(self: ^IUtils, szFileName: cstring) -> SteamAPICall ---
    Utils_ShowGamepadTextInput :: proc(self: ^IUtils, eInputMode: EGamepadTextInputMode, eLineInputMode: EGamepadTextInputLineMode, pchDescription: cstring, unCharMax: u32, pchExistingText: cstring) -> bool ---
    Utils_GetEnteredGamepadTextLength :: proc(self: ^IUtils) -> u32 ---
    Utils_GetEnteredGamepadTextInput :: proc(self: ^IUtils, pchText: u8, cchText: u32) -> bool ---
    Utils_GetSteamUILanguage :: proc(self: ^IUtils) -> cstring ---
    Utils_IsSteamRunningInVR :: proc(self: ^IUtils) -> bool ---
    Utils_SetOverlayNotificationInset :: proc(self: ^IUtils, nHorizontalInset: i32, nVerticalInset: i32) ---
    Utils_IsSteamInBigPictureMode :: proc(self: ^IUtils) -> bool ---
    Utils_StartVRDashboard :: proc(self: ^IUtils) ---
    Utils_IsVRHeadsetStreamingEnabled :: proc(self: ^IUtils) -> bool ---
    Utils_SetVRHeadsetStreamingEnabled :: proc(self: ^IUtils, bEnabled: bool) ---
    Utils_IsSteamChinaLauncher :: proc(self: ^IUtils) -> bool ---
    Utils_InitFilterText :: proc(self: ^IUtils, unFilterOptions: u32) -> bool ---
    Utils_FilterText :: proc(self: ^IUtils, eContext: ETextFilteringContext, sourceSteamID: CSteamID, pchInputMessage: cstring, pchOutFilteredText: ^u8, nByteSizeOutFilteredText: u32) -> i32 ---
    Utils_GetIPv6ConnectivityState :: proc(self: ^IUtils, eProtocol: ESteamIPv6ConnectivityProtocol) -> ESteamIPv6ConnectivityState ---
    Utils_IsSteamRunningOnSteamDeck :: proc(self: ^IUtils) -> bool ---
    Utils_ShowFloatingGamepadTextInput :: proc(self: ^IUtils, eKeyboardMode: EFloatingGamepadTextInputMode, nTextFieldXPosition: i32, nTextFieldYPosition: i32, nTextFieldWidth: i32, nTextFieldHeight: i32) -> bool ---
    Utils_SetGameLauncherMode :: proc(self: ^IUtils, bLauncherMode: bool) ---
    Utils_DismissFloatingGamepadTextInput :: proc(self: ^IUtils) -> bool ---
    Utils_DismissGamepadTextInput :: proc(self: ^IUtils) -> bool ---


    Matchmaking_GetFavoriteGameCount :: proc(self: ^IMatchmaking) -> i32 ---
    Matchmaking_GetFavoriteGame :: proc(self: ^IMatchmaking, iGame: i32, pnAppID: ^AppId, pnIP: ^u32, pnConnPort: ^u16, pnQueryPort: ^u16, punFlags: ^u32, pRTime32LastPlayedOnServer: ^u32) -> bool ---
    Matchmaking_AddFavoriteGame :: proc(self: ^IMatchmaking, nAppID: AppId, nIP: u32, nConnPort: u16, nQueryPort: u16, unFlags: u32, rTime32LastPlayedOnServer: u32) -> i32 ---
    Matchmaking_RemoveFavoriteGame :: proc(self: ^IMatchmaking, nAppID: AppId, nIP: u32, nConnPort: u16, nQueryPort: u16, unFlags: u32) -> bool ---
    Matchmaking_RequestLobbyList :: proc(self: ^IMatchmaking) -> SteamAPICall ---
    Matchmaking_AddRequestLobbyListStringFilter :: proc(self: ^IMatchmaking, pchKeyToMatch: cstring, pchValueToMatch: cstring, eComparisonType: ELobbyComparison) ---
    Matchmaking_AddRequestLobbyListNumericalFilter :: proc(self: ^IMatchmaking, pchKeyToMatch: cstring, nValueToMatch: i32, eComparisonType: ELobbyComparison) ---
    Matchmaking_AddRequestLobbyListNearValueFilter :: proc(self: ^IMatchmaking, pchKeyToMatch: cstring, nValueToBeCloseTo: i32) ---
    Matchmaking_AddRequestLobbyListFilterSlotsAvailable :: proc(self: ^IMatchmaking, nSlotsAvailable: i32) ---
    Matchmaking_AddRequestLobbyListDistanceFilter :: proc(self: ^IMatchmaking, eLobbyDistanceFilter: ELobbyDistanceFilter) ---
    Matchmaking_AddRequestLobbyListResultCountFilter :: proc(self: ^IMatchmaking, cMaxResults: i32) ---
    Matchmaking_AddRequestLobbyListCompatibleMembersFilter :: proc(self: ^IMatchmaking, steamIDLobby: CSteamID) ---
    Matchmaking_GetLobbyByIndex :: proc(self: ^IMatchmaking, iLobby: i32) -> CSteamID ---
    Matchmaking_CreateLobby :: proc(self: ^IMatchmaking, eLobbyType: ELobbyType, cMaxMembers: i32) -> SteamAPICall ---
    Matchmaking_JoinLobby :: proc(self: ^IMatchmaking, steamIDLobby: CSteamID) -> SteamAPICall ---
    Matchmaking_LeaveLobby :: proc(self: ^IMatchmaking, steamIDLobby: CSteamID) ---
    Matchmaking_InviteUserToLobby :: proc(self: ^IMatchmaking, steamIDLobby: CSteamID, steamIDInvitee: CSteamID) -> bool ---
    Matchmaking_GetNumLobbyMembers :: proc(self: ^IMatchmaking, steamIDLobby: CSteamID) -> i32 ---
    Matchmaking_GetLobbyMemberByIndex :: proc(self: ^IMatchmaking, steamIDLobby: CSteamID, iMember: i32) -> CSteamID ---
    Matchmaking_GetLobbyData :: proc(self: ^IMatchmaking, steamIDLobby: CSteamID, pchKey: cstring) -> cstring ---
    Matchmaking_SetLobbyData :: proc(self: ^IMatchmaking, steamIDLobby: CSteamID, pchKey: cstring, pchValue: cstring) -> bool ---
    Matchmaking_GetLobbyDataCount :: proc(self: ^IMatchmaking, steamIDLobby: CSteamID) -> i32 ---
    Matchmaking_GetLobbyDataByIndex :: proc(self: ^IMatchmaking, steamIDLobby: CSteamID, iLobbyData: i32, pchKey: ^u8, cchKeyBufferSize: i32, pchValue: ^u8, cchValueBufferSize: i32) -> bool ---
    Matchmaking_DeleteLobbyData :: proc(self: ^IMatchmaking, steamIDLobby: CSteamID, pchKey: cstring) -> bool ---
    Matchmaking_GetLobbyMemberData :: proc(self: ^IMatchmaking, steamIDLobby: CSteamID, steamIDUser: CSteamID, pchKey: cstring) -> cstring ---
    Matchmaking_SetLobbyMemberData :: proc(self: ^IMatchmaking, steamIDLobby: CSteamID, pchKey: cstring, pchValue: cstring) ---
    Matchmaking_SendLobbyChatMsg :: proc(self: ^IMatchmaking, steamIDLobby: CSteamID, pvMsgBody: rawptr, cubMsgBody: i32) -> bool ---
    Matchmaking_GetLobbyChatEntry :: proc(self: ^IMatchmaking, steamIDLobby: CSteamID, iChatID: i32, pSteamIDUser: ^CSteamID, pvData: rawptr, cubData: i32, peChatEntryType: ^EChatEntryType) -> i32 ---
    Matchmaking_RequestLobbyData :: proc(self: ^IMatchmaking, steamIDLobby: CSteamID) -> bool ---
    Matchmaking_SetLobbyGameServer :: proc(self: ^IMatchmaking, steamIDLobby: CSteamID, unGameServerIP: u32, unGameServerPort: u16, steamIDGameServer: CSteamID) ---
    Matchmaking_GetLobbyGameServer :: proc(self: ^IMatchmaking, steamIDLobby: CSteamID, punGameServerIP: ^u32, punGameServerPort: ^u16, psteamIDGameServer: ^CSteamID) -> bool ---
    Matchmaking_SetLobbyMemberLimit :: proc(self: ^IMatchmaking, steamIDLobby: CSteamID, cMaxMembers: i32) -> bool ---
    Matchmaking_GetLobbyMemberLimit :: proc(self: ^IMatchmaking, steamIDLobby: CSteamID) -> i32 ---
    Matchmaking_SetLobbyType :: proc(self: ^IMatchmaking, steamIDLobby: CSteamID, eLobbyType: ELobbyType) -> bool ---
    Matchmaking_SetLobbyJoinable :: proc(self: ^IMatchmaking, steamIDLobby: CSteamID, bLobbyJoinable: bool) -> bool ---
    Matchmaking_GetLobbyOwner :: proc(self: ^IMatchmaking, steamIDLobby: CSteamID) -> CSteamID ---
    Matchmaking_SetLobbyOwner :: proc(self: ^IMatchmaking, steamIDLobby: CSteamID, steamIDNewOwner: CSteamID) -> bool ---
    Matchmaking_SetLinkedLobby :: proc(self: ^IMatchmaking, steamIDLobby: CSteamID, steamIDLobbyDependent: CSteamID) -> bool ---

    MatchmakingServerListResponse_ServerResponded :: proc(self: ^IMatchmakingServerListResponse, hRequest: HServerListRequest, iServer: i32) ---
    MatchmakingServerListResponse_ServerFailedToRespond :: proc(self: ^IMatchmakingServerListResponse, hRequest: HServerListRequest, iServer: i32) ---
    MatchmakingServerListResponse_RefreshComplete :: proc(self: ^IMatchmakingServerListResponse, hRequest: HServerListRequest, response: EMatchMakingServerResponse) ---

    MatchmakingPingResponse_ServerResponded :: proc(self: ^IMatchmakingPingResponse, server: ^gameserveritet) ---
    MatchmakingPingResponse_ServerFailedToRespond :: proc(self: ^IMatchmakingPingResponse) ---

    MatchmakingPlayersResponse_AddPlayerToList :: proc(self: ^IMatchmakingPlayersResponse, pchName: cstring, nScore: i32, flTimePlayed: f32) ---
    MatchmakingPlayersResponse_PlayersFailedToRespond :: proc(self: ^IMatchmakingPlayersResponse) ---
    MatchmakingPlayersResponse_PlayersRefreshComplete :: proc(self: ^IMatchmakingPlayersResponse) ---

    MatchmakingRulesResponse_RulesResponded :: proc(self: ^IMatchmakingRulesResponse, pchRule: cstring, pchValue: cstring) ---
    MatchmakingRulesResponse_RulesFailedToRespond :: proc(self: ^IMatchmakingRulesResponse) ---
    MatchmakingRulesResponse_RulesRefreshComplete :: proc(self: ^IMatchmakingRulesResponse) ---

    MatchmakingServers_RequestInternetServerList :: proc(self: ^IMatchmakingServers, iApp: AppId, ppchFilters: ^^MatchMakingKeyValuePair, nFilters: u32, pRequestServersResponse: ^IMatchmakingServerListResponse) -> HServerListRequest ---
    MatchmakingServers_RequestLANServerList :: proc(self: ^IMatchmakingServers, iApp: AppId, pRequestServersResponse: ^IMatchmakingServerListResponse) -> HServerListRequest ---
    MatchmakingServers_RequestFriendsServerList :: proc(self: ^IMatchmakingServers, iApp: AppId, ppchFilters: ^^MatchMakingKeyValuePair, nFilters: u32, pRequestServersResponse: ^IMatchmakingServerListResponse) -> HServerListRequest ---
    MatchmakingServers_RequestFavoritesServerList :: proc(self: ^IMatchmakingServers, iApp: AppId, ppchFilters: ^^MatchMakingKeyValuePair, nFilters: u32, pRequestServersResponse: ^IMatchmakingServerListResponse) -> HServerListRequest ---
    MatchmakingServers_RequestHistoryServerList :: proc(self: ^IMatchmakingServers, iApp: AppId, ppchFilters: ^^MatchMakingKeyValuePair, nFilters: u32, pRequestServersResponse: ^IMatchmakingServerListResponse) -> HServerListRequest ---
    MatchmakingServers_RequestSpectatorServerList :: proc(self: ^IMatchmakingServers, iApp: AppId, ppchFilters: ^^MatchMakingKeyValuePair, nFilters: u32, pRequestServersResponse: ^IMatchmakingServerListResponse) -> HServerListRequest ---
    MatchmakingServers_ReleaseRequest :: proc(self: ^IMatchmakingServers, hServerListRequest: HServerListRequest) ---
    MatchmakingServers_GetServerDetails :: proc(self: ^IMatchmakingServers, hRequest: HServerListRequest, iServer: i32) -> ^gameserveritet ---
    MatchmakingServers_CancelQuery :: proc(self: ^IMatchmakingServers, hRequest: HServerListRequest) ---
    MatchmakingServers_RefreshQuery :: proc(self: ^IMatchmakingServers, hRequest: HServerListRequest) ---
    MatchmakingServers_IsRefreshing :: proc(self: ^IMatchmakingServers, hRequest: HServerListRequest) -> bool ---
    MatchmakingServers_GetServerCount :: proc(self: ^IMatchmakingServers, hRequest: HServerListRequest) -> i32 ---
    MatchmakingServers_RefreshServer :: proc(self: ^IMatchmakingServers, hRequest: HServerListRequest, iServer: i32) ---
    MatchmakingServers_PingServer :: proc(self: ^IMatchmakingServers, unIP: u32, usPort: u16, pRequestServersResponse: ^IMatchmakingPingResponse) -> HServerQuery ---
    MatchmakingServers_PlayerDetails :: proc(self: ^IMatchmakingServers, unIP: u32, usPort: u16, pRequestServersResponse: ^IMatchmakingPlayersResponse) -> HServerQuery ---
    MatchmakingServers_ServerRules :: proc(self: ^IMatchmakingServers, unIP: u32, usPort: u16, pRequestServersResponse: ^IMatchmakingRulesResponse) -> HServerQuery ---
    MatchmakingServers_CancelServerQuery :: proc(self: ^IMatchmakingServers, hServerQuery: HServerQuery) ---

    GameSearch_AddGameSearchParams :: proc(self: ^IGameSearch, pchKeyToFind: cstring, pchValuesToFind: cstring) -> EGameSearchErrorCode ---
    GameSearch_SearchForGameWithLobby :: proc(self: ^IGameSearch, steamIDLobby: CSteamID, nPlayerMin: i32, nPlayerMax: i32) -> EGameSearchErrorCode ---
    GameSearch_SearchForGameSolo :: proc(self: ^IGameSearch, nPlayerMin: i32, nPlayerMax: i32) -> EGameSearchErrorCode ---
    GameSearch_AcceptGame :: proc(self: ^IGameSearch) -> EGameSearchErrorCode ---
    GameSearch_DeclineGame :: proc(self: ^IGameSearch) -> EGameSearchErrorCode ---
    GameSearch_RetrieveConnectionDetails :: proc(self: ^IGameSearch, steamIDHost: CSteamID, pchConnectionDetails: ^u8, cubConnectionDetails: i32) -> EGameSearchErrorCode ---
    GameSearch_EndGameSearch :: proc(self: ^IGameSearch) -> EGameSearchErrorCode ---
    GameSearch_SetGameHostParams :: proc(self: ^IGameSearch, pchKey: cstring, pchValue: cstring) -> EGameSearchErrorCode ---
    GameSearch_SetConnectionDetails :: proc(self: ^IGameSearch, pchConnectionDetails: cstring, cubConnectionDetails: i32) -> EGameSearchErrorCode ---
    GameSearch_RequestPlayersForGame :: proc(self: ^IGameSearch, nPlayerMin: i32, nPlayerMax: i32, nMaxTeamSize: i32) -> EGameSearchErrorCode ---
    GameSearch_HostConfirmGameStart :: proc(self: ^IGameSearch, ullUniqueGameID: u64) -> EGameSearchErrorCode ---
    GameSearch_CancelRequestPlayersForGame :: proc(self: ^IGameSearch) -> EGameSearchErrorCode ---
    GameSearch_SubmitPlayerResult :: proc(self: ^IGameSearch, ullUniqueGameID: u64, steamIDPlayer: CSteamID, EPlayerResult: EPlayerResult) -> EGameSearchErrorCode ---
    GameSearch_EndGame :: proc(self: ^IGameSearch, ullUniqueGameID: u64) -> EGameSearchErrorCode ---

    Parties_GetNumActiveBeacons :: proc(self: ^IParties) -> u32 ---
    Parties_GetBeaconByIndex :: proc(self: ^IParties, unIndex: u32) -> PartyBeaconID ---
    Parties_GetBeaconDetails :: proc(self: ^IParties, ulBeaconID: PartyBeaconID, pSteamIDBeaconOwner: ^CSteamID, pLocation: ^SteamPartyBeaconLocation, pchMetadata: ^u8, cchMetadata: i32) -> bool ---
    Parties_JoinParty :: proc(self: ^IParties, ulBeaconID: PartyBeaconID) -> SteamAPICall ---
    Parties_GetNumAvailableBeaconLocations :: proc(self: ^IParties, puNumLocations: ^u32) -> bool ---
    Parties_GetAvailableBeaconLocations :: proc(self: ^IParties, pLocationList: ^SteamPartyBeaconLocation, uMaxNumLocations: u32) -> bool ---
    Parties_CreateBeacon :: proc(self: ^IParties, unOpenSlots: u32, pBeaconLocation: ^SteamPartyBeaconLocation, pchConnectString: cstring, pchMetadata: cstring) -> SteamAPICall ---
    Parties_OnReservationCompleted :: proc(self: ^IParties, ulBeacon: PartyBeaconID, steamIDUser: CSteamID) ---
    Parties_CancelReservation :: proc(self: ^IParties, ulBeacon: PartyBeaconID, steamIDUser: CSteamID) ---
    Parties_ChangeNumOpenSlots :: proc(self: ^IParties, ulBeacon: PartyBeaconID, unOpenSlots: u32) -> SteamAPICall ---
    Parties_DestroyBeacon :: proc(self: ^IParties, ulBeacon: PartyBeaconID) -> bool ---
    Parties_GetBeaconLocationData :: proc(self: ^IParties, BeaconLocation: SteamPartyBeaconLocation, eData: ESteamPartyBeaconLocationData, pchDataStringOut: ^u8, cchDataStringOut: i32) -> bool ---

    RemoteStorage_FileWrite :: proc(self: ^IRemoteStorage, pchFile: cstring, pvData: rawptr, cubData: i32) -> bool ---
    RemoteStorage_FileRead :: proc(self: ^IRemoteStorage, pchFile: cstring, pvData: rawptr, cubDataToRead: i32) -> i32 ---
    RemoteStorage_FileWriteAsync :: proc(self: ^IRemoteStorage, pchFile: cstring, pvData: rawptr, cubData: u32) -> SteamAPICall ---
    RemoteStorage_FileReadAsync :: proc(self: ^IRemoteStorage, pchFile: cstring, nOffset: u32, cubToRead: u32) -> SteamAPICall ---
    RemoteStorage_FileReadAsyncComplete :: proc(self: ^IRemoteStorage, hReadCall: SteamAPICall, pvBuffer: rawptr, cubToRead: u32) -> bool ---
    RemoteStorage_FileForget :: proc(self: ^IRemoteStorage, pchFile: cstring) -> bool ---
    RemoteStorage_FileDelete :: proc(self: ^IRemoteStorage, pchFile: cstring) -> bool ---
    RemoteStorage_FileShare :: proc(self: ^IRemoteStorage, pchFile: cstring) -> SteamAPICall ---
    RemoteStorage_SetSyncPlatforms :: proc(self: ^IRemoteStorage, pchFile: cstring, eRemoteStoragePlatform: ERemoteStoragePlatform) -> bool ---
    RemoteStorage_FileWriteStreamOpen :: proc(self: ^IRemoteStorage, pchFile: cstring) -> UGCFileWriteStreamHandle ---
    RemoteStorage_FileWriteStreamWriteChunk :: proc(self: ^IRemoteStorage, writeHandle: UGCFileWriteStreamHandle, pvData: rawptr, cubData: i32) -> bool ---
    RemoteStorage_FileWriteStreamClose :: proc(self: ^IRemoteStorage, writeHandle: UGCFileWriteStreamHandle) -> bool ---
    RemoteStorage_FileWriteStreamCancel :: proc(self: ^IRemoteStorage, writeHandle: UGCFileWriteStreamHandle) -> bool ---
    RemoteStorage_FileExists :: proc(self: ^IRemoteStorage, pchFile: cstring) -> bool ---
    RemoteStorage_FilePersisted :: proc(self: ^IRemoteStorage, pchFile: cstring) -> bool ---
    RemoteStorage_GetFileSize :: proc(self: ^IRemoteStorage, pchFile: cstring) -> i32 ---
    RemoteStorage_GetFileTimestamp :: proc(self: ^IRemoteStorage, pchFile: cstring) -> i64 ---
    RemoteStorage_GetSyncPlatforms :: proc(self: ^IRemoteStorage, pchFile: cstring) -> ERemoteStoragePlatform ---
    RemoteStorage_GetFileCount :: proc(self: ^IRemoteStorage) -> i32 ---
    RemoteStorage_GetFileNameAndSize :: proc(self: ^IRemoteStorage, iFile: i32, pnFileSizeInBytes: ^i32) -> cstring ---
    RemoteStorage_GetQuota :: proc(self: ^IRemoteStorage, pnTotalBytes: ^u64, puAvailableBytes: ^u64) -> bool ---
    RemoteStorage_IsCloudEnabledForAccount :: proc(self: ^IRemoteStorage) -> bool ---
    RemoteStorage_IsCloudEnabledForApp :: proc(self: ^IRemoteStorage) -> bool ---
    RemoteStorage_SetCloudEnabledForApp :: proc(self: ^IRemoteStorage, bEnabled: bool) ---
    RemoteStorage_UGCDownload :: proc(self: ^IRemoteStorage, hContent: UGCHandle, unPriority: u32) -> SteamAPICall ---
    RemoteStorage_GetUGCDownloadProgress :: proc(self: ^IRemoteStorage, hContent: UGCHandle, pnBytesDownloaded: ^i32, pnBytesExpected: ^i32) -> bool ---
    RemoteStorage_GetUGCDetails :: proc(self: ^IRemoteStorage, hContent: UGCHandle, pnAppID: ^AppId, ppchName: ^^u8, pnFileSizeInBytes: ^i32, pSteamIDOwner: ^CSteamID) -> bool ---
    RemoteStorage_UGCRead :: proc(self: ^IRemoteStorage, hContent: UGCHandle, pvData: rawptr, cubDataToRead: i32, cOffset: u32, eAction: EUGCReadAction) -> i32 ---
    RemoteStorage_GetCachedUGCCount :: proc(self: ^IRemoteStorage) -> i32 ---
    RemoteStorage_GetCachedUGCHandle :: proc(self: ^IRemoteStorage, iCachedContent: i32) -> UGCHandle ---
    RemoteStorage_PublishWorkshopFile :: proc(self: ^IRemoteStorage, pchFile: cstring, pchPreviewFile: cstring, nConsumerAppId: AppId, pchTitle: cstring, pchDescription: cstring, eVisibility: ERemoteStoragePublishedFileVisibility, pTags: ^SteamParamStringArray, eWorkshopFileType: EWorkshopFileType) -> SteamAPICall ---
    RemoteStorage_CreatePublishedFileUpdateRequest :: proc(self: ^IRemoteStorage, unPublishedFileId: PublishedFileId) -> PublishedFileUpdateHandle ---
    RemoteStorage_UpdatePublishedFileFile :: proc(self: ^IRemoteStorage, updateHandle: PublishedFileUpdateHandle, pchFile: cstring) -> bool ---
    RemoteStorage_UpdatePublishedFilePreviewFile :: proc(self: ^IRemoteStorage, updateHandle: PublishedFileUpdateHandle, pchPreviewFile: cstring) -> bool ---
    RemoteStorage_UpdatePublishedFileTitle :: proc(self: ^IRemoteStorage, updateHandle: PublishedFileUpdateHandle, pchTitle: cstring) -> bool ---
    RemoteStorage_UpdatePublishedFileDescription :: proc(self: ^IRemoteStorage, updateHandle: PublishedFileUpdateHandle, pchDescription: cstring) -> bool ---
    RemoteStorage_UpdatePublishedFileVisibility :: proc(self: ^IRemoteStorage, updateHandle: PublishedFileUpdateHandle, eVisibility: ERemoteStoragePublishedFileVisibility) -> bool ---
    RemoteStorage_UpdatePublishedFileTags :: proc(self: ^IRemoteStorage, updateHandle: PublishedFileUpdateHandle, pTags: ^SteamParamStringArray) -> bool ---
    RemoteStorage_CommitPublishedFileUpdate :: proc(self: ^IRemoteStorage, updateHandle: PublishedFileUpdateHandle) -> SteamAPICall ---
    RemoteStorage_GetPublishedFileDetails :: proc(self: ^IRemoteStorage, unPublishedFileId: PublishedFileId, unMaxSecondsOld: u32) -> SteamAPICall ---
    RemoteStorage_DeletePublishedFile :: proc(self: ^IRemoteStorage, unPublishedFileId: PublishedFileId) -> SteamAPICall ---
    RemoteStorage_EnumerateUserPublishedFiles :: proc(self: ^IRemoteStorage, unStartIndex: u32) -> SteamAPICall ---
    RemoteStorage_SubscribePublishedFile :: proc(self: ^IRemoteStorage, unPublishedFileId: PublishedFileId) -> SteamAPICall ---
    RemoteStorage_EnumerateUserSubscribedFiles :: proc(self: ^IRemoteStorage, unStartIndex: u32) -> SteamAPICall ---
    RemoteStorage_UnsubscribePublishedFile :: proc(self: ^IRemoteStorage, unPublishedFileId: PublishedFileId) -> SteamAPICall ---
    RemoteStorage_UpdatePublishedFileSetChangeDescription :: proc(self: ^IRemoteStorage, updateHandle: PublishedFileUpdateHandle, pchChangeDescription: cstring) -> bool ---
    RemoteStorage_GetPublishedItemVoteDetails :: proc(self: ^IRemoteStorage, unPublishedFileId: PublishedFileId) -> SteamAPICall ---
    RemoteStorage_UpdateUserPublishedItemVote :: proc(self: ^IRemoteStorage, unPublishedFileId: PublishedFileId, bVoteUp: bool) -> SteamAPICall ---
    RemoteStorage_GetUserPublishedItemVoteDetails :: proc(self: ^IRemoteStorage, unPublishedFileId: PublishedFileId) -> SteamAPICall ---
    RemoteStorage_EnumerateUserSharedWorkshopFiles :: proc(self: ^IRemoteStorage, steamId: CSteamID, unStartIndex: u32, pRequiredTags: ^SteamParamStringArray, pExcludedTags: ^SteamParamStringArray) -> SteamAPICall ---
    RemoteStorage_PublishVideo :: proc(self: ^IRemoteStorage, eVideoProvider: EWorkshopVideoProvider, pchVideoAccount: cstring, pchVideoIdentifier: cstring, pchPreviewFile: cstring, nConsumerAppId: AppId, pchTitle: cstring, pchDescription: cstring, eVisibility: ERemoteStoragePublishedFileVisibility, pTags: ^SteamParamStringArray) -> SteamAPICall ---
    RemoteStorage_SetUserPublishedFileAction :: proc(self: ^IRemoteStorage, unPublishedFileId: PublishedFileId, eAction: EWorkshopFileAction) -> SteamAPICall ---
    RemoteStorage_EnumeratePublishedFilesByUserAction :: proc(self: ^IRemoteStorage, eAction: EWorkshopFileAction, unStartIndex: u32) -> SteamAPICall ---
    RemoteStorage_EnumeratePublishedWorkshopFiles :: proc(self: ^IRemoteStorage, eEnumerationType: EWorkshopEnumerationType, unStartIndex: u32, unCount: u32, unDays: u32, pTags: ^SteamParamStringArray, pUserTags: ^SteamParamStringArray) -> SteamAPICall ---
    RemoteStorage_UGCDownloadToLocation :: proc(self: ^IRemoteStorage, hContent: UGCHandle, pchLocation: cstring, unPriority: u32) -> SteamAPICall ---
    RemoteStorage_GetLocalFileChangeCount :: proc(self: ^IRemoteStorage) -> i32 ---
    RemoteStorage_GetLocalFileChange :: proc(self: ^IRemoteStorage, iFile: i32, pEChangeType: ^ERemoteStorageLocalFileChange, pEFilePathType: ^ERemoteStorageFilePathType) -> cstring ---
    RemoteStorage_BeginFileWriteBatch :: proc(self: ^IRemoteStorage) -> bool ---
    RemoteStorage_EndFileWriteBatch :: proc(self: ^IRemoteStorage) -> bool ---

    UserStats_RequestCurrentStats :: proc(self: ^IUserStats) -> bool ---
    UserStats_GetStatInt32 :: proc(self: ^IUserStats, pchName: cstring, pData: ^i32) -> bool ---
    UserStats_GetStatFloat :: proc(self: ^IUserStats, pchName: cstring, pData: ^f32) -> bool ---
    UserStats_SetStatInt32 :: proc(self: ^IUserStats, pchName: cstring, nData: i32) -> bool ---
    UserStats_SetStatFloat :: proc(self: ^IUserStats, pchName: cstring, fData: f32) -> bool ---
    UserStats_UpdateAvgRateStat :: proc(self: ^IUserStats, pchName: cstring, flCountThisSession: f32, dSessionLength: f64) -> bool ---
    UserStats_GetAchievement :: proc(self: ^IUserStats, pchName: cstring, pbAchieved: ^bool) -> bool ---
    UserStats_SetAchievement :: proc(self: ^IUserStats, pchName: cstring) -> bool ---
    UserStats_ClearAchievement :: proc(self: ^IUserStats, pchName: cstring) -> bool ---
    UserStats_GetAchievementAndUnlockTime :: proc(self: ^IUserStats, pchName: cstring, pbAchieved: ^bool, punUnlockTime: ^u32) -> bool ---
    UserStats_StoreStats :: proc(self: ^IUserStats) -> bool ---
    UserStats_GetAchievementIcon :: proc(self: ^IUserStats, pchName: cstring) -> i32 ---
    UserStats_GetAchievementDisplayAttribute :: proc(self: ^IUserStats, pchName: cstring, pchKey: cstring) -> cstring ---
    UserStats_IndicateAchievementProgress :: proc(self: ^IUserStats, pchName: cstring, nCurProgress: u32, nMaxProgress: u32) -> bool ---
    UserStats_GetNumAchievements :: proc(self: ^IUserStats) -> u32 ---
    UserStats_GetAchievementName :: proc(self: ^IUserStats, iAchievement: u32) -> cstring ---
    UserStats_RequestUserStats :: proc(self: ^IUserStats, steamIDUser: CSteamID) -> SteamAPICall ---
    UserStats_GetUserStatInt32 :: proc(self: ^IUserStats, steamIDUser: CSteamID, pchName: cstring, pData: ^i32) -> bool ---
    UserStats_GetUserStatFloat :: proc(self: ^IUserStats, steamIDUser: CSteamID, pchName: cstring, pData: ^f32) -> bool ---
    UserStats_GetUserAchievement :: proc(self: ^IUserStats, steamIDUser: CSteamID, pchName: cstring, pbAchieved: ^bool) -> bool ---
    UserStats_GetUserAchievementAndUnlockTime :: proc(self: ^IUserStats, steamIDUser: CSteamID, pchName: cstring, pbAchieved: ^bool, punUnlockTime: ^u32) -> bool ---
    UserStats_ResetAllStats :: proc(self: ^IUserStats, bAchievementsToo: bool) -> bool ---
    UserStats_FindOrCreateLeaderboard :: proc(self: ^IUserStats, pchLeaderboardName: cstring, eLeaderboardSortMethod: ELeaderboardSortMethod, eLeaderboardDisplayType: ELeaderboardDisplayType) -> SteamAPICall ---
    UserStats_FindLeaderboard :: proc(self: ^IUserStats, pchLeaderboardName: cstring) -> SteamAPICall ---
    UserStats_GetLeaderboardName :: proc(self: ^IUserStats, hSteamLeaderboard: SteamLeaderboard) -> cstring ---
    UserStats_GetLeaderboardEntryCount :: proc(self: ^IUserStats, hSteamLeaderboard: SteamLeaderboard) -> i32 ---
    UserStats_GetLeaderboardSortMethod :: proc(self: ^IUserStats, hSteamLeaderboard: SteamLeaderboard) -> ELeaderboardSortMethod ---
    UserStats_GetLeaderboardDisplayType :: proc(self: ^IUserStats, hSteamLeaderboard: SteamLeaderboard) -> ELeaderboardDisplayType ---
    UserStats_DownloadLeaderboardEntries :: proc(self: ^IUserStats, hSteamLeaderboard: SteamLeaderboard, eLeaderboardDataRequest: ELeaderboardDataRequest, nRangeStart: i32, nRangeEnd: i32) -> SteamAPICall ---
    UserStats_DownloadLeaderboardEntriesForUsers :: proc(self: ^IUserStats, hSteamLeaderboard: SteamLeaderboard, prgUsers: ^CSteamID, cUsers: i32) -> SteamAPICall ---
    UserStats_GetDownloadedLeaderboardEntry :: proc(self: ^IUserStats, hSteamLeaderboardEntries: SteamLeaderboardEntries, index: i32, pLeaderboardEntry: ^LeaderboardEntry, pDetails: ^i32, cDetailsMax: i32) -> bool ---
    UserStats_UploadLeaderboardScore :: proc(self: ^IUserStats, hSteamLeaderboard: SteamLeaderboard, eLeaderboardUploadScoreMethod: ELeaderboardUploadScoreMethod, nScore: i32, pScoreDetails: ^i32, cScoreDetailsCount: i32) -> SteamAPICall ---
    UserStats_AttachLeaderboardUGC :: proc(self: ^IUserStats, hSteamLeaderboard: SteamLeaderboard, hUGC: UGCHandle) -> SteamAPICall ---
    UserStats_GetNumberOfCurrentPlayers :: proc(self: ^IUserStats) -> SteamAPICall ---
    UserStats_RequestGlobalAchievementPercentages :: proc(self: ^IUserStats) -> SteamAPICall ---
    UserStats_GetMostAchievedAchievementInfo :: proc(self: ^IUserStats, pchName: ^u8, unNameBufLen: u32, pflPercent: ^f32, pbAchieved: ^bool) -> i32 ---
    UserStats_GetNextMostAchievedAchievementInfo :: proc(self: ^IUserStats, iIteratorPrevious: i32, pchName: ^u8, unNameBufLen: u32, pflPercent: ^f32, pbAchieved: ^bool) -> i32 ---
    UserStats_GetAchievementAchievedPercent :: proc(self: ^IUserStats, pchName: cstring, pflPercent: ^f32) -> bool ---
    UserStats_RequestGlobalStats :: proc(self: ^IUserStats, nHistoryDays: i32) -> SteamAPICall ---
    UserStats_GetGlobalStatInt64 :: proc(self: ^IUserStats, pchStatName: cstring, pData: ^i64) -> bool ---
    UserStats_GetGlobalStatFloat64 :: proc(self: ^IUserStats, pchStatName: cstring, pData: ^f64) -> bool ---
    UserStats_GetGlobalStatHistoryInt64 :: proc(self: ^IUserStats, pchStatName: cstring, pData: ^i64, cubData: u32) -> i32 ---
    UserStats_GetGlobalStatHistoryFloat64 :: proc(self: ^IUserStats, pchStatName: cstring, pData: ^f64, cubData: u32) -> i32 ---
    UserStats_GetAchievementProgressLimitsInt32 :: proc(self: ^IUserStats, pchName: cstring, pnMinProgress: ^i32, pnMaxProgress: ^i32) -> bool ---
    UserStats_GetAchievementProgressLimitsFloat :: proc(self: ^IUserStats, pchName: cstring, pfMinProgress: ^f32, pfMaxProgress: ^f32) -> bool ---

    Apps_BIsSubscribed :: proc(self: ^IApps) -> bool ---
    Apps_BIsLowViolence :: proc(self: ^IApps) -> bool ---
    Apps_BIsCybercafe :: proc(self: ^IApps) -> bool ---
    Apps_BIsVACBanned :: proc(self: ^IApps) -> bool ---
    Apps_GetCurrentGameLanguage :: proc(self: ^IApps) -> cstring ---
    Apps_GetAvailableGameLanguages :: proc(self: ^IApps) -> cstring ---
    Apps_BIsSubscribedApp :: proc(self: ^IApps, appID: AppId) -> bool ---
    Apps_BIsDlcInstalled :: proc(self: ^IApps, appID: AppId) -> bool ---
    Apps_GetEarliestPurchaseUnixTime :: proc(self: ^IApps, nAppID: AppId) -> u32 ---
    Apps_BIsSubscribedFromFreeWeekend :: proc(self: ^IApps) -> bool ---
    Apps_GetDLCCount :: proc(self: ^IApps) -> i32 ---
    Apps_BGetDLCDataByIndex :: proc(self: ^IApps, iDLC: i32, pAppID: ^AppId, pbAvailable: ^bool, pchName: ^u8, cchNameBufferSize: i32) -> bool ---
    Apps_InstallDLC :: proc(self: ^IApps, nAppID: AppId) ---
    Apps_UninstallDLC :: proc(self: ^IApps, nAppID: AppId) ---
    Apps_RequestAppProofOfPurchaseKey :: proc(self: ^IApps, nAppID: AppId) ---
    Apps_GetCurrentBetaName :: proc(self: ^IApps, pchName: ^u8, cchNameBufferSize: i32) -> bool ---
    Apps_MarkContentCorrupt :: proc(self: ^IApps, bMissingFilesOnly: bool) -> bool ---
    Apps_GetInstalledDepots :: proc(self: ^IApps, appID: AppId, pvecDepots: ^DepotId, cMaxDepots: u32) -> u32 ---
    Apps_GetAppInstallDir :: proc(self: ^IApps, appID: AppId, pchFolder: ^u8, cchFolderBufferSize: u32) -> u32 ---
    Apps_BIsAppInstalled :: proc(self: ^IApps, appID: AppId) -> bool ---
    Apps_GetAppOwner :: proc(self: ^IApps) -> CSteamID ---
    Apps_GetLaunchQueryParam :: proc(self: ^IApps, pchKey: cstring) -> cstring ---
    Apps_GetDlcDownloadProgress :: proc(self: ^IApps, nAppID: AppId, punBytesDownloaded: ^u64, punBytesTotal: ^u64) -> bool ---
    Apps_GetAppBuildId :: proc(self: ^IApps) -> i32 ---
    Apps_RequestAllProofOfPurchaseKeys :: proc(self: ^IApps) ---
    Apps_GetFileDetails :: proc(self: ^IApps, pszFileName: cstring) -> SteamAPICall ---
    Apps_GetLaunchCommandLine :: proc(self: ^IApps, pszCommandLine: ^u8, cubCommandLine: i32) -> i32 ---
    Apps_BIsSubscribedFromFamilySharing :: proc(self: ^IApps) -> bool ---
    Apps_BIsTimedTrial :: proc(self: ^IApps, punSecondsAllowed: ^u32, punSecondsPlayed: ^u32) -> bool ---
    Apps_SetDlcContext :: proc(self: ^IApps, nAppID: AppId) -> bool ---
    Apps_GetNumBetas :: proc(self: ^IApps, unAppID: AppId, pnAvailable: ^i32, pnPrivate: ^i32) -> i32 ---
    Apps_GetBetaInfo :: proc(self: ^IApps, unAppID: AppId, iBetaIndex: i32, punFlags: ^u32, punBuildID: ^u32, pchBetaName: [^]byte, cchBetaName: i32, pchDescription: [^]byte, cchDescription: i32) -> bool ---
    Apps_SetActiveBeta :: proc(self: ^IApps, unAppID: AppId, pchBetaName: cstring) -> bool ---

    Networking_SendP2PPacket :: proc(self: ^INetworking, steamIDRemote: CSteamID, pubData: rawptr, cubData: u32, eP2PSendType: EP2PSend, nChannel: i32) -> bool ---
    Networking_IsP2PPacketAvailable :: proc(self: ^INetworking, pcubMsgSize: ^u32, nChannel: i32) -> bool ---
    Networking_ReadP2PPacket :: proc(self: ^INetworking, pubDest: rawptr, cubDest: u32, pcubMsgSize: ^u32, psteamIDRemote: ^CSteamID, nChannel: i32) -> bool ---
    Networking_AcceptP2PSessionWithUser :: proc(self: ^INetworking, steamIDRemote: CSteamID) -> bool ---
    Networking_CloseP2PSessionWithUser :: proc(self: ^INetworking, steamIDRemote: CSteamID) -> bool ---
    Networking_CloseP2PChannelWithUser :: proc(self: ^INetworking, steamIDRemote: CSteamID, nChannel: i32) -> bool ---
    Networking_GetP2PSessionState :: proc(self: ^INetworking, steamIDRemote: CSteamID, pConnectionState: ^P2PSessionState) -> bool ---
    Networking_AllowP2PPacketRelay :: proc(self: ^INetworking, bAllow: bool) -> bool ---
    Networking_CreateListenSocket :: proc(self: ^INetworking, nVirtualP2PPort: i32, nIP: SteamIPAddress, nPort: u16, bAllowUseOfPacketRelay: bool) -> SNetListenSocket ---
    Networking_CreateP2PConnectionSocket :: proc(self: ^INetworking, steamIDTarget: CSteamID, nVirtualPort: i32, nTimeoutSec: i32, bAllowUseOfPacketRelay: bool) -> SNetSocket ---
    Networking_CreateConnectionSocket :: proc(self: ^INetworking, nIP: SteamIPAddress, nPort: u16, nTimeoutSec: i32) -> SNetSocket ---
    Networking_DestroySocket :: proc(self: ^INetworking, hSocket: SNetSocket, bNotifyRemoteEnd: bool) -> bool ---
    Networking_DestroyListenSocket :: proc(self: ^INetworking, hSocket: SNetListenSocket, bNotifyRemoteEnd: bool) -> bool ---
    Networking_SendDataOnSocket :: proc(self: ^INetworking, hSocket: SNetSocket, pubData: rawptr, cubData: u32, bReliable: bool) -> bool ---
    Networking_IsDataAvailableOnSocket :: proc(self: ^INetworking, hSocket: SNetSocket, pcubMsgSize: ^u32) -> bool ---
    Networking_RetrieveDataFromSocket :: proc(self: ^INetworking, hSocket: SNetSocket, pubDest: rawptr, cubDest: u32, pcubMsgSize: ^u32) -> bool ---
    Networking_IsDataAvailable :: proc(self: ^INetworking, hListenSocket: SNetListenSocket, pcubMsgSize: ^u32, phSocket: ^SNetSocket) -> bool ---
    Networking_RetrieveData :: proc(self: ^INetworking, hListenSocket: SNetListenSocket, pubDest: rawptr, cubDest: u32, pcubMsgSize: ^u32, phSocket: ^SNetSocket) -> bool ---
    Networking_GetSocketInfo :: proc(self: ^INetworking, hSocket: SNetSocket, pSteamIDRemote: ^CSteamID, peSocketStatus: ^int, punIPRemote: ^SteamIPAddress, punPortRemote: ^u16) -> bool ---
    Networking_GetListenSocketInfo :: proc(self: ^INetworking, hListenSocket: SNetListenSocket, pnIP: ^SteamIPAddress, pnPort: ^u16) -> bool ---
    Networking_GetSocketConnectionType :: proc(self: ^INetworking, hSocket: SNetSocket) -> ESNetSocketConnectionType ---
    Networking_GetMaxPacketSize :: proc(self: ^INetworking, hSocket: SNetSocket) -> i32 ---

    Screenshots_WriteScreenshot :: proc(self: ^IScreenshots, pubRGB: rawptr, cubRGB: u32, nWidth: i32, nHeight: i32) -> ScreenshotHandle ---
    Screenshots_AddScreenshotToLibrary :: proc(self: ^IScreenshots, pchFilename: cstring, pchThumbnailFilename: cstring, nWidth: i32, nHeight: i32) -> ScreenshotHandle ---
    Screenshots_TriggerScreenshot :: proc(self: ^IScreenshots) ---
    Screenshots_HookScreenshots :: proc(self: ^IScreenshots, bHook: bool) ---
    Screenshots_SetLocation :: proc(self: ^IScreenshots, hScreenshot: ScreenshotHandle, pchLocation: cstring) -> bool ---
    Screenshots_TagUser :: proc(self: ^IScreenshots, hScreenshot: ScreenshotHandle, steamID: CSteamID) -> bool ---
    Screenshots_TagPublishedFile :: proc(self: ^IScreenshots, hScreenshot: ScreenshotHandle, unPublishedFileID: PublishedFileId) -> bool ---
    Screenshots_IsScreenshotsHooked :: proc(self: ^IScreenshots) -> bool ---
    Screenshots_AddVRScreenshotToLibrary :: proc(self: ^IScreenshots, eType: EVRScreenshotType, pchFilename: cstring, pchVRFilename: cstring) -> ScreenshotHandle ---

    Music_BIsEnabled :: proc(self: ^IMusic) -> bool ---
    Music_BIsPlaying :: proc(self: ^IMusic) -> bool ---
    Music_GetPlaybackStatus :: proc(self: ^IMusic) -> AudioPlaybacStatus ---
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
    MusicRemote_SetPNGIcon_64x64 :: proc(self: ^IMusicRemote, pvBuffer: rawptr, cbBufferLength: u32) -> bool ---
    MusicRemote_EnablePlayPrevious :: proc(self: ^IMusicRemote, bValue: bool) -> bool ---
    MusicRemote_EnablePlayNext :: proc(self: ^IMusicRemote, bValue: bool) -> bool ---
    MusicRemote_EnableShuffled :: proc(self: ^IMusicRemote, bValue: bool) -> bool ---
    MusicRemote_EnableLooped :: proc(self: ^IMusicRemote, bValue: bool) -> bool ---
    MusicRemote_EnableQueue :: proc(self: ^IMusicRemote, bValue: bool) -> bool ---
    MusicRemote_EnablePlaylists :: proc(self: ^IMusicRemote, bValue: bool) -> bool ---
    MusicRemote_UpdatePlaybackStatus :: proc(self: ^IMusicRemote, nStatus: AudioPlaybacStatus) -> bool ---
    MusicRemote_UpdateShuffled :: proc(self: ^IMusicRemote, bValue: bool) -> bool ---
    MusicRemote_UpdateLooped :: proc(self: ^IMusicRemote, bValue: bool) -> bool ---
    MusicRemote_UpdateVolume :: proc(self: ^IMusicRemote, flValue: f32) -> bool ---
    MusicRemote_CurrentEntryWillChange :: proc(self: ^IMusicRemote) -> bool ---
    MusicRemote_CurrentEntryIsAvailable :: proc(self: ^IMusicRemote, bAvailable: bool) -> bool ---
    MusicRemote_UpdateCurrentEntryText :: proc(self: ^IMusicRemote, pchText: cstring) -> bool ---
    MusicRemote_UpdateCurrentEntryElapsedSeconds :: proc(self: ^IMusicRemote, nValue: i32) -> bool ---
    MusicRemote_UpdateCurrentEntryCoverArt :: proc(self: ^IMusicRemote, pvBuffer: rawptr, cbBufferLength: u32) -> bool ---
    MusicRemote_CurrentEntryDidChange :: proc(self: ^IMusicRemote) -> bool ---
    MusicRemote_QueueWillChange :: proc(self: ^IMusicRemote) -> bool ---
    MusicRemote_ResetQueueEntries :: proc(self: ^IMusicRemote) -> bool ---
    MusicRemote_SetQueueEntry :: proc(self: ^IMusicRemote, nID: i32, nPosition: i32, pchEntryText: cstring) -> bool ---
    MusicRemote_SetCurrentQueueEntry :: proc(self: ^IMusicRemote, nID: i32) -> bool ---
    MusicRemote_QueueDidChange :: proc(self: ^IMusicRemote) -> bool ---
    MusicRemote_PlaylistWillChange :: proc(self: ^IMusicRemote) -> bool ---
    MusicRemote_ResetPlaylistEntries :: proc(self: ^IMusicRemote) -> bool ---
    MusicRemote_SetPlaylistEntry :: proc(self: ^IMusicRemote, nID: i32, nPosition: i32, pchEntryText: cstring) -> bool ---
    MusicRemote_SetCurrentPlaylistEntry :: proc(self: ^IMusicRemote, nID: i32) -> bool ---
    MusicRemote_PlaylistDidChange :: proc(self: ^IMusicRemote) -> bool ---

    HTTP_CreateHTTPRequest :: proc(self: ^IHTTP, eHTTPRequestMethod: EHTTPMethod, pchAbsoluteURL: cstring) -> HTTPRequestHandle ---
    HTTP_SetHTTPRequestContextValue :: proc(self: ^IHTTP, hRequest: HTTPRequestHandle, ulContextValue: u64) -> bool ---
    HTTP_SetHTTPRequestNetworkActivityTimeout :: proc(self: ^IHTTP, hRequest: HTTPRequestHandle, unTimeoutSeconds: u32) -> bool ---
    HTTP_SetHTTPRequestHeaderValue :: proc(self: ^IHTTP, hRequest: HTTPRequestHandle, pchHeaderName: cstring, pchHeaderValue: cstring) -> bool ---
    HTTP_SetHTTPRequestGetOrPostParameter :: proc(self: ^IHTTP, hRequest: HTTPRequestHandle, pchParamName: cstring, pchParamValue: cstring) -> bool ---
    HTTP_SendHTTPRequest :: proc(self: ^IHTTP, hRequest: HTTPRequestHandle, pCallHandle: ^SteamAPICall) -> bool ---
    HTTP_SendHTTPRequestAndStreamResponse :: proc(self: ^IHTTP, hRequest: HTTPRequestHandle, pCallHandle: ^SteamAPICall) -> bool ---
    HTTP_DeferHTTPRequest :: proc(self: ^IHTTP, hRequest: HTTPRequestHandle) -> bool ---
    HTTP_PrioritizeHTTPRequest :: proc(self: ^IHTTP, hRequest: HTTPRequestHandle) -> bool ---
    HTTP_GetHTTPResponseHeaderSize :: proc(self: ^IHTTP, hRequest: HTTPRequestHandle, pchHeaderName: cstring, unResponseHeaderSize: ^u32) -> bool ---
    HTTP_GetHTTPResponseHeaderValue :: proc(self: ^IHTTP, hRequest: HTTPRequestHandle, pchHeaderName: cstring, pHeaderValueBuffer: ^u8, unBufferSize: u32) -> bool ---
    HTTP_GetHTTPResponseBodySize :: proc(self: ^IHTTP, hRequest: HTTPRequestHandle, unBodySize: ^u32) -> bool ---
    HTTP_GetHTTPResponseBodyData :: proc(self: ^IHTTP, hRequest: HTTPRequestHandle, pBodyDataBuffer: ^u8, unBufferSize: u32) -> bool ---
    HTTP_GetHTTPStreamingResponseBodyData :: proc(self: ^IHTTP, hRequest: HTTPRequestHandle, cOffset: u32, pBodyDataBuffer: ^u8, unBufferSize: u32) -> bool ---
    HTTP_ReleaseHTTPRequest :: proc(self: ^IHTTP, hRequest: HTTPRequestHandle) -> bool ---
    HTTP_GetHTTPDownloadProgressPct :: proc(self: ^IHTTP, hRequest: HTTPRequestHandle, pflPercentOut: ^f32) -> bool ---
    HTTP_SetHTTPRequestRawPostBody :: proc(self: ^IHTTP, hRequest: HTTPRequestHandle, pchContentType: cstring, pubBody: ^u8, unBodyLen: u32) -> bool ---
    HTTP_CreateCookieContainer :: proc(self: ^IHTTP, bAllowResponsesToModify: bool) -> HTTPCookieContainerHandle ---
    HTTP_ReleaseCookieContainer :: proc(self: ^IHTTP, hCookieContainer: HTTPCookieContainerHandle) -> bool ---
    HTTP_SetCookie :: proc(self: ^IHTTP, hCookieContainer: HTTPCookieContainerHandle, pchHost: cstring, pchUrl: cstring, pchCookie: cstring) -> bool ---
    HTTP_SetHTTPRequestCookieContainer :: proc(self: ^IHTTP, hRequest: HTTPRequestHandle, hCookieContainer: HTTPCookieContainerHandle) -> bool ---
    HTTP_SetHTTPRequestUserAgentInfo :: proc(self: ^IHTTP, hRequest: HTTPRequestHandle, pchUserAgentInfo: cstring) -> bool ---
    HTTP_SetHTTPRequestRequiresVerifiedCertificate :: proc(self: ^IHTTP, hRequest: HTTPRequestHandle, bRequireVerifiedCertificate: bool) -> bool ---
    HTTP_SetHTTPRequestAbsoluteTimeoutMS :: proc(self: ^IHTTP, hRequest: HTTPRequestHandle, unMilliseconds: u32) -> bool ---
    HTTP_GetHTTPRequestWasTimedOut :: proc(self: ^IHTTP, hRequest: HTTPRequestHandle, pbWasTimedOut: ^bool) -> bool ---

    Input_Init :: proc(self: ^IInput, bExplicitlyCallRunFrame: bool) -> bool ---
    Input_Shutdown :: proc(self: ^IInput) -> bool ---
    Input_SetInputActionManifestFilePath :: proc(self: ^IInput, pchInputActionManifestAbsolutePath: cstring) -> bool ---
    Input_RunFrame :: proc(self: ^IInput, bReservedValue: bool) ---
    Input_BWaitForData :: proc(self: ^IInput, bWaitForever: bool, unTimeout: u32) -> bool ---
    Input_BNewDataAvailable :: proc(self: ^IInput) -> bool ---
    Input_GetConnectedControllers :: proc(self: ^IInput, handlesOut: ^InputHandle) -> i32 ---
    Input_EnableDeviceCallbacks :: proc(self: ^IInput) ---
    Input_EnableActionEventCallbacks :: proc(self: ^IInput, pCallback: SteamInputActionEventCallbackPointer) ---
    Input_GetActionSetHandle :: proc(self: ^IInput, pszActionSetName: cstring) -> InputActionSetHandle ---
    Input_ActivateActionSet :: proc(self: ^IInput, inputHandle: InputHandle, actionSetHandle: InputActionSetHandle) ---
    Input_GetCurrentActionSet :: proc(self: ^IInput, inputHandle: InputHandle) -> InputActionSetHandle ---
    Input_ActivateActionSetLayer :: proc(self: ^IInput, inputHandle: InputHandle, actionSetLayerHandle: InputActionSetHandle) ---
    Input_DeactivateActionSetLayer :: proc(self: ^IInput, inputHandle: InputHandle, actionSetLayerHandle: InputActionSetHandle) ---
    Input_DeactivateAllActionSetLayers :: proc(self: ^IInput, inputHandle: InputHandle) ---
    Input_GetActiveActionSetLayers :: proc(self: ^IInput, inputHandle: InputHandle, handlesOut: ^InputActionSetHandle) -> i32 ---
    Input_GetDigitalActionHandle :: proc(self: ^IInput, pszActionName: cstring) -> InputDigitalActionHandle ---
    Input_GetDigitalActionData :: proc(self: ^IInput, inputHandle: InputHandle, digitalActionHandle: InputDigitalActionHandle) -> InputDigitalActionData ---
    Input_GetDigitalActionOrigins :: proc(self: ^IInput, inputHandle: InputHandle, actionSetHandle: InputActionSetHandle, digitalActionHandle: InputDigitalActionHandle, originsOut: ^EInputActionOrigin) -> i32 ---
    Input_GetStringForDigitalActionName :: proc(self: ^IInput, eActionHandle: InputDigitalActionHandle) -> cstring ---
    Input_GetAnalogActionHandle :: proc(self: ^IInput, pszActionName: cstring) -> InputAnalogActionHandle ---
    Input_GetAnalogActionData :: proc(self: ^IInput, inputHandle: InputHandle, analogActionHandle: InputAnalogActionHandle) -> InputAnalogActionData ---
    Input_GetAnalogActionOrigins :: proc(self: ^IInput, inputHandle: InputHandle, actionSetHandle: InputActionSetHandle, analogActionHandle: InputAnalogActionHandle, originsOut: ^EInputActionOrigin) -> i32 ---
    Input_GetGlyphPNGForActionOrigin :: proc(self: ^IInput, eOrigin: EInputActionOrigin, eSize: ESteamInputGlyphSize, unFlags: u32) -> cstring ---
    Input_GetGlyphSVGForActionOrigin :: proc(self: ^IInput, eOrigin: EInputActionOrigin, unFlags: u32) -> cstring ---
    Input_GetGlyphForActionOrigin_Legacy :: proc(self: ^IInput, eOrigin: EInputActionOrigin) -> cstring ---
    Input_GetStringForActionOrigin :: proc(self: ^IInput, eOrigin: EInputActionOrigin) -> cstring ---
    Input_GetStringForAnalogActionName :: proc(self: ^IInput, eActionHandle: InputAnalogActionHandle) -> cstring ---
    Input_StopAnalogActionMomentum :: proc(self: ^IInput, inputHandle: InputHandle, eAction: InputAnalogActionHandle) ---
    Input_GetMotionData :: proc(self: ^IInput, inputHandle: InputHandle) -> InputMotionData ---
    Input_TriggerVibration :: proc(self: ^IInput, inputHandle: InputHandle, usLeftSpeed: u16, usRightSpeed: u16) ---
    Input_TriggerVibrationExtended :: proc(self: ^IInput, inputHandle: InputHandle, usLeftSpeed: u16, usRightSpeed: u16, usLeftTriggerSpeed: u16, usRightTriggerSpeed: u16) ---
    Input_TriggerSimpleHapticEvent :: proc(self: ^IInput, inputHandle: InputHandle, eHapticLocation: EControllerHapticLocation, nIntensity: u8, nGainDB: i8, nOtherIntensity: u8, nOtherGainDB: i8) ---
    Input_SetLEDColor :: proc(self: ^IInput, inputHandle: InputHandle, nColorR: u8, nColorG: u8, nColorB: u8, nFlags: u32) ---
    Input_Legacy_TriggerHapticPulse :: proc(self: ^IInput, inputHandle: InputHandle, eTargetPad: ESteamControllerPad, usDurationMicroSec: u16) ---
    Input_Legacy_TriggerRepeatedHapticPulse :: proc(self: ^IInput, inputHandle: InputHandle, eTargetPad: ESteamControllerPad, usDurationMicroSec: u16, usOffMicroSec: u16, unRepeat: u16, nFlags: u32) ---
    Input_ShowBindingPanel :: proc(self: ^IInput, inputHandle: InputHandle) -> bool ---
    Input_GetInputTypeForHandle :: proc(self: ^IInput, inputHandle: InputHandle) -> ESteamInputType ---
    Input_GetControllerForGamepadIndex :: proc(self: ^IInput, nIndex: i32) -> InputHandle ---
    Input_GetGamepadIndexForController :: proc(self: ^IInput, ulinputHandle: InputHandle) -> i32 ---
    Input_GetStringForXboxOrigin :: proc(self: ^IInput, eOrigin: EXboxOrigin) -> cstring ---
    Input_GetGlyphForXboxOrigin :: proc(self: ^IInput, eOrigin: EXboxOrigin) -> cstring ---
    Input_GetActionOriginFromXboxOrigin :: proc(self: ^IInput, inputHandle: InputHandle, eOrigin: EXboxOrigin) -> EInputActionOrigin ---
    Input_TranslateActionOrigin :: proc(self: ^IInput, eDestinationInputType: ESteamInputType, eSourceOrigin: EInputActionOrigin) -> EInputActionOrigin ---
    Input_GetDeviceBindingRevision :: proc(self: ^IInput, inputHandle: InputHandle, pMajor: ^int, pMinor: ^int) -> bool ---
    Input_GetRemotePlaySessionID :: proc(self: ^IInput, inputHandle: InputHandle) -> u32 ---
    Input_GetSessionInputConfigurationSettings :: proc(self: ^IInput) -> u16 ---
    // IInput_SetDualSenseTriggerEffect :: proc(self: ^IInput, inputHandle: InputHandle, pParam: ^ScePadTriggerEffectParam) ---

    Controller_Init :: proc(self: ^IController) -> bool ---
    Controller_Shutdown :: proc(self: ^IController) -> bool ---
    Controller_RunFrame :: proc(self: ^IController) ---
    Controller_GetConnectedControllers :: proc(self: ^IController, handlesOut: ^ControllerHandle) -> i32 ---
    Controller_GetActionSetHandle :: proc(self: ^IController, pszActionSetName: cstring) -> ControllerActionSetHandle ---
    Controller_ActivateActionSet :: proc(self: ^IController, controllerHandle: ControllerHandle, actionSetHandle: ControllerActionSetHandle) ---
    Controller_GetCurrentActionSet :: proc(self: ^IController, controllerHandle: ControllerHandle) -> ControllerActionSetHandle ---
    Controller_ActivateActionSetLayer :: proc(self: ^IController, controllerHandle: ControllerHandle, actionSetLayerHandle: ControllerActionSetHandle) ---
    Controller_DeactivateActionSetLayer :: proc(self: ^IController, controllerHandle: ControllerHandle, actionSetLayerHandle: ControllerActionSetHandle) ---
    Controller_DeactivateAllActionSetLayers :: proc(self: ^IController, controllerHandle: ControllerHandle) ---
    Controller_GetActiveActionSetLayers :: proc(self: ^IController, controllerHandle: ControllerHandle, handlesOut: ^ControllerActionSetHandle) -> i32 ---
    Controller_GetDigitalActionHandle :: proc(self: ^IController, pszActionName: cstring) -> ControllerDigitalActionHandle ---
    Controller_GetDigitalActionData :: proc(self: ^IController, controllerHandle: ControllerHandle, digitalActionHandle: ControllerDigitalActionHandle) -> InputDigitalActionData ---
    Controller_GetDigitalActionOrigins :: proc(self: ^IController, controllerHandle: ControllerHandle, actionSetHandle: ControllerActionSetHandle, digitalActionHandle: ControllerDigitalActionHandle, originsOut: ^EControllerActionOrigin) -> i32 ---
    Controller_GetAnalogActionHandle :: proc(self: ^IController, pszActionName: cstring) -> ControllerAnalogActionHandle ---
    Controller_GetAnalogActionData :: proc(self: ^IController, controllerHandle: ControllerHandle, analogActionHandle: ControllerAnalogActionHandle) -> InputAnalogActionData ---
    Controller_GetAnalogActionOrigins :: proc(self: ^IController, controllerHandle: ControllerHandle, actionSetHandle: ControllerActionSetHandle, analogActionHandle: ControllerAnalogActionHandle, originsOut: ^EControllerActionOrigin) -> i32 ---
    Controller_GetGlyphForActionOrigin :: proc(self: ^IController, eOrigin: EControllerActionOrigin) -> cstring ---
    Controller_GetStringForActionOrigin :: proc(self: ^IController, eOrigin: EControllerActionOrigin) -> cstring ---
    Controller_StopAnalogActionMomentum :: proc(self: ^IController, controllerHandle: ControllerHandle, eAction: ControllerAnalogActionHandle) ---
    Controller_GetMotionData :: proc(self: ^IController, controllerHandle: ControllerHandle) -> InputMotionData ---
    Controller_TriggerHapticPulse :: proc(self: ^IController, controllerHandle: ControllerHandle, eTargetPad: ESteamControllerPad, usDurationMicroSec: u16) ---
    Controller_TriggerRepeatedHapticPulse :: proc(self: ^IController, controllerHandle: ControllerHandle, eTargetPad: ESteamControllerPad, usDurationMicroSec: u16, usOffMicroSec: u16, unRepeat: u16, nFlags: u32) ---
    Controller_TriggerVibration :: proc(self: ^IController, controllerHandle: ControllerHandle, usLeftSpeed: u16, usRightSpeed: u16) ---
    Controller_SetLEDColor :: proc(self: ^IController, controllerHandle: ControllerHandle, nColorR: u8, nColorG: u8, nColorB: u8, nFlags: u32) ---
    Controller_ShowBindingPanel :: proc(self: ^IController, controllerHandle: ControllerHandle) -> bool ---
    Controller_GetInputTypeForHandle :: proc(self: ^IController, controllerHandle: ControllerHandle) -> ESteamInputType ---
    Controller_GetControllerForGamepadIndex :: proc(self: ^IController, nIndex: i32) -> ControllerHandle ---
    Controller_GetGamepadIndexForController :: proc(self: ^IController, ulControllerHandle: ControllerHandle) -> i32 ---
    Controller_GetStringForXboxOrigin :: proc(self: ^IController, eOrigin: EXboxOrigin) -> cstring ---
    Controller_GetGlyphForXboxOrigin :: proc(self: ^IController, eOrigin: EXboxOrigin) -> cstring ---
    Controller_GetActionOriginFromXboxOrigin :: proc(self: ^IController, controllerHandle: ControllerHandle, eOrigin: EXboxOrigin) -> EControllerActionOrigin ---
    Controller_TranslateActionOrigin :: proc(self: ^IController, eDestinationInputType: ESteamInputType, eSourceOrigin: EControllerActionOrigin) -> EControllerActionOrigin ---
    Controller_GetControllerBindingRevision :: proc(self: ^IController, controllerHandle: ControllerHandle, pMajor: ^int, pMinor: ^int) -> bool ---

    UGC_CreateQueryUserUGCRequest :: proc(self: ^IUGC, unAccountID: AccountID, eListType: EUserUGCList, eMatchingUGCType: EUGCMatchingUGCType, eSortOrder: EUserUGCListSortOrder, nCreatorAppID: AppId, nConsumerAppID: AppId, unPage: u32) -> UGCQueryHandle ---
    UGC_CreateQueryAllUGCRequestByPage :: proc(self: ^IUGC, eQueryType: EUGCQuery, eMatchingeMatchingUGCTypeFileType: EUGCMatchingUGCType, nCreatorAppID: AppId, nConsumerAppID: AppId, unPage: u32) -> UGCQueryHandle ---
    UGC_CreateQueryAllUGCRequestByCursor :: proc(self: ^IUGC, eQueryType: EUGCQuery, eMatchingeMatchingUGCTypeFileType: EUGCMatchingUGCType, nCreatorAppID: AppId, nConsumerAppID: AppId, pchCursor: cstring) -> UGCQueryHandle ---
    UGC_CreateQueryUGCDetailsRequest :: proc(self: ^IUGC, pvecPublishedFileID: ^PublishedFileId, unNumPublishedFileIDs: u32) -> UGCQueryHandle ---
    UGC_SendQueryUGCRequest :: proc(self: ^IUGC, handle: UGCQueryHandle) -> SteamAPICall ---
    UGC_GetQueryUGCResult :: proc(self: ^IUGC, handle: UGCQueryHandle, index: u32, pDetails: ^SteamUGCDetails) -> bool ---
    UGC_GetQueryUGCNumTags :: proc(self: ^IUGC, handle: UGCQueryHandle, index: u32) -> u32 ---
    UGC_GetQueryUGCTag :: proc(self: ^IUGC, handle: UGCQueryHandle, index: u32, indexTag: u32, pchValue: ^u8, cchValueSize: u32) -> bool ---
    UGC_GetQueryUGCTagDisplayName :: proc(self: ^IUGC, handle: UGCQueryHandle, index: u32, indexTag: u32, pchValue: ^u8, cchValueSize: u32) -> bool ---
    UGC_GetQueryUGCPreviewURL :: proc(self: ^IUGC, handle: UGCQueryHandle, index: u32, pchURL: ^u8, cchURLSize: u32) -> bool ---
    UGC_GetQueryUGCMetadata :: proc(self: ^IUGC, handle: UGCQueryHandle, index: u32, pchMetadata: ^u8, cchMetadatasize: u32) -> bool ---
    UGC_GetQueryUGCChildren :: proc(self: ^IUGC, handle: UGCQueryHandle, index: u32, pvecPublishedFileID: ^PublishedFileId, cMaxEntries: u32) -> bool ---
    UGC_GetQueryUGCStatistic :: proc(self: ^IUGC, handle: UGCQueryHandle, index: u32, eStatType: EItemStatistic, pStatValue: ^u64) -> bool ---
    UGC_GetQueryUGCNumAdditionalPreviews :: proc(self: ^IUGC, handle: UGCQueryHandle, index: u32) -> u32 ---
    UGC_GetQueryUGCAdditionalPreview :: proc(self: ^IUGC, handle: UGCQueryHandle, index: u32, previewIndex: u32, pchURLOrVideoID: ^u8, cchURLSize: u32, pchOriginalFileName: ^u8, cchOriginalFileNameSize: u32, pPreviewType: ^EItemPreviewType) -> bool ---
    UGC_GetQueryUGCNumKeyValueTags :: proc(self: ^IUGC, handle: UGCQueryHandle, index: u32) -> u32 ---
    UGC_GetQueryUGCKeyValueTag :: proc(self: ^IUGC, handle: UGCQueryHandle, index: u32, pchKey: cstring, pchValue: ^u8, cchValueSize: u32) -> bool ---
    UGC_GetQueryFirstUGCKeyValueTag :: proc(self: ^IUGC, handle: UGCQueryHandle, index: u32, pchKey: cstring, pchValue: [^]u8, cchValueSize: u32) -> bool ---
    UGC_GetQueryUGCContentDescriptors :: proc(self: ^IUGC, handle: UGCQueryHandle, index: u32, pvecDescriptors: [^]EUGCContentDescriptorID, cMaxEntries: u32) -> u32 ---
    UGC_ReleaseQueryUGCRequest :: proc(self: ^IUGC, handle: UGCQueryHandle) -> bool ---
    UGC_AddRequiredTag :: proc(self: ^IUGC, handle: UGCQueryHandle, pTagName: cstring) -> bool ---
    UGC_AddRequiredTagGroup :: proc(self: ^IUGC, handle: UGCQueryHandle, pTagGroups: ^SteamParamStringArray) -> bool ---
    UGC_AddExcludedTag :: proc(self: ^IUGC, handle: UGCQueryHandle, pTagName: cstring) -> bool ---
    UGC_SetReturnOnlyIDs :: proc(self: ^IUGC, handle: UGCQueryHandle, bReturnOnlyIDs: bool) -> bool ---
    UGC_SetReturnKeyValueTags :: proc(self: ^IUGC, handle: UGCQueryHandle, bReturnKeyValueTags: bool) -> bool ---
    UGC_SetReturnLongDescription :: proc(self: ^IUGC, handle: UGCQueryHandle, bReturnLongDescription: bool) -> bool ---
    UGC_SetReturnMetadata :: proc(self: ^IUGC, handle: UGCQueryHandle, bReturnMetadata: bool) -> bool ---
    UGC_SetReturnChildren :: proc(self: ^IUGC, handle: UGCQueryHandle, bReturnChildren: bool) -> bool ---
    UGC_SetReturnAdditionalPreviews :: proc(self: ^IUGC, handle: UGCQueryHandle, bReturnAdditionalPreviews: bool) -> bool ---
    UGC_SetReturnTotalOnly :: proc(self: ^IUGC, handle: UGCQueryHandle, bReturnTotalOnly: bool) -> bool ---
    UGC_SetReturnPlaytimeStats :: proc(self: ^IUGC, handle: UGCQueryHandle, unDays: u32) -> bool ---
    UGC_SetLanguage :: proc(self: ^IUGC, handle: UGCQueryHandle, pchLanguage: cstring) -> bool ---
    UGC_SetAllowCachedResponse :: proc(self: ^IUGC, handle: UGCQueryHandle, unMaxAgeSeconds: u32) -> bool ---
    UGC_SetCloudFileNameFilter :: proc(self: ^IUGC, handle: UGCQueryHandle, pMatchCloudFileName: cstring) -> bool ---
    UGC_SetMatchAnyTag :: proc(self: ^IUGC, handle: UGCQueryHandle, bMatchAnyTag: bool) -> bool ---
    UGC_SetSearchText :: proc(self: ^IUGC, handle: UGCQueryHandle, pSearchText: cstring) -> bool ---
    UGC_SetRankedByTrendDays :: proc(self: ^IUGC, handle: UGCQueryHandle, unDays: u32) -> bool ---
    UGC_SetTimeCreatedDateRange :: proc(self: ^IUGC, handle: UGCQueryHandle, rtStart: RTime32, rtEnd: RTime32) -> bool ---
    UGC_SetTimeUpdatedDateRange :: proc(self: ^IUGC, handle: UGCQueryHandle, rtStart: RTime32, rtEnd: RTime32) -> bool ---
    UGC_AddRequiredKeyValueTag :: proc(self: ^IUGC, handle: UGCQueryHandle, pKey: cstring, pValue: cstring) -> bool ---
    UGC_RequestUGCDetails :: proc(self: ^IUGC, nPublishedFileID: PublishedFileId, unMaxAgeSeconds: u32) -> SteamAPICall ---
    UGC_CreateItem :: proc(self: ^IUGC, nConsumerAppId: AppId, eFileType: EWorkshopFileType) -> SteamAPICall ---
    UGC_StartItemUpdate :: proc(self: ^IUGC, nConsumerAppId: AppId, nPublishedFileID: PublishedFileId) -> UGCUpdateHandle ---
    UGC_SetItemTitle :: proc(self: ^IUGC, handle: UGCUpdateHandle, pchTitle: cstring) -> bool ---
    UGC_SetItemDescription :: proc(self: ^IUGC, handle: UGCUpdateHandle, pchDescription: cstring) -> bool ---
    UGC_SetItemUpdateLanguage :: proc(self: ^IUGC, handle: UGCUpdateHandle, pchLanguage: cstring) -> bool ---
    UGC_SetItemMetadata :: proc(self: ^IUGC, handle: UGCUpdateHandle, pchMetaData: cstring) -> bool ---
    UGC_SetItemVisibility :: proc(self: ^IUGC, handle: UGCUpdateHandle, eVisibility: ERemoteStoragePublishedFileVisibility) -> bool ---
    UGC_SetItemTags :: proc(self: ^IUGC, updateHandle: UGCUpdateHandle, pTags: ^SteamParamStringArray, bAllowAdminTags: bool = false) -> bool ---
    UGC_SetItemContent :: proc(self: ^IUGC, handle: UGCUpdateHandle, pszContentFolder: cstring) -> bool ---
    UGC_SetItemPreview :: proc(self: ^IUGC, handle: UGCUpdateHandle, pszPreviewFile: cstring) -> bool ---
    UGC_SetAllowLegacyUpload :: proc(self: ^IUGC, handle: UGCUpdateHandle, bAllowLegacyUpload: bool) -> bool ---
    UGC_RemoveAllItemKeyValueTags :: proc(self: ^IUGC, handle: UGCUpdateHandle) -> bool ---
    UGC_RemoveItemKeyValueTags :: proc(self: ^IUGC, handle: UGCUpdateHandle, pchKey: cstring) -> bool ---
    UGC_AddItemKeyValueTag :: proc(self: ^IUGC, handle: UGCUpdateHandle, pchKey: cstring, pchValue: cstring) -> bool ---
    UGC_AddItemPreviewFile :: proc(self: ^IUGC, handle: UGCUpdateHandle, pszPreviewFile: cstring, type: EItemPreviewType) -> bool ---
    UGC_AddItemPreviewVideo :: proc(self: ^IUGC, handle: UGCUpdateHandle, pszVideoID: cstring) -> bool ---
    UGC_UpdateItemPreviewFile :: proc(self: ^IUGC, handle: UGCUpdateHandle, index: u32, pszPreviewFile: cstring) -> bool ---
    UGC_UpdateItemPreviewVideo :: proc(self: ^IUGC, handle: UGCUpdateHandle, index: u32, pszVideoID: cstring) -> bool ---
    UGC_RemoveItemPreview :: proc(self: ^IUGC, handle: UGCUpdateHandle, index: u32) -> bool ---
    UGC_AddContentDescriptor :: proc(self: ^IUGC, handle: UGCUpdateHandle, descid: EUGCContentDescriptorID) -> bool ---
    UGC_RemoveContentDescriptor :: proc(self: ^IUGC, handle: UGCUpdateHandle, descid: EUGCContentDescriptorID) -> bool ---
    UGC_SubmitItemUpdate :: proc(self: ^IUGC, handle: UGCUpdateHandle, pchChangeNote: cstring) -> SteamAPICall ---
    UGC_GetItemUpdateProgress :: proc(self: ^IUGC, handle: UGCUpdateHandle, punBytesProcessed: ^u64, punBytesTotal: ^u64) -> EItemUpdateStatus ---
    UGC_SetUserItemVote :: proc(self: ^IUGC, nPublishedFileID: PublishedFileId, bVoteUp: bool) -> SteamAPICall ---
    UGC_GetUserItemVote :: proc(self: ^IUGC, nPublishedFileID: PublishedFileId) -> SteamAPICall ---
    UGC_AddItemToFavorites :: proc(self: ^IUGC, nAppId: AppId, nPublishedFileID: PublishedFileId) -> SteamAPICall ---
    UGC_RemoveItemFromFavorites :: proc(self: ^IUGC, nAppId: AppId, nPublishedFileID: PublishedFileId) -> SteamAPICall ---
    UGC_SubscribeItem :: proc(self: ^IUGC, nPublishedFileID: PublishedFileId) -> SteamAPICall ---
    UGC_UnsubscribeItem :: proc(self: ^IUGC, nPublishedFileID: PublishedFileId) -> SteamAPICall ---
    UGC_GetNumSubscribedItems :: proc(self: ^IUGC) -> u32 ---
    UGC_GetSubscribedItems :: proc(self: ^IUGC, pvecPublishedFileID: ^PublishedFileId, cMaxEntries: u32) -> u32 ---
    UGC_GetItemState :: proc(self: ^IUGC, nPublishedFileID: PublishedFileId) -> u32 ---
    UGC_GetItemInstallInfo :: proc(self: ^IUGC, nPublishedFileID: PublishedFileId, punSizeOnDisk: ^u64, pchFolder: ^u8, cchFolderSize: u32, punTimeStamp: ^u32) -> bool ---
    UGC_GetItemDownloadInfo :: proc(self: ^IUGC, nPublishedFileID: PublishedFileId, punBytesDownloaded: ^u64, punBytesTotal: ^u64) -> bool ---
    UGC_DownloadItem :: proc(self: ^IUGC, nPublishedFileID: PublishedFileId, bHighPriority: bool) -> bool ---
    UGC_BInitWorkshopForGameServer :: proc(self: ^IUGC, unWorkshopDepotID: DepotId, pszFolder: cstring) -> bool ---
    UGC_SuspendDownloads :: proc(self: ^IUGC, bSuspend: bool) ---
    UGC_StartPlaytimeTracking :: proc(self: ^IUGC, pvecPublishedFileID: ^PublishedFileId, unNumPublishedFileIDs: u32) -> SteamAPICall ---
    UGC_StopPlaytimeTracking :: proc(self: ^IUGC, pvecPublishedFileID: ^PublishedFileId, unNumPublishedFileIDs: u32) -> SteamAPICall ---
    UGC_StopPlaytimeTrackingForAllItems :: proc(self: ^IUGC) -> SteamAPICall ---
    UGC_AddDependency :: proc(self: ^IUGC, nParentPublishedFileID: PublishedFileId, nChildPublishedFileID: PublishedFileId) -> SteamAPICall ---
    UGC_RemoveDependency :: proc(self: ^IUGC, nParentPublishedFileID: PublishedFileId, nChildPublishedFileID: PublishedFileId) -> SteamAPICall ---
    UGC_AddAppDependency :: proc(self: ^IUGC, nPublishedFileID: PublishedFileId, nAppID: AppId) -> SteamAPICall ---
    UGC_RemoveAppDependency :: proc(self: ^IUGC, nPublishedFileID: PublishedFileId, nAppID: AppId) -> SteamAPICall ---
    UGC_GetAppDependencies :: proc(self: ^IUGC, nPublishedFileID: PublishedFileId) -> SteamAPICall ---
    UGC_DeleteItem :: proc(self: ^IUGC, nPublishedFileID: PublishedFileId) -> SteamAPICall ---
    UGC_ShowWorkshopEULA :: proc(self: ^IUGC) -> bool ---
    UGC_GetWorkshopEULAStatus :: proc(self: ^IUGC) -> SteamAPICall ---
    UGC_GetUserContentDescriptorPreferences :: proc(self: ^IUGC, pvecDescriptors: [^]EUGCContentDescriptorID, cMaxEntries: u32) -> u32 ---
    UGC_GetNumSupportedGameVersions :: proc(self: IUGC, handle: UGCQueryHandle, index: u32) -> u32 ---
    UGC_SetAdminQuery :: proc(self: IUGC, handle: UGCUpdateHandle, bAdminQuery: bool) -> bool ---
    UGC_SetRequiredGameVersions :: proc(self: IUGC, handle: UGCUpdateHandle, pszGameBranchMin: cstring, pszGameBranchMax: cstring) -> bool ---


    HTMLSurface_Init :: proc(self: ^IHTMLSurface) -> bool ---
    HTMLSurface_Shutdown :: proc(self: ^IHTMLSurface) -> bool ---
    HTMLSurface_CreateBrowser :: proc(self: ^IHTMLSurface, pchUserAgent: cstring, pchUserCSS: cstring) -> SteamAPICall ---
    HTMLSurface_RemoveBrowser :: proc(self: ^IHTMLSurface, unBrowserHandle: HHTMLBrowser) ---
    HTMLSurface_LoadURL :: proc(self: ^IHTMLSurface, unBrowserHandle: HHTMLBrowser, pchURL: cstring, pchPostData: cstring) ---
    HTMLSurface_SetSize :: proc(self: ^IHTMLSurface, unBrowserHandle: HHTMLBrowser, unWidth: u32, unHeight: u32) ---
    HTMLSurface_StopLoad :: proc(self: ^IHTMLSurface, unBrowserHandle: HHTMLBrowser) ---
    HTMLSurface_Reload :: proc(self: ^IHTMLSurface, unBrowserHandle: HHTMLBrowser) ---
    HTMLSurface_GoBack :: proc(self: ^IHTMLSurface, unBrowserHandle: HHTMLBrowser) ---
    HTMLSurface_GoForward :: proc(self: ^IHTMLSurface, unBrowserHandle: HHTMLBrowser) ---
    HTMLSurface_AddHeader :: proc(self: ^IHTMLSurface, unBrowserHandle: HHTMLBrowser, pchKey: cstring, pchValue: cstring) ---
    HTMLSurface_ExecuteJavascript :: proc(self: ^IHTMLSurface, unBrowserHandle: HHTMLBrowser, pchScript: cstring) ---
    HTMLSurface_MouseUp :: proc(self: ^IHTMLSurface, unBrowserHandle: HHTMLBrowser, eMouseButton: IHTMLSurface_EHTMLMouseButton) ---
    HTMLSurface_MouseDown :: proc(self: ^IHTMLSurface, unBrowserHandle: HHTMLBrowser, eMouseButton: IHTMLSurface_EHTMLMouseButton) ---
    HTMLSurface_MouseDoubleClick :: proc(self: ^IHTMLSurface, unBrowserHandle: HHTMLBrowser, eMouseButton: IHTMLSurface_EHTMLMouseButton) ---
    HTMLSurface_MouseMove :: proc(self: ^IHTMLSurface, unBrowserHandle: HHTMLBrowser, x: i32, y: i32) ---
    HTMLSurface_MouseWheel :: proc(self: ^IHTMLSurface, unBrowserHandle: HHTMLBrowser, nDelta: i32) ---
    HTMLSurface_KeyDown :: proc(self: ^IHTMLSurface, unBrowserHandle: HHTMLBrowser, nNativeKeyCode: u32, eHTMLKeyModifiers: IHTMLSurface_EHTMLKeyModifiers, bIsSystemKey: bool) ---
    HTMLSurface_KeyUp :: proc(self: ^IHTMLSurface, unBrowserHandle: HHTMLBrowser, nNativeKeyCode: u32, eHTMLKeyModifiers: IHTMLSurface_EHTMLKeyModifiers) ---
    HTMLSurface_KeyChar :: proc(self: ^IHTMLSurface, unBrowserHandle: HHTMLBrowser, cUnicodeChar: u32, eHTMLKeyModifiers: IHTMLSurface_EHTMLKeyModifiers) ---
    HTMLSurface_SetHorizontalScroll :: proc(self: ^IHTMLSurface, unBrowserHandle: HHTMLBrowser, nAbsolutePixelScroll: u32) ---
    HTMLSurface_SetVerticalScroll :: proc(self: ^IHTMLSurface, unBrowserHandle: HHTMLBrowser, nAbsolutePixelScroll: u32) ---
    HTMLSurface_SetKeyFocus :: proc(self: ^IHTMLSurface, unBrowserHandle: HHTMLBrowser, bHasKeyFocus: bool) ---
    HTMLSurface_ViewSource :: proc(self: ^IHTMLSurface, unBrowserHandle: HHTMLBrowser) ---
    HTMLSurface_CopyToClipboard :: proc(self: ^IHTMLSurface, unBrowserHandle: HHTMLBrowser) ---
    HTMLSurface_PasteFromClipboard :: proc(self: ^IHTMLSurface, unBrowserHandle: HHTMLBrowser) ---
    HTMLSurface_Find :: proc(self: ^IHTMLSurface, unBrowserHandle: HHTMLBrowser, pchSearchStr: cstring, bCurrentlyInFind: bool, bReverse: bool) ---
    HTMLSurface_StopFind :: proc(self: ^IHTMLSurface, unBrowserHandle: HHTMLBrowser) ---
    HTMLSurface_GetLinkAtPosition :: proc(self: ^IHTMLSurface, unBrowserHandle: HHTMLBrowser, x: i32, y: i32) ---
    HTMLSurface_SetCookie :: proc(self: ^IHTMLSurface, pchHostname: cstring, pchKey: cstring, pchValue: cstring, pchPath: cstring, nExpires: RTime32, bSecure: bool, bHTTPOnly: bool) ---
    HTMLSurface_SetPageScaleFactor :: proc(self: ^IHTMLSurface, unBrowserHandle: HHTMLBrowser, flZoom: f32, nPointX: i32, nPointY: i32) ---
    HTMLSurface_SetBackgroundMode :: proc(self: ^IHTMLSurface, unBrowserHandle: HHTMLBrowser, bBackgroundMode: bool) ---
    HTMLSurface_SetDPIScalingFactor :: proc(self: ^IHTMLSurface, unBrowserHandle: HHTMLBrowser, flDPIScaling: f32) ---
    HTMLSurface_OpenDeveloperTools :: proc(self: ^IHTMLSurface, unBrowserHandle: HHTMLBrowser) ---
    HTMLSurface_AllowStartRequest :: proc(self: ^IHTMLSurface, unBrowserHandle: HHTMLBrowser, bAllowed: bool) ---
    HTMLSurface_JSDialogResponse :: proc(self: ^IHTMLSurface, unBrowserHandle: HHTMLBrowser, bResult: bool) ---
    HTMLSurface_FileLoadDialogResponse :: proc(self: ^IHTMLSurface, unBrowserHandle: HHTMLBrowser, pchSelectedFiles: ^cstring) ---

    Inventory_GetResultStatus :: proc(self: ^IInventory, resultHandle: SteamInventoryResult) -> EResult ---
    Inventory_GetResultItems :: proc(self: ^IInventory, resultHandle: SteamInventoryResult, pOutItemsArray: ^SteamItemDetails, punOutItemsArraySize: ^u32) -> bool ---
    Inventory_GetResultItemProperty :: proc(self: ^IInventory, resultHandle: SteamInventoryResult, unItemIndex: u32, pchPropertyName: cstring, pchValueBuffer: ^u8, punValueBufferSizeOut: ^u32) -> bool ---
    Inventory_GetResultTimestamp :: proc(self: ^IInventory, resultHandle: SteamInventoryResult) -> u32 ---
    Inventory_CheckResultSteamID :: proc(self: ^IInventory, resultHandle: SteamInventoryResult, steamIDExpected: CSteamID) -> bool ---
    Inventory_DestroyResult :: proc(self: ^IInventory, resultHandle: SteamInventoryResult) ---
    Inventory_GetAllItems :: proc(self: ^IInventory, pResultHandle: ^SteamInventoryResult) -> bool ---
    Inventory_GetItemsByID :: proc(self: ^IInventory, pResultHandle: ^SteamInventoryResult, pInstanceIDs: ^SteamItemInstanceID, unCountInstanceIDs: u32) -> bool ---
    Inventory_SerializeResult :: proc(self: ^IInventory, resultHandle: SteamInventoryResult, pOutBuffer: rawptr, punOutBufferSize: ^u32) -> bool ---
    Inventory_DeserializeResult :: proc(self: ^IInventory, pOutResultHandle: ^SteamInventoryResult, pBuffer: rawptr, unBufferSize: u32, bRESERVED_MUST_BE_FALSE: bool) -> bool ---
    Inventory_GenerateItems :: proc(self: ^IInventory, pResultHandle: ^SteamInventoryResult, pArrayItemDefs: ^SteamItemDef, punArrayQuantity: ^u32, unArrayLength: u32) -> bool ---
    Inventory_GrantPromoItems :: proc(self: ^IInventory, pResultHandle: ^SteamInventoryResult) -> bool ---
    Inventory_AddPromoItem :: proc(self: ^IInventory, pResultHandle: ^SteamInventoryResult, itemDef: SteamItemDef) -> bool ---
    Inventory_AddPromoItems :: proc(self: ^IInventory, pResultHandle: ^SteamInventoryResult, pArrayItemDefs: ^SteamItemDef, unArrayLength: u32) -> bool ---
    Inventory_ConsumeItem :: proc(self: ^IInventory, pResultHandle: ^SteamInventoryResult, itemConsume: SteamItemInstanceID, unQuantity: u32) -> bool ---
    Inventory_ExchangeItems :: proc(self: ^IInventory, pResultHandle: ^SteamInventoryResult, pArrayGenerate: ^SteamItemDef, punArrayGenerateQuantity: ^u32, unArrayGenerateLength: u32, pArrayDestroy: ^SteamItemInstanceID, punArrayDestroyQuantity: ^u32, unArrayDestroyLength: u32) -> bool ---
    Inventory_TransferItemQuantity :: proc(self: ^IInventory, pResultHandle: ^SteamInventoryResult, itemIdSource: SteamItemInstanceID, unQuantity: u32, itemIdDest: SteamItemInstanceID) -> bool ---
    Inventory_SendItemDropHeartbeat :: proc(self: ^IInventory) ---
    Inventory_TriggerItemDrop :: proc(self: ^IInventory, pResultHandle: ^SteamInventoryResult, dropListDefinition: SteamItemDef) -> bool ---
    Inventory_TradeItems :: proc(self: ^IInventory, pResultHandle: ^SteamInventoryResult, steamIDTradePartner: CSteamID, pArrayGive: ^SteamItemInstanceID, pArrayGiveQuantity: ^u32, nArrayGiveLength: u32, pArrayGet: ^SteamItemInstanceID, pArrayGetQuantity: ^u32, nArrayGetLength: u32) -> bool ---
    Inventory_LoadItemDefinitions :: proc(self: ^IInventory) -> bool ---
    Inventory_GetItemDefinitionIDs :: proc(self: ^IInventory, pItemDefIDs: ^SteamItemDef, punItemDefIDsArraySize: ^u32) -> bool ---
    Inventory_GetItemDefinitionProperty :: proc(self: ^IInventory, iDefinition: SteamItemDef, pchPropertyName: cstring, pchValueBuffer: ^u8, punValueBufferSizeOut: ^u32) -> bool ---
    Inventory_RequestEligiblePromoItemDefinitionsIDs :: proc(self: ^IInventory, steamID: CSteamID) -> SteamAPICall ---
    Inventory_GetEligiblePromoItemDefinitionIDs :: proc(self: ^IInventory, steamID: CSteamID, pItemDefIDs: ^SteamItemDef, punItemDefIDsArraySize: ^u32) -> bool ---
    Inventory_StartPurchase :: proc(self: ^IInventory, pArrayItemDefs: ^SteamItemDef, punArrayQuantity: ^u32, unArrayLength: u32) -> SteamAPICall ---
    Inventory_RequestPrices :: proc(self: ^IInventory) -> SteamAPICall ---
    Inventory_GetNumItemsWithPrices :: proc(self: ^IInventory) -> u32 ---
    Inventory_GetItemsWithPrices :: proc(self: ^IInventory, pArrayItemDefs: ^SteamItemDef, pCurrentPrices: ^u64, pBasePrices: ^u64, unArrayLength: u32) -> bool ---
    Inventory_GetItemPrice :: proc(self: ^IInventory, iDefinition: SteamItemDef, pCurrentPrice: ^u64, pBasePrice: ^u64) -> bool ---
    Inventory_StartUpdateProperties :: proc(self: ^IInventory) -> SteamInventoryUpdateHandle ---
    Inventory_RemoveProperty :: proc(self: ^IInventory, handle: SteamInventoryUpdateHandle, nItemID: SteamItemInstanceID, pchPropertyName: cstring) -> bool ---
    Inventory_SetProperty :: proc(self: ^IInventory, handle: SteamInventoryUpdateHandle, nItemID: SteamItemInstanceID, pchPropertyName: cstring, pchPropertyValue: cstring) -> bool ---
    Inventory_SetPropertyBool :: proc(self: ^IInventory, handle: SteamInventoryUpdateHandle, nItemID: SteamItemInstanceID, pchPropertyName: cstring, bValue: bool) -> bool ---
    Inventory_SetPropertyInt64 :: proc(self: ^IInventory, handle: SteamInventoryUpdateHandle, nItemID: SteamItemInstanceID, pchPropertyName: cstring, nValue: i64) -> bool ---
    Inventory_SetPropertyFloat :: proc(self: ^IInventory, handle: SteamInventoryUpdateHandle, nItemID: SteamItemInstanceID, pchPropertyName: cstring, flValue: f32) -> bool ---
    Inventory_SubmitUpdateProperties :: proc(self: ^IInventory, handle: SteamInventoryUpdateHandle, pResultHandle: ^SteamInventoryResult) -> bool ---
    Inventory_InspectItem :: proc(self: ^IInventory, pResultHandle: ^SteamInventoryResult, pchItemToken: cstring) -> bool ---

    Timeline_SetTimelineStateDescription :: proc(self: ^ITimeline, pchDescription: cstring, flTimeDelta: f32) ---
    Timeline_ClearTimelineStateDescription :: proc(self: ^ITimeline, flTimeDelta: f32) ---
    Timeline_AddTimelineEvent :: proc(self: ^ITimeline, pchIcon: cstring, pchTitle: cstring, pchDescription: cstring, unPriority: u32, flStartOffsetSeconds: f32, flDurationSeconds: f32, ePossibleClip: ETimelineEventClipPriority) ---
    Timeline_SetTimelineGameMode :: proc(self: ^ITimeline, eMode: ETimelineGameMode) ---

    Video_GetVideoURL :: proc(self: ^IVideo, unVideoAppID: AppId) ---
    Video_IsBroadcasting :: proc(self: ^IVideo, pnNumViewers: ^int) -> bool ---
    Video_GetOPFSettings :: proc(self: ^IVideo, unVideoAppID: AppId) ---
    Video_GetOPFStringForApp :: proc(self: ^IVideo, unVideoAppID: AppId, pchBuffer: ^u8, pnBufferSize: ^i32) -> bool ---

    ParentalSettings_BIsParentalLockEnabled :: proc(self: ^IParentalSettings) -> bool ---
    ParentalSettings_BIsParentalLockLocked :: proc(self: ^IParentalSettings) -> bool ---
    ParentalSettings_BIsAppBlocked :: proc(self: ^IParentalSettings, nAppID: AppId) -> bool ---
    ParentalSettings_BIsAppInBlockList :: proc(self: ^IParentalSettings, nAppID: AppId) -> bool ---
    ParentalSettings_BIsFeatureBlocked :: proc(self: ^IParentalSettings, eFeature: EParentalFeature) -> bool ---
    ParentalSettings_BIsFeatureInBlockList :: proc(self: ^IParentalSettings, eFeature: EParentalFeature) -> bool ---

    RemotePlay_GetSessionCount :: proc(self: ^IRemotePlay) -> u32 ---
    RemotePlay_GetSessionID :: proc(self: ^IRemotePlay, iSessionIndex: i32) -> RemotePlaySessionID ---
    RemotePlay_GetSessionSteamID :: proc(self: ^IRemotePlay, unSessionID: RemotePlaySessionID) -> CSteamID ---
    RemotePlay_GetSessionClientName :: proc(self: ^IRemotePlay, unSessionID: RemotePlaySessionID) -> cstring ---
    RemotePlay_GetSessionClientFormFactor :: proc(self: ^IRemotePlay, unSessionID: RemotePlaySessionID) -> ESteamDeviceFormFactor ---
    RemotePlay_BGetSessionClientResolution :: proc(self: ^IRemotePlay, unSessionID: RemotePlaySessionID, pnResolutionX: ^int, pnResolutionY: ^int) -> bool ---
    RemotePlay_BStartRemotePlayTogether :: proc(self: ^IRemotePlay, bShowOverlay: bool) -> bool ---
    RemotePlay_BSendRemotePlayTogetherInvite :: proc(self: ^IRemotePlay, steamIDFriend: CSteamID) -> bool ---

    NetworkingMessages_SendMessageToUser :: proc(self: ^INetworkingMessages, identityRemote: ^SteamNetworkingIdentity, pubData: rawptr, cubData: u32, nSendFlags: i32, nRemoteChannel: i32) -> EResult ---
    NetworkingMessages_ReceiveMessagesOnChannel :: proc(self: ^INetworkingMessages, nLocalChannel: i32, ppOutMessages: ^^SteamNetworkingMessage, nMaxMessages: i32) -> i32 ---
    NetworkingMessages_AcceptSessionWithUser :: proc(self: ^INetworkingMessages, identityRemote: ^SteamNetworkingIdentity) -> bool ---
    NetworkingMessages_CloseSessionWithUser :: proc(self: ^INetworkingMessages, identityRemote: ^SteamNetworkingIdentity) -> bool ---
    NetworkingMessages_CloseChannelWithUser :: proc(self: ^INetworkingMessages, identityRemote: ^SteamNetworkingIdentity, nLocalChannel: i32) -> bool ---
    NetworkingMessages_GetSessionConnectionInfo :: proc(self: ^INetworkingMessages, identityRemote: ^SteamNetworkingIdentity, pConnectionInfo: ^SteamNetConnectionInfo, pQuickStatus: ^SteamNetConnectionRealTimeStatus) -> ESteamNetworkingConnectionState ---

    NetworkingSockets_CreateListenSocketIP :: proc(self: ^INetworkingSockets, localAddress: ^SteamNetworkingIPAddr, nOptions: i32, pOptions: ^SteamNetworkingConfigValue) -> HSteamListenSocket ---
    NetworkingSockets_ConnectByIPAddress :: proc(self: ^INetworkingSockets, address: ^SteamNetworkingIPAddr, nOptions: i32, pOptions: ^SteamNetworkingConfigValue) -> HSteamNetConnection ---
    NetworkingSockets_CreateListenSocketP2P :: proc(self: ^INetworkingSockets, nLocalVirtualPort: i32, nOptions: i32, pOptions: ^SteamNetworkingConfigValue) -> HSteamListenSocket ---
    NetworkingSockets_ConnectP2P :: proc(self: ^INetworkingSockets, identityRemote: ^SteamNetworkingIdentity, nRemoteVirtualPort: i32, nOptions: i32, pOptions: ^SteamNetworkingConfigValue) -> HSteamNetConnection ---
    NetworkingSockets_AcceptConnection :: proc(self: ^INetworkingSockets, hConn: HSteamNetConnection) -> EResult ---
    NetworkingSockets_CloseConnection :: proc(self: ^INetworkingSockets, hPeer: HSteamNetConnection, nReason: i32, pszDebug: cstring, bEnableLinger: bool) -> bool ---
    NetworkingSockets_CloseListenSocket :: proc(self: ^INetworkingSockets, hSocket: HSteamListenSocket) -> bool ---
    NetworkingSockets_SetConnectionUserData :: proc(self: ^INetworkingSockets, hPeer: HSteamNetConnection, nUserData: i64) -> bool ---
    NetworkingSockets_GetConnectionUserData :: proc(self: ^INetworkingSockets, hPeer: HSteamNetConnection) -> i64 ---
    NetworkingSockets_SetConnectionName :: proc(self: ^INetworkingSockets, hPeer: HSteamNetConnection, pszName: cstring) ---
    NetworkingSockets_GetConnectionName :: proc(self: ^INetworkingSockets, hPeer: HSteamNetConnection, pszName: ^u8, nMaxLen: i32) -> bool ---
    NetworkingSockets_SendMessageToConnection :: proc(self: ^INetworkingSockets, hConn: HSteamNetConnection, pData: rawptr, cbData: u32, nSendFlags: i32, pOutMessageNumber: ^i64) -> EResult ---
    NetworkingSockets_FlushMessagesOnConnection :: proc(self: ^INetworkingSockets, hConn: HSteamNetConnection) -> EResult ---
    NetworkingSockets_ReceiveMessagesOnConnection :: proc(self: ^INetworkingSockets, hConn: HSteamNetConnection, ppOutMessages: ^^SteamNetworkingMessage, nMaxMessages: i32) -> i32 ---
    NetworkingSockets_GetConnectionInfo :: proc(self: ^INetworkingSockets, hConn: HSteamNetConnection, pInfo: ^SteamNetConnectionInfo) -> bool ---
    NetworkingSockets_GetConnectionRealTimeStatus :: proc(self: ^INetworkingSockets, hConn: HSteamNetConnection, pStatus: ^SteamNetConnectionRealTimeStatus, nLanes: i32, pLanes: ^SteamNetConnectionRealTimeLaneStatus) -> EResult ---
    NetworkingSockets_GetDetailedConnectionStatus :: proc(self: ^INetworkingSockets, hConn: HSteamNetConnection, pszBuf: ^u8, cbBuf: i32) -> i32 ---
    NetworkingSockets_GetListenSocketAddress :: proc(self: ^INetworkingSockets, hSocket: HSteamListenSocket, address: ^SteamNetworkingIPAddr) -> bool ---
    NetworkingSockets_CreateSocketPair :: proc(self: ^INetworkingSockets, pOutConnection1: ^HSteamNetConnection, pOutConnection2: ^HSteamNetConnection, bUseNetworkLoopback: bool, pIdentity1: ^SteamNetworkingIdentity, pIdentity2: ^SteamNetworkingIdentity) -> bool ---
    NetworkingSockets_ConfigureConnectionLanes :: proc(self: ^INetworkingSockets, hConn: HSteamNetConnection, nNumLanes: i32, pLanePriorities: ^int, pLaneWeights: ^u16) -> EResult ---
    NetworkingSockets_GetIdentity :: proc(self: ^INetworkingSockets, pIdentity: ^SteamNetworkingIdentity) -> bool ---
    NetworkingSockets_InitAuthentication :: proc(self: ^INetworkingSockets) -> ESteamNetworkingAvailability ---
    NetworkingSockets_GetAuthenticationStatus :: proc(self: ^INetworkingSockets, pDetails: ^SteamNetAuthenticationStatus) -> ESteamNetworkingAvailability ---
    NetworkingSockets_CreatePollGroup :: proc(self: ^INetworkingSockets) -> HSteamNetPollGroup ---
    NetworkingSockets_DestroyPollGroup :: proc(self: ^INetworkingSockets, hPollGroup: HSteamNetPollGroup) -> bool ---
    NetworkingSockets_SetConnectionPollGroup :: proc(self: ^INetworkingSockets, hConn: HSteamNetConnection, hPollGroup: HSteamNetPollGroup) -> bool ---
    NetworkingSockets_ReceiveMessagesOnPollGroup :: proc(self: ^INetworkingSockets, hPollGroup: HSteamNetPollGroup, ppOutMessages: ^^SteamNetworkingMessage, nMaxMessages: i32) -> i32 ---
    NetworkingSockets_ReceivedRelayAuthTicket :: proc(self: ^INetworkingSockets, pvTicket: rawptr, cbTicket: i32, pOutParsedTicket: SteamDatagramRelayAuthTicketPtr) -> bool ---
    NetworkingSockets_FindRelayAuthTicketForServer :: proc(self: ^INetworkingSockets, identityGameServer: ^SteamNetworkingIdentity, nRemoteVirtualPort: i32, pOutParsedTicket: SteamDatagramRelayAuthTicketPtr) -> i32 ---
    NetworkingSockets_ConnectToHostedDedicatedServer :: proc(self: ^INetworkingSockets, identityTarget: ^SteamNetworkingIdentity, nRemoteVirtualPort: i32, nOptions: i32, pOptions: ^SteamNetworkingConfigValue) -> HSteamNetConnection ---
    NetworkingSockets_GetHostedDedicatedServerPort :: proc(self: ^INetworkingSockets) -> u16 ---
    NetworkingSockets_GetHostedDedicatedServerPOPID :: proc(self: ^INetworkingSockets) -> SteamNetworkingPOPID ---
    NetworkingSockets_GetHostedDedicatedServerAddress :: proc(self: ^INetworkingSockets, pRouting: ^SteamDatagramHostedAddress) -> EResult ---
    NetworkingSockets_CreateHostedDedicatedServerListenSocket :: proc(self: ^INetworkingSockets, nLocalVirtualPort: i32, nOptions: i32, pOptions: ^SteamNetworkingConfigValue) -> HSteamListenSocket ---
    NetworkingSockets_GetGameCoordinatorServerLogin :: proc(self: ^INetworkingSockets, pLoginInfo: ^SteamDatagramGameCoordinatorServerLogin, pcbSignedBlob: ^int, pBlob: rawptr) -> EResult ---
    NetworkingSockets_ConnectP2PCustomSignaling :: proc(self: ^INetworkingSockets, pSignaling: SteamDatagramRelayAuthTicketPtr, pPeerIdentity: ^SteamNetworkingIdentity, nRemoteVirtualPort: i32, nOptions: i32, pOptions: ^SteamNetworkingConfigValue) -> HSteamNetConnection ---
    NetworkingSockets_ReceivedP2PCustomSignal :: proc(self: ^INetworkingSockets, pMsg: rawptr, cbMsg: i32, pContext: INetworkingSignalingRecvContextPtr) -> bool ---
    NetworkingSockets_GetCertificateRequest :: proc(self: ^INetworkingSockets, pcbBlob: ^int, pBlob: rawptr, errMsg: ^SteamNetworkingErrMsg) -> bool ---
    NetworkingSockets_SetCertificate :: proc(self: ^INetworkingSockets, pCertificate: rawptr, cbCertificate: i32, errMsg: ^SteamNetworkingErrMsg) -> bool ---
    NetworkingSockets_ResetIdentity :: proc(self: ^INetworkingSockets, pIdentity: ^SteamNetworkingIdentity) ---
    NetworkingSockets_RunCallbacks :: proc(self: ^INetworkingSockets) ---
    NetworkingSockets_BeginAsyncRequestFakeIP :: proc(self: ^INetworkingSockets, nNumPorts: i32) -> bool ---
    NetworkingSockets_GetFakeIP :: proc(self: ^INetworkingSockets, idxFirstPort: i32, pInfo: ^SteamNetworkingFakeIPResult) ---
    NetworkingSockets_CreateListenSocketP2PFakeIP :: proc(self: ^INetworkingSockets, idxFakePort: i32, nOptions: i32, pOptions: ^SteamNetworkingConfigValue) -> HSteamListenSocket ---
    NetworkingSockets_GetRemoteFakeIPForConnection :: proc(self: ^INetworkingSockets, hConn: HSteamNetConnection, pOutAddr: ^SteamNetworkingIPAddr) -> EResult ---
    NetworkingSockets_CreateFakeUDPPort :: proc(self: ^INetworkingSockets, idxFakeServerPort: i32) -> ^INetworkingFakeUDPPort ---

    NetworkingUtils_AllocateMessage :: proc(self: ^INetworkingUtils, cbAllocateBuffer: i32) -> ^SteamNetworkingMessage ---
    NetworkingUtils_InitRelayNetworkAccess :: proc(self: ^INetworkingUtils) ---
    NetworkingUtils_GetRelayNetworkStatus :: proc(self: ^INetworkingUtils, pDetails: ^SteamRelayNetworkStatus) -> ESteamNetworkingAvailability ---
    NetworkingUtils_GetLocalPingLocation :: proc(self: ^INetworkingUtils, result: ^SteamNetworkPingLocation) -> f32 ---
    NetworkingUtils_EstimatePingTimeBetweenTwoLocations :: proc(self: ^INetworkingUtils, location1: ^SteamNetworkPingLocation, location2: ^SteamNetworkPingLocation) -> i32 ---
    NetworkingUtils_EstimatePingTimeFromLocalHost :: proc(self: ^INetworkingUtils, remoteLocation: ^SteamNetworkPingLocation) -> i32 ---
    NetworkingUtils_ConvertPingLocationToString :: proc(self: ^INetworkingUtils, location: ^SteamNetworkPingLocation, pszBuf: ^u8, cchBufSize: i32) ---
    NetworkingUtils_ParsePingLocationString :: proc(self: ^INetworkingUtils, pszString: cstring, result: ^SteamNetworkPingLocation) -> bool ---
    NetworkingUtils_CheckPingDataUpToDate :: proc(self: ^INetworkingUtils, flMaxAgeSeconds: f32) -> bool ---
    NetworkingUtils_GetPingToDataCenter :: proc(self: ^INetworkingUtils, popID: SteamNetworkingPOPID, pViaRelayPoP: ^SteamNetworkingPOPID) -> i32 ---
    NetworkingUtils_GetDirectPingToPOP :: proc(self: ^INetworkingUtils, popID: SteamNetworkingPOPID) -> i32 ---
    NetworkingUtils_GetPOPCount :: proc(self: ^INetworkingUtils) -> i32 ---
    NetworkingUtils_GetPOPList :: proc(self: ^INetworkingUtils, list: ^SteamNetworkingPOPID, nListSz: i32) -> i32 ---
    NetworkingUtils_GetLocalTimestamp :: proc(self: ^INetworkingUtils) -> SteamNetworkingMicroseconds ---
    NetworkingUtils_SetDebugOutputFunction :: proc(self: ^INetworkingUtils, eDetailLevel: ESteamNetworkingSocketsDebugOutputType, pfnFunc: FSteamNetworkingSocketsDebugOutput) ---
    NetworkingUtils_IsFakeIPv4 :: proc(self: ^INetworkingUtils, nIPv4: u32) -> bool ---
    NetworkingUtils_GetIPv4FakeIPType :: proc(self: ^INetworkingUtils, nIPv4: u32) -> ESteamNetworkingFakeIPType ---
    NetworkingUtils_GetRealIdentityForFakeIP :: proc(self: ^INetworkingUtils, fakeIP: ^SteamNetworkingIPAddr, pOutRealIdentity: ^SteamNetworkingIdentity) -> EResult ---
    NetworkingUtils_SetGlobalConfigValueInt32 :: proc(self: ^INetworkingUtils, eValue: ESteamNetworkingConfigValue, val: i32) -> bool ---
    NetworkingUtils_SetGlobalConfigValueFloat :: proc(self: ^INetworkingUtils, eValue: ESteamNetworkingConfigValue, val: f32) -> bool ---
    NetworkingUtils_SetGlobalConfigValueString :: proc(self: ^INetworkingUtils, eValue: ESteamNetworkingConfigValue, val: cstring) -> bool ---
    NetworkingUtils_SetGlobalConfigValuePtr :: proc(self: ^INetworkingUtils, eValue: ESteamNetworkingConfigValue, val: rawptr) -> bool ---
    NetworkingUtils_SetConnectionConfigValueInt32 :: proc(self: ^INetworkingUtils, hConn: HSteamNetConnection, eValue: ESteamNetworkingConfigValue, val: i32) -> bool ---
    NetworkingUtils_SetConnectionConfigValueFloat :: proc(self: ^INetworkingUtils, hConn: HSteamNetConnection, eValue: ESteamNetworkingConfigValue, val: f32) -> bool ---
    NetworkingUtils_SetConnectionConfigValueString :: proc(self: ^INetworkingUtils, hConn: HSteamNetConnection, eValue: ESteamNetworkingConfigValue, val: cstring) -> bool ---
    NetworkingUtils_SetGlobalCallbacSteamNetConnectionStatusChanged :: proc(self: ^INetworkingUtils, fnCallback: FnSteamNetConnectionStatusChanged) -> bool ---
    NetworkingUtils_SetGlobalCallbacSteamNetAuthenticationStatusChanged :: proc(self: ^INetworkingUtils, fnCallback: FnSteamNetAuthenticationStatusChanged) -> bool ---
    NetworkingUtils_SetGlobalCallbacSteamRelayNetworkStatusChanged :: proc(self: ^INetworkingUtils, fnCallback: FnSteamRelayNetworkStatusChanged) -> bool ---
    NetworkingUtils_SetGlobalCallbacFakeIPResult :: proc(self: ^INetworkingUtils, fnCallback: FnSteamNetworkingFakeIPResult) -> bool ---
    NetworkingUtils_SetGlobalCallbacMessagesSessionRequest :: proc(self: ^INetworkingUtils, fnCallback: FnSteamNetworkingMessagesSessionRequest) -> bool ---
    NetworkingUtils_SetGlobalCallbacMessagesSessionFailed :: proc(self: ^INetworkingUtils, fnCallback: FnSteamNetworkingMessagesSessionFailed) -> bool ---
    NetworkingUtils_SetConfigValue :: proc(self: ^INetworkingUtils, eValue: ESteamNetworkingConfigValue, eScopeType: ESteamNetworkingConfigScope, scopeObj: int, eDataType: ESteamNetworkingConfigDataType, pArg: rawptr) -> bool ---
    NetworkingUtils_SetConfigValueStruct :: proc(self: ^INetworkingUtils, opt: ^SteamNetworkingConfigValue, eScopeType: ESteamNetworkingConfigScope, scopeObj: int) -> bool ---
    NetworkingUtils_GetConfigValue :: proc(self: ^INetworkingUtils, eValue: ESteamNetworkingConfigValue, eScopeType: ESteamNetworkingConfigScope, scopeObj: int, pOutDataType: ^ESteamNetworkingConfigDataType, pResult: rawptr, cbResult: ^int) -> ESteamNetworkingGetConfigValueResult ---
    NetworkingUtils_GetConfigValueInfo :: proc(self: ^INetworkingUtils, eValue: ESteamNetworkingConfigValue, pOutDataType: ^ESteamNetworkingConfigDataType, pOutScope: ^ESteamNetworkingConfigScope) -> cstring ---
    NetworkingUtils_IterateGenericEditableConfigValues :: proc(self: ^INetworkingUtils, eCurrent: ESteamNetworkingConfigValue, bEnumerateDevVars: bool) -> ESteamNetworkingConfigValue ---
    NetworkingUtils_SteamNetworkingIPAddr_ToString :: proc(self: ^INetworkingUtils, addr: ^SteamNetworkingIPAddr, buf: ^u8, cbBuf: u32, bWithPort: bool) ---
    NetworkingUtils_SteamNetworkingIPAddr_ParseString :: proc(self: ^INetworkingUtils, pAddr: ^SteamNetworkingIPAddr, pszStr: cstring) -> bool ---
    NetworkingUtils_SteamNetworkingIPAddr_GetFakeIPType :: proc(self: ^INetworkingUtils, addr: ^SteamNetworkingIPAddr) -> ESteamNetworkingFakeIPType ---
    NetworkingUtils_SteamNetworkingIdentity_ToString :: proc(self: ^INetworkingUtils, identity: ^SteamNetworkingIdentity, buf: ^u8, cbBuf: u32) ---
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
    GameServer_SetMaxPlayerCount :: proc(self: ^IGameServer, cPlayersMax: i32) ---
    GameServer_SetBotPlayerCount :: proc(self: ^IGameServer, cBotplayers: i32) ---
    GameServer_SetServerName :: proc(self: ^IGameServer, pszServerName: cstring) ---
    GameServer_SetMapName :: proc(self: ^IGameServer, pszMapName: cstring) ---
    GameServer_SetPasswordProtected :: proc(self: ^IGameServer, bPasswordProtected: bool) ---
    GameServer_SetSpectatorPort :: proc(self: ^IGameServer, unSpectatorPort: u16) ---
    GameServer_SetSpectatorServerName :: proc(self: ^IGameServer, pszSpectatorServerName: cstring) ---
    GameServer_ClearAllKeyValues :: proc(self: ^IGameServer) ---
    GameServer_SetKeyValue :: proc(self: ^IGameServer, pKey: cstring, pValue: cstring) ---
    GameServer_SetGameTags :: proc(self: ^IGameServer, pchGameTags: cstring) ---
    GameServer_SetGameData :: proc(self: ^IGameServer, pchGameData: cstring) ---
    GameServer_SetRegion :: proc(self: ^IGameServer, pszRegion: cstring) ---
    GameServer_SetAdvertiseServerActive :: proc(self: ^IGameServer, bActive: bool) ---
    GameServer_GetAuthSessionTicket :: proc(self: ^IGameServer, pTicket: rawptr, cbMaxTicket: i32, pcbTicket: ^u32) -> HAuthTicket ---
    GameServer_BeginAuthSession :: proc(self: ^IGameServer, pAuthTicket: rawptr, cbAuthTicket: i32, steamID: CSteamID) -> EBeginAuthSessionResult ---
    GameServer_EndAuthSession :: proc(self: ^IGameServer, steamID: CSteamID) ---
    GameServer_CancelAuthTicket :: proc(self: ^IGameServer, hAuthTicket: HAuthTicket) ---
    GameServer_UserHasLicenseForApp :: proc(self: ^IGameServer, steamID: CSteamID, appID: AppId) -> EUserHasLicenseForAppResult ---
    GameServer_RequestUserGroupStatus :: proc(self: ^IGameServer, steamIDUser: CSteamID, steamIDGroup: CSteamID) -> bool ---
    GameServer_GetGameplayStats :: proc(self: ^IGameServer) ---
    GameServer_GetServerReputation :: proc(self: ^IGameServer) -> SteamAPICall ---
    GameServer_GetPublicIP :: proc(self: ^IGameServer) -> SteamIPAddress ---
    GameServer_HandleIncomingPacket :: proc(self: ^IGameServer, pData: rawptr, cbData: i32, srcIP: u32, srcPort: u16) -> bool ---
    GameServer_GetNextOutgoingPacket :: proc(self: ^IGameServer, pOut: rawptr, cbMaxOut: i32, pNetAdr: ^u32, pPort: ^u16) -> i32 ---
    GameServer_AssociateWithClan :: proc(self: ^IGameServer, steamIDClan: CSteamID) -> SteamAPICall ---
    GameServer_ComputeNewPlayerCompatibility :: proc(self: ^IGameServer, steamIDNewPlayer: CSteamID) -> SteamAPICall ---
    GameServer_SendUserConnectAndAuthenticate_DEPRECATED :: proc(self: ^IGameServer, unIPClient: u32, pvAuthBlob: rawptr, cubAuthBlobSize: u32, pSteamIDUser: ^CSteamID) -> bool ---
    GameServer_CreateUnauthenticatedUserConnection :: proc(self: ^IGameServer) -> CSteamID ---
    GameServer_SendUserDisconnect_DEPRECATED :: proc(self: ^IGameServer, steamIDUser: CSteamID) ---
    GameServer_BUpdateUserData :: proc(self: ^IGameServer, steamIDUser: CSteamID, pchPlayerName: cstring, uScore: u32) -> bool ---

    GameServerStats_RequestUserStats :: proc(self: ^IGameServerStats, steamIDUser: CSteamID) -> SteamAPICall ---
    GameServerStats_GetUserStatInt32 :: proc(self: ^IGameServerStats, steamIDUser: CSteamID, pchName: cstring, pData: ^i32) -> bool ---
    GameServerStats_GetUserStatFloat :: proc(self: ^IGameServerStats, steamIDUser: CSteamID, pchName: cstring, pData: ^f32) -> bool ---
    GameServerStats_GetUserAchievement :: proc(self: ^IGameServerStats, steamIDUser: CSteamID, pchName: cstring, pbAchieved: ^bool) -> bool ---
    GameServerStats_SetUserStatInt32 :: proc(self: ^IGameServerStats, steamIDUser: CSteamID, pchName: cstring, nData: i32) -> bool ---
    GameServerStats_SetUserStatFloat :: proc(self: ^IGameServerStats, steamIDUser: CSteamID, pchName: cstring, fData: f32) -> bool ---
    GameServerStats_UpdateUserAvgRateStat :: proc(self: ^IGameServerStats, steamIDUser: CSteamID, pchName: cstring, flCountThisSession: f32, dSessionLength: f64) -> bool ---
    GameServerStats_SetUserAchievement :: proc(self: ^IGameServerStats, steamIDUser: CSteamID, pchName: cstring) -> bool ---
    GameServerStats_ClearUserAchievement :: proc(self: ^IGameServerStats, steamIDUser: CSteamID, pchName: cstring) -> bool ---
    GameServerStats_StoreUserStats :: proc(self: ^IGameServerStats, steamIDUser: CSteamID) -> SteamAPICall ---

    NetworkingFakeUDPPort_DestroyFakeUDPPort :: proc(self: ^INetworkingFakeUDPPort) ---
    NetworkingFakeUDPPort_SendMessageToFakeIP :: proc(self: ^INetworkingFakeUDPPort, remoteAddress: ^SteamNetworkingIPAddr, pData: rawptr, cbData: u32, nSendFlags: i32) -> EResult ---
    NetworkingFakeUDPPort_ReceiveMessages :: proc(self: ^INetworkingFakeUDPPort, ppOutMessages: ^^SteamNetworkingMessage, nMaxMessages: i32) -> i32 ---
    NetworkingFakeUDPPort_ScheduleCleanup :: proc(self: ^INetworkingFakeUDPPort, remoteAddress: ^SteamNetworkingIPAddr) ---

    MatchMakingKeyValuePair_t_Construct :: proc(self: ^MatchMakingKeyValuePair) ---
} // foreign lib


// From: steam_api_internal.h
// Purpose: Base values for callback identifiers, each callback must
//			have a unique ID.
iSteamUserCallbacks :: 100
iSteamGameServerCallbacks :: 200
iSteamFriendsCallbacks :: 300
iSteamBillingCallbacks :: 400
iSteamMatchmakingCallbacks :: 500
iSteamContentServerCallbacks :: 600
iSteamUtilsCallbacks :: 700
iSteamAppsCallbacks :: 1000
iSteamUserStatsCallbacks :: 1100
iSteamNetworkingCallbacks :: 1200
iSteamNetworkingSocketsCallbacks :: 1220
iSteamNetworkingMessagesCallbacks :: 1250
iSteamNetworkingUtilsCallbacks :: 1280
iSteamRemoteStorageCallbacks :: 1300
iSteamGameServerItemsCallbacks :: 1500
iSteamGameCoordinatorCallbacks :: 1700
iSteamGameServerStatsCallbacks :: 1800
iSteam2AsyncCallbacks :: 1900
iSteamGameStatsCallbacks :: 2000
iSteamHTTPCallbacks :: 2100
iSteamScreenshotsCallbacks :: 2300
// NOTE: 2500-2599 are reserved
iSteamStreamLauncherCallbacks :: 2600
iSteamControllerCallbacks :: 2800
iSteamUGCCallbacks :: 3400
iSteamStreamClientCallbacks :: 3500
iSteamMusicCallbacks :: 4000
iSteamMusicRemoteCallbacks :: 4100
iSteamGameNotificationCallbacks :: 4400
iSteamHTMLSurfaceCallbacks :: 4500
iSteamVideoCallbacks :: 4600
iSteamInventoryCallbacks :: 4700
ISteamParentalSettingsCallbacks :: 5000
iSteamGameSearchCallbacks :: 5200
iSteamPartiesCallbacks :: 5300
iSteamSTARCallbacks :: 5500
iSteamRemotePlayCallbacks :: 5700
iSteamChatCallbacks :: 5900


// From: isteamapps.h

// From: isteamapps.h
ICallback :: enum i32 {
    DlcInstalled                                           = iSteamAppsCallbacks + 5,

    // Purpose: response to RegisterActivationCode()
    RegisterActivationCodeResponse                         = iSteamAppsCallbacks + 8,

    // Purpose: posted after the user gains executes a Steam URL with command line or query parameters
    // such as steam://run/<appid>//-commandline/?param1=value1&param2=value2&param3=value3 etc
    // while the game is already running.  The new params can be queried
    // with GetLaunchQueryParam and GetLaunchCommandLine
    NewUrlLaunchParameters                                 = iSteamAppsCallbacks + 14,

    // Purpose: response to RequestAppProofOfPurchaseKey/RequestAllProofOfPurchaseKeys
    // for supporting third-party CD keys, or other proof-of-purchase systems.
    AppProofOfPurchaseKeyResponse                          = iSteamAppsCallbacks + 21,

    // Purpose: response to GetFileDetails
    FileDetailsResult                                      = iSteamAppsCallbacks + 23,

    // Purpose: called for games in Timed Trial mode
    TimedTrialStatus                                       = iSteamAppsCallbacks + 30,


    // From: isteamfriends.h

    // Purpose: called when a friends' status changes
    PersonaStateChange                                     = iSteamFriendsCallbacks + 4,

    // Purpose: posted when game overlay activates or deactivates
    //			the game can use this to be pause or resume single player games
    GameOverlayActivated                                   = iSteamFriendsCallbacks + 31,

    // Purpose: called when the user tries to join a different game server from their friends list
    //			game client should attempt to connect to specified server when this is received
    GameServerChangeRequested                              = iSteamFriendsCallbacks + 32,

    // Purpose: called when the user tries to join a lobby from their friends list
    //			game client should attempt to connect to specified lobby when this is received
    GameLobbyJoinRequested                                 = iSteamFriendsCallbacks + 33,

    // Purpose: called when an avatar is loaded in from a previous GetLargeFriendAvatar() call
    //			if the image wasn't already available
    AvatarImageLoaded                                      = iSteamFriendsCallbacks + 34,

    // Purpose: marks the return of a request officer list call
    ClanOfficerListResponse                                = iSteamFriendsCallbacks + 35,

    // Purpose: callback indicating updated data about friends rich presence information
    FriendRichPresenceUpdate                               = iSteamFriendsCallbacks + 36,

    // Purpose: called when the user tries to join a game from their friends list
    //			rich presence will have been set with the "connect" key which is set here
    GameRichPresenceJoinRequested                          = iSteamFriendsCallbacks + 37,

    // Purpose: a chat message has been received for a clan chat the game has joined
    GameConnectedClanChatMsg                               = iSteamFriendsCallbacks + 38,

    // Purpose: a user has joined a clan chat
    GameConnectedChatJoin                                  = iSteamFriendsCallbacks + 39,

    // Purpose: a user has left the chat we're in
    GameConnectedChatLeave                                 = iSteamFriendsCallbacks + 40,

    // Purpose: a DownloadClanActivityCounts() call has finished
    DownloadClanActivityCountsResult                       = iSteamFriendsCallbacks + 41,

    // Purpose: a JoinClanChatRoom() call has finished
    JoinClanChatRoomCompletionResult                       = iSteamFriendsCallbacks + 42,

    // Purpose: a chat message has been received from a user
    GameConnectedFriendChatMsg                             = iSteamFriendsCallbacks + 43,
    FriendsGetFollowerCount                                = iSteamFriendsCallbacks + 44,
    FriendsIsFollowing                                     = iSteamFriendsCallbacks + 45,
    FriendsEnumerateFollowingList                          = iSteamFriendsCallbacks + 46,

    // Purpose: reports the result of an attempt to change the user's persona name
    SetPersonaNameResponse                                 = iSteamFriendsCallbacks + 47,

    // Purpose: Invoked when the status of unread messages changes
    UnreadChatMessagesChanged                              = iSteamFriendsCallbacks + 48,

    // Purpose: Dispatched when an overlay browser instance is navigated to a protocol/scheme registered by RegisterProtocolInOverlayBrowser()
    OverlayBrowserProtocolNavigation                       = iSteamFriendsCallbacks + 49,

    // Purpose: A user's equipped profile items have changed
    EquippedProfileItemsChanged                            = iSteamFriendsCallbacks + 50,
    EquippedProfileItems                                   = iSteamFriendsCallbacks + 51,


    // From: isteamgamecoordinator.h
    GCMessageAvailable                                     = iSteamGameCoordinatorCallbacks + 1,

    // callback notification - A message failed to make it to the GC. It may be down temporarily
    GCMessageFailed                                        = iSteamGameCoordinatorCallbacks + 2,


    // From: isteamgameserver.h

    // client has been approved to connect to this game server
    GSClientApprove                                        = iSteamGameServerCallbacks + 1,

    // client has been denied to connection to this game server
    GSClientDeny                                           = iSteamGameServerCallbacks + 2,

    // request the game server should kick the user
    GSClientKick                                           = iSteamGameServerCallbacks + 3,

    // NOTE: callback values 4, and 5, are skipped because they are used for old deprecated callbacks, 
    // do not reuse them here.

    // client achievement info
    GSClientAchievementStatus                              = iSteamGameServerCallbacks + 6,

    // received when the game server requests to be displayed as secure (VAC protected)
    // m_bSecure is true if the game server should display itself as secure to users, false otherwise
    GSPolicyResponse                                       = iSteamUserCallbacks + 15,

    // GS gameplay stats info
    GSGameplayStats                                        = iSteamGameServerCallbacks + 7,

    // send as a reply to RequestUserGroupStatus()
    GSClientGroupStatus                                    = iSteamGameServerCallbacks + 8,

    // Sent as a reply to GetServerReputation()
    GSReputation                                           = iSteamGameServerCallbacks + 9,

    // Sent as a reply to AssociateWithClan()
    AssociateWithClanResult                                = iSteamGameServerCallbacks + 10,

    // Sent as a reply to ComputeNewPlayerCompatibility()
    ComputeNewPlayerCompatibilityResult                    = iSteamGameServerCallbacks + 11,


    // From: isteamgameserverstats.h

    // Purpose: called when the latests stats and achievements have been received
    //			from the server
    GSStatsReceived                                        = iSteamGameServerStatsCallbacks,

    // Purpose: result of a request to store the user stats for a game
    GSStatsStored                                          = iSteamGameServerStatsCallbacks + 1,

    // Purpose: Callback indicating that a user's stats have been unloaded.
    //  Call RequestUserStats again to access stats for this user
    GSStatsUnloaded                                        = iSteamUserStatsCallbacks + 8,


    // From: isteamhttp.h
    HTTPRequestCompleted                                   = iSteamHTTPCallbacks + 1,
    HTTPRequestHeadersReceived                             = iSteamHTTPCallbacks + 2,
    HTTPRequestDataReceived                                = iSteamHTTPCallbacks + 3,


    // From: isteaminput.h

    // Purpose: called when a new controller has been connected, will fire once
    // per controller if multiple new controllers connect in the same frame
    SteamInputDeviceConnected                              = iSteamControllerCallbacks + 1,

    // Purpose: called when a new controller has been connected, will fire once
    // per controller if multiple new controllers connect in the same frame
    SteamInputDeviceDisconnected                           = iSteamControllerCallbacks + 2,

    // Purpose: called when a controller configuration has been loaded, will fire once
    // per controller per focus change for Steam Input enabled controllers
    SteamInputConfigurationLoaded                          = iSteamControllerCallbacks + 3,


    // From: isteaminventory.h

    // SteamInventoryResultReady_t callbacks are fired whenever asynchronous
    // results transition from "Pending" to "OK" or an error state. There will
    // always be exactly one callback per handle.
    SteamInventoryResultReady                              = iSteamInventoryCallbacks + 0,

    // SteamInventoryFullUpdate_t callbacks are triggered when GetAllItems
    // successfully returns a result which is newer / fresher than the last
    // known result. (It will not trigger if the inventory hasn't changed,
    // or if results from two overlapping calls are reversed in flight and
    // the earlier result is already known to be stale/out-of-date.)
    // The normal ResultReady callback will still be triggered immediately
    // afterwards; this is an additional notification for your convenience.
    SteamInventoryFullUpdate                               = iSteamInventoryCallbacks + 1,

    // A SteamInventoryDefinitionUpdate_t callback is triggered whenever
    // item definitions have been updated, which could be in response to 
    // LoadItemDefinitions() or any other async request which required
    // a definition update in order to process results from the server.
    SteamInventoryDefinitionUpdate                         = iSteamInventoryCallbacks + 2,

    // Returned 
    SteamInventoryEligiblePromoItemDefIDs                  = iSteamInventoryCallbacks + 3,

    // Triggered from StartPurchase call
    SteamInventoryStartPurchaseResult                      = iSteamInventoryCallbacks + 4,

    // Triggered from RequestPrices
    SteamInventoryRequestPricesResult                      = iSteamInventoryCallbacks + 5,


    // From: isteammatchmaking.h

    // Callbacks for ISteamMatchmaking (which go through the regular Steam callback registration system)

    // Purpose: a server was added/removed from the favorites list, you should refresh now
    FavoritesListChanged                                   = iSteamMatchmakingCallbacks + 2,

    // Purpose: Someone has invited you to join a Lobby
    //			normally you don't need to do anything with this, since
    //			the Steam UI will also display a '<user> has invited you to the lobby, join?' dialog
    //
    //			if the user outside a game chooses to join, your game will be launched with the parameter "+connect_lobby <64-bit lobby id>",
    //			or with the callback GameLobbyJoinRequested_t if they're already in-game
    LobbyInvite                                            = iSteamMatchmakingCallbacks + 3,

    // Purpose: Sent on entering a lobby, or on failing to enter
    //			m_EChatRoomEnterResponse will be set to k_EChatRoomEnterResponseSuccess on success,
    //			or a higher value on failure (see enum EChatRoomEnterResponse)
    LobbyEnter                                             = iSteamMatchmakingCallbacks + 4,

    // Purpose: The lobby metadata has changed
    //			if m_ulSteamIDMember is the steamID of a lobby member, use GetLobbyMemberData() to access per-user details
    //			if m_ulSteamIDMember == m_ulSteamIDLobby, use GetLobbyData() to access lobby metadata
    LobbyDataUpdate                                        = iSteamMatchmakingCallbacks + 5,

    // Purpose: The lobby chat room state has changed
    //			this is usually sent when a user has joined or left the lobby
    LobbyChatUpdate                                        = iSteamMatchmakingCallbacks + 6,

    // Purpose: A chat message for this lobby has been sent
    //			use GetLobbyChatEntry( m_iChatID ) to retrieve the contents of this message
    LobbyChatMsg                                           = iSteamMatchmakingCallbacks + 7,

    // Purpose: A game created a game for all the members of the lobby to join,
    //			as triggered by a SetLobbyGameServer()
    //			it's up to the individual clients to take action on this; the usual
    //			game behavior is to leave the lobby and connect to the specified game server
    LobbyGameCreated                                       = iSteamMatchmakingCallbacks + 9,

    // Purpose: Number of matching lobbies found
    //			iterate the returned lobbies with GetLobbyByIndex(), from values 0, to m_nLobbiesMatching-1
    LobbyMatchList                                         = iSteamMatchmakingCallbacks + 10,

    // Purpose: posted if a user is forcefully removed from a lobby
    //			can occur if a user loses connection to Steam
    LobbyKicked                                            = iSteamMatchmakingCallbacks + 12,

    // Purpose: Result of our request to create a Lobby
    //			m_eResult == k_EResultOK on success
    //			at this point, the lobby has been joined and is ready for use
    //			a LobbyEnter_t callback will also be received (since the local user is joining their own lobby)
    LobbyCreated                                           = iSteamMatchmakingCallbacks + 13,

    // used by now obsolete RequestFriendsLobbiesResponse_t
    // enum i32 { k = iSteamMatchmakingCallbacks + 14 };

    // Purpose: Result of CheckForPSNGameBootInvite
    //			m_eResult == k_EResultOK on success
    //			at this point, the local user may not have finishing joining this lobby;
    //			game code should wait until the subsequent LobbyEnter_t callback is received
    PSNGameBootInviteResult                                = iSteamMatchmakingCallbacks + 15,

    // Purpose: Result of our request to create a Lobby
    //			m_eResult == k_EResultOK on success
    //			at this point, the lobby has been joined and is ready for use
    //			a LobbyEnter_t callback will also be received (since the local user is joining their own lobby)
    FavoritesListAccountsUpdated                           = iSteamMatchmakingCallbacks + 16,

    // Callbacks for ISteamGameSearch (which go through the regular Steam callback registration system)
    SearchForGameProgressCallback                          = iSteamGameSearchCallbacks + 1,

    // notification to all players searching that a game has been found
    SearchForGameResultCallback                            = iSteamGameSearchCallbacks + 2,

    // ISteamGameSearch : Game Host API callbacks

    // callback from RequestPlayersForGame when the matchmaking service has started or ended search
    // callback will also follow a call from CancelRequestPlayersForGame - m_bSearchInProgress will be false
    RequestPlayersForGameProgressCallback                  = iSteamGameSearchCallbacks + 11,

    // callback from RequestPlayersForGame
    // one of these will be sent per player 
    // followed by additional callbacks when players accept or decline the game
    RequestPlayersForGameResultCallback                    = iSteamGameSearchCallbacks + 12,
    RequestPlayersForGameFinalResultCallback               = iSteamGameSearchCallbacks + 13,

    // this callback confirms that results were received by the matchmaking service for this player
    SubmitPlayerResultResultCallback                       = iSteamGameSearchCallbacks + 14,

    // this callback confirms that the game is recorded as complete on the matchmaking service
    // the next call to RequestPlayersForGame will generate a new unique game ID
    EndGameResultCallback                                  = iSteamGameSearchCallbacks + 15,

    // Steam has responded to the user request to join a party via the given Beacon ID.
    // If successful, the connect string contains game-specific instructions to connect
    // to the game with that party.
    JoinPartyCallback                                      = iSteamPartiesCallbacks + 1,

    // Response to CreateBeacon request. If successful, the beacon ID is provided.
    CreateBeaconCallback                                   = iSteamPartiesCallbacks + 2,

    // Someone has used the beacon to join your party - they are in-flight now
    // and we've reserved one of the open slots for them.
    // You should confirm when they join your party by calling OnReservationCompleted().
    // Otherwise, Steam may timeout their reservation eventually.
    ReservationNotificationCallback                        = iSteamPartiesCallbacks + 3,

    // Response to ChangeNumOpenSlots call
    ChangeNumOpenSlotsCallback                             = iSteamPartiesCallbacks + 4,

    // The list of possible Party beacon locations has changed
    AvailableBeaconLocationsUpdated                        = iSteamPartiesCallbacks + 5,

    // The list of active beacons may have changed
    ActiveBeaconsUpdated                                   = iSteamPartiesCallbacks + 6,


    // From: isteamnetworking.h

    // callback notification - a user wants to talk to us over the P2P channel via the SendP2PPacket() API
    // in response, a call to AcceptP2PPacketsFromUser() needs to be made, if you want to talk with them
    P2PSessionRequest                                      = iSteamNetworkingCallbacks + 2,

    // callback notification - packets can't get through to the specified user via the SendP2PPacket() API
    // all packets queued packets unsent at this point will be dropped
    // further attempts to send will retry making the connection (but will be dropped if we fail again)
    P2PSessionConnectFail                                  = iSteamNetworkingCallbacks + 3,

    // callback notification - status of a socket has changed
    // used as part of the CreateListenSocket() / CreateP2PConnectionSocket() 
    SocketStatusCallback                                   = iSteamNetworkingCallbacks + 1,


    // From: isteamnetworkingmessages.h

    /// Posted when a remote host is sending us a message, and we do not already have a session with them
    SteamNetworkingMessagesSessionRequest                  = iSteamNetworkingMessagesCallbacks + 1,

    /// Posted when we fail to establish a connection, or we detect that communications
    /// have been disrupted it an unusual way.  There is no notification when a peer proactively
    /// closes the session.  ("Closed by peer" is not a concept of UDP-style communications, and
    /// SteamNetworkingMessages is primarily intended to make porting UDP code easy.)
    ///
    /// Remember: callbacks are asynchronous.   See notes on SendMessageToUser,
    /// and k_nSteamNetworkingSend_AutoRestartBrokenSession in particular.
    ///
    /// Also, if a session times out due to inactivity, no callbacks will be posted.  The only
    /// way to detect that this is happening is that querying the session state may return
    /// none, connecting, and findingroute again.
    SteamNetworkingMessagesSessionFailed                   = iSteamNetworkingMessagesCallbacks + 2,


    // From: isteamnetworkingsockets.h

    /// This callback is posted whenever a connection is created, destroyed, or changes state.
    /// The m_info field will contain a complete description of the connection at the time the
    /// change occurred and the callback was posted.  In particular, m_eState will have the
    /// new connection state.
    ///
    /// You will usually need to listen for this callback to know when:
    /// - A new connection arrives on a listen socket.
    ///   m_info.m_hListenSocket will be set, m_eOldState = k_ESteamNetworkingConnectionState_None,
    ///   and m_info.m_eState = k_ESteamNetworkingConnectionState_Connecting.
    ///   See ISteamNetworkigSockets=AcceptConnection.
    /// - A connection you initiated has been accepted by the remote host.
    ///   m_eOldState = k_ESteamNetworkingConnectionState_Connecting, and
    ///   m_info.m_eState = k_ESteamNetworkingConnectionState_Connected.
    ///   Some connections might transition to k_ESteamNetworkingConnectionState_FindingRoute first.
    /// - A connection has been actively rejected or closed by the remote host.
    ///   m_eOldState = k_ESteamNetworkingConnectionState_Connecting or k_ESteamNetworkingConnectionState_Connected,
    ///   and m_info.m_eState = k_ESteamNetworkingConnectionState_ClosedByPeer.  m_info.m_eEndReason
    ///   and m_info.m_szEndDebug will have for more details.
    ///   NOTE: upon receiving this callback, you must still destroy the connection using
    ///   ISteamNetworkingSockets=CloseConnection to free up local resources.  (The details
    ///   passed to the function are not used in this case, since the connection is already closed.)
    /// - A problem was detected with the connection, and it has been closed by the local host.
    ///   The most common failure is timeout, but other configuration or authentication failures
    ///   can cause this.  m_eOldState = k_ESteamNetworkingConnectionState_Connecting or
    ///   k_ESteamNetworkingConnectionState_Connected, and m_info.m_eState = k_ESteamNetworkingConnectionState_ProblemDetectedLocally.
    ///   m_info.m_eEndReason and m_info.m_szEndDebug will have for more details.
    ///   NOTE: upon receiving this callback, you must still destroy the connection using
    ///   ISteamNetworkingSockets=CloseConnection to free up local resources.  (The details
    ///   passed to the function are not used in this case, since the connection is already closed.)
    ///
    /// Remember that callbacks are posted to a queue, and networking connections can
    /// change at any time.  It is possible that the connection has already changed
    /// state by the time you process this callback.
    ///
    /// Also note that callbacks will be posted when connections are created and destroyed by your own API calls.
    SteamNetConnectionStatusChangedCallback                = iSteamNetworkingSocketsCallbacks + 1,

    /// A struct used to describe our readiness to participate in authenticated,
    /// encrypted communication.  In order to do this we need:
    ///
    /// - The list of trusted CA certificates that might be relevant for this
    ///   app.
    /// - A valid certificate issued by a CA.
    ///
    /// This callback is posted whenever the state of our readiness changes.
    SteamNetAuthenticationStatus                           = iSteamNetworkingSocketsCallbacks + 2,


    // From: isteamnetworkingutils.h

    /// A struct used to describe our readiness to use the relay network.
    /// To do this we first need to fetch the network configuration,
    /// which describes what POPs are available.
    SteamRelayNetworkStatus                                = iSteamNetworkingUtilsCallbacks + 1,


    // From: isteamparentalsettings.h

    // Purpose: Callback for querying UGC
    SteamParentalSettingsChanged                           = ISteamParentalSettingsCallbacks + 1,


    // From: isteamremotestorage.h

    // Purpose: The result of a call to FileShare()
    RemoteStorageFileShareResult                           = iSteamRemoteStorageCallbacks + 7,

    // iSteamRemoteStorageCallbacks + 8, is deprecated! Do not reuse

    // Purpose: The result of a call to PublishFile()
    RemoteStoragePublishFileResult                         = iSteamRemoteStorageCallbacks + 9,

    // iSteamRemoteStorageCallbacks + 10 is deprecated! Do not reuse

    // Purpose: The result of a call to DeletePublishedFile()
    RemoteStorageDeletePublishedFileResult                 = iSteamRemoteStorageCallbacks + 11,

    // Purpose: The result of a call to EnumerateUserPublishedFiles()
    RemoteStorageEnumerateUserPublishedFilesResult         = iSteamRemoteStorageCallbacks + 12,

    // Purpose: The result of a call to SubscribePublishedFile()
    RemoteStorageSubscribePublishedFileResult              = iSteamRemoteStorageCallbacks + 13,

    // Purpose: The result of a call to EnumerateSubscribePublishedFiles()
    RemoteStorageEnumerateUserSubscribedFilesResult        = iSteamRemoteStorageCallbacks + 14,

    // Purpose: The result of a call to UnsubscribePublishedFile()
    RemoteStorageUnsubscribePublishedFileResult            = iSteamRemoteStorageCallbacks + 15,

    // Purpose: The result of a call to CommitPublishedFileUpdate()
    RemoteStorageUpdatePublishedFileResult                 = iSteamRemoteStorageCallbacks + 16,

    // Purpose: The result of a call to UGCDownload()
    RemoteStorageDownloadUGCResult                         = iSteamRemoteStorageCallbacks + 17,

    // Purpose: The result of a call to GetPublishedFileDetails()
    RemoteStorageGetPublishedFileDetailsResult             = iSteamRemoteStorageCallbacks + 18,
    RemoteStorageEnumerateWorkshopFilesResult              = iSteamRemoteStorageCallbacks + 19,

    // Purpose: The result of GetPublishedItemVoteDetails
    RemoteStorageGetPublishedItemVoteDetailsResult         = iSteamRemoteStorageCallbacks + 20,

    // Purpose: User subscribed to a file for the app (from within the app or on the web)
    RemoteStoragePublishedFileSubscribed                   = iSteamRemoteStorageCallbacks + 21,

    // Purpose: User unsubscribed from a file for the app (from within the app or on the web)
    RemoteStoragePublishedFileUnsubscribed                 = iSteamRemoteStorageCallbacks + 22,

    // Purpose: Published file that a user owns was deleted (from within the app or the web)
    RemoteStoragePublishedFileDeleted                      = iSteamRemoteStorageCallbacks + 23,

    // Purpose: The result of a call to UpdateUserPublishedItemVote()
    RemoteStorageUpdateUserPublishedItemVoteResult         = iSteamRemoteStorageCallbacks + 24,

    // Purpose: The result of a call to GetUserPublishedItemVoteDetails()
    RemoteStorageUserVoteDetails                           = iSteamRemoteStorageCallbacks + 25,
    RemoteStorageEnumerateUserSharedWorkshopFilesResult    = iSteamRemoteStorageCallbacks + 26,
    RemoteStorageSetUserPublishedFileActionResult          = iSteamRemoteStorageCallbacks + 27,
    RemoteStorageEnumeratePublishedFilesByUserActionResult = iSteamRemoteStorageCallbacks + 28,

    // Purpose: Called periodically while a PublishWorkshopFile is in progress
    RemoteStoragePublishFileProgress                       = iSteamRemoteStorageCallbacks + 29,

    // Purpose: Called when the content for a published file is updated
    RemoteStoragePublishedFileUpdated                      = iSteamRemoteStorageCallbacks + 30,

    // Purpose: Called when a FileWriteAsync completes
    RemoteStorageFileWriteAsyncComplete                    = iSteamRemoteStorageCallbacks + 31,

    // Purpose: Called when a FileReadAsync completes
    RemoteStorageFileReadAsyncComplete                     = iSteamRemoteStorageCallbacks + 32,


    // From: isteamscreenshots.h

    // Purpose: Screenshot successfully written or otherwise added to the library
    // and can now be tagged
    ScreenshotReady                                        = iSteamScreenshotsCallbacks + 1,

    // Purpose: Screenshot has been requested by the user.  Only sent if
    // HookScreenshots() has been called, in which case Steam will not take
    // the screenshot itself.
    ScreenshotRequested                                    = iSteamScreenshotsCallbacks + 2,


    // From: isteamugc.h

    // Purpose: Callback for querying UGC
    SteamUGCQueryCompleted                                 = iSteamUGCCallbacks + 1,

    // Purpose: Callback for requesting details on one piece of UGC
    SteamUGCRequestUGCDetailsResult                        = iSteamUGCCallbacks + 2,

    // Purpose: result for ISteamUGC=CreateItem() 
    CreateItemResult                                       = iSteamUGCCallbacks + 3,

    // Purpose: result for ISteamUGC=SubmitItemUpdate() 
    SubmitItemUpdateResult                                 = iSteamUGCCallbacks + 4,

    // Purpose: a Workshop item has been installed or updated
    ItemInstalled                                          = iSteamUGCCallbacks + 5,

    // Purpose: result of DownloadItem(), existing item files can be accessed again
    DownloadItemResult                                     = iSteamUGCCallbacks + 6,

    // Purpose: result of AddItemToFavorites() or RemoveItemFromFavorites()
    UserFavoriteItemsListChanged                           = iSteamUGCCallbacks + 7,

    // Purpose: The result of a call to SetUserItemVote()
    SetUserItemVoteResult                                  = iSteamUGCCallbacks + 8,

    // Purpose: The result of a call to GetUserItemVote()
    GetUserItemVoteResult                                  = iSteamUGCCallbacks + 9,

    // Purpose: The result of a call to StartPlaytimeTracking()
    StartPlaytimeTrackingResult                            = iSteamUGCCallbacks + 10,

    // Purpose: The result of a call to StopPlaytimeTracking()
    StopPlaytimeTrackingResult                             = iSteamUGCCallbacks + 11,

    // Purpose: The result of a call to AddDependency
    AddUGCDependencyResult                                 = iSteamUGCCallbacks + 12,

    // Purpose: The result of a call to RemoveDependency
    RemoveUGCDependencyResult                              = iSteamUGCCallbacks + 13,

    // Purpose: The result of a call to AddAppDependency
    AddAppDependencyResult                                 = iSteamUGCCallbacks + 14,

    // Purpose: The result of a call to RemoveAppDependency
    RemoveAppDependencyResult                              = iSteamUGCCallbacks + 15,

    // Purpose: The result of a call to GetAppDependencies.  Callback may be called
    //			multiple times until all app dependencies have been returned.
    GetAppDependenciesResult                               = iSteamUGCCallbacks + 16,

    // Purpose: The result of a call to DeleteItem
    DeleteItemResult                                       = iSteamUGCCallbacks + 17,

    // Purpose: signal that the list of subscribed items changed
    UserSubscribedItemsListChanged                         = iSteamUGCCallbacks + 18,

    // Purpose: Status of the user's acceptable/rejection of the app's specific Workshop EULA
    WorkshopEULAStatus                                     = iSteamUGCCallbacks + 20,


    // From: isteamuser.h

    // Purpose: called when a connections to the Steam back-end has been established
    //			this means the Steam client now has a working connection to the Steam servers
    //			usually this will have occurred before the game has launched, and should
    //			only be seen if the user has dropped connection due to a networking issue
    //			or a Steam server update
    SteamServersConnected                                  = iSteamUserCallbacks + 1,

    // Purpose: called when a connection attempt has failed
    //			this will occur periodically if the Steam client is not connected, 
    //			and has failed in it's retry to establish a connection
    SteamServerConnectFailure                              = iSteamUserCallbacks + 2,


    // Purpose: called if the client has lost connection to the Steam servers
    //			real-time services will be disabled until a matching SteamServersConnected_t has been posted
    SteamServersDisconnected                               = iSteamUserCallbacks + 3,


    // Purpose: Sent by the Steam server to the client telling it to disconnect from the specified game server,
    //			which it may be in the process of or already connected to.
    //			The game client should immediately disconnect upon receiving this message.
    //			This can usually occur if the user doesn't have rights to play on the game server.
    ClientGameServerDeny                                   = iSteamUserCallbacks + 13,


    // Purpose: called when the callback system for this client is in an error state (and has flushed pending callbacks)
    //			When getting this message the client should disconnect from Steam, reset any stored Steam state and reconnect.
    //			This usually occurs in the rare event the Steam client has some kind of fatal error.
    IPCFailure                                             = iSteamUserCallbacks + 17,

    // Purpose: Signaled whenever licenses change
    LicensesUpdated                                        = iSteamUserCallbacks + 25,

    // callback for BeginAuthSession
    ValidateAuthTicketResponse                             = iSteamUserCallbacks + 43,

    // Purpose: called when a user has responded to a microtransaction authorization request
    MicroTxnAuthorizationResponse                          = iSteamUserCallbacks + 52,

    // Purpose: Result from RequestEncryptedAppTicket
    EncryptedAppTicketResponse                             = iSteamUserCallbacks + 54,

    // callback for GetAuthSessionTicket
    GetAuthSessionTicketResponse                           = iSteamUserCallbacks + 63,

    // Purpose: sent to your game in response to a steam://gamewebcallback/ command
    GameWebCallback                                        = iSteamUserCallbacks + 64,

    // Purpose: sent to your game in response to ISteamUser=RequestStoreAuthURL
    StoreAuthURLResponse                                   = iSteamUserCallbacks + 65,

    // Purpose: sent in response to ISteamUser=GetMarketEligibility
    MarketEligibilityResponse                              = iSteamUserCallbacks + 66,

    // Purpose: sent for games with enabled anti indulgence / duration control, for
    // enabled users. Lets the game know whether the user can keep playing or
    // whether the game should exit, and returns info about remaining gameplay time.
    //
    // This callback is fired asynchronously in response to timers triggering.
    // It is also fired in response to calls to GetDurationControl().
    DurationControl                                        = iSteamUserCallbacks + 67,


    // From: isteamuserstats.h

    // Purpose: called when the latests stats and achievements have been received
    //			from the server
    UserStatsReceived                                      = iSteamUserStatsCallbacks + 1,

    // Purpose: result of a request to store the user stats for a game
    UserStatsStored                                        = iSteamUserStatsCallbacks + 2,

    // Purpose: result of a request to store the achievements for a game, or an 
    //			"indicate progress" call. If both m_nCurProgress and m_nMaxProgress
    //			are zero, that means the achievement has been fully unlocked.
    UserAchievementStored                                  = iSteamUserStatsCallbacks + 3,

    // Purpose: call result for finding a leaderboard, returned as a result of FindOrCreateLeaderboard() or FindLeaderboard()
    //			use CCallResult<> to map this async result to a member function
    LeaderboardFindResult                                  = iSteamUserStatsCallbacks + 4,

    // Purpose: call result indicating scores for a leaderboard have been downloaded and are ready to be retrieved, returned as a result of DownloadLeaderboardEntries()
    //			use CCallResult<> to map this async result to a member function
    LeaderboardScoresDownloaded                            = iSteamUserStatsCallbacks + 5,

    // Purpose: call result indicating scores has been uploaded, returned as a result of UploadLeaderboardScore()
    //			use CCallResult<> to map this async result to a member function
    LeaderboardScoreUploaded                               = iSteamUserStatsCallbacks + 6,
    NumberOfCurrentPlayers                                 = iSteamUserStatsCallbacks + 7,

    // Purpose: Callback indicating that a user's stats have been unloaded.
    //  Call RequestUserStats again to access stats for this user
    UserStatsUnloaded                                      = iSteamUserStatsCallbacks + 8,

    // Purpose: Callback indicating that an achievement icon has been fetched
    UserAchievementIconFetched                             = iSteamUserStatsCallbacks + 9,

    // Purpose: Callback indicating that global achievement percentages are fetched
    GlobalAchievementPercentagesReady                      = iSteamUserStatsCallbacks + 10,

    // Purpose: call result indicating UGC has been uploaded, returned as a result of SetLeaderboardUGC()
    LeaderboardUGCSet                                      = iSteamUserStatsCallbacks + 11,

    // Purpose: callback indicating that PS3 trophies have been installed
    PS3TrophiesInstalled                                   = iSteamUserStatsCallbacks + 12,
    // Purpose: callback indicating global stats have been received.
    //	Returned as a result of RequestGlobalStats()
    GlobalStatsReceived                                    = iSteamUserStatsCallbacks + 12,


    // From: isteamutils.h

    // Purpose: The country of the user changed
    IPCountry                                              = iSteamUtilsCallbacks + 1,

    // Purpose: Fired when running on a laptop and less than 10 minutes of battery is left, fires then every minute
    LowBatteryPower                                        = iSteamUtilsCallbacks + 2,

    // Purpose: called when a SteamAsyncCall_t has completed (or failed)
    SteamAPICallCompleted                                  = iSteamUtilsCallbacks + 3,

    // called when Steam wants to shutdown
    SteamShutdown                                          = iSteamUtilsCallbacks + 4,
    CheckFileSignature                                     = iSteamUtilsCallbacks + 5,

    // iSteamUtilsCallbacks + 13 is taken

    // Full Screen gamepad text input has been closed
    GamepadTextInputDismissed                              = iSteamUtilsCallbacks + 14,

    // iSteamUtilsCallbacks + 15 through 35 are taken

    // iSteamUtilsCallbacks + 37 is taken

    // The floating on-screen keyboard has been closed
    FloatingGamepadTextInputDismissed                      = iSteamUtilsCallbacks + 38,
}

/// Internal structure used in manual callback dispatch
CallbackMsg :: struct #align (CALLBACK_ALIGN) {
    hSteamUser: HSteamUser, // Specific user to whom this callback applies.
    iCallback:  ICallback, // Callback identifier.  (Corresponds to the k_iCallback enum in the callback structure.)
    pubParam:   ^u8, // Points to the callback structure
    cubParam:   i32, // Size of the data pointed to by m_pubParam
}

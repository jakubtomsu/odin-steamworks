package steamworks
import "core:c"
foreign import lib "steam_api64.lib"

// VALVE_CALLBACK_PACK_SMALL / VALVE_CALLBACK_PACK_LARGE
CALLBACK_PACK_LARGE :: #config(STEAMWORKS_CALLBACK_PACK_LARGE, true)
CALLBACK_ALIGN :: 8 when CALLBACK_PACK_LARGE else 4

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

AppId :: c.uint
DepotId :: c.uint
RTime32 :: c.uint
SteamAPICall :: u64
AccountID :: c.uint
PartyBeaconID :: u64
HAuthTicket :: c.uint
PFNPreMinidumpCallback :: proc "c" (_: rawptr)
HSteamPipe :: int32
HSteamUser :: int32
FriendsGroupID :: i64
HServerListRequest :: rawptr
HServerQuery :: c.int
UGCHandle :: u64
PublishedFileUpdateHandle :: u64
PublishedFileId :: u64
UGCFileWriteStreamHandle :: u64
SteamLeaderboard :: u64
SteamLeaderboardEntries :: u64
SNetSocket :: c.uint
SNetListenSocket :: c.uint
ScreenshotHandle :: c.uint
HTTPRequestHandle :: c.uint
HTTPCookieContainerHandle :: c.uint
InputHandle :: u64
InputActionSetHandle :: u64
InputDigitalActionHandle :: u64
InputAnalogActionHandle :: u64
SteamInputActionEventCallbackPointer :: proc "c" (_: ^SteamInputActionEvent)
ControllerHandle :: u64
ControllerActionSetHandle :: u64
ControllerDigitalActionHandle :: u64
ControllerAnalogActionHandle :: u64
UGCQueryHandle :: u64
UGCUpdateHandle :: u64
HHTMLBrowser :: c.uint
SteamItemInstanceID :: u64
SteamItemDef :: int
SteamInventoryResult :: int
SteamInventoryUpdateHandle :: u64
RemotePlaySessionID :: c.uint
FnSteamNetConnectionStatusChanged :: proc "c" (_: ^SteamNetConnectionStatusChangedCallback)
FnSteamNetAuthenticationStatusChanged :: proc "c" (_: ^SteamNetAuthenticationStatus)
FnSteamRelayNetworkStatusChanged :: proc "c" (_: ^SteamRelayNetworkStatus)
FnSteamNetworkingMessagesSessionRequest :: proc "c" (_: ^SteamNetworkingMessagesSessionRequest)
FnSteamNetworkingMessagesSessionFailed :: proc "c" (_: ^SteamNetworkingMessagesSessionFailed)
FnSteamNetworkingFakeIPResult :: proc "c" (_: ^SteamNetworkingFakeIPResult)
HSteamNetConnection :: c.uint
HSteamListenSocket :: c.uint
HSteamNetPollGroup :: c.uint
SteamNetworkingErrMsg :: [1024]u8
SteamNetworkingPOPID :: c.uint
SteamNetworkingMicroseconds :: c.longlong
FSteamNetworkingSocketsDebugOutput :: proc "c" (_: ESteamNetworkingSocketsDebugOutputType, _: cstring)

uAppIdInvalid: AppId : 0x0
uDepotIdInvalid: DepotId : 0x0
uAPICallInvalid: SteamAPICall : 0x0
ulPartyBeaconIdInvalid: PartyBeaconID : 0
HAuthTicketInvalid: HAuthTicket : 0
unSteamAccountIDMask: c.uint : 0xFFFFFFFF
unSteamAccountInstanceMask: c.uint : 0x000FFFFF
unSteamUserDefaultInstance: c.uint : 1
cchGameExtraInfoMax: c.int : 64
cchMaxFriendsGroupName: c.int : 64
cFriendsGroupLimit: c.int : 100
FriendsGroupID_Invalid: FriendsGroupID : -1
cEnumerateFollowersMax: c.int : 50
cubChatMetadataMax: uint32 : 8192
cbMaxGameServerGameDir: c.int : 32
cbMaxGameServerMapName: c.int : 32
cbMaxGameServerGameDescription: c.int : 64
cbMaxGameServerName: c.int : 64
cbMaxGameServerTags: c.int : 128
cbMaxGameServerGameData: c.int : 2048
HSERVERQUERY_INVALID: c.uint : 0xffffffff
unFavoriteFlagNone: uint32 : 0x00
unFavoriteFlagFavorite: uint32 : 0x01
unFavoriteFlagHistory: uint32 : 0x02
unMaxCloudFileChunkSize: uint32 : 100 * 1024 * 1024
PublishedFileIdInvalid: PublishedFileId : 0
cchPublishedDocumentTitleMax: uint32 : 128 + 1
cchPublishedDocumentDescriptionMax: uint32 : 8000
cchPublishedDocumentChangeDescriptionMax: uint32 : 8000
unEnumeratePublishedFilesMaxResults: uint32 : 50
cchTagListMax: uint32 : 1024 + 1
cchFilenameMax: uint32 : 260
cchPublishedFileURLMax: uint32 : 256
cubAppProofOfPurchaseKeyMax: c.int : 240
nScreenshotMaxTaggedUsers: uint32 : 32
nScreenshotMaxTaggedPublishedFiles: uint32 : 32
cubUFSTagTypeMax: c.int : 255
cubUFSTagValueMax: c.int : 255
ScreenshotThumbWidth: c.int : 200
kNumUGCResultsPerPage: uint32 : 50
cchDeveloperMetadataMax: uint32 : 5000
INVALID_HTMLBROWSER: uint32 : 0
SteamItemInstanceIDInvalid: SteamItemInstanceID : ~SteamItemInstanceID(0)
SteamInventoryResultInvalid: SteamInventoryResult : -1
HSteamNetConnection_Invalid: HSteamNetConnection : 0
HSteamListenSocket_Invalid: HSteamListenSocket : 0
HSteamNetPollGroup_Invalid: HSteamNetPollGroup : 0
cchMaxSteamNetworkingErrMsg: c.int : 1024
cchSteamNetworkingMaxConnectionCloseReason: c.int : 128
cchSteamNetworkingMaxConnectionDescription: c.int : 128
cchSteamNetworkingMaxConnectionAppName: c.int : 32
nSteamNetworkConnectionInfoFlags_Unauthenticated: c.int : 1
nSteamNetworkConnectionInfoFlags_Unencrypted: c.int : 2
nSteamNetworkConnectionInfoFlags_LoopbackBuffers: c.int : 4
nSteamNetworkConnectionInfoFlags_Fast: c.int : 8
nSteamNetworkConnectionInfoFlags_Relayed: c.int : 16
nSteamNetworkConnectionInfoFlags_DualWifi: c.int : 32
cbMaxSteamNetworkingSocketsMessageSizeSend: c.int : 512 * 1024
nSteamNetworkingSend_Unreliable: c.int : 0
nSteamNetworkingSend_NoNagle: c.int : 1
nSteamNetworkingSend_UnreliableNoNagle: c.int : nSteamNetworkingSend_Unreliable | nSteamNetworkingSend_NoNagle
nSteamNetworkingSend_NoDelay: c.int : 4
nSteamNetworkingSend_UnreliableNoDelay: c.int : nSteamNetworkingSend_Unreliable | nSteamNetworkingSend_NoDelay | nSteamNetworkingSend_NoNagle
nSteamNetworkingSend_Reliable: c.int : 8
nSteamNetworkingSend_ReliableNoNagle: c.int : nSteamNetworkingSend_Reliable | nSteamNetworkingSend_NoNagle
nSteamNetworkingSend_UseCurrentThread: c.int : 16
nSteamNetworkingSend_AutoRestartBrokenSession: c.int : 32
cchMaxSteamNetworkingPingLocationString: c.int : 1024
nSteamNetworkingPing_Failed: c.int : -1
nSteamNetworkingPing_Unknown: c.int : -2
nSteamNetworkingConfig_P2P_Transport_ICE_Enable_Default: c.int : -1
nSteamNetworkingConfig_P2P_Transport_ICE_Enable_Disable: c.int : 0
nSteamNetworkingConfig_P2P_Transport_ICE_Enable_Relay: c.int : 1
nSteamNetworkingConfig_P2P_Transport_ICE_Enable_Private: c.int : 2
nSteamNetworkingConfig_P2P_Transport_ICE_Enable_Public: c.int : 4
nSteamNetworkingConfig_P2P_Transport_ICE_Enable_All: c.int : 0x7fffffff
STEAMGAMESERVER_QUERY_PORT_SHARED: uint16 : 0xffff
MASTERSERVERUPDATERPORT_USEGAMESOCKETSHARE: uint16 : STEAMGAMESERVER_QUERY_PORT_SHARED
cbSteamDatagramMaxSerializedTicket: uint32 : 512
cbMaxSteamDatagramGameCoordinatorServerLoginAppData: uint32 : 2048
cbMaxSteamDatagramGameCoordinatorServerLoginSerialized: uint32 : 4096
cbSteamNetworkingSocketsFakeUDPPortRecommendedMTU: c.int : 1200
cbSteamNetworkingSocketsFakeUDPPortMaxMessageSize: c.int : 4096

UGCHandleInvalid: UGCHandle : 0xffffffffffffffff
PublishedFileUpdateHandleInvalid: PublishedFileUpdateHandle : 0xffffffffffffffff
UGCFileStreamHandleInvalid: UGCFileWriteStreamHandle : 0xffffffffffffffff
UGCQueryHandleInvalid: UGCQueryHandle : 0xffffffffffffffff
UGCUpdateHandleInvalid: UGCUpdateHandle : 0xffffffffffffffff
SteamInventoryUpdateHandleInvalid: SteamInventoryUpdateHandle : 0xffffffffffffffff
SteamDatagramPOPID_dev: SteamNetworkingPOPID : (uint32('d') << 16) | (uint32('e') << 8) | uint32('v')

// -------
// Structs
// -------

SteamNetworkingMessage :: struct #align CALLBACK_ALIGN {
    pData:            rawptr,
    cbSize:           c.int,
    conn:             HSteamNetConnection,
    identityPeer:     SteamNetworkingIdentity,
    nConnUserData:    int64,
    usecTimeReceived: SteamNetworkingMicroseconds,
    nMessageNumber:   int64,
    pfnFreeData:      proc "c" (_: ^SteamNetworkingMessage),
    pfnRelease:       proc "c" (_: ^SteamNetworkingMessage),
    nChannel:         c.int,
    nFlags:           c.int,
    nUserData:        int64,
    idxLane:          uint16,
    _pad1__:          uint16,
}

SteamInputActionEvent_AnalogAction :: struct #align CALLBACK_ALIGN {
    actionHandle:     InputAnalogActionHandle,
    analogActionData: InputAnalogActionData,
}

SteamInputActionEvent_DigitalAction :: struct #align CALLBACK_ALIGN {
    actionHandle:      InputDigitalActionHandle,
    digitalActionData: InputDigitalActionData,
}

SteamInputActionEvent :: struct #align CALLBACK_ALIGN {
    controllerHandle: InputHandle,
    eEventType:       ESteamInputActionEventType,
    using actions:    struct #raw_union {
        analogAction:  SteamInputActionEvent_AnalogAction,
        digitalAction: SteamInputActionEvent_DigitalAction,
    },
}


SteamServersConnected :: struct #align CALLBACK_ALIGN {}

SteamServerConnectFailure :: struct #align CALLBACK_ALIGN {
    eResult:        EResult,
    bStillRetrying: bool,
}

SteamServersDisconnected :: struct #align CALLBACK_ALIGN {
    eResult: EResult,
}

ClientGameServerDeny :: struct #align CALLBACK_ALIGN {
    uAppID:           uint32,
    unGameServerIP:   uint32,
    usGameServerPort: uint16,
    bSecure:          uint16,
    uReason:          uint32,
}

IPCFailure :: struct #align CALLBACK_ALIGN {
    eFailureType: uint8,
}

LicensesUpdated :: struct #align CALLBACK_ALIGN {}

ValidateAuthTicketResponse :: struct #align CALLBACK_ALIGN {
    SteamID:              CSteamID,
    eAuthSessionResponse: EAuthSessionResponse,
    OwnerSteamID:         CSteamID,
}

MicroTxnAuthorizationResponse :: struct #align CALLBACK_ALIGN {
    unAppID:     uint32,
    ulOrderID:   uint64,
    bAuthorized: uint8,
}

EncryptedAppTicketResponse :: struct #align CALLBACK_ALIGN {
    eResult: EResult,
}

GetAuthSessionTicketResponse :: struct #align CALLBACK_ALIGN {
    hAuthTicket: HAuthTicket,
    eResult:     EResult,
}

GameWebCallback :: struct #align CALLBACK_ALIGN {
    szURL: [256]u8,
}

StoreAuthURLResponse :: struct #align CALLBACK_ALIGN {
    szURL: [512]u8,
}

MarketEligibilityResponse :: struct #align CALLBACK_ALIGN {
    bAllowed:                   bool,
    eNotAllowedReason:          EMarketNotAllowedReasonFlags,
    rtAllowedAtTime:            RTime32,
    cdaySteamGuardRequiredDays: c.int,
    cdayNewDeviceCooldown:      c.int,
}

DurationControl :: struct #align CALLBACK_ALIGN {
    eResult:        EResult,
    appid:          AppId,
    bApplicable:    bool,
    csecsLast5h:    int32,
    progress:       EDurationControlProgress,
    notification:   EDurationControlNotification,
    csecsToday:     int32,
    csecsRemaining: int32,
}

PersonaStateChange :: struct #align CALLBACK_ALIGN {
    ulSteamID:    uint64,
    nChangeFlags: c.int,
}

GameOverlayActivated :: struct #align CALLBACK_ALIGN {
    bActive: uint8,
}

GameServerChangeRequested :: struct #align CALLBACK_ALIGN {
    rgchServer:   [64]u8,
    rgchPassword: [64]u8,
}

GameLobbyJoinRequested :: struct #align CALLBACK_ALIGN {
    steamIDLobby:  CSteamID,
    steamIDFriend: CSteamID,
}

AvatarImageLoaded :: struct #align CALLBACK_ALIGN {
    steamID: CSteamID,
    iImage:  c.int,
    iWide:   c.int,
    iTall:   c.int,
}

ClanOfficerListResponse :: struct #align CALLBACK_ALIGN {
    steamIDClan: CSteamID,
    cOfficers:   c.int,
    bSuccess:    uint8,
}

FriendRichPresenceUpdate :: struct #align CALLBACK_ALIGN {
    steamIDFriend: CSteamID,
    nAppID:        AppId,
}

GameRichPresenceJoinRequested :: struct #align CALLBACK_ALIGN {
    steamIDFriend: CSteamID,
    rgchConnect:   [256]u8,
}

GameConnectedClanChatMsg :: struct #align CALLBACK_ALIGN {
    steamIDClanChat: CSteamID,
    steamIDUser:     CSteamID,
    iMessageID:      c.int,
}

GameConnectedChatJoin :: struct #align CALLBACK_ALIGN {
    steamIDClanChat: CSteamID,
    steamIDUser:     CSteamID,
}

GameConnectedChatLeave :: struct #align CALLBACK_ALIGN {
    steamIDClanChat: CSteamID,
    steamIDUser:     CSteamID,
    bKicked:         bool,
    bDropped:        bool,
}

DownloadClanActivityCountsResult :: struct #align CALLBACK_ALIGN {
    bSuccess: bool,
}

JoinClanChatRoomCompletionResult :: struct #align CALLBACK_ALIGN {
    steamIDClanChat:        CSteamID,
    eChatRoomEnterResponse: EChatRoomEnterResponse,
}

GameConnectedFriendChatMsg :: struct #align CALLBACK_ALIGN {
    steamIDUser: CSteamID,
    iMessageID:  c.int,
}

FriendsGetFollowerCount :: struct #align CALLBACK_ALIGN {
    eResult: EResult,
    steamID: CSteamID,
    nCount:  c.int,
}

FriendsIsFollowing :: struct #align CALLBACK_ALIGN {
    eResult:      EResult,
    steamID:      CSteamID,
    bIsFollowing: bool,
}

FriendsEnumerateFollowingList :: struct #align CALLBACK_ALIGN {
    eResult:           EResult,
    rgSteamID:         [50]CSteamID,
    nResultsReturned:  int32,
    nTotalResultCount: int32,
}

SetPersonaNameResponse :: struct #align CALLBACK_ALIGN {
    bSuccess:      bool,
    bLocalSuccess: bool,
    result:        EResult,
}

UnreadChatMessagesChanged :: struct #align CALLBACK_ALIGN {}

OverlayBrowserProtocolNavigation :: struct #align CALLBACK_ALIGN {
    rgchURI: [1024]u8,
}

EquippedProfileItemsChanged :: struct #align CALLBACK_ALIGN {
    steamID: CSteamID,
}

EquippedProfileItems :: struct #align CALLBACK_ALIGN {
    eResult:                   EResult,
    steamID:                   CSteamID,
    bHasAnimatedAvatar:        bool,
    bHasAvatarFrame:           bool,
    bHasProfileModifier:       bool,
    bHasProfileBackground:     bool,
    bHasMiniProfileBackground: bool,
}

IPCountry :: struct #align CALLBACK_ALIGN {}

LowBatteryPower :: struct #align CALLBACK_ALIGN {
    nMinutesBatteryLeft: uint8,
}

SteamAPICallCompleted :: struct #align CALLBACK_ALIGN {
    hAsyncCall: SteamAPICall,
    iCallback:  c.int,
    cubParam:   uint32,
}

SteamShutdown :: struct #align CALLBACK_ALIGN {}

CheckFileSignature :: struct #align CALLBACK_ALIGN {
    eCheckFileSignature: ECheckFileSignature,
}

GamepadTextInputDismissed :: struct #align CALLBACK_ALIGN {
    bSubmitted:      bool,
    unSubmittedText: uint32,
}

AppResumingFromSuspend :: struct #align CALLBACK_ALIGN {}

FloatingGamepadTextInputDismissed :: struct #align CALLBACK_ALIGN {}

FavoritesListChanged :: struct #align CALLBACK_ALIGN {
    nIP:         uint32,
    nQueryPort:  uint32,
    nConnPort:   uint32,
    nAppID:      uint32,
    nFlags:      uint32,
    bAdd:        bool,
    unAccountId: AccountID,
}

LobbyInvite :: struct #align CALLBACK_ALIGN {
    ulSteamIDUser:  uint64,
    ulSteamIDLobby: uint64,
    ulGameID:       uint64,
}

LobbyEnter :: struct #align CALLBACK_ALIGN {
    ulSteamIDLobby:         uint64,
    rgfChatPermissions:     uint32,
    bLocked:                bool,
    EChatRoomEnterResponse: uint32,
}

LobbyDataUpdate :: struct #align CALLBACK_ALIGN {
    ulSteamIDLobby:  uint64,
    ulSteamIDMember: uint64,
    bSuccess:        uint8,
}

LobbyChatUpdate :: struct #align CALLBACK_ALIGN {
    ulSteamIDLobby:           uint64,
    ulSteamIDUserChanged:     uint64,
    ulSteamIDMakingChange:    uint64,
    rgfChatMemberStateChange: uint32,
}

LobbyChatMsg :: struct #align CALLBACK_ALIGN {
    ulSteamIDLobby: uint64,
    ulSteamIDUser:  uint64,
    eChatEntryType: uint8,
    iChatID:        uint32,
}

LobbyGameCreated :: struct #align CALLBACK_ALIGN {
    ulSteamIDLobby:      uint64,
    ulSteamIDGameServer: uint64,
    unIP:                uint32,
    usPort:              uint16,
}

LobbyMatchList :: struct #align CALLBACK_ALIGN {
    nLobbiesMatching: uint32,
}

LobbyKicked :: struct #align CALLBACK_ALIGN {
    ulSteamIDLobby:         uint64,
    ulSteamIDAdmin:         uint64,
    bKickedDueToDisconnect: uint8,
}

LobbyCreated :: struct #align CALLBACK_ALIGN {
    eResult:        EResult,
    ulSteamIDLobby: uint64,
}

PSNGameBootInviteResult :: struct #align CALLBACK_ALIGN {
    bGameBootInviteExists: bool,
    steamIDLobby:          CSteamID,
}

FavoritesListAccountsUpdated :: struct #align CALLBACK_ALIGN {
    eResult: EResult,
}

SearchForGameProgressCallback :: struct #align CALLBACK_ALIGN {
    ullSearchID:               uint64,
    eResult:                   EResult,
    lobbyID:                   CSteamID,
    steamIDEndedSearch:        CSteamID,
    nSecondsRemainingEstimate: int32,
    cPlayersSearching:         int32,
}

SearchForGameResultCallback :: struct #align CALLBACK_ALIGN {
    ullSearchID:         uint64,
    eResult:             EResult,
    nCountPlayersInGame: int32,
    nCountAcceptedGame:  int32,
    steamIDHost:         CSteamID,
    bFinalCallback:      bool,
}

RequestPlayersForGameProgressCallback :: struct #align CALLBACK_ALIGN {
    eResult:     EResult,
    ullSearchID: uint64,
}

RequestPlayersForGameResultCallback :: struct #align CALLBACK_ALIGN {
    eResult:                   EResult,
    ullSearchID:               uint64,
    SteamIDPlayerFound:        CSteamID,
    SteamIDLobby:              CSteamID,
    ePlayerAcceptState:        RequestPlayersForGameResultCallbact_PlayerAcceptState,
    nPlayerIndex:              int32,
    nTotalPlayersFound:        int32,
    nTotalPlayersAcceptedGame: int32,
    nSuggestedTeamIndex:       int32,
    ullUniqueGameID:           uint64,
}

RequestPlayersForGameResultCallbact_PlayerAcceptState :: enum {
    EStateUnknown        = 0,
    EStatePlayerAccepted = 1,
    EStatePlayerDeclined = 2,
}

RequestPlayersForGameFinalResultCallback :: struct #align CALLBACK_ALIGN {
    eResult:         EResult,
    ullSearchID:     uint64,
    ullUniqueGameID: uint64,
}

SubmitPlayerResultResultCallback :: struct #align CALLBACK_ALIGN {
    eResult:         EResult,
    ullUniqueGameID: uint64,
    steamIDPlayer:   CSteamID,
}

EndGameResultCallback :: struct #align CALLBACK_ALIGN {
    eResult:         EResult,
    ullUniqueGameID: uint64,
}

JoinPartyCallback :: struct #align CALLBACK_ALIGN {
    eResult:            EResult,
    ulBeaconID:         PartyBeaconID,
    SteamIDBeaconOwner: CSteamID,
    rgchConnectString:  [256]u8,
}

CreateBeaconCallback :: struct #align CALLBACK_ALIGN {
    eResult:    EResult,
    ulBeaconID: PartyBeaconID,
}

ReservationNotificationCallback :: struct #align CALLBACK_ALIGN {
    ulBeaconID:    PartyBeaconID,
    steamIDJoiner: CSteamID,
}

ChangeNumOpenSlotsCallback :: struct #align CALLBACK_ALIGN {
    eResult: EResult,
}

AvailableBeaconLocationsUpdated :: struct #align CALLBACK_ALIGN {}

ActiveBeaconsUpdated :: struct #align CALLBACK_ALIGN {}

RemoteStorageFileShareResult :: struct #align CALLBACK_ALIGN {
    eResult:      EResult,
    hFile:        UGCHandle,
    rgchFilename: [260]u8,
}

RemoteStoragePublishFileResult :: struct #align CALLBACK_ALIGN {
    eResult:                                  EResult,
    nPublishedFileId:                         PublishedFileId,
    bUserNeedsToAcceptWorkshopLegalAgreement: bool,
}

RemoteStorageDeletePublishedFileResult :: struct #align CALLBACK_ALIGN {
    eResult:          EResult,
    nPublishedFileId: PublishedFileId,
}

RemoteStorageEnumerateUserPublishedFilesResult :: struct #align CALLBACK_ALIGN {
    eResult:           EResult,
    nResultsReturned:  int32,
    nTotalResultCount: int32,
    rgPublishedFileId: [50]PublishedFileId,
}

RemoteStorageSubscribePublishedFileResult :: struct #align CALLBACK_ALIGN {
    eResult:          EResult,
    nPublishedFileId: PublishedFileId,
}

RemoteStorageEnumerateUserSubscribedFilesResult :: struct #align CALLBACK_ALIGN {
    eResult:           EResult,
    nResultsReturned:  int32,
    nTotalResultCount: int32,
    rgPublishedFileId: [50]PublishedFileId,
    rgRTimeSubscribed: [50]uint32,
}

RemoteStorageUnsubscribePublishedFileResult :: struct #align CALLBACK_ALIGN {
    eResult:          EResult,
    nPublishedFileId: PublishedFileId,
}

RemoteStorageUpdatePublishedFileResult :: struct #align CALLBACK_ALIGN {
    eResult:                                  EResult,
    nPublishedFileId:                         PublishedFileId,
    bUserNeedsToAcceptWorkshopLegalAgreement: bool,
}

RemoteStorageDownloadUGCResult :: struct #align CALLBACK_ALIGN {
    eResult:        EResult,
    hFile:          UGCHandle,
    nAppID:         AppId,
    nSizeInBytes:   int32,
    pchFileName:    [260]u8,
    ulSteamIDOwner: uint64,
}

RemoteStorageGetPublishedFileDetailsResult :: struct #align CALLBACK_ALIGN {
    eResult:          EResult,
    nPublishedFileId: PublishedFileId,
    nCreatorAppID:    AppId,
    nConsumerAppID:   AppId,
    rgchTitle:        [129]u8,
    rgchDescription:  [8000]u8,
    hFile:            UGCHandle,
    hPreviewFile:     UGCHandle,
    ulSteamIDOwner:   uint64,
    rtimeCreated:     uint32,
    rtimeUpdated:     uint32,
    eVisibility:      ERemoteStoragePublishedFileVisibility,
    bBanned:          bool,
    rgchTags:         [1025]u8,
    bTagsTruncated:   bool,
    pchFileName:      [260]u8,
    nFileSize:        int32,
    nPreviewFileSize: int32,
    rgchURL:          [256]u8,
    eFileType:        EWorkshopFileType,
    bAcceptedForUse:  bool,
}

RemoteStorageEnumerateWorkshopFilesResult :: struct #align CALLBACK_ALIGN {
    eResult:           EResult,
    nResultsReturned:  int32,
    nTotalResultCount: int32,
    rgPublishedFileId: [50]PublishedFileId,
    rgScore:           [50]f32,
    nAppId:            AppId,
    unStartIndex:      uint32,
}

RemoteStorageGetPublishedItemVoteDetailsResult :: struct #align CALLBACK_ALIGN {
    eResult:           EResult,
    unPublishedFileId: PublishedFileId,
    nVotesFor:         int32,
    nVotesAgainst:     int32,
    nReports:          int32,
    fScore:            f32,
}

RemoteStoragePublishedFileSubscribed :: struct #align CALLBACK_ALIGN {
    nPublishedFileId: PublishedFileId,
    nAppID:           AppId,
}

RemoteStoragePublishedFileUnsubscribed :: struct #align CALLBACK_ALIGN {
    nPublishedFileId: PublishedFileId,
    nAppID:           AppId,
}

RemoteStoragePublishedFileDeleted :: struct #align CALLBACK_ALIGN {
    nPublishedFileId: PublishedFileId,
    nAppID:           AppId,
}

RemoteStorageUpdateUserPublishedItemVoteResult :: struct #align CALLBACK_ALIGN {
    eResult:          EResult,
    nPublishedFileId: PublishedFileId,
}

RemoteStorageUserVoteDetails :: struct #align CALLBACK_ALIGN {
    eResult:          EResult,
    nPublishedFileId: PublishedFileId,
    eVote:            EWorkshopVote,
}

RemoteStorageEnumerateUserSharedWorkshopFilesResult :: struct #align CALLBACK_ALIGN {
    eResult:           EResult,
    nResultsReturned:  int32,
    nTotalResultCount: int32,
    rgPublishedFileId: [50]PublishedFileId,
}

RemoteStorageSetUserPublishedFileActionResult :: struct #align CALLBACK_ALIGN {
    eResult:          EResult,
    nPublishedFileId: PublishedFileId,
    eAction:          EWorkshopFileAction,
}

RemoteStorageEnumeratePublishedFilesByUserActionResult :: struct #align CALLBACK_ALIGN {
    eResult:           EResult,
    eAction:           EWorkshopFileAction,
    nResultsReturned:  int32,
    nTotalResultCount: int32,
    rgPublishedFileId: [50]PublishedFileId,
    rgRTimeUpdated:    [50]uint32,
}

RemoteStoragePublishFileProgress :: struct #align CALLBACK_ALIGN {
    dPercentFile: f64,
    bPreview:     bool,
}

RemoteStoragePublishedFileUpdated :: struct #align CALLBACK_ALIGN {
    nPublishedFileId: PublishedFileId,
    nAppID:           AppId,
    ulUnused:         uint64,
}

RemoteStorageFileWriteAsyncComplete :: struct #align CALLBACK_ALIGN {
    eResult: EResult,
}

RemoteStorageFileReadAsyncComplete :: struct #align CALLBACK_ALIGN {
    hFileReadAsync: SteamAPICall,
    eResult:        EResult,
    nOffset:        uint32,
    cubRead:        uint32,
}

RemoteStorageLocalFileChange :: struct #align CALLBACK_ALIGN {}

UserStatsReceived :: struct #align CALLBACK_ALIGN {
    nGameID:     uint64,
    eResult:     EResult,
    steamIDUser: CSteamID,
}

UserStatsStored :: struct #align CALLBACK_ALIGN {
    nGameID: uint64,
    eResult: EResult,
}

UserAchievementStored :: struct #align CALLBACK_ALIGN {
    nGameID:             uint64,
    bGroupAchievement:   bool,
    rgchAchievementName: [128]u8,
    nCurProgress:        uint32,
    nMaxProgress:        uint32,
}

LeaderboardFindResult :: struct #align CALLBACK_ALIGN {
    hSteamLeaderboard: SteamLeaderboard,
    bLeaderboardFound: uint8,
}

LeaderboardScoresDownloaded :: struct #align CALLBACK_ALIGN {
    hSteamLeaderboard:        SteamLeaderboard,
    hSteamLeaderboardEntries: SteamLeaderboardEntries,
    cEntryCount:              c.int,
}

LeaderboardScoreUploaded :: struct #align CALLBACK_ALIGN {
    bSuccess:            uint8,
    hSteamLeaderboard:   SteamLeaderboard,
    nScore:              int32,
    bScoreChanged:       uint8,
    nGlobalRankNew:      c.int,
    nGlobalRankPrevious: c.int,
}

NumberOfCurrentPlayers :: struct #align CALLBACK_ALIGN {
    bSuccess: uint8,
    cPlayers: int32,
}

UserStatsUnloaded :: struct #align CALLBACK_ALIGN {
    steamIDUser: CSteamID,
}

UserAchievementIconFetched :: struct #align CALLBACK_ALIGN {
    nGameID:             CGameID,
    rgchAchievementName: [128]u8,
    bAchieved:           bool,
    nIconHandle:         c.int,
}

GlobalAchievementPercentagesReady :: struct #align CALLBACK_ALIGN {
    nGameID: uint64,
    eResult: EResult,
}

LeaderboardUGCSet :: struct #align CALLBACK_ALIGN {
    eResult:           EResult,
    hSteamLeaderboard: SteamLeaderboard,
}

PS3TrophiesInstalled :: struct #align CALLBACK_ALIGN {
    nGameID:             uint64,
    eResult:             EResult,
    ulRequiredDiskSpace: uint64,
}

GlobalStatsReceived :: struct #align CALLBACK_ALIGN {
    nGameID: uint64,
    eResult: EResult,
}

DlcInstalled :: struct #align CALLBACK_ALIGN {
    nAppID: AppId,
}

RegisterActivationCodeResponse :: struct #align CALLBACK_ALIGN {
    eResult:             ERegisterActivationCodeResult,
    unPackageRegistered: uint32,
}

NewUrlLaunchParameters :: struct #align CALLBACK_ALIGN {}

AppProofOfPurchaseKeyResponse :: struct #align CALLBACK_ALIGN {
    eResult:      EResult,
    nAppID:       uint32,
    cchKeyLength: uint32,
    rgchKey:      [240]u8,
}

FileDetailsResult :: struct #align CALLBACK_ALIGN {
    eResult:    EResult,
    ulFileSize: uint64,
    FileSHA:    [20]uint8,
    unFlags:    uint32,
}

TimedTrialStatus :: struct #align CALLBACK_ALIGN {
    unAppID:          AppId,
    bIsOffline:       bool,
    unSecondsAllowed: uint32,
    unSecondsPlayed:  uint32,
}

P2PSessionRequest :: struct #align CALLBACK_ALIGN {
    steamIDRemote: CSteamID,
}

P2PSessionConnectFail :: struct #align CALLBACK_ALIGN {
    steamIDRemote:    CSteamID,
    eP2PSessionError: uint8,
}

SocketStatusCallback :: struct #align CALLBACK_ALIGN {
    hSocket:          SNetSocket,
    hListenSocket:    SNetListenSocket,
    steamIDRemote:    CSteamID,
    eSNetSocketState: c.int,
}

ScreenshotReady :: struct #align CALLBACK_ALIGN {
    hLocal:  ScreenshotHandle,
    eResult: EResult,
}

ScreenshotRequested :: struct #align CALLBACK_ALIGN {}

PlaybackStatusHasChanged :: struct #align CALLBACK_ALIGN {}

VolumeHasChanged :: struct #align CALLBACK_ALIGN {
    flNewVolume: f32,
}

MusicPlayerRemoteWillActivate :: struct #align CALLBACK_ALIGN {}

MusicPlayerRemoteWillDeactivate :: struct #align CALLBACK_ALIGN {}

MusicPlayerRemoteToFront :: struct #align CALLBACK_ALIGN {}

MusicPlayerWillQuit :: struct #align CALLBACK_ALIGN {}

MusicPlayerWantsPlay :: struct #align CALLBACK_ALIGN {}

MusicPlayerWantsPause :: struct #align CALLBACK_ALIGN {}

MusicPlayerWantsPlayPrevious :: struct #align CALLBACK_ALIGN {}

MusicPlayerWantsPlayNext :: struct #align CALLBACK_ALIGN {}

MusicPlayerWantsShuffled :: struct #align CALLBACK_ALIGN {
    bShuffled: bool,
}

MusicPlayerWantsLooped :: struct #align CALLBACK_ALIGN {
    bLooped: bool,
}

MusicPlayerWantsVolume :: struct #align CALLBACK_ALIGN {
    flNewVolume: f32,
}

MusicPlayerSelectsQueueEntry :: struct #align CALLBACK_ALIGN {
    nID: c.int,
}

MusicPlayerSelectsPlaylistEntry :: struct #align CALLBACK_ALIGN {
    nID: c.int,
}

MusicPlayerWantsPlayingRepeatStatus :: struct #align CALLBACK_ALIGN {
    nPlayingRepeatStatus: c.int,
}

HTTPRequestCompleted :: struct #align CALLBACK_ALIGN {
    hRequest:           HTTPRequestHandle,
    ulContextValue:     uint64,
    bRequestSuccessful: bool,
    eStatusCode:        EHTTPStatusCode,
    unBodySize:         uint32,
}

HTTPRequestHeadersReceived :: struct #align CALLBACK_ALIGN {
    hRequest:       HTTPRequestHandle,
    ulContextValue: uint64,
}

HTTPRequestDataReceived :: struct #align CALLBACK_ALIGN {
    hRequest:       HTTPRequestHandle,
    ulContextValue: uint64,
    cOffset:        uint32,
    cBytesReceived: uint32,
}

SteamInputDeviceConnected :: struct #align CALLBACK_ALIGN {
    ulConnectedDeviceHandle: InputHandle,
}

SteamInputDeviceDisconnected :: struct #align CALLBACK_ALIGN {
    ulDisconnectedDeviceHandle: InputHandle,
}

SteamInputConfigurationLoaded :: struct #align CALLBACK_ALIGN {
    unAppID:            AppId,
    ulDeviceHandle:     InputHandle,
    ulMappingCreator:   CSteamID,
    unMajorRevision:    uint32,
    unMinorRevision:    uint32,
    bUsesSteamInputAPI: bool,
    bUsesGamepadAPI:    bool,
}

SteamUGCQueryCompleted :: struct #align CALLBACK_ALIGN {
    handle:                 UGCQueryHandle,
    eResult:                EResult,
    unNumResultsReturned:   uint32,
    unTotalMatchingResults: uint32,
    bCachedData:            bool,
    rgchNextCursor:         [256]u8,
}

SteamUGCRequestUGCDetailsResult :: struct #align CALLBACK_ALIGN {
    details:     SteamUGCDetails,
    bCachedData: bool,
}

CreateItemResult :: struct #align CALLBACK_ALIGN {
    eResult:                                  EResult,
    nPublishedFileId:                         PublishedFileId,
    bUserNeedsToAcceptWorkshopLegalAgreement: bool,
}

SubmitItemUpdateResult :: struct #align CALLBACK_ALIGN {
    eResult:                                  EResult,
    bUserNeedsToAcceptWorkshopLegalAgreement: bool,
    nPublishedFileId:                         PublishedFileId,
}

ItemInstalled :: struct #align CALLBACK_ALIGN {
    unAppID:          AppId,
    nPublishedFileId: PublishedFileId,
}

DownloadItemResult :: struct #align CALLBACK_ALIGN {
    unAppID:          AppId,
    nPublishedFileId: PublishedFileId,
    eResult:          EResult,
}

UserFavoriteItemsListChanged :: struct #align CALLBACK_ALIGN {
    nPublishedFileId: PublishedFileId,
    eResult:          EResult,
    bWasAddRequest:   bool,
}

SetUserItemVoteResult :: struct #align CALLBACK_ALIGN {
    nPublishedFileId: PublishedFileId,
    eResult:          EResult,
    bVoteUp:          bool,
}

GetUserItemVoteResult :: struct #align CALLBACK_ALIGN {
    nPublishedFileId: PublishedFileId,
    eResult:          EResult,
    bVotedUp:         bool,
    bVotedDown:       bool,
    bVoteSkipped:     bool,
}

StartPlaytimeTrackingResult :: struct #align CALLBACK_ALIGN {
    eResult: EResult,
}

StopPlaytimeTrackingResult :: struct #align CALLBACK_ALIGN {
    eResult: EResult,
}

AddUGCDependencyResult :: struct #align CALLBACK_ALIGN {
    eResult:               EResult,
    nPublishedFileId:      PublishedFileId,
    nChildPublishedFileId: PublishedFileId,
}

RemoveUGCDependencyResult :: struct #align CALLBACK_ALIGN {
    eResult:               EResult,
    nPublishedFileId:      PublishedFileId,
    nChildPublishedFileId: PublishedFileId,
}

AddAppDependencyResult :: struct #align CALLBACK_ALIGN {
    eResult:          EResult,
    nPublishedFileId: PublishedFileId,
    nAppID:           AppId,
}

RemoveAppDependencyResult :: struct #align CALLBACK_ALIGN {
    eResult:          EResult,
    nPublishedFileId: PublishedFileId,
    nAppID:           AppId,
}

GetAppDependenciesResult :: struct #align CALLBACK_ALIGN {
    eResult:                  EResult,
    nPublishedFileId:         PublishedFileId,
    rgAppIDs:                 [32]AppId,
    nNumAppDependencies:      uint32,
    nTotalNumAppDependencies: uint32,
}

DeleteItemResult :: struct #align CALLBACK_ALIGN {
    eResult:          EResult,
    nPublishedFileId: PublishedFileId,
}

UserSubscribedItemsListChanged :: struct #align CALLBACK_ALIGN {
    nAppID: AppId,
}

WorkshopEULAStatus :: struct #align CALLBACK_ALIGN {
    eResult:      EResult,
    nAppID:       AppId,
    unVersion:    uint32,
    rtAction:     RTime32,
    bAccepted:    bool,
    bNeedsAction: bool,
}

SteamAppInstalled :: struct #align CALLBACK_ALIGN {
    nAppID:              AppId,
    iInstallFolderIndex: c.int,
}

SteamAppUninstalled :: struct #align CALLBACK_ALIGN {
    nAppID:              AppId,
    iInstallFolderIndex: c.int,
}

HTML_BrowserReady :: struct #align CALLBACK_ALIGN {
    unBrowserHandle: HHTMLBrowser,
}

HTML_NeedsPaint :: struct #align CALLBACK_ALIGN {
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

HTML_StartRequest :: struct #align CALLBACK_ALIGN {
    unBrowserHandle: HHTMLBrowser,
    pchURL:          cstring,
    pchTarget:       cstring,
    pchPostData:     cstring,
    bIsRedirect:     bool,
}

HTML_CloseBrowser :: struct #align CALLBACK_ALIGN {
    unBrowserHandle: HHTMLBrowser,
}

HTML_URLChanged :: struct #align CALLBACK_ALIGN {
    unBrowserHandle: HHTMLBrowser,
    pchURL:          cstring,
    pchPostData:     cstring,
    bIsRedirect:     bool,
    pchPageTitle:    cstring,
    bNewNavigation:  bool,
}

HTML_FinishedRequest :: struct #align CALLBACK_ALIGN {
    unBrowserHandle: HHTMLBrowser,
    pchURL:          cstring,
    pchPageTitle:    cstring,
}

HTML_OpenLinkInNewTab :: struct #align CALLBACK_ALIGN {
    unBrowserHandle: HHTMLBrowser,
    pchURL:          cstring,
}

HTML_ChangedTitle :: struct #align CALLBACK_ALIGN {
    unBrowserHandle: HHTMLBrowser,
    pchTitle:        cstring,
}

HTML_SearchResults :: struct #align CALLBACK_ALIGN {
    unBrowserHandle: HHTMLBrowser,
    unResults:       uint32,
    unCurrentMatch:  uint32,
}

HTML_CanGoBackAndForward :: struct #align CALLBACK_ALIGN {
    unBrowserHandle: HHTMLBrowser,
    bCanGoBack:      bool,
    bCanGoForward:   bool,
}

HTML_HorizontalScroll :: struct #align CALLBACK_ALIGN {
    unBrowserHandle: HHTMLBrowser,
    unScrollMax:     uint32,
    unScrollCurrent: uint32,
    flPageScale:     f32,
    bVisible:        bool,
    unPageSize:      uint32,
}

HTML_VerticalScroll :: struct #align CALLBACK_ALIGN {
    unBrowserHandle: HHTMLBrowser,
    unScrollMax:     uint32,
    unScrollCurrent: uint32,
    flPageScale:     f32,
    bVisible:        bool,
    unPageSize:      uint32,
}

HTML_LinkAtPosition :: struct #align CALLBACK_ALIGN {
    unBrowserHandle: HHTMLBrowser,
    x:               uint32,
    y:               uint32,
    pchURL:          cstring,
    bInput:          bool,
    bLiveLink:       bool,
}

HTML_JSAlert :: struct #align CALLBACK_ALIGN {
    unBrowserHandle: HHTMLBrowser,
    pchMessage:      cstring,
}

HTML_JSConfirt :: struct #align CALLBACK_ALIGN {
    unBrowserHandle: HHTMLBrowser,
    pchMessage:      cstring,
}

HTML_FileOpenDialog :: struct #align CALLBACK_ALIGN {
    unBrowserHandle: HHTMLBrowser,
    pchTitle:        cstring,
    pchInitialFile:  cstring,
}

HTML_NewWindow :: struct #align CALLBACK_ALIGN {
    unBrowserHandle:                  HHTMLBrowser,
    pchURL:                           cstring,
    unX:                              uint32,
    unY:                              uint32,
    unWide:                           uint32,
    unTall:                           uint32,
    unNewWindow_BrowserHandle_IGNORE: HHTMLBrowser,
}

HTML_SetCursor :: struct #align CALLBACK_ALIGN {
    unBrowserHandle: HHTMLBrowser,
    eMouseCursor:    uint32,
}

HTML_StatusText :: struct #align CALLBACK_ALIGN {
    unBrowserHandle: HHTMLBrowser,
    pchMsg:          cstring,
}

HTML_ShowToolTip :: struct #align CALLBACK_ALIGN {
    unBrowserHandle: HHTMLBrowser,
    pchMsg:          cstring,
}

HTML_UpdateToolTip :: struct #align CALLBACK_ALIGN {
    unBrowserHandle: HHTMLBrowser,
    pchMsg:          cstring,
}

HTML_HideToolTip :: struct #align CALLBACK_ALIGN {
    unBrowserHandle: HHTMLBrowser,
}

HTML_BrowserRestarted :: struct #align CALLBACK_ALIGN {
    unBrowserHandle:    HHTMLBrowser,
    unOldBrowserHandle: HHTMLBrowser,
}

SteamInventoryResultReady :: struct #align CALLBACK_ALIGN {
    handle: SteamInventoryResult,
    result: EResult,
}

SteamInventoryFullUpdate :: struct #align CALLBACK_ALIGN {
    handle: SteamInventoryResult,
}

SteamInventoryDefinitionUpdate :: struct #align CALLBACK_ALIGN {}

SteamInventoryEligiblePromoItemDefIDs :: struct #align CALLBACK_ALIGN {
    result:                   EResult,
    steamID:                  CSteamID,
    numEligiblePromoItemDefs: c.int,
    bCachedData:              bool,
}

SteamInventoryStartPurchaseResult :: struct #align CALLBACK_ALIGN {
    result:    EResult,
    ulOrderID: uint64,
    ulTransID: uint64,
}

SteamInventoryRequestPricesResult :: struct #align CALLBACK_ALIGN {
    result:       EResult,
    rgchCurrency: [4]u8,
}

GetVideoURLResult :: struct #align CALLBACK_ALIGN {
    eResult:      EResult,
    unVideoAppID: AppId,
    rgchURL:      [256]u8,
}

GetOPFSettingsResult :: struct #align CALLBACK_ALIGN {
    eResult:      EResult,
    unVideoAppID: AppId,
}

SteamParentalSettingsChanged :: struct #align CALLBACK_ALIGN {}

SteamRemotePlaySessionConnected :: struct #align CALLBACK_ALIGN {
    unSessionID: RemotePlaySessionID,
}

SteamRemotePlaySessionDisconnected :: struct #align CALLBACK_ALIGN {
    unSessionID: RemotePlaySessionID,
}

SteamNetworkingMessagesSessionRequest :: struct #align CALLBACK_ALIGN {
    identityRemote: SteamNetworkingIdentity,
}

SteamNetworkingMessagesSessionFailed :: struct #align CALLBACK_ALIGN {
    info: SteamNetConnectionInfo,
}

SteamNetConnectionStatusChangedCallback :: struct #align CALLBACK_ALIGN {
    hConn:     HSteamNetConnection,
    info:      SteamNetConnectionInfo,
    eOldState: ESteamNetworkingConnectionState,
}

SteamNetAuthenticationStatus :: struct #align CALLBACK_ALIGN {
    eAvail:   ESteamNetworkingAvailability,
    debugMsg: [256]u8,
}

SteamRelayNetworkStatus :: struct #align CALLBACK_ALIGN {
    eAvail:                     ESteamNetworkingAvailability,
    bPingMeasurementInProgress: c.int,
    eAvailNetworkConfig:        ESteamNetworkingAvailability,
    eAvailAnyRelay:             ESteamNetworkingAvailability,
    debugMsg:                   [256]u8,
}

GSClientApprove :: struct #align CALLBACK_ALIGN {
    SteamID:      CSteamID,
    OwnerSteamID: CSteamID,
}

GSClientDeny :: struct #align CALLBACK_ALIGN {
    SteamID:          CSteamID,
    eDenyReason:      EDenyReason,
    rgchOptionalText: [128]u8,
}

GSClientKick :: struct #align CALLBACK_ALIGN {
    SteamID:     CSteamID,
    eDenyReason: EDenyReason,
}

GSClientAchievementStatus :: struct #align CALLBACK_ALIGN {
    SteamID:        uint64,
    pchAchievement: [128]u8,
    bUnlocked:      bool,
}

GSPolicyResponse :: struct #align CALLBACK_ALIGN {
    bSecure: uint8,
}

GSGameplayStats :: struct #align CALLBACK_ALIGN {
    eResult:              EResult,
    nRank:                int32,
    unTotalConnects:      uint32,
    unTotalMinutesPlayed: uint32,
}

GSClientGroupStatus :: struct #align CALLBACK_ALIGN {
    SteamIDUser:  CSteamID,
    SteamIDGroup: CSteamID,
    bMember:      bool,
    bOfficer:     bool,
}

GSReputation :: struct #align CALLBACK_ALIGN {
    eResult:           EResult,
    unReputationScore: uint32,
    bBanned:           bool,
    unBannedIP:        uint32,
    usBannedPort:      uint16,
    ulBannedGameID:    uint64,
    unBanExpires:      uint32,
}

AssociateWithClanResult :: struct #align CALLBACK_ALIGN {
    eResult: EResult,
}

ComputeNewPlayerCompatibilityResult :: struct #align CALLBACK_ALIGN {
    eResult:                           EResult,
    cPlayersThatDontLikeCandidate:     c.int,
    cPlayersThatCandidateDoesntLike:   c.int,
    cClanPlayersThatDontLikeCandidate: c.int,
    SteamIDCandidate:                  CSteamID,
}

GSStatsReceived :: struct #align CALLBACK_ALIGN {
    eResult:     EResult,
    steamIDUser: CSteamID,
}

GSStatsStored :: struct #align CALLBACK_ALIGN {
    eResult:     EResult,
    steamIDUser: CSteamID,
}

GSStatsUnloaded :: struct #align CALLBACK_ALIGN {
    steamIDUser: CSteamID,
}

SteamNetworkingFakeIPResult :: struct #align CALLBACK_ALIGN {
    eResult:  EResult,
    identity: SteamNetworkingIdentity,
    unIP:     uint32,
    unPorts:  [8]uint16,
}

// -----
// Enums
// -----

CGameID_EGameIDType :: enum {
    App      = 0,
    GameMod  = 1,
    Shortcut = 2,
    P2P      = 3,
}

ESteamIPType :: enum {
    IPv4 = 0,
    IPv6 = 1,
}

EUniverse :: enum {
    Invalid  = 0,
    Public   = 1,
    Beta     = 2,
    Internal = 3,
    Dev      = 4,
    Max      = 5,
}

EResult :: enum {
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

EVoiceResult :: enum {
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

EDenyReason :: enum {
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

EBeginAuthSessionResult :: enum {
    OK               = 0,
    InvalidTicket    = 1,
    DuplicateRequest = 2,
    InvalidVersion   = 3,
    GameMismatch     = 4,
    ExpiredTicket    = 5,
}

EAuthSessionResponse :: enum {
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

EUserHasLicenseForAppResult :: enum {
    HasLicense         = 0,
    DoesNotHaveLicense = 1,
    NoAuth             = 2,
}

EAccountType :: enum {
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

EChatEntryType :: enum {
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

EChatRoomEnterResponse :: enum {
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

EChatSteamIDInstanceFlags :: enum {
    AccountInstanceMask  = 4095,
    InstanceFlagClan     = 524288,
    InstanceFlagLobby    = 262144,
    InstanceFlagMMSLobby = 131072,
}

ENotificationPosition :: enum {
    TopLeft     = 0,
    TopRight    = 1,
    BottomLeft  = 2,
    BottomRight = 3,
}

EBroadcastUploadResult :: enum {
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

EMarketNotAllowedReasonFlags :: enum {
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

EDurationControlProgress :: enum {
    Progress_Full  = 0,
    Progress_Half  = 1,
    Progress_None  = 2,
    ExitSoon_3h    = 3,
    ExitSoon_5h    = 4,
    ExitSoon_Night = 5,
}

EDurationControlNotification :: enum {
    None           = 0,
    OneHour        = 1,
    ThreeHours     = 2,
    HalfProgress   = 3,
    NoProgress     = 4,
    ExitSoon_3h    = 5,
    ExitSoon_5h    = 6,
    ExitSoon_Night = 7,
}

EDurationControlOnlineState :: enum {
    Invalid       = 0,
    Offline       = 1,
    Online        = 2,
    OnlineHighPri = 3,
}

EGameSearchErrorCode :: enum {
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

EPlayerResult :: enum {
    FailedToConnect = 1,
    Abandoned       = 2,
    Kicked          = 3,
    Incomplete      = 4,
    Completed       = 5,
}

ESteamIPv6ConnectivityProtocol :: enum {
    Invalid = 0,
    HTTP    = 1,
    UDP     = 2,
}

ESteamIPv6ConnectivityState :: enum {
    Unknown = 0,
    Good    = 1,
    Bad     = 2,
}

EFriendRelationship :: enum {
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

EPersonaState :: enum {
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

EFriendFlags :: enum {
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

EUserRestriction :: enum {
    None        = 0,
    Unknown     = 1,
    AnyChat     = 2,
    VoiceChat   = 4,
    GroupChat   = 8,
    Rating      = 16,
    GameInvites = 32,
    Trading     = 64,
}

EOverlayToStoreFlag :: enum {
    None             = 0,
    AddToCart        = 1,
    AddToCartAndShow = 2,
}

EActivateGameOverlayToWebPageMode :: enum {
    Default = 0,
    Modal   = 1,
}

ECommunityProfileItemType :: enum {
    AnimatedAvatar        = 0,
    AvatarFrame           = 1,
    ProfileModifier       = 2,
    ProfileBackground     = 3,
    MiniProfileBackground = 4,
}

ECommunityProfileItemProperty :: enum {
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
EPersonaChange :: enum {
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

ESteamAPICallFailure :: enum {
    None               = -1,
    SteamGone          = 0,
    NetworkFailure     = 1,
    InvalidHandle      = 2,
    MismatchedCallback = 3,
}

EGamepadTextInputMode :: enum {
    Normal   = 0,
    Password = 1,
}

EGamepadTextInputLineMode :: enum {
    SingleLine    = 0,
    MultipleLines = 1,
}

EFloatingGamepadTextInputMode :: enum {
    SingleLine    = 0,
    MultipleLines = 1,
    Email         = 2,
    Numeric       = 3,
}

ETextFilteringContext :: enum {
    Unknown     = 0,
    GameContent = 1,
    Chat        = 2,
    Name        = 3,
}

ECheckFileSignature :: enum {
    InvalidSignature             = 0,
    ValidSignature               = 1,
    FileNotFound                 = 2,
    NoSignaturesFoundForThisApp  = 3,
    NoSignaturesFoundForThisFile = 4,
}

EMatchMakingServerResponse :: enum {
    ServerResponded               = 0,
    ServerFailedToRespond         = 1,
    NoServersListedOnMasterServer = 2,
}

ELobbyType :: enum {
    Private       = 0,
    FriendsOnly   = 1,
    Public        = 2,
    Invisible     = 3,
    PrivateUnique = 4,
}

ELobbyComparison :: enum {
    EqualToOrLessThan    = -2,
    LessThan             = -1,
    Equal                = 0,
    GreaterThan          = 1,
    EqualToOrGreaterThan = 2,
    NotEqual             = 3,
}

ELobbyDistanceFilter :: enum {
    Close     = 0,
    Default   = 1,
    Far       = 2,
    Worldwide = 3,
}

EChatMemberStateChange :: enum {
    Entered      = 1,
    Left         = 2,
    Disconnected = 4,
    Kicked       = 8,
    Banned       = 16,
}

ESteamPartyBeaconLocationType :: enum {
    Invalid   = 0,
    ChatGroup = 1,
    Max       = 2,
}

ESteamPartyBeaconLocationData :: enum {
    Invalid       = 0,
    Name          = 1,
    IconURLSmall  = 2,
    IconURLMedium = 3,
    IconURLLarge  = 4,
}

ERemoteStoragePlatform :: enum {
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

ERemoteStoragePublishedFileVisibility :: enum {
    Public      = 0,
    FriendsOnly = 1,
    Private     = 2,
    Unlisted    = 3,
}

EWorkshopFileType :: enum {
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

EWorkshopVote :: enum {
    Unvoted = 0,
    For     = 1,
    Against = 2,
    Later   = 3,
}

EWorkshopFileAction :: enum {
    Played    = 0,
    Completed = 1,
}

EWorkshopEnumerationType :: enum {
    RankedByVote            = 0,
    Recent                  = 1,
    Trending                = 2,
    FavoritesOfFriends      = 3,
    VotedByFriends          = 4,
    ContentByFriends        = 5,
    RecentFromFollowedUsers = 6,
}

EWorkshopVideoProvider :: enum {
    None    = 0,
    Youtube = 1,
}

EUGCReadAction :: enum {
    ContinueReadingUntilFinished = 0,
    ContinueReading              = 1,
    Close                        = 2,
}

ERemoteStorageLocalFileChange :: enum {
    Invalid     = 0,
    FileUpdated = 1,
    FileDeleted = 2,
}

ERemoteStorageFilePathType :: enum {
    Invalid     = 0,
    Absolute    = 1,
    APIFilename = 2,
}

ELeaderboardDataRequest :: enum {
    Global           = 0,
    GlobalAroundUser = 1,
    Friends          = 2,
    Users            = 3,
}

ELeaderboardSortMethod :: enum {
    MethodNone       = 0,
    MethodAscending  = 1,
    MethodDescending = 2,
}

ELeaderboardDisplayType :: enum {
    None             = 0,
    Numeric          = 1,
    TimeSeconds      = 2,
    TimeMilliSeconds = 3,
}

ELeaderboardUploadScoreMethod :: enum {
    None        = 0,
    KeepBest    = 1,
    ForceUpdate = 2,
}

ERegisterActivationCodeResult :: enum {
    OK                = 0,
    Fail              = 1,
    AlreadyRegistered = 2,
    Timeout           = 3,
    AlreadyOwned      = 4,
}

EP2PSessionError :: enum {
    None                           = 0,
    NoRightsToApp                  = 2,
    Timeout                        = 4,
    NotRunningApp_DELETED          = 1,
    DestinationNotLoggedIn_DELETED = 3,
    Max                            = 5,
}

EP2PSend :: enum {
    Unreliable            = 0,
    UnreliableNoDelay     = 1,
    Reliable              = 2,
    ReliableWithBuffering = 3,
}

ESNetSocketState :: enum {
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

ESNetSocketConnectionType :: enum {
    NotConnected = 0,
    UDP          = 1,
    UDPRelay     = 2,
}

EVRScreenshotType :: enum {
    None           = 0,
    Mono           = 1,
    Stereo         = 2,
    MonoCubemap    = 3,
    MonoPanorama   = 4,
    StereoPanorama = 5,
}

AudioPlaybacStatus :: enum {
    Undefined = 0,
    Playing   = 1,
    Paused    = 2,
    Idle      = 3,
}

EHTTPMethod :: enum {
    Invalid = 0,
    GET     = 1,
    HEAD    = 2,
    POST    = 3,
    PUT     = 4,
    DELETE  = 5,
    OPTIONS = 6,
    PATCH   = 7,
}

EHTTPStatusCode :: enum {
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

EInputSourceMode :: enum {
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

EInputActionOrigin :: enum {
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

EXboxOrigin :: enum {
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

ESteamControllerPad :: enum {
    Left  = 0,
    Right = 1,
}

EControllerHapticLocation :: enum {
    Left  = 1,
    Right = 2,
    Both  = 3,
}

EControllerHapticType :: enum {
    Off   = 0,
    Tick  = 1,
    Click = 2,
}

ESteamInputType :: enum {
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

ESteamInputConfigurationEnableType :: enum {
    None        = 0,
    Playstation = 1,
    Xbox        = 2,
    Generic     = 4,
    Switch      = 8,
}

ESteamInputLEDFlag :: enum {
    SetColor           = 0,
    RestoreUserDefault = 1,
}

ESteamInputGlyphSize :: enum {
    Small  = 0,
    Medium = 1,
    Large  = 2,
    Count  = 3,
}

ESteamInputGlyphStyle :: enum {
    Knockout         = 0,
    Light            = 1,
    Dark             = 2,
    NeutralColorABXY = 16,
    SolidABXY        = 32,
}

ESteamInputActionEventType :: enum {
    DigitalAction = 0,
    AnalogAction  = 1,
}

EControllerActionOrigin :: enum {
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

ESteamControllerLEDFlag :: enum {
    SetColor           = 0,
    RestoreUserDefault = 1,
}

EUGCMatchingUGCType :: enum {
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

EUserUGCList :: enum {
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

EUserUGCListSortOrder :: enum {
    CreationOrderDesc    = 0,
    CreationOrderAsc     = 1,
    TitleAsc             = 2,
    LastUpdatedDesc      = 3,
    SubscriptionDateDesc = 4,
    VoteScoreDesc        = 5,
    ForModeration        = 6,
}

EUGCQuery :: enum {
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

EItemUpdateStatus :: enum {
    Invalid              = 0,
    PreparingConfig      = 1,
    PreparingContent     = 2,
    UploadingContent     = 3,
    UploadingPreviewFile = 4,
    CommittingChanges    = 5,
}

EItemState :: enum {
    None            = 0,
    Subscribed      = 1,
    LegacyItem      = 2,
    Installed       = 4,
    NeedsUpdate     = 8,
    Downloading     = 16,
    DownloadPending = 32,
}

EItemStatistic :: enum {
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

EItemPreviewType :: enum {
    Image                          = 0,
    YouTubeVideo                   = 1,
    Sketchfab                      = 2,
    EnvironmentMap_HorizontalCross = 3,
    EnvironmentMap_LatLong         = 4,
    ReservedMax                    = 255,
}

ESteamItemFlags :: enum {
    NoTrade  = 1,
    Removed  = 256,
    Consumed = 512,
}

EParentalFeature :: enum {
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

ESteamDeviceFormFactor :: enum {
    Unknown  = 0,
    Phone    = 1,
    Tablet   = 2,
    Computer = 3,
    TV       = 4,
}

ESteamNetworkingAvailability :: enum {
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

ESteamNetworkingIdentityType :: enum {
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

ESteamNetworkingFakeIPType :: enum {
    Invalid     = 0,
    NotFake     = 1,
    GlobalIPv4  = 2,
    LocalIPv4   = 3,
    _Force32Bit = 2147483647,
}

ESteamNetworkingConnectionState :: enum {
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

ESteamNetConnectionEnd :: enum {
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

ESteamNetworkingConfigScope :: enum {
    Global           = 1,
    SocketsInterface = 2,
    ListenSocket     = 3,
    Connection       = 4,
    _Force32Bit      = 2147483647,
}

ESteamNetworkingConfigDataType :: enum {
    Int32       = 1,
    Int64       = 2,
    Float       = 3,
    String      = 4,
    Ptr         = 5,
    _Force32Bit = 2147483647,
}

ESteamNetworkingConfigValue :: enum {
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

ESteamNetworkingGetConfigValueResult :: enum {
    BadValue           = -1,
    BadScopeObj        = -2,
    BufferTooSmall     = -3,
    OK                 = 1,
    OKInherited        = 2,
    Result__Force32Bit = 2147483647,
}

ESteamNetworkingSocketsDebugOutputType :: enum {
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

EServerMode :: enum {
    Invalid                 = 0,
    NoAuthentication        = 1,
    Authentication          = 2,
    AuthenticationAndSecure = 3,
}

IHTMLSurface_EHTMLMouseButton :: enum {
    Left   = 0,
    Right  = 1,
    Middle = 2,
}

IHTMLSurface_EMouseCursor :: enum {
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

IHTMLSurface_EHTMLKeyModifiers :: enum {
    None      = 0,
    AltDown   = 1,
    CtrlDown  = 2,
    ShiftDown = 4,
}

SteamIPAddress :: struct #align CALLBACK_ALIGN {
    rgubIPv6: [16]uint8,
    eType:    ESteamIPType,
}

FriendGameInfo :: struct #align CALLBACK_ALIGN {
    gameID:       CGameID,
    unGameIP:     uint32,
    usGamePort:   uint16,
    usQueryPort:  uint16,
    steamIDLobby: CSteamID,
}

MatchMakingKeyValuePair :: struct #align CALLBACK_ALIGN {
    szKey:   [256]u8,
    szValue: [256]u8,
}

servernetadr :: struct #align CALLBACK_ALIGN {
    usConnectionPort: uint16,
    usQueryPort:      uint16,
    unIP:             uint32,
}

gameserveritet :: struct #align CALLBACK_ALIGN {
    NetAdr:                 servernetadr,
    nPing:                  c.int,
    bHadSuccessfulResponse: bool,
    bDoNotRefresh:          bool,
    szGameDir:              [32]u8,
    szMap:                  [32]u8,
    szGameDescription:      [64]u8,
    nAppID:                 uint32,
    nPlayers:               c.int,
    nMaxPlayers:            c.int,
    nBotPlayers:            c.int,
    bPassword:              bool,
    bSecure:                bool,
    ulTimeLastPlayed:       uint32,
    nServerVersion:         c.int,
    szServerName:           [64]u8,
    szGameTags:             [128]u8,
    steamID:                CSteamID,
}

SteamPartyBeaconLocation :: struct #align CALLBACK_ALIGN {
    eType:        ESteamPartyBeaconLocationType,
    ulLocationID: uint64,
}

SteamParamStringArray :: struct #align CALLBACK_ALIGN {
    ppStrings:   ^cstring,
    nNumStrings: int32,
}

LeaderboardEntry :: struct #align CALLBACK_ALIGN {
    steamIDUser: CSteamID,
    nGlobalRank: int32,
    nScore:      int32,
    cDetails:    int32,
    hUGC:        UGCHandle,
}

P2PSessionState :: struct #align CALLBACK_ALIGN {
    bConnectionActive:     uint8,
    bConnecting:           uint8,
    eP2PSessionError:      uint8,
    bUsingRelay:           uint8,
    nBytesQueuedForSend:   int32,
    nPacketsQueuedForSend: int32,
    nRemoteIP:             uint32,
    nRemotePort:           uint16,
}

InputAnalogActionData :: struct #align CALLBACK_ALIGN {
    eMode:   EInputSourceMode,
    x:       f32,
    y:       f32,
    bActive: bool,
}

InputDigitalActionData :: struct #align CALLBACK_ALIGN {
    bState:  bool,
    bActive: bool,
}

InputMotionData :: struct #align CALLBACK_ALIGN {
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

SteamUGCDetails :: struct #align CALLBACK_ALIGN {
    nPublishedFileId:     PublishedFileId,
    eResult:              EResult,
    eFileType:            EWorkshopFileType,
    nCreatorAppID:        AppId,
    nConsumerAppID:       AppId,
    rgchTitle:            [129]u8,
    rgchDescription:      [8000]u8,
    ulSteamIDOwner:       uint64,
    rtimeCreated:         uint32,
    rtimeUpdated:         uint32,
    rtimeAddedToUserList: uint32,
    eVisibility:          ERemoteStoragePublishedFileVisibility,
    bBanned:              bool,
    bAcceptedForUse:      bool,
    bTagsTruncated:       bool,
    rgchTags:             [1025]u8,
    hFile:                UGCHandle,
    hPreviewFile:         UGCHandle,
    pchFileName:          [260]u8,
    nFileSize:            int32,
    nPreviewFileSize:     int32,
    rgchURL:              [256]u8,
    unVotesUp:            uint32,
    unVotesDown:          uint32,
    flScore:              f32,
    unNumChildren:        uint32,
}

SteamItemDetails :: struct #align CALLBACK_ALIGN {
    itemId:      SteamItemInstanceID,
    iDefinition: SteamItemDef,
    unQuantity:  uint16,
    unFlags:     uint16,
}

SteamNetworkingIPAddr :: struct #align CALLBACK_ALIGN {
    ipv6: [16]uint8,
    port: uint16,
}

SteamNetworkingIdentity :: struct #align CALLBACK_ALIGN {
    eType:              ESteamNetworkingIdentityType,
    cbSize:             c.int,
    szUnknownRawString: [128]u8,
}

SteamNetConnectionInfo :: struct #align CALLBACK_ALIGN {
    identityRemote:          SteamNetworkingIdentity,
    nUserData:               int64,
    hListenSocket:           HSteamListenSocket,
    addrRemote:              SteamNetworkingIPAddr,
    _pad1:                   uint16,
    idPOPRemote:             SteamNetworkingPOPID,
    idPOPRelay:              SteamNetworkingPOPID,
    eState:                  ESteamNetworkingConnectionState,
    eEndReason:              c.int,
    szEndDebug:              [128]u8,
    szConnectionDescription: [128]u8,
    nFlags:                  c.int,
    reserved:                [63]uint32,
}

SteamNetConnectionRealTimeStatus :: struct #align CALLBACK_ALIGN {
    eState:                    ESteamNetworkingConnectionState,
    nPing:                     c.int,
    flConnectionQualityLocal:  f32,
    flConnectionQualityRemote: f32,
    flOutPacketsPerSec:        f32,
    flOutBytesPerSec:          f32,
    flInPacketsPerSec:         f32,
    flInBytesPerSec:           f32,
    nSendRateBytesPerSecond:   c.int,
    cbPendingUnreliable:       c.int,
    cbPendingReliable:         c.int,
    cbSentUnackedReliable:     c.int,
    usecQueueTime:             SteamNetworkingMicroseconds,
    reserved:                  [16]uint32,
}

SteamNetConnectionRealTimeLaneStatus :: struct #align CALLBACK_ALIGN {
    cbPendingUnreliable:   c.int,
    cbPendingReliable:     c.int,
    cbSentUnackedReliable: c.int,
    _reservePad1:          c.int,
    usecQueueTime:         SteamNetworkingMicroseconds,
    reserved:              [10]uint32,
}

SteamNetworkPingLocation :: struct #align CALLBACK_ALIGN {
    data: [512]uint8,
}

SteamNetworkingConfigValue :: struct #align CALLBACK_ALIGN {
    eValue:    ESteamNetworkingConfigValue,
    eDataType: ESteamNetworkingConfigDataType,
    int64:     int64,
}

SteamDatagramHostedAddress :: struct #align CALLBACK_ALIGN {
    cbSize: c.int,
    data:   [128]u8,
}

SteamDatagramGameCoordinatorServerLogin :: struct #align CALLBACK_ALIGN {
    identity:  SteamNetworkingIdentity,
    routing:   SteamDatagramHostedAddress,
    nAppID:    AppId,
    rtime:     RTime32,
    cbAppData: c.int,
    appData:   [2048]u8,
}

SteamAPIWarningMessageHook :: proc "c" (_: c.int, _: cstring)

// ----------------
// Accessor Aliases
// ----------------

Client :: SteamClient
User: proc "c" () -> ^IUser : SteamUser_v023
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
UGC: proc "c" () -> ^IUGC : SteamUGC_v017
AppList: proc "c" () -> ^IAppList : SteamAppList_v001
HTMLSurface: proc "c" () -> ^IHTMLSurface : SteamHTMLSurface_v005
Inventory: proc "c" () -> ^IInventory : SteamInventory_v003
Video: proc "c" () -> ^IVideo : SteamVideo_v002
ParentalSettings: proc "c" () -> ^IParentalSettings : SteamParentalSettings_v001
RemotePlay: proc "c" () -> ^IRemotePlay : SteamRemotePlay_v001
NetworkingMessages_SteamAPI: proc "c" () -> ^INetworkingMessages : SteamNetworkingMessages_SteamAPI_v002
NetworkingSockets_SteamAPI: proc "c" () -> ^INetworkingSockets : SteamNetworkingSockets_SteamAPI_v012

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

    // sets whether or not SteaRunCallbacks() should do a try {} catch (...) {} around calls to issuing callbacks
    // This is ignored if you are using the manual callback dispatch method
    bTryCatchCallbacks :: proc "c" () ---

    // exists only for backwards compat with code written against older SDKs
    InitSafe :: proc "c" () -> bool ---

    // this should be called before the game initialized the steam APIs
    // pchDate should be of the format "Mmm dd yyyy" (such as from the __ DATE __ macro )
    // pchTime should be of the format "hh:mm:ss" (such as from the __ TIME __ macro )
    // bFullMemoryDumps (Win32 only) -- writes out a uuid-full.dmp in the client/dumps folder
    // pvContext-- can be NULL, will be the void * context passed into pfnPreMinidumpCallback
    // PFNPreMinidumpCallback pfnPreMinidumpCallback   -- optional callback which occurs just before a .dmp file is written during a crash.  Applications can hook this to allow adding additional information into the .dmp comment stream.
    UseBreakpadCrashHandler :: proc "c" (pchVersion: cstring, pchDate: cstring, pchTime: cstring, bFullMemoryDumps: bool, pvContext: rawptr, pfnPreMinidumpCallback: PFNPreMinidumpCallback) ---
    SetBreakpadAppID :: proc "c" (unAppID: uint32) ---


    /// Inform the API that you wish to use manual event dispatch.  This must be called after SteamAPI_Init, but before
    /// you use any of the other manual dispatch functions below.
    ManualDispatch_Init :: proc "c" () ---

    /// Perform certain periodic actions that need to be performed.
    ManualDispatch_RunFrame :: proc "c" (hSteamPipe: HSteamPipe) ---

    /// Fetch the next pending callback on the given pipe, if any.  If a callback is available, true is returned
    /// and the structure is populated.  In this case, you MUST call SteamAPI_ManualDispatch_FreeLastCallback
    /// (after dispatching the callback) before calling SteamAPI_ManualDispatch_GetNextCallback again.
    ManualDispatch_GetNextCallback :: proc "c" (hSteamPipe: HSteamPipe, pCallbackMsg: ^CallbackMsg) -> bool ---

    /// You must call this after dispatching the callback, if SteamAPI_ManualDispatch_GetNextCallback returns true.
    ManualDispatch_FreeLastCallback :: proc "c" (hSteamPipe: HSteamPipe) ---

    /// Return the call result for the specified call on the specified pipe.  You really should
    /// only call this in a handler for SteamAPICallCompletedcallback.
    ManualDispatch_GetAPICallResult :: proc "c" (hSteamPipe: HSteamPipe, hSteamAPICall: SteamAPICall, pCallback: rawptr, cubCallback: c.int, iCallbackExpected: c.int, pbFailed: ^bool) -> bool ---


    GetHSteamPipe :: proc "c" () -> HSteamPipe ---
}

// -------------------------------------------
// Versioned accessors
// -------------------------------------------

@(link_prefix = "SteamAPI_", default_calling_convention = "c")
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
    SteamUGC_v017 :: proc() -> ^IUGC ---
    SteamAppList_v001 :: proc() -> ^IAppList ---
    SteamHTMLSurface_v005 :: proc() -> ^IHTMLSurface ---
    SteamInventory_v003 :: proc() -> ^IInventory ---
    SteamVideo_v002 :: proc() -> ^IVideo ---
    SteamParentalSettings_v001 :: proc() -> ^IParentalSettings ---
    SteamRemotePlay_v001 :: proc() -> ^IRemotePlay ---
    SteamNetworkingMessages_SteamAPI_v002 :: proc() -> ^INetworkingMessages ---
    SteamNetworkingSockets_SteamAPI_v012 :: proc() -> ^INetworkingSockets ---
}

// -------------------------------------------
// Interfaces
// -------------------------------------------

@(link_prefix = "SteamAPI_ISteam", default_calling_convention = "c")
foreign lib {
    Client_CreateSteamPipe :: proc(self: ^IClient) -> HSteamPipe ---
    Client_BReleaseSteamPipe :: proc(self: ^IClient, hSteamPipe: HSteamPipe) -> bool ---
    Client_ConnectToGlobalUser :: proc(self: ^IClient, hSteamPipe: HSteamPipe) -> HSteamUser ---
    Client_CreateLocalUser :: proc(self: ^IClient, phSteamPipe: ^HSteamPipe, eAccountType: EAccountType) -> HSteamUser ---
    Client_ReleaseUser :: proc(self: ^IClient, hSteamPipe: HSteamPipe, hUser: HSteamUser) ---
    Client_GetIUser :: proc(self: ^IClient, hSteamUser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: cstring) -> ^IUser ---
    Client_GetIGameServer :: proc(self: ^IClient, hSteamUser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: cstring) -> ^IGameServer ---
    Client_SetLocalIPBinding :: proc(self: ^IClient, unIP: ^SteamIPAddress, usPort: uint16) ---
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
    Client_SetWarningMessageHook :: proc(self: ^IClient, pFunction: SteamAPIWarningMessageHook) ---
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
    User_GetAuthSessionTicket :: proc(self: ^IUser, pTicket: rawptr, cbMaxTicket: c.int, pcbTicket: ^uint32, #by_ptr pSteamNetworkingIdentity: SteamNetworkingIdentity) -> HAuthTicket ---
    User_BeginAuthSession :: proc(self: ^IUser, pAuthTicket: rawptr, cbAuthTicket: c.int, steamID: CSteamID) -> EBeginAuthSessionResult ---
    User_EndAuthSession :: proc(self: ^IUser, steamID: CSteamID) ---
    User_CancelAuthTicket :: proc(self: ^IUser, hAuthTicket: HAuthTicket) ---
    User_UserHasLicenseForApp :: proc(self: ^IUser, steamID: CSteamID, appID: AppId) -> EUserHasLicenseForAppResult ---
    User_BIsBehindNAT :: proc(self: ^IUser) -> bool ---
    User_AdvertiseGame :: proc(self: ^IUser, steamIDGameServer: CSteamID, unIPServer: uint32, usPortServer: uint16) ---
    User_RequestEncryptedAppTicket :: proc(self: ^IUser, pDataToInclude: rawptr, cbDataToInclude: c.int) -> SteamAPICall ---
    User_GetEncryptedAppTicket :: proc(self: ^IUser, pTicket: rawptr, cbMaxTicket: c.int, pcbTicket: ^uint32) -> bool ---
    User_GetGameBadgeLevel :: proc(self: ^IUser, nSeries: c.int, bFoil: bool) -> c.int ---
    User_GetPlayerSteamLevel :: proc(self: ^IUser) -> c.int ---
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
    Friends_GetFriendCount :: proc(self: ^IFriends, iFriendFlags: c.int) -> c.int ---
    Friends_GetFriendByIndex :: proc(self: ^IFriends, iFriend: c.int, iFriendFlags: c.int) -> CSteamID ---
    Friends_GetFriendRelationship :: proc(self: ^IFriends, steamIDFriend: CSteamID) -> EFriendRelationship ---
    Friends_GetFriendPersonaState :: proc(self: ^IFriends, steamIDFriend: CSteamID) -> EPersonaState ---
    Friends_GetFriendPersonaName :: proc(self: ^IFriends, steamIDFriend: CSteamID) -> cstring ---
    Friends_GetFriendGamePlayed :: proc(self: ^IFriends, steamIDFriend: CSteamID, pFriendGameInfo: ^FriendGameInfo) -> bool ---
    Friends_GetFriendPersonaNameHistory :: proc(self: ^IFriends, steamIDFriend: CSteamID, iPersonaName: c.int) -> cstring ---
    Friends_GetFriendSteamLevel :: proc(self: ^IFriends, steamIDFriend: CSteamID) -> c.int ---
    Friends_GetPlayerNickname :: proc(self: ^IFriends, steamIDPlayer: CSteamID) -> cstring ---
    Friends_GetFriendsGroupCount :: proc(self: ^IFriends) -> c.int ---
    Friends_GetFriendsGroupIDByIndex :: proc(self: ^IFriends, iFG: c.int) -> FriendsGroupID ---
    Friends_GetFriendsGroupName :: proc(self: ^IFriends, friendsGroupID: FriendsGroupID) -> cstring ---
    Friends_GetFriendsGroupMembersCount :: proc(self: ^IFriends, friendsGroupID: FriendsGroupID) -> c.int ---
    Friends_GetFriendsGroupMembersList :: proc(self: ^IFriends, friendsGroupID: FriendsGroupID, pOutSteamIDMembers: ^CSteamID, nMembersCount: c.int) ---
    Friends_HasFriend :: proc(self: ^IFriends, steamIDFriend: CSteamID, iFriendFlags: c.int) -> bool ---
    Friends_GetClanCount :: proc(self: ^IFriends) -> c.int ---
    Friends_GetClanByIndex :: proc(self: ^IFriends, iClan: c.int) -> CSteamID ---
    Friends_GetClanName :: proc(self: ^IFriends, steamIDClan: CSteamID) -> cstring ---
    Friends_GetClanTag :: proc(self: ^IFriends, steamIDClan: CSteamID) -> cstring ---
    Friends_GetClanActivityCounts :: proc(self: ^IFriends, steamIDClan: CSteamID, pnOnline: ^int, pnInGame: ^int, pnChatting: ^int) -> bool ---
    Friends_DownloadClanActivityCounts :: proc(self: ^IFriends, psteamIDClans: ^CSteamID, cClansToRequest: c.int) -> SteamAPICall ---
    Friends_GetFriendCountFromSource :: proc(self: ^IFriends, steamIDSource: CSteamID) -> c.int ---
    Friends_GetFriendFromSourceByIndex :: proc(self: ^IFriends, steamIDSource: CSteamID, iFriend: c.int) -> CSteamID ---
    Friends_IsUserInSource :: proc(self: ^IFriends, steamIDUser: CSteamID, steamIDSource: CSteamID) -> bool ---
    Friends_SetInGameVoiceSpeaking :: proc(self: ^IFriends, steamIDUser: CSteamID, bSpeaking: bool) ---
    Friends_ActivateGameOverlay :: proc(self: ^IFriends, pchDialog: cstring) ---
    Friends_ActivateGameOverlayToUser :: proc(self: ^IFriends, pchDialog: cstring, steamID: CSteamID) ---
    Friends_ActivateGameOverlayToWebPage :: proc(self: ^IFriends, pchURL: cstring, eMode: EActivateGameOverlayToWebPageMode) ---
    Friends_ActivateGameOverlayToStore :: proc(self: ^IFriends, nAppID: AppId, eFlag: EOverlayToStoreFlag) ---
    Friends_SetPlayedWith :: proc(self: ^IFriends, steamIDUserPlayedWith: CSteamID) ---
    Friends_ActivateGameOverlayInviteDialog :: proc(self: ^IFriends, steamIDLobby: CSteamID) ---
    Friends_GetSmallFriendAvatar :: proc(self: ^IFriends, steamIDFriend: CSteamID) -> c.int ---
    Friends_GetMediumFriendAvatar :: proc(self: ^IFriends, steamIDFriend: CSteamID) -> c.int ---
    Friends_GetLargeFriendAvatar :: proc(self: ^IFriends, steamIDFriend: CSteamID) -> c.int ---
    Friends_RequestUserInformation :: proc(self: ^IFriends, steamIDUser: CSteamID, bRequireNameOnly: bool) -> bool ---
    Friends_RequestClanOfficerList :: proc(self: ^IFriends, steamIDClan: CSteamID) -> SteamAPICall ---
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
    Friends_GetFriendCoplayGame :: proc(self: ^IFriends, steamIDFriend: CSteamID) -> AppId ---
    Friends_JoinClanChatRoom :: proc(self: ^IFriends, steamIDClan: CSteamID) -> SteamAPICall ---
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
    Friends_GetFollowerCount :: proc(self: ^IFriends, steamID: CSteamID) -> SteamAPICall ---
    Friends_IsFollowing :: proc(self: ^IFriends, steamID: CSteamID) -> SteamAPICall ---
    Friends_EnumerateFollowingList :: proc(self: ^IFriends, unStartIndex: uint32) -> SteamAPICall ---
    Friends_IsClanPublic :: proc(self: ^IFriends, steamIDClan: CSteamID) -> bool ---
    Friends_IsClanOfficialGameGroup :: proc(self: ^IFriends, steamIDClan: CSteamID) -> bool ---
    Friends_GetNumChatsWithUnreadPriorityMessages :: proc(self: ^IFriends) -> c.int ---
    Friends_ActivateGameOverlayRemotePlayTogetherInviteDialog :: proc(self: ^IFriends, steamIDLobby: CSteamID) ---
    Friends_RegisterProtocolInOverlayBrowser :: proc(self: ^IFriends, pchProtocol: cstring) -> bool ---
    Friends_ActivateGameOverlayInviteDialogConnectString :: proc(self: ^IFriends, pchConnectString: cstring) ---
    Friends_RequestEquippedProfileItems :: proc(self: ^IFriends, steamID: CSteamID) -> SteamAPICall ---
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
    Utils_IsAPICallCompleted :: proc(self: ^IUtils, hSteamAPICall: SteamAPICall, pbFailed: ^bool) -> bool ---
    Utils_GetAPICallFailureReason :: proc(self: ^IUtils, hSteamAPICall: SteamAPICall) -> ESteamAPICallFailure ---
    Utils_GetAPICallResult :: proc(self: ^IUtils, hSteamAPICall: SteamAPICall, pCallback: rawptr, cubCallback: c.int, iCallbackExpected: c.int, pbFailed: ^bool) -> bool ---
    Utils_GetIPCCallCount :: proc(self: ^IUtils) -> uint32 ---
    Utils_SetWarningMessageHook :: proc(self: ^IUtils, pFunction: SteamAPIWarningMessageHook) ---
    Utils_IsOverlayEnabled :: proc(self: ^IUtils) -> bool ---
    Utils_BOverlayNeedsPresent :: proc(self: ^IUtils) -> bool ---
    Utils_CheckFileSignature :: proc(self: ^IUtils, szFileName: cstring) -> SteamAPICall ---
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
    Utils_ShowFloatingGamepadTextInput :: proc(self: ^IUtils, eKeyboardMode: EFloatingGamepadTextInputMode, nTextFieldXPosition: c.int, nTextFieldYPosition: c.int, nTextFieldWidth: c.int, nTextFieldHeight: c.int) -> bool ---
    Utils_SetGameLauncherMode :: proc(self: ^IUtils, bLauncherMode: bool) ---
    Utils_DismissFloatingGamepadTextInput :: proc(self: ^IUtils) -> bool ---

    Matchmaking_GetFavoriteGameCount :: proc(self: ^IMatchmaking) -> c.int ---
    Matchmaking_GetFavoriteGame :: proc(self: ^IMatchmaking, iGame: c.int, pnAppID: ^AppId, pnIP: ^uint32, pnConnPort: ^uint16, pnQueryPort: ^uint16, punFlags: ^uint32, pRTime32LastPlayedOnServer: ^uint32) -> bool ---
    Matchmaking_AddFavoriteGame :: proc(self: ^IMatchmaking, nAppID: AppId, nIP: uint32, nConnPort: uint16, nQueryPort: uint16, unFlags: uint32, rTime32LastPlayedOnServer: uint32) -> c.int ---
    Matchmaking_RemoveFavoriteGame :: proc(self: ^IMatchmaking, nAppID: AppId, nIP: uint32, nConnPort: uint16, nQueryPort: uint16, unFlags: uint32) -> bool ---
    Matchmaking_RequestLobbyList :: proc(self: ^IMatchmaking) -> SteamAPICall ---
    Matchmaking_AddRequestLobbyListStringFilter :: proc(self: ^IMatchmaking, pchKeyToMatch: cstring, pchValueToMatch: cstring, eComparisonType: ELobbyComparison) ---
    Matchmaking_AddRequestLobbyListNumericalFilter :: proc(self: ^IMatchmaking, pchKeyToMatch: cstring, nValueToMatch: c.int, eComparisonType: ELobbyComparison) ---
    Matchmaking_AddRequestLobbyListNearValueFilter :: proc(self: ^IMatchmaking, pchKeyToMatch: cstring, nValueToBeCloseTo: c.int) ---
    Matchmaking_AddRequestLobbyListFilterSlotsAvailable :: proc(self: ^IMatchmaking, nSlotsAvailable: c.int) ---
    Matchmaking_AddRequestLobbyListDistanceFilter :: proc(self: ^IMatchmaking, eLobbyDistanceFilter: ELobbyDistanceFilter) ---
    Matchmaking_AddRequestLobbyListResultCountFilter :: proc(self: ^IMatchmaking, cMaxResults: c.int) ---
    Matchmaking_AddRequestLobbyListCompatibleMembersFilter :: proc(self: ^IMatchmaking, steamIDLobby: CSteamID) ---
    Matchmaking_GetLobbyByIndex :: proc(self: ^IMatchmaking, iLobby: c.int) -> CSteamID ---
    Matchmaking_CreateLobby :: proc(self: ^IMatchmaking, eLobbyType: ELobbyType, cMaxMembers: c.int) -> SteamAPICall ---
    Matchmaking_JoinLobby :: proc(self: ^IMatchmaking, steamIDLobby: CSteamID) -> SteamAPICall ---
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

    MatchmakingPingResponse_ServerResponded :: proc(self: ^IMatchmakingPingResponse, server: ^gameserveritet) ---
    MatchmakingPingResponse_ServerFailedToRespond :: proc(self: ^IMatchmakingPingResponse) ---

    MatchmakingPlayersResponse_AddPlayerToList :: proc(self: ^IMatchmakingPlayersResponse, pchName: cstring, nScore: c.int, flTimePlayed: f32) ---
    MatchmakingPlayersResponse_PlayersFailedToRespond :: proc(self: ^IMatchmakingPlayersResponse) ---
    MatchmakingPlayersResponse_PlayersRefreshComplete :: proc(self: ^IMatchmakingPlayersResponse) ---

    MatchmakingRulesResponse_RulesResponded :: proc(self: ^IMatchmakingRulesResponse, pchRule: cstring, pchValue: cstring) ---
    MatchmakingRulesResponse_RulesFailedToRespond :: proc(self: ^IMatchmakingRulesResponse) ---
    MatchmakingRulesResponse_RulesRefreshComplete :: proc(self: ^IMatchmakingRulesResponse) ---

    MatchmakingServers_RequestInternetServerList :: proc(self: ^IMatchmakingServers, iApp: AppId, ppchFilters: ^^MatchMakingKeyValuePair, nFilters: uint32, pRequestServersResponse: ^IMatchmakingServerListResponse) -> HServerListRequest ---
    MatchmakingServers_RequestLANServerList :: proc(self: ^IMatchmakingServers, iApp: AppId, pRequestServersResponse: ^IMatchmakingServerListResponse) -> HServerListRequest ---
    MatchmakingServers_RequestFriendsServerList :: proc(self: ^IMatchmakingServers, iApp: AppId, ppchFilters: ^^MatchMakingKeyValuePair, nFilters: uint32, pRequestServersResponse: ^IMatchmakingServerListResponse) -> HServerListRequest ---
    MatchmakingServers_RequestFavoritesServerList :: proc(self: ^IMatchmakingServers, iApp: AppId, ppchFilters: ^^MatchMakingKeyValuePair, nFilters: uint32, pRequestServersResponse: ^IMatchmakingServerListResponse) -> HServerListRequest ---
    MatchmakingServers_RequestHistoryServerList :: proc(self: ^IMatchmakingServers, iApp: AppId, ppchFilters: ^^MatchMakingKeyValuePair, nFilters: uint32, pRequestServersResponse: ^IMatchmakingServerListResponse) -> HServerListRequest ---
    MatchmakingServers_RequestSpectatorServerList :: proc(self: ^IMatchmakingServers, iApp: AppId, ppchFilters: ^^MatchMakingKeyValuePair, nFilters: uint32, pRequestServersResponse: ^IMatchmakingServerListResponse) -> HServerListRequest ---
    MatchmakingServers_ReleaseRequest :: proc(self: ^IMatchmakingServers, hServerListRequest: HServerListRequest) ---
    MatchmakingServers_GetServerDetails :: proc(self: ^IMatchmakingServers, hRequest: HServerListRequest, iServer: c.int) -> ^gameserveritet ---
    MatchmakingServers_CancelQuery :: proc(self: ^IMatchmakingServers, hRequest: HServerListRequest) ---
    MatchmakingServers_RefreshQuery :: proc(self: ^IMatchmakingServers, hRequest: HServerListRequest) ---
    MatchmakingServers_IsRefreshing :: proc(self: ^IMatchmakingServers, hRequest: HServerListRequest) -> bool ---
    MatchmakingServers_GetServerCount :: proc(self: ^IMatchmakingServers, hRequest: HServerListRequest) -> c.int ---
    MatchmakingServers_RefreshServer :: proc(self: ^IMatchmakingServers, hRequest: HServerListRequest, iServer: c.int) ---
    MatchmakingServers_PingServer :: proc(self: ^IMatchmakingServers, unIP: uint32, usPort: uint16, pRequestServersResponse: ^IMatchmakingPingResponse) -> HServerQuery ---
    MatchmakingServers_PlayerDetails :: proc(self: ^IMatchmakingServers, unIP: uint32, usPort: uint16, pRequestServersResponse: ^IMatchmakingPlayersResponse) -> HServerQuery ---
    MatchmakingServers_ServerRules :: proc(self: ^IMatchmakingServers, unIP: uint32, usPort: uint16, pRequestServersResponse: ^IMatchmakingRulesResponse) -> HServerQuery ---
    MatchmakingServers_CancelServerQuery :: proc(self: ^IMatchmakingServers, hServerQuery: HServerQuery) ---

    GameSearch_AddGameSearchParams :: proc(self: ^IGameSearch, pchKeyToFind: cstring, pchValuesToFind: cstring) -> EGameSearchErrorCode ---
    GameSearch_SearchForGameWithLobby :: proc(self: ^IGameSearch, steamIDLobby: CSteamID, nPlayerMin: c.int, nPlayerMax: c.int) -> EGameSearchErrorCode ---
    GameSearch_SearchForGameSolo :: proc(self: ^IGameSearch, nPlayerMin: c.int, nPlayerMax: c.int) -> EGameSearchErrorCode ---
    GameSearch_AcceptGame :: proc(self: ^IGameSearch) -> EGameSearchErrorCode ---
    GameSearch_DeclineGame :: proc(self: ^IGameSearch) -> EGameSearchErrorCode ---
    GameSearch_RetrieveConnectionDetails :: proc(self: ^IGameSearch, steamIDHost: CSteamID, pchConnectionDetails: ^u8, cubConnectionDetails: c.int) -> EGameSearchErrorCode ---
    GameSearch_EndGameSearch :: proc(self: ^IGameSearch) -> EGameSearchErrorCode ---
    GameSearch_SetGameHostParams :: proc(self: ^IGameSearch, pchKey: cstring, pchValue: cstring) -> EGameSearchErrorCode ---
    GameSearch_SetConnectionDetails :: proc(self: ^IGameSearch, pchConnectionDetails: cstring, cubConnectionDetails: c.int) -> EGameSearchErrorCode ---
    GameSearch_RequestPlayersForGame :: proc(self: ^IGameSearch, nPlayerMin: c.int, nPlayerMax: c.int, nMaxTeamSize: c.int) -> EGameSearchErrorCode ---
    GameSearch_HostConfirmGameStart :: proc(self: ^IGameSearch, ullUniqueGameID: uint64) -> EGameSearchErrorCode ---
    GameSearch_CancelRequestPlayersForGame :: proc(self: ^IGameSearch) -> EGameSearchErrorCode ---
    GameSearch_SubmitPlayerResult :: proc(self: ^IGameSearch, ullUniqueGameID: uint64, steamIDPlayer: CSteamID, EPlayerResult: EPlayerResult) -> EGameSearchErrorCode ---
    GameSearch_EndGame :: proc(self: ^IGameSearch, ullUniqueGameID: uint64) -> EGameSearchErrorCode ---

    Parties_GetNumActiveBeacons :: proc(self: ^IParties) -> uint32 ---
    Parties_GetBeaconByIndex :: proc(self: ^IParties, unIndex: uint32) -> PartyBeaconID ---
    Parties_GetBeaconDetails :: proc(self: ^IParties, ulBeaconID: PartyBeaconID, pSteamIDBeaconOwner: ^CSteamID, pLocation: ^SteamPartyBeaconLocation, pchMetadata: ^u8, cchMetadata: c.int) -> bool ---
    Parties_JoinParty :: proc(self: ^IParties, ulBeaconID: PartyBeaconID) -> SteamAPICall ---
    Parties_GetNumAvailableBeaconLocations :: proc(self: ^IParties, puNumLocations: ^uint32) -> bool ---
    Parties_GetAvailableBeaconLocations :: proc(self: ^IParties, pLocationList: ^SteamPartyBeaconLocation, uMaxNumLocations: uint32) -> bool ---
    Parties_CreateBeacon :: proc(self: ^IParties, unOpenSlots: uint32, pBeaconLocation: ^SteamPartyBeaconLocation, pchConnectString: cstring, pchMetadata: cstring) -> SteamAPICall ---
    Parties_OnReservationCompleted :: proc(self: ^IParties, ulBeacon: PartyBeaconID, steamIDUser: CSteamID) ---
    Parties_CancelReservation :: proc(self: ^IParties, ulBeacon: PartyBeaconID, steamIDUser: CSteamID) ---
    Parties_ChangeNumOpenSlots :: proc(self: ^IParties, ulBeacon: PartyBeaconID, unOpenSlots: uint32) -> SteamAPICall ---
    Parties_DestroyBeacon :: proc(self: ^IParties, ulBeacon: PartyBeaconID) -> bool ---
    Parties_GetBeaconLocationData :: proc(self: ^IParties, BeaconLocation: SteamPartyBeaconLocation, eData: ESteamPartyBeaconLocationData, pchDataStringOut: ^u8, cchDataStringOut: c.int) -> bool ---

    RemoteStorage_FileWrite :: proc(self: ^IRemoteStorage, pchFile: cstring, pvData: rawptr, cubData: int32) -> bool ---
    RemoteStorage_FileRead :: proc(self: ^IRemoteStorage, pchFile: cstring, pvData: rawptr, cubDataToRead: int32) -> int32 ---
    RemoteStorage_FileWriteAsync :: proc(self: ^IRemoteStorage, pchFile: cstring, pvData: rawptr, cubData: uint32) -> SteamAPICall ---
    RemoteStorage_FileReadAsync :: proc(self: ^IRemoteStorage, pchFile: cstring, nOffset: uint32, cubToRead: uint32) -> SteamAPICall ---
    RemoteStorage_FileReadAsyncComplete :: proc(self: ^IRemoteStorage, hReadCall: SteamAPICall, pvBuffer: rawptr, cubToRead: uint32) -> bool ---
    RemoteStorage_FileForget :: proc(self: ^IRemoteStorage, pchFile: cstring) -> bool ---
    RemoteStorage_FileDelete :: proc(self: ^IRemoteStorage, pchFile: cstring) -> bool ---
    RemoteStorage_FileShare :: proc(self: ^IRemoteStorage, pchFile: cstring) -> SteamAPICall ---
    RemoteStorage_SetSyncPlatforms :: proc(self: ^IRemoteStorage, pchFile: cstring, eRemoteStoragePlatform: ERemoteStoragePlatform) -> bool ---
    RemoteStorage_FileWriteStreamOpen :: proc(self: ^IRemoteStorage, pchFile: cstring) -> UGCFileWriteStreamHandle ---
    RemoteStorage_FileWriteStreamWriteChunk :: proc(self: ^IRemoteStorage, writeHandle: UGCFileWriteStreamHandle, pvData: rawptr, cubData: int32) -> bool ---
    RemoteStorage_FileWriteStreamClose :: proc(self: ^IRemoteStorage, writeHandle: UGCFileWriteStreamHandle) -> bool ---
    RemoteStorage_FileWriteStreamCancel :: proc(self: ^IRemoteStorage, writeHandle: UGCFileWriteStreamHandle) -> bool ---
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
    RemoteStorage_UGCDownload :: proc(self: ^IRemoteStorage, hContent: UGCHandle, unPriority: uint32) -> SteamAPICall ---
    RemoteStorage_GetUGCDownloadProgress :: proc(self: ^IRemoteStorage, hContent: UGCHandle, pnBytesDownloaded: ^int32, pnBytesExpected: ^int32) -> bool ---
    RemoteStorage_GetUGCDetails :: proc(self: ^IRemoteStorage, hContent: UGCHandle, pnAppID: ^AppId, ppchName: ^^u8, pnFileSizeInBytes: ^int32, pSteamIDOwner: ^CSteamID) -> bool ---
    RemoteStorage_UGCRead :: proc(self: ^IRemoteStorage, hContent: UGCHandle, pvData: rawptr, cubDataToRead: int32, cOffset: uint32, eAction: EUGCReadAction) -> int32 ---
    RemoteStorage_GetCachedUGCCount :: proc(self: ^IRemoteStorage) -> int32 ---
    RemoteStorage_GetCachedUGCHandle :: proc(self: ^IRemoteStorage, iCachedContent: int32) -> UGCHandle ---
    RemoteStorage_PublishWorkshopFile :: proc(self: ^IRemoteStorage, pchFile: cstring, pchPreviewFile: cstring, nConsumerAppId: AppId, pchTitle: cstring, pchDescription: cstring, eVisibility: ERemoteStoragePublishedFileVisibility, pTags: ^SteamParamStringArray, eWorkshopFileType: EWorkshopFileType) -> SteamAPICall ---
    RemoteStorage_CreatePublishedFileUpdateRequest :: proc(self: ^IRemoteStorage, unPublishedFileId: PublishedFileId) -> PublishedFileUpdateHandle ---
    RemoteStorage_UpdatePublishedFileFile :: proc(self: ^IRemoteStorage, updateHandle: PublishedFileUpdateHandle, pchFile: cstring) -> bool ---
    RemoteStorage_UpdatePublishedFilePreviewFile :: proc(self: ^IRemoteStorage, updateHandle: PublishedFileUpdateHandle, pchPreviewFile: cstring) -> bool ---
    RemoteStorage_UpdatePublishedFileTitle :: proc(self: ^IRemoteStorage, updateHandle: PublishedFileUpdateHandle, pchTitle: cstring) -> bool ---
    RemoteStorage_UpdatePublishedFileDescription :: proc(self: ^IRemoteStorage, updateHandle: PublishedFileUpdateHandle, pchDescription: cstring) -> bool ---
    RemoteStorage_UpdatePublishedFileVisibility :: proc(self: ^IRemoteStorage, updateHandle: PublishedFileUpdateHandle, eVisibility: ERemoteStoragePublishedFileVisibility) -> bool ---
    RemoteStorage_UpdatePublishedFileTags :: proc(self: ^IRemoteStorage, updateHandle: PublishedFileUpdateHandle, pTags: ^SteamParamStringArray) -> bool ---
    RemoteStorage_CommitPublishedFileUpdate :: proc(self: ^IRemoteStorage, updateHandle: PublishedFileUpdateHandle) -> SteamAPICall ---
    RemoteStorage_GetPublishedFileDetails :: proc(self: ^IRemoteStorage, unPublishedFileId: PublishedFileId, unMaxSecondsOld: uint32) -> SteamAPICall ---
    RemoteStorage_DeletePublishedFile :: proc(self: ^IRemoteStorage, unPublishedFileId: PublishedFileId) -> SteamAPICall ---
    RemoteStorage_EnumerateUserPublishedFiles :: proc(self: ^IRemoteStorage, unStartIndex: uint32) -> SteamAPICall ---
    RemoteStorage_SubscribePublishedFile :: proc(self: ^IRemoteStorage, unPublishedFileId: PublishedFileId) -> SteamAPICall ---
    RemoteStorage_EnumerateUserSubscribedFiles :: proc(self: ^IRemoteStorage, unStartIndex: uint32) -> SteamAPICall ---
    RemoteStorage_UnsubscribePublishedFile :: proc(self: ^IRemoteStorage, unPublishedFileId: PublishedFileId) -> SteamAPICall ---
    RemoteStorage_UpdatePublishedFileSetChangeDescription :: proc(self: ^IRemoteStorage, updateHandle: PublishedFileUpdateHandle, pchChangeDescription: cstring) -> bool ---
    RemoteStorage_GetPublishedItemVoteDetails :: proc(self: ^IRemoteStorage, unPublishedFileId: PublishedFileId) -> SteamAPICall ---
    RemoteStorage_UpdateUserPublishedItemVote :: proc(self: ^IRemoteStorage, unPublishedFileId: PublishedFileId, bVoteUp: bool) -> SteamAPICall ---
    RemoteStorage_GetUserPublishedItemVoteDetails :: proc(self: ^IRemoteStorage, unPublishedFileId: PublishedFileId) -> SteamAPICall ---
    RemoteStorage_EnumerateUserSharedWorkshopFiles :: proc(self: ^IRemoteStorage, steamId: CSteamID, unStartIndex: uint32, pRequiredTags: ^SteamParamStringArray, pExcludedTags: ^SteamParamStringArray) -> SteamAPICall ---
    RemoteStorage_PublishVideo :: proc(self: ^IRemoteStorage, eVideoProvider: EWorkshopVideoProvider, pchVideoAccount: cstring, pchVideoIdentifier: cstring, pchPreviewFile: cstring, nConsumerAppId: AppId, pchTitle: cstring, pchDescription: cstring, eVisibility: ERemoteStoragePublishedFileVisibility, pTags: ^SteamParamStringArray) -> SteamAPICall ---
    RemoteStorage_SetUserPublishedFileAction :: proc(self: ^IRemoteStorage, unPublishedFileId: PublishedFileId, eAction: EWorkshopFileAction) -> SteamAPICall ---
    RemoteStorage_EnumeratePublishedFilesByUserAction :: proc(self: ^IRemoteStorage, eAction: EWorkshopFileAction, unStartIndex: uint32) -> SteamAPICall ---
    RemoteStorage_EnumeratePublishedWorkshopFiles :: proc(self: ^IRemoteStorage, eEnumerationType: EWorkshopEnumerationType, unStartIndex: uint32, unCount: uint32, unDays: uint32, pTags: ^SteamParamStringArray, pUserTags: ^SteamParamStringArray) -> SteamAPICall ---
    RemoteStorage_UGCDownloadToLocation :: proc(self: ^IRemoteStorage, hContent: UGCHandle, pchLocation: cstring, unPriority: uint32) -> SteamAPICall ---
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
    UserStats_RequestUserStats :: proc(self: ^IUserStats, steamIDUser: CSteamID) -> SteamAPICall ---
    UserStats_GetUserStatInt32 :: proc(self: ^IUserStats, steamIDUser: CSteamID, pchName: cstring, pData: ^int32) -> bool ---
    UserStats_GetUserStatFloat :: proc(self: ^IUserStats, steamIDUser: CSteamID, pchName: cstring, pData: ^f32) -> bool ---
    UserStats_GetUserAchievement :: proc(self: ^IUserStats, steamIDUser: CSteamID, pchName: cstring, pbAchieved: ^bool) -> bool ---
    UserStats_GetUserAchievementAndUnlockTime :: proc(self: ^IUserStats, steamIDUser: CSteamID, pchName: cstring, pbAchieved: ^bool, punUnlockTime: ^uint32) -> bool ---
    UserStats_ResetAllStats :: proc(self: ^IUserStats, bAchievementsToo: bool) -> bool ---
    UserStats_FindOrCreateLeaderboard :: proc(self: ^IUserStats, pchLeaderboardName: cstring, eLeaderboardSortMethod: ELeaderboardSortMethod, eLeaderboardDisplayType: ELeaderboardDisplayType) -> SteamAPICall ---
    UserStats_FindLeaderboard :: proc(self: ^IUserStats, pchLeaderboardName: cstring) -> SteamAPICall ---
    UserStats_GetLeaderboardName :: proc(self: ^IUserStats, hSteamLeaderboard: SteamLeaderboard) -> cstring ---
    UserStats_GetLeaderboardEntryCount :: proc(self: ^IUserStats, hSteamLeaderboard: SteamLeaderboard) -> c.int ---
    UserStats_GetLeaderboardSortMethod :: proc(self: ^IUserStats, hSteamLeaderboard: SteamLeaderboard) -> ELeaderboardSortMethod ---
    UserStats_GetLeaderboardDisplayType :: proc(self: ^IUserStats, hSteamLeaderboard: SteamLeaderboard) -> ELeaderboardDisplayType ---
    UserStats_DownloadLeaderboardEntries :: proc(self: ^IUserStats, hSteamLeaderboard: SteamLeaderboard, eLeaderboardDataRequest: ELeaderboardDataRequest, nRangeStart: c.int, nRangeEnd: c.int) -> SteamAPICall ---
    UserStats_DownloadLeaderboardEntriesForUsers :: proc(self: ^IUserStats, hSteamLeaderboard: SteamLeaderboard, prgUsers: ^CSteamID, cUsers: c.int) -> SteamAPICall ---
    UserStats_GetDownloadedLeaderboardEntry :: proc(self: ^IUserStats, hSteamLeaderboardEntries: SteamLeaderboardEntries, index: c.int, pLeaderboardEntry: ^LeaderboardEntry, pDetails: ^int32, cDetailsMax: c.int) -> bool ---
    UserStats_UploadLeaderboardScore :: proc(self: ^IUserStats, hSteamLeaderboard: SteamLeaderboard, eLeaderboardUploadScoreMethod: ELeaderboardUploadScoreMethod, nScore: int32, pScoreDetails: ^int32, cScoreDetailsCount: c.int) -> SteamAPICall ---
    UserStats_AttachLeaderboardUGC :: proc(self: ^IUserStats, hSteamLeaderboard: SteamLeaderboard, hUGC: UGCHandle) -> SteamAPICall ---
    UserStats_GetNumberOfCurrentPlayers :: proc(self: ^IUserStats) -> SteamAPICall ---
    UserStats_RequestGlobalAchievementPercentages :: proc(self: ^IUserStats) -> SteamAPICall ---
    UserStats_GetMostAchievedAchievementInfo :: proc(self: ^IUserStats, pchName: ^u8, unNameBufLen: uint32, pflPercent: ^f32, pbAchieved: ^bool) -> c.int ---
    UserStats_GetNextMostAchievedAchievementInfo :: proc(self: ^IUserStats, iIteratorPrevious: c.int, pchName: ^u8, unNameBufLen: uint32, pflPercent: ^f32, pbAchieved: ^bool) -> c.int ---
    UserStats_GetAchievementAchievedPercent :: proc(self: ^IUserStats, pchName: cstring, pflPercent: ^f32) -> bool ---
    UserStats_RequestGlobalStats :: proc(self: ^IUserStats, nHistoryDays: c.int) -> SteamAPICall ---
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
    Apps_BIsSubscribedApp :: proc(self: ^IApps, appID: AppId) -> bool ---
    Apps_BIsDlcInstalled :: proc(self: ^IApps, appID: AppId) -> bool ---
    Apps_GetEarliestPurchaseUnixTime :: proc(self: ^IApps, nAppID: AppId) -> uint32 ---
    Apps_BIsSubscribedFromFreeWeekend :: proc(self: ^IApps) -> bool ---
    Apps_GetDLCCount :: proc(self: ^IApps) -> c.int ---
    Apps_BGetDLCDataByIndex :: proc(self: ^IApps, iDLC: c.int, pAppID: ^AppId, pbAvailable: ^bool, pchName: ^u8, cchNameBufferSize: c.int) -> bool ---
    Apps_InstallDLC :: proc(self: ^IApps, nAppID: AppId) ---
    Apps_UninstallDLC :: proc(self: ^IApps, nAppID: AppId) ---
    Apps_RequestAppProofOfPurchaseKey :: proc(self: ^IApps, nAppID: AppId) ---
    Apps_GetCurrentBetaName :: proc(self: ^IApps, pchName: ^u8, cchNameBufferSize: c.int) -> bool ---
    Apps_MarkContentCorrupt :: proc(self: ^IApps, bMissingFilesOnly: bool) -> bool ---
    Apps_GetInstalledDepots :: proc(self: ^IApps, appID: AppId, pvecDepots: ^DepotId, cMaxDepots: uint32) -> uint32 ---
    Apps_GetAppInstallDir :: proc(self: ^IApps, appID: AppId, pchFolder: ^u8, cchFolderBufferSize: uint32) -> uint32 ---
    Apps_BIsAppInstalled :: proc(self: ^IApps, appID: AppId) -> bool ---
    Apps_GetAppOwner :: proc(self: ^IApps) -> CSteamID ---
    Apps_GetLaunchQueryParam :: proc(self: ^IApps, pchKey: cstring) -> cstring ---
    Apps_GetDlcDownloadProgress :: proc(self: ^IApps, nAppID: AppId, punBytesDownloaded: ^uint64, punBytesTotal: ^uint64) -> bool ---
    Apps_GetAppBuildId :: proc(self: ^IApps) -> c.int ---
    Apps_RequestAllProofOfPurchaseKeys :: proc(self: ^IApps) ---
    Apps_GetFileDetails :: proc(self: ^IApps, pszFileName: cstring) -> SteamAPICall ---
    Apps_GetLaunchCommandLine :: proc(self: ^IApps, pszCommandLine: ^u8, cubCommandLine: c.int) -> c.int ---
    Apps_BIsSubscribedFromFamilySharing :: proc(self: ^IApps) -> bool ---
    Apps_BIsTimedTrial :: proc(self: ^IApps, punSecondsAllowed: ^uint32, punSecondsPlayed: ^uint32) -> bool ---
    Apps_SetDlcContext :: proc(self: ^IApps, nAppID: AppId) -> bool ---

    Networking_SendP2PPacket :: proc(self: ^INetworking, steamIDRemote: CSteamID, pubData: rawptr, cubData: uint32, eP2PSendType: EP2PSend, nChannel: c.int) -> bool ---
    Networking_IsP2PPacketAvailable :: proc(self: ^INetworking, pcubMsgSize: ^uint32, nChannel: c.int) -> bool ---
    Networking_ReadP2PPacket :: proc(self: ^INetworking, pubDest: rawptr, cubDest: uint32, pcubMsgSize: ^uint32, psteamIDRemote: ^CSteamID, nChannel: c.int) -> bool ---
    Networking_AcceptP2PSessionWithUser :: proc(self: ^INetworking, steamIDRemote: CSteamID) -> bool ---
    Networking_CloseP2PSessionWithUser :: proc(self: ^INetworking, steamIDRemote: CSteamID) -> bool ---
    Networking_CloseP2PChannelWithUser :: proc(self: ^INetworking, steamIDRemote: CSteamID, nChannel: c.int) -> bool ---
    Networking_GetP2PSessionState :: proc(self: ^INetworking, steamIDRemote: CSteamID, pConnectionState: ^P2PSessionState) -> bool ---
    Networking_AllowP2PPacketRelay :: proc(self: ^INetworking, bAllow: bool) -> bool ---
    Networking_CreateListenSocket :: proc(self: ^INetworking, nVirtualP2PPort: c.int, nIP: SteamIPAddress, nPort: uint16, bAllowUseOfPacketRelay: bool) -> SNetListenSocket ---
    Networking_CreateP2PConnectionSocket :: proc(self: ^INetworking, steamIDTarget: CSteamID, nVirtualPort: c.int, nTimeoutSec: c.int, bAllowUseOfPacketRelay: bool) -> SNetSocket ---
    Networking_CreateConnectionSocket :: proc(self: ^INetworking, nIP: SteamIPAddress, nPort: uint16, nTimeoutSec: c.int) -> SNetSocket ---
    Networking_DestroySocket :: proc(self: ^INetworking, hSocket: SNetSocket, bNotifyRemoteEnd: bool) -> bool ---
    Networking_DestroyListenSocket :: proc(self: ^INetworking, hSocket: SNetListenSocket, bNotifyRemoteEnd: bool) -> bool ---
    Networking_SendDataOnSocket :: proc(self: ^INetworking, hSocket: SNetSocket, pubData: rawptr, cubData: uint32, bReliable: bool) -> bool ---
    Networking_IsDataAvailableOnSocket :: proc(self: ^INetworking, hSocket: SNetSocket, pcubMsgSize: ^uint32) -> bool ---
    Networking_RetrieveDataFromSocket :: proc(self: ^INetworking, hSocket: SNetSocket, pubDest: rawptr, cubDest: uint32, pcubMsgSize: ^uint32) -> bool ---
    Networking_IsDataAvailable :: proc(self: ^INetworking, hListenSocket: SNetListenSocket, pcubMsgSize: ^uint32, phSocket: ^SNetSocket) -> bool ---
    Networking_RetrieveData :: proc(self: ^INetworking, hListenSocket: SNetListenSocket, pubDest: rawptr, cubDest: uint32, pcubMsgSize: ^uint32, phSocket: ^SNetSocket) -> bool ---
    Networking_GetSocketInfo :: proc(self: ^INetworking, hSocket: SNetSocket, pSteamIDRemote: ^CSteamID, peSocketStatus: ^int, punIPRemote: ^SteamIPAddress, punPortRemote: ^uint16) -> bool ---
    Networking_GetListenSocketInfo :: proc(self: ^INetworking, hListenSocket: SNetListenSocket, pnIP: ^SteamIPAddress, pnPort: ^uint16) -> bool ---
    Networking_GetSocketConnectionType :: proc(self: ^INetworking, hSocket: SNetSocket) -> ESNetSocketConnectionType ---
    Networking_GetMaxPacketSize :: proc(self: ^INetworking, hSocket: SNetSocket) -> c.int ---

    Screenshots_WriteScreenshot :: proc(self: ^IScreenshots, pubRGB: rawptr, cubRGB: uint32, nWidth: c.int, nHeight: c.int) -> ScreenshotHandle ---
    Screenshots_AddScreenshotToLibrary :: proc(self: ^IScreenshots, pchFilename: cstring, pchThumbnailFilename: cstring, nWidth: c.int, nHeight: c.int) -> ScreenshotHandle ---
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
    MusicRemote_SetPNGIcon_64x64 :: proc(self: ^IMusicRemote, pvBuffer: rawptr, cbBufferLength: uint32) -> bool ---
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
    HTTP_SendHTTPRequest :: proc(self: ^IHTTP, hRequest: HTTPRequestHandle, pCallHandle: ^SteamAPICall) -> bool ---
    HTTP_SendHTTPRequestAndStreamResponse :: proc(self: ^IHTTP, hRequest: HTTPRequestHandle, pCallHandle: ^SteamAPICall) -> bool ---
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
    Input_GetConnectedControllers :: proc(self: ^IInput, handlesOut: ^InputHandle) -> c.int ---
    Input_EnableDeviceCallbacks :: proc(self: ^IInput) ---
    Input_EnableActionEventCallbacks :: proc(self: ^IInput, pCallback: SteamInputActionEventCallbackPointer) ---
    Input_GetActionSetHandle :: proc(self: ^IInput, pszActionSetName: cstring) -> InputActionSetHandle ---
    Input_ActivateActionSet :: proc(self: ^IInput, inputHandle: InputHandle, actionSetHandle: InputActionSetHandle) ---
    Input_GetCurrentActionSet :: proc(self: ^IInput, inputHandle: InputHandle) -> InputActionSetHandle ---
    Input_ActivateActionSetLayer :: proc(self: ^IInput, inputHandle: InputHandle, actionSetLayerHandle: InputActionSetHandle) ---
    Input_DeactivateActionSetLayer :: proc(self: ^IInput, inputHandle: InputHandle, actionSetLayerHandle: InputActionSetHandle) ---
    Input_DeactivateAllActionSetLayers :: proc(self: ^IInput, inputHandle: InputHandle) ---
    Input_GetActiveActionSetLayers :: proc(self: ^IInput, inputHandle: InputHandle, handlesOut: ^InputActionSetHandle) -> c.int ---
    Input_GetDigitalActionHandle :: proc(self: ^IInput, pszActionName: cstring) -> InputDigitalActionHandle ---
    Input_GetDigitalActionData :: proc(self: ^IInput, inputHandle: InputHandle, digitalActionHandle: InputDigitalActionHandle) -> InputDigitalActionData ---
    Input_GetDigitalActionOrigins :: proc(self: ^IInput, inputHandle: InputHandle, actionSetHandle: InputActionSetHandle, digitalActionHandle: InputDigitalActionHandle, originsOut: ^EInputActionOrigin) -> c.int ---
    Input_GetStringForDigitalActionName :: proc(self: ^IInput, eActionHandle: InputDigitalActionHandle) -> cstring ---
    Input_GetAnalogActionHandle :: proc(self: ^IInput, pszActionName: cstring) -> InputAnalogActionHandle ---
    Input_GetAnalogActionData :: proc(self: ^IInput, inputHandle: InputHandle, analogActionHandle: InputAnalogActionHandle) -> InputAnalogActionData ---
    Input_GetAnalogActionOrigins :: proc(self: ^IInput, inputHandle: InputHandle, actionSetHandle: InputActionSetHandle, analogActionHandle: InputAnalogActionHandle, originsOut: ^EInputActionOrigin) -> c.int ---
    Input_GetGlyphPNGForActionOrigin :: proc(self: ^IInput, eOrigin: EInputActionOrigin, eSize: ESteamInputGlyphSize, unFlags: uint32) -> cstring ---
    Input_GetGlyphSVGForActionOrigin :: proc(self: ^IInput, eOrigin: EInputActionOrigin, unFlags: uint32) -> cstring ---
    Input_GetGlyphForActionOrigin_Legacy :: proc(self: ^IInput, eOrigin: EInputActionOrigin) -> cstring ---
    Input_GetStringForActionOrigin :: proc(self: ^IInput, eOrigin: EInputActionOrigin) -> cstring ---
    Input_GetStringForAnalogActionName :: proc(self: ^IInput, eActionHandle: InputAnalogActionHandle) -> cstring ---
    Input_StopAnalogActionMomentum :: proc(self: ^IInput, inputHandle: InputHandle, eAction: InputAnalogActionHandle) ---
    Input_GetMotionData :: proc(self: ^IInput, inputHandle: InputHandle) -> InputMotionData ---
    Input_TriggerVibration :: proc(self: ^IInput, inputHandle: InputHandle, usLeftSpeed: c.ushort, usRightSpeed: c.ushort) ---
    Input_TriggerVibrationExtended :: proc(self: ^IInput, inputHandle: InputHandle, usLeftSpeed: c.ushort, usRightSpeed: c.ushort, usLeftTriggerSpeed: c.ushort, usRightTriggerSpeed: c.ushort) ---
    Input_TriggerSimpleHapticEvent :: proc(self: ^IInput, inputHandle: InputHandle, eHapticLocation: EControllerHapticLocation, nIntensity: uint8, nGainDB: i8, nOtherIntensity: uint8, nOtherGainDB: i8) ---
    Input_SetLEDColor :: proc(self: ^IInput, inputHandle: InputHandle, nColorR: uint8, nColorG: uint8, nColorB: uint8, nFlags: c.uint) ---
    Input_Legacy_TriggerHapticPulse :: proc(self: ^IInput, inputHandle: InputHandle, eTargetPad: ESteamControllerPad, usDurationMicroSec: c.ushort) ---
    Input_Legacy_TriggerRepeatedHapticPulse :: proc(self: ^IInput, inputHandle: InputHandle, eTargetPad: ESteamControllerPad, usDurationMicroSec: c.ushort, usOffMicroSec: c.ushort, unRepeat: c.ushort, nFlags: c.uint) ---
    Input_ShowBindingPanel :: proc(self: ^IInput, inputHandle: InputHandle) -> bool ---
    Input_GetInputTypeForHandle :: proc(self: ^IInput, inputHandle: InputHandle) -> ESteamInputType ---
    Input_GetControllerForGamepadIndex :: proc(self: ^IInput, nIndex: c.int) -> InputHandle ---
    Input_GetGamepadIndexForController :: proc(self: ^IInput, ulinputHandle: InputHandle) -> c.int ---
    Input_GetStringForXboxOrigin :: proc(self: ^IInput, eOrigin: EXboxOrigin) -> cstring ---
    Input_GetGlyphForXboxOrigin :: proc(self: ^IInput, eOrigin: EXboxOrigin) -> cstring ---
    Input_GetActionOriginFromXboxOrigin :: proc(self: ^IInput, inputHandle: InputHandle, eOrigin: EXboxOrigin) -> EInputActionOrigin ---
    Input_TranslateActionOrigin :: proc(self: ^IInput, eDestinationInputType: ESteamInputType, eSourceOrigin: EInputActionOrigin) -> EInputActionOrigin ---
    Input_GetDeviceBindingRevision :: proc(self: ^IInput, inputHandle: InputHandle, pMajor: ^int, pMinor: ^int) -> bool ---
    Input_GetRemotePlaySessionID :: proc(self: ^IInput, inputHandle: InputHandle) -> uint32 ---
    Input_GetSessionInputConfigurationSettings :: proc(self: ^IInput) -> uint16 ---
    // IInput_SetDualSenseTriggerEffect :: proc(self: ^IInput, inputHandle: InputHandle, pParam: ^ScePadTriggerEffectParam) ---

    Controller_Init :: proc(self: ^IController) -> bool ---
    Controller_Shutdown :: proc(self: ^IController) -> bool ---
    Controller_RunFrame :: proc(self: ^IController) ---
    Controller_GetConnectedControllers :: proc(self: ^IController, handlesOut: ^ControllerHandle) -> c.int ---
    Controller_GetActionSetHandle :: proc(self: ^IController, pszActionSetName: cstring) -> ControllerActionSetHandle ---
    Controller_ActivateActionSet :: proc(self: ^IController, controllerHandle: ControllerHandle, actionSetHandle: ControllerActionSetHandle) ---
    Controller_GetCurrentActionSet :: proc(self: ^IController, controllerHandle: ControllerHandle) -> ControllerActionSetHandle ---
    Controller_ActivateActionSetLayer :: proc(self: ^IController, controllerHandle: ControllerHandle, actionSetLayerHandle: ControllerActionSetHandle) ---
    Controller_DeactivateActionSetLayer :: proc(self: ^IController, controllerHandle: ControllerHandle, actionSetLayerHandle: ControllerActionSetHandle) ---
    Controller_DeactivateAllActionSetLayers :: proc(self: ^IController, controllerHandle: ControllerHandle) ---
    Controller_GetActiveActionSetLayers :: proc(self: ^IController, controllerHandle: ControllerHandle, handlesOut: ^ControllerActionSetHandle) -> c.int ---
    Controller_GetDigitalActionHandle :: proc(self: ^IController, pszActionName: cstring) -> ControllerDigitalActionHandle ---
    Controller_GetDigitalActionData :: proc(self: ^IController, controllerHandle: ControllerHandle, digitalActionHandle: ControllerDigitalActionHandle) -> InputDigitalActionData ---
    Controller_GetDigitalActionOrigins :: proc(self: ^IController, controllerHandle: ControllerHandle, actionSetHandle: ControllerActionSetHandle, digitalActionHandle: ControllerDigitalActionHandle, originsOut: ^EControllerActionOrigin) -> c.int ---
    Controller_GetAnalogActionHandle :: proc(self: ^IController, pszActionName: cstring) -> ControllerAnalogActionHandle ---
    Controller_GetAnalogActionData :: proc(self: ^IController, controllerHandle: ControllerHandle, analogActionHandle: ControllerAnalogActionHandle) -> InputAnalogActionData ---
    Controller_GetAnalogActionOrigins :: proc(self: ^IController, controllerHandle: ControllerHandle, actionSetHandle: ControllerActionSetHandle, analogActionHandle: ControllerAnalogActionHandle, originsOut: ^EControllerActionOrigin) -> c.int ---
    Controller_GetGlyphForActionOrigin :: proc(self: ^IController, eOrigin: EControllerActionOrigin) -> cstring ---
    Controller_GetStringForActionOrigin :: proc(self: ^IController, eOrigin: EControllerActionOrigin) -> cstring ---
    Controller_StopAnalogActionMomentum :: proc(self: ^IController, controllerHandle: ControllerHandle, eAction: ControllerAnalogActionHandle) ---
    Controller_GetMotionData :: proc(self: ^IController, controllerHandle: ControllerHandle) -> InputMotionData ---
    Controller_TriggerHapticPulse :: proc(self: ^IController, controllerHandle: ControllerHandle, eTargetPad: ESteamControllerPad, usDurationMicroSec: c.ushort) ---
    Controller_TriggerRepeatedHapticPulse :: proc(self: ^IController, controllerHandle: ControllerHandle, eTargetPad: ESteamControllerPad, usDurationMicroSec: c.ushort, usOffMicroSec: c.ushort, unRepeat: c.ushort, nFlags: c.uint) ---
    Controller_TriggerVibration :: proc(self: ^IController, controllerHandle: ControllerHandle, usLeftSpeed: c.ushort, usRightSpeed: c.ushort) ---
    Controller_SetLEDColor :: proc(self: ^IController, controllerHandle: ControllerHandle, nColorR: uint8, nColorG: uint8, nColorB: uint8, nFlags: c.uint) ---
    Controller_ShowBindingPanel :: proc(self: ^IController, controllerHandle: ControllerHandle) -> bool ---
    Controller_GetInputTypeForHandle :: proc(self: ^IController, controllerHandle: ControllerHandle) -> ESteamInputType ---
    Controller_GetControllerForGamepadIndex :: proc(self: ^IController, nIndex: c.int) -> ControllerHandle ---
    Controller_GetGamepadIndexForController :: proc(self: ^IController, ulControllerHandle: ControllerHandle) -> c.int ---
    Controller_GetStringForXboxOrigin :: proc(self: ^IController, eOrigin: EXboxOrigin) -> cstring ---
    Controller_GetGlyphForXboxOrigin :: proc(self: ^IController, eOrigin: EXboxOrigin) -> cstring ---
    Controller_GetActionOriginFromXboxOrigin :: proc(self: ^IController, controllerHandle: ControllerHandle, eOrigin: EXboxOrigin) -> EControllerActionOrigin ---
    Controller_TranslateActionOrigin :: proc(self: ^IController, eDestinationInputType: ESteamInputType, eSourceOrigin: EControllerActionOrigin) -> EControllerActionOrigin ---
    Controller_GetControllerBindingRevision :: proc(self: ^IController, controllerHandle: ControllerHandle, pMajor: ^int, pMinor: ^int) -> bool ---

    UGC_CreateQueryUserUGCRequest :: proc(self: ^IUGC, unAccountID: AccountID, eListType: EUserUGCList, eMatchingUGCType: EUGCMatchingUGCType, eSortOrder: EUserUGCListSortOrder, nCreatorAppID: AppId, nConsumerAppID: AppId, unPage: uint32) -> UGCQueryHandle ---
    UGC_CreateQueryAllUGCRequestByPage :: proc(self: ^IUGC, eQueryType: EUGCQuery, eMatchingeMatchingUGCTypeFileType: EUGCMatchingUGCType, nCreatorAppID: AppId, nConsumerAppID: AppId, unPage: uint32) -> UGCQueryHandle ---
    UGC_CreateQueryAllUGCRequestByCursor :: proc(self: ^IUGC, eQueryType: EUGCQuery, eMatchingeMatchingUGCTypeFileType: EUGCMatchingUGCType, nCreatorAppID: AppId, nConsumerAppID: AppId, pchCursor: cstring) -> UGCQueryHandle ---
    UGC_CreateQueryUGCDetailsRequest :: proc(self: ^IUGC, pvecPublishedFileID: ^PublishedFileId, unNumPublishedFileIDs: uint32) -> UGCQueryHandle ---
    UGC_SendQueryUGCRequest :: proc(self: ^IUGC, handle: UGCQueryHandle) -> SteamAPICall ---
    UGC_GetQueryUGCResult :: proc(self: ^IUGC, handle: UGCQueryHandle, index: uint32, pDetails: ^SteamUGCDetails) -> bool ---
    UGC_GetQueryUGCNumTags :: proc(self: ^IUGC, handle: UGCQueryHandle, index: uint32) -> uint32 ---
    UGC_GetQueryUGCTag :: proc(self: ^IUGC, handle: UGCQueryHandle, index: uint32, indexTag: uint32, pchValue: ^u8, cchValueSize: uint32) -> bool ---
    UGC_GetQueryUGCTagDisplayName :: proc(self: ^IUGC, handle: UGCQueryHandle, index: uint32, indexTag: uint32, pchValue: ^u8, cchValueSize: uint32) -> bool ---
    UGC_GetQueryUGCPreviewURL :: proc(self: ^IUGC, handle: UGCQueryHandle, index: uint32, pchURL: ^u8, cchURLSize: uint32) -> bool ---
    UGC_GetQueryUGCMetadata :: proc(self: ^IUGC, handle: UGCQueryHandle, index: uint32, pchMetadata: ^u8, cchMetadatasize: uint32) -> bool ---
    UGC_GetQueryUGCChildren :: proc(self: ^IUGC, handle: UGCQueryHandle, index: uint32, pvecPublishedFileID: ^PublishedFileId, cMaxEntries: uint32) -> bool ---
    UGC_GetQueryUGCStatistic :: proc(self: ^IUGC, handle: UGCQueryHandle, index: uint32, eStatType: EItemStatistic, pStatValue: ^uint64) -> bool ---
    UGC_GetQueryUGCNumAdditionalPreviews :: proc(self: ^IUGC, handle: UGCQueryHandle, index: uint32) -> uint32 ---
    UGC_GetQueryUGCAdditionalPreview :: proc(self: ^IUGC, handle: UGCQueryHandle, index: uint32, previewIndex: uint32, pchURLOrVideoID: ^u8, cchURLSize: uint32, pchOriginalFileName: ^u8, cchOriginalFileNameSize: uint32, pPreviewType: ^EItemPreviewType) -> bool ---
    UGC_GetQueryUGCNumKeyValueTags :: proc(self: ^IUGC, handle: UGCQueryHandle, index: uint32) -> uint32 ---
    UGC_GetQueryUGCKeyValueTag :: proc(self: ^IUGC, handle: UGCQueryHandle, index: uint32, pchKey: cstring, pchValue: ^u8, cchValueSize: uint32) -> bool ---
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
    UGC_SetReturnPlaytimeStats :: proc(self: ^IUGC, handle: UGCQueryHandle, unDays: uint32) -> bool ---
    UGC_SetLanguage :: proc(self: ^IUGC, handle: UGCQueryHandle, pchLanguage: cstring) -> bool ---
    UGC_SetAllowCachedResponse :: proc(self: ^IUGC, handle: UGCQueryHandle, unMaxAgeSeconds: uint32) -> bool ---
    UGC_SetCloudFileNameFilter :: proc(self: ^IUGC, handle: UGCQueryHandle, pMatchCloudFileName: cstring) -> bool ---
    UGC_SetMatchAnyTag :: proc(self: ^IUGC, handle: UGCQueryHandle, bMatchAnyTag: bool) -> bool ---
    UGC_SetSearchText :: proc(self: ^IUGC, handle: UGCQueryHandle, pSearchText: cstring) -> bool ---
    UGC_SetRankedByTrendDays :: proc(self: ^IUGC, handle: UGCQueryHandle, unDays: uint32) -> bool ---
    UGC_SetTimeCreatedDateRange :: proc(self: ^IUGC, handle: UGCQueryHandle, rtStart: RTime32, rtEnd: RTime32) -> bool ---
    UGC_SetTimeUpdatedDateRange :: proc(self: ^IUGC, handle: UGCQueryHandle, rtStart: RTime32, rtEnd: RTime32) -> bool ---
    UGC_AddRequiredKeyValueTag :: proc(self: ^IUGC, handle: UGCQueryHandle, pKey: cstring, pValue: cstring) -> bool ---
    UGC_RequestUGCDetails :: proc(self: ^IUGC, nPublishedFileID: PublishedFileId, unMaxAgeSeconds: uint32) -> SteamAPICall ---
    UGC_CreateItem :: proc(self: ^IUGC, nConsumerAppId: AppId, eFileType: EWorkshopFileType) -> SteamAPICall ---
    UGC_StartItemUpdate :: proc(self: ^IUGC, nConsumerAppId: AppId, nPublishedFileID: PublishedFileId) -> UGCUpdateHandle ---
    UGC_SetItemTitle :: proc(self: ^IUGC, handle: UGCUpdateHandle, pchTitle: cstring) -> bool ---
    UGC_SetItemDescription :: proc(self: ^IUGC, handle: UGCUpdateHandle, pchDescription: cstring) -> bool ---
    UGC_SetItemUpdateLanguage :: proc(self: ^IUGC, handle: UGCUpdateHandle, pchLanguage: cstring) -> bool ---
    UGC_SetItemMetadata :: proc(self: ^IUGC, handle: UGCUpdateHandle, pchMetaData: cstring) -> bool ---
    UGC_SetItemVisibility :: proc(self: ^IUGC, handle: UGCUpdateHandle, eVisibility: ERemoteStoragePublishedFileVisibility) -> bool ---
    UGC_SetItemTags :: proc(self: ^IUGC, updateHandle: UGCUpdateHandle, pTags: ^SteamParamStringArray) -> bool ---
    UGC_SetItemContent :: proc(self: ^IUGC, handle: UGCUpdateHandle, pszContentFolder: cstring) -> bool ---
    UGC_SetItemPreview :: proc(self: ^IUGC, handle: UGCUpdateHandle, pszPreviewFile: cstring) -> bool ---
    UGC_SetAllowLegacyUpload :: proc(self: ^IUGC, handle: UGCUpdateHandle, bAllowLegacyUpload: bool) -> bool ---
    UGC_RemoveAllItemKeyValueTags :: proc(self: ^IUGC, handle: UGCUpdateHandle) -> bool ---
    UGC_RemoveItemKeyValueTags :: proc(self: ^IUGC, handle: UGCUpdateHandle, pchKey: cstring) -> bool ---
    UGC_AddItemKeyValueTag :: proc(self: ^IUGC, handle: UGCUpdateHandle, pchKey: cstring, pchValue: cstring) -> bool ---
    UGC_AddItemPreviewFile :: proc(self: ^IUGC, handle: UGCUpdateHandle, pszPreviewFile: cstring, type: EItemPreviewType) -> bool ---
    UGC_AddItemPreviewVideo :: proc(self: ^IUGC, handle: UGCUpdateHandle, pszVideoID: cstring) -> bool ---
    UGC_UpdateItemPreviewFile :: proc(self: ^IUGC, handle: UGCUpdateHandle, index: uint32, pszPreviewFile: cstring) -> bool ---
    UGC_UpdateItemPreviewVideo :: proc(self: ^IUGC, handle: UGCUpdateHandle, index: uint32, pszVideoID: cstring) -> bool ---
    UGC_RemoveItemPreview :: proc(self: ^IUGC, handle: UGCUpdateHandle, index: uint32) -> bool ---
    UGC_SubmitItemUpdate :: proc(self: ^IUGC, handle: UGCUpdateHandle, pchChangeNote: cstring) -> SteamAPICall ---
    UGC_GetItemUpdateProgress :: proc(self: ^IUGC, handle: UGCUpdateHandle, punBytesProcessed: ^uint64, punBytesTotal: ^uint64) -> EItemUpdateStatus ---
    UGC_SetUserItemVote :: proc(self: ^IUGC, nPublishedFileID: PublishedFileId, bVoteUp: bool) -> SteamAPICall ---
    UGC_GetUserItemVote :: proc(self: ^IUGC, nPublishedFileID: PublishedFileId) -> SteamAPICall ---
    UGC_AddItemToFavorites :: proc(self: ^IUGC, nAppId: AppId, nPublishedFileID: PublishedFileId) -> SteamAPICall ---
    UGC_RemoveItemFromFavorites :: proc(self: ^IUGC, nAppId: AppId, nPublishedFileID: PublishedFileId) -> SteamAPICall ---
    UGC_SubscribeItem :: proc(self: ^IUGC, nPublishedFileID: PublishedFileId) -> SteamAPICall ---
    UGC_UnsubscribeItem :: proc(self: ^IUGC, nPublishedFileID: PublishedFileId) -> SteamAPICall ---
    UGC_GetNumSubscribedItems :: proc(self: ^IUGC) -> uint32 ---
    UGC_GetSubscribedItems :: proc(self: ^IUGC, pvecPublishedFileID: ^PublishedFileId, cMaxEntries: uint32) -> uint32 ---
    UGC_GetItemState :: proc(self: ^IUGC, nPublishedFileID: PublishedFileId) -> uint32 ---
    UGC_GetItemInstallInfo :: proc(self: ^IUGC, nPublishedFileID: PublishedFileId, punSizeOnDisk: ^uint64, pchFolder: ^u8, cchFolderSize: uint32, punTimeStamp: ^uint32) -> bool ---
    UGC_GetItemDownloadInfo :: proc(self: ^IUGC, nPublishedFileID: PublishedFileId, punBytesDownloaded: ^uint64, punBytesTotal: ^uint64) -> bool ---
    UGC_DownloadItem :: proc(self: ^IUGC, nPublishedFileID: PublishedFileId, bHighPriority: bool) -> bool ---
    UGC_BInitWorkshopForGameServer :: proc(self: ^IUGC, unWorkshopDepotID: DepotId, pszFolder: cstring) -> bool ---
    UGC_SuspendDownloads :: proc(self: ^IUGC, bSuspend: bool) ---
    UGC_StartPlaytimeTracking :: proc(self: ^IUGC, pvecPublishedFileID: ^PublishedFileId, unNumPublishedFileIDs: uint32) -> SteamAPICall ---
    UGC_StopPlaytimeTracking :: proc(self: ^IUGC, pvecPublishedFileID: ^PublishedFileId, unNumPublishedFileIDs: uint32) -> SteamAPICall ---
    UGC_StopPlaytimeTrackingForAllItems :: proc(self: ^IUGC) -> SteamAPICall ---
    UGC_AddDependency :: proc(self: ^IUGC, nParentPublishedFileID: PublishedFileId, nChildPublishedFileID: PublishedFileId) -> SteamAPICall ---
    UGC_RemoveDependency :: proc(self: ^IUGC, nParentPublishedFileID: PublishedFileId, nChildPublishedFileID: PublishedFileId) -> SteamAPICall ---
    UGC_AddAppDependency :: proc(self: ^IUGC, nPublishedFileID: PublishedFileId, nAppID: AppId) -> SteamAPICall ---
    UGC_RemoveAppDependency :: proc(self: ^IUGC, nPublishedFileID: PublishedFileId, nAppID: AppId) -> SteamAPICall ---
    UGC_GetAppDependencies :: proc(self: ^IUGC, nPublishedFileID: PublishedFileId) -> SteamAPICall ---
    UGC_DeleteItem :: proc(self: ^IUGC, nPublishedFileID: PublishedFileId) -> SteamAPICall ---
    UGC_ShowWorkshopEULA :: proc(self: ^IUGC) -> bool ---
    UGC_GetWorkshopEULAStatus :: proc(self: ^IUGC) -> SteamAPICall ---

    AppList_GetNumInstalledApps :: proc(self: ^IAppList) -> uint32 ---
    AppList_GetInstalledApps :: proc(self: ^IAppList, pvecAppID: ^AppId, unMaxAppIDs: uint32) -> uint32 ---
    AppList_GetAppName :: proc(self: ^IAppList, nAppID: AppId, pchName: ^u8, cchNameMax: c.int) -> c.int ---
    AppList_GetAppInstallDir :: proc(self: ^IAppList, nAppID: AppId, pchDirectory: ^u8, cchNameMax: c.int) -> c.int ---
    AppList_GetAppBuildId :: proc(self: ^IAppList, nAppID: AppId) -> c.int ---

    HTMLSurface_Init :: proc(self: ^IHTMLSurface) -> bool ---
    HTMLSurface_Shutdown :: proc(self: ^IHTMLSurface) -> bool ---
    HTMLSurface_CreateBrowser :: proc(self: ^IHTMLSurface, pchUserAgent: cstring, pchUserCSS: cstring) -> SteamAPICall ---
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

    Inventory_GetResultStatus :: proc(self: ^IInventory, resultHandle: SteamInventoryResult) -> EResult ---
    Inventory_GetResultItems :: proc(self: ^IInventory, resultHandle: SteamInventoryResult, pOutItemsArray: ^SteamItemDetails, punOutItemsArraySize: ^uint32) -> bool ---
    Inventory_GetResultItemProperty :: proc(self: ^IInventory, resultHandle: SteamInventoryResult, unItemIndex: uint32, pchPropertyName: cstring, pchValueBuffer: ^u8, punValueBufferSizeOut: ^uint32) -> bool ---
    Inventory_GetResultTimestamp :: proc(self: ^IInventory, resultHandle: SteamInventoryResult) -> uint32 ---
    Inventory_CheckResultSteamID :: proc(self: ^IInventory, resultHandle: SteamInventoryResult, steamIDExpected: CSteamID) -> bool ---
    Inventory_DestroyResult :: proc(self: ^IInventory, resultHandle: SteamInventoryResult) ---
    Inventory_GetAllItems :: proc(self: ^IInventory, pResultHandle: ^SteamInventoryResult) -> bool ---
    Inventory_GetItemsByID :: proc(self: ^IInventory, pResultHandle: ^SteamInventoryResult, pInstanceIDs: ^SteamItemInstanceID, unCountInstanceIDs: uint32) -> bool ---
    Inventory_SerializeResult :: proc(self: ^IInventory, resultHandle: SteamInventoryResult, pOutBuffer: rawptr, punOutBufferSize: ^uint32) -> bool ---
    Inventory_DeserializeResult :: proc(self: ^IInventory, pOutResultHandle: ^SteamInventoryResult, pBuffer: rawptr, unBufferSize: uint32, bRESERVED_MUST_BE_FALSE: bool) -> bool ---
    Inventory_GenerateItems :: proc(self: ^IInventory, pResultHandle: ^SteamInventoryResult, pArrayItemDefs: ^SteamItemDef, punArrayQuantity: ^uint32, unArrayLength: uint32) -> bool ---
    Inventory_GrantPromoItems :: proc(self: ^IInventory, pResultHandle: ^SteamInventoryResult) -> bool ---
    Inventory_AddPromoItem :: proc(self: ^IInventory, pResultHandle: ^SteamInventoryResult, itemDef: SteamItemDef) -> bool ---
    Inventory_AddPromoItems :: proc(self: ^IInventory, pResultHandle: ^SteamInventoryResult, pArrayItemDefs: ^SteamItemDef, unArrayLength: uint32) -> bool ---
    Inventory_ConsumeItem :: proc(self: ^IInventory, pResultHandle: ^SteamInventoryResult, itemConsume: SteamItemInstanceID, unQuantity: uint32) -> bool ---
    Inventory_ExchangeItems :: proc(self: ^IInventory, pResultHandle: ^SteamInventoryResult, pArrayGenerate: ^SteamItemDef, punArrayGenerateQuantity: ^uint32, unArrayGenerateLength: uint32, pArrayDestroy: ^SteamItemInstanceID, punArrayDestroyQuantity: ^uint32, unArrayDestroyLength: uint32) -> bool ---
    Inventory_TransferItemQuantity :: proc(self: ^IInventory, pResultHandle: ^SteamInventoryResult, itemIdSource: SteamItemInstanceID, unQuantity: uint32, itemIdDest: SteamItemInstanceID) -> bool ---
    Inventory_SendItemDropHeartbeat :: proc(self: ^IInventory) ---
    Inventory_TriggerItemDrop :: proc(self: ^IInventory, pResultHandle: ^SteamInventoryResult, dropListDefinition: SteamItemDef) -> bool ---
    Inventory_TradeItems :: proc(self: ^IInventory, pResultHandle: ^SteamInventoryResult, steamIDTradePartner: CSteamID, pArrayGive: ^SteamItemInstanceID, pArrayGiveQuantity: ^uint32, nArrayGiveLength: uint32, pArrayGet: ^SteamItemInstanceID, pArrayGetQuantity: ^uint32, nArrayGetLength: uint32) -> bool ---
    Inventory_LoadItemDefinitions :: proc(self: ^IInventory) -> bool ---
    Inventory_GetItemDefinitionIDs :: proc(self: ^IInventory, pItemDefIDs: ^SteamItemDef, punItemDefIDsArraySize: ^uint32) -> bool ---
    Inventory_GetItemDefinitionProperty :: proc(self: ^IInventory, iDefinition: SteamItemDef, pchPropertyName: cstring, pchValueBuffer: ^u8, punValueBufferSizeOut: ^uint32) -> bool ---
    Inventory_RequestEligiblePromoItemDefinitionsIDs :: proc(self: ^IInventory, steamID: CSteamID) -> SteamAPICall ---
    Inventory_GetEligiblePromoItemDefinitionIDs :: proc(self: ^IInventory, steamID: CSteamID, pItemDefIDs: ^SteamItemDef, punItemDefIDsArraySize: ^uint32) -> bool ---
    Inventory_StartPurchase :: proc(self: ^IInventory, pArrayItemDefs: ^SteamItemDef, punArrayQuantity: ^uint32, unArrayLength: uint32) -> SteamAPICall ---
    Inventory_RequestPrices :: proc(self: ^IInventory) -> SteamAPICall ---
    Inventory_GetNumItemsWithPrices :: proc(self: ^IInventory) -> uint32 ---
    Inventory_GetItemsWithPrices :: proc(self: ^IInventory, pArrayItemDefs: ^SteamItemDef, pCurrentPrices: ^uint64, pBasePrices: ^uint64, unArrayLength: uint32) -> bool ---
    Inventory_GetItemPrice :: proc(self: ^IInventory, iDefinition: SteamItemDef, pCurrentPrice: ^uint64, pBasePrice: ^uint64) -> bool ---
    Inventory_StartUpdateProperties :: proc(self: ^IInventory) -> SteamInventoryUpdateHandle ---
    Inventory_RemoveProperty :: proc(self: ^IInventory, handle: SteamInventoryUpdateHandle, nItemID: SteamItemInstanceID, pchPropertyName: cstring) -> bool ---
    Inventory_SetProperty :: proc(self: ^IInventory, handle: SteamInventoryUpdateHandle, nItemID: SteamItemInstanceID, pchPropertyName: cstring, pchPropertyValue: cstring) -> bool ---
    Inventory_SetPropertyBool :: proc(self: ^IInventory, handle: SteamInventoryUpdateHandle, nItemID: SteamItemInstanceID, pchPropertyName: cstring, bValue: bool) -> bool ---
    Inventory_SetPropertyInt64 :: proc(self: ^IInventory, handle: SteamInventoryUpdateHandle, nItemID: SteamItemInstanceID, pchPropertyName: cstring, nValue: int64) -> bool ---
    Inventory_SetPropertyFloat :: proc(self: ^IInventory, handle: SteamInventoryUpdateHandle, nItemID: SteamItemInstanceID, pchPropertyName: cstring, flValue: f32) -> bool ---
    Inventory_SubmitUpdateProperties :: proc(self: ^IInventory, handle: SteamInventoryUpdateHandle, pResultHandle: ^SteamInventoryResult) -> bool ---
    Inventory_InspectItem :: proc(self: ^IInventory, pResultHandle: ^SteamInventoryResult, pchItemToken: cstring) -> bool ---

    Video_GetVideoURL :: proc(self: ^IVideo, unVideoAppID: AppId) ---
    Video_IsBroadcasting :: proc(self: ^IVideo, pnNumViewers: ^int) -> bool ---
    Video_GetOPFSettings :: proc(self: ^IVideo, unVideoAppID: AppId) ---
    Video_GetOPFStringForApp :: proc(self: ^IVideo, unVideoAppID: AppId, pchBuffer: ^u8, pnBufferSize: ^int32) -> bool ---

    ParentalSettings_BIsParentalLockEnabled :: proc(self: ^IParentalSettings) -> bool ---
    ParentalSettings_BIsParentalLockLocked :: proc(self: ^IParentalSettings) -> bool ---
    ParentalSettings_BIsAppBlocked :: proc(self: ^IParentalSettings, nAppID: AppId) -> bool ---
    ParentalSettings_BIsAppInBlockList :: proc(self: ^IParentalSettings, nAppID: AppId) -> bool ---
    ParentalSettings_BIsFeatureBlocked :: proc(self: ^IParentalSettings, eFeature: EParentalFeature) -> bool ---
    ParentalSettings_BIsFeatureInBlockList :: proc(self: ^IParentalSettings, eFeature: EParentalFeature) -> bool ---

    RemotePlay_GetSessionCount :: proc(self: ^IRemotePlay) -> uint32 ---
    RemotePlay_GetSessionID :: proc(self: ^IRemotePlay, iSessionIndex: c.int) -> RemotePlaySessionID ---
    RemotePlay_GetSessionSteamID :: proc(self: ^IRemotePlay, unSessionID: RemotePlaySessionID) -> CSteamID ---
    RemotePlay_GetSessionClientName :: proc(self: ^IRemotePlay, unSessionID: RemotePlaySessionID) -> cstring ---
    RemotePlay_GetSessionClientFormFactor :: proc(self: ^IRemotePlay, unSessionID: RemotePlaySessionID) -> ESteamDeviceFormFactor ---
    RemotePlay_BGetSessionClientResolution :: proc(self: ^IRemotePlay, unSessionID: RemotePlaySessionID, pnResolutionX: ^int, pnResolutionY: ^int) -> bool ---
    RemotePlay_BSendRemotePlayTogetherInvite :: proc(self: ^IRemotePlay, steamIDFriend: CSteamID) -> bool ---

    NetworkingMessages_SendMessageToUser :: proc(self: ^INetworkingMessages, identityRemote: ^SteamNetworkingIdentity, pubData: rawptr, cubData: uint32, nSendFlags: c.int, nRemoteChannel: c.int) -> EResult ---
    NetworkingMessages_ReceiveMessagesOnChannel :: proc(self: ^INetworkingMessages, nLocalChannel: c.int, ppOutMessages: ^^SteamNetworkingMessage, nMaxMessages: c.int) -> c.int ---
    NetworkingMessages_AcceptSessionWithUser :: proc(self: ^INetworkingMessages, identityRemote: ^SteamNetworkingIdentity) -> bool ---
    NetworkingMessages_CloseSessionWithUser :: proc(self: ^INetworkingMessages, identityRemote: ^SteamNetworkingIdentity) -> bool ---
    NetworkingMessages_CloseChannelWithUser :: proc(self: ^INetworkingMessages, identityRemote: ^SteamNetworkingIdentity, nLocalChannel: c.int) -> bool ---
    NetworkingMessages_GetSessionConnectionInfo :: proc(self: ^INetworkingMessages, identityRemote: ^SteamNetworkingIdentity, pConnectionInfo: ^SteamNetConnectionInfo, pQuickStatus: ^SteamNetConnectionRealTimeStatus) -> ESteamNetworkingConnectionState ---

    NetworkingSockets_CreateListenSocketIP :: proc(self: ^INetworkingSockets, localAddress: ^SteamNetworkingIPAddr, nOptions: c.int, pOptions: ^SteamNetworkingConfigValue) -> HSteamListenSocket ---
    NetworkingSockets_ConnectByIPAddress :: proc(self: ^INetworkingSockets, address: ^SteamNetworkingIPAddr, nOptions: c.int, pOptions: ^SteamNetworkingConfigValue) -> HSteamNetConnection ---
    NetworkingSockets_CreateListenSocketP2P :: proc(self: ^INetworkingSockets, nLocalVirtualPort: c.int, nOptions: c.int, pOptions: ^SteamNetworkingConfigValue) -> HSteamListenSocket ---
    NetworkingSockets_ConnectP2P :: proc(self: ^INetworkingSockets, identityRemote: ^SteamNetworkingIdentity, nRemoteVirtualPort: c.int, nOptions: c.int, pOptions: ^SteamNetworkingConfigValue) -> HSteamNetConnection ---
    NetworkingSockets_AcceptConnection :: proc(self: ^INetworkingSockets, hConn: HSteamNetConnection) -> EResult ---
    NetworkingSockets_CloseConnection :: proc(self: ^INetworkingSockets, hPeer: HSteamNetConnection, nReason: c.int, pszDebug: cstring, bEnableLinger: bool) -> bool ---
    NetworkingSockets_CloseListenSocket :: proc(self: ^INetworkingSockets, hSocket: HSteamListenSocket) -> bool ---
    NetworkingSockets_SetConnectionUserData :: proc(self: ^INetworkingSockets, hPeer: HSteamNetConnection, nUserData: int64) -> bool ---
    NetworkingSockets_GetConnectionUserData :: proc(self: ^INetworkingSockets, hPeer: HSteamNetConnection) -> int64 ---
    NetworkingSockets_SetConnectionName :: proc(self: ^INetworkingSockets, hPeer: HSteamNetConnection, pszName: cstring) ---
    NetworkingSockets_GetConnectionName :: proc(self: ^INetworkingSockets, hPeer: HSteamNetConnection, pszName: ^u8, nMaxLen: c.int) -> bool ---
    NetworkingSockets_SendMessageToConnection :: proc(self: ^INetworkingSockets, hConn: HSteamNetConnection, pData: rawptr, cbData: uint32, nSendFlags: c.int, pOutMessageNumber: ^int64) -> EResult ---
    NetworkingSockets_FlushMessagesOnConnection :: proc(self: ^INetworkingSockets, hConn: HSteamNetConnection) -> EResult ---
    NetworkingSockets_ReceiveMessagesOnConnection :: proc(self: ^INetworkingSockets, hConn: HSteamNetConnection, ppOutMessages: ^^SteamNetworkingMessage, nMaxMessages: c.int) -> c.int ---
    NetworkingSockets_GetConnectionInfo :: proc(self: ^INetworkingSockets, hConn: HSteamNetConnection, pInfo: ^SteamNetConnectionInfo) -> bool ---
    NetworkingSockets_GetConnectionRealTimeStatus :: proc(self: ^INetworkingSockets, hConn: HSteamNetConnection, pStatus: ^SteamNetConnectionRealTimeStatus, nLanes: c.int, pLanes: ^SteamNetConnectionRealTimeLaneStatus) -> EResult ---
    NetworkingSockets_GetDetailedConnectionStatus :: proc(self: ^INetworkingSockets, hConn: HSteamNetConnection, pszBuf: ^u8, cbBuf: c.int) -> c.int ---
    NetworkingSockets_GetListenSocketAddress :: proc(self: ^INetworkingSockets, hSocket: HSteamListenSocket, address: ^SteamNetworkingIPAddr) -> bool ---
    NetworkingSockets_CreateSocketPair :: proc(self: ^INetworkingSockets, pOutConnection1: ^HSteamNetConnection, pOutConnection2: ^HSteamNetConnection, bUseNetworkLoopback: bool, pIdentity1: ^SteamNetworkingIdentity, pIdentity2: ^SteamNetworkingIdentity) -> bool ---
    NetworkingSockets_ConfigureConnectionLanes :: proc(self: ^INetworkingSockets, hConn: HSteamNetConnection, nNumLanes: c.int, pLanePriorities: ^int, pLaneWeights: ^uint16) -> EResult ---
    NetworkingSockets_GetIdentity :: proc(self: ^INetworkingSockets, pIdentity: ^SteamNetworkingIdentity) -> bool ---
    NetworkingSockets_InitAuthentication :: proc(self: ^INetworkingSockets) -> ESteamNetworkingAvailability ---
    NetworkingSockets_GetAuthenticationStatus :: proc(self: ^INetworkingSockets, pDetails: ^SteamNetAuthenticationStatus) -> ESteamNetworkingAvailability ---
    NetworkingSockets_CreatePollGroup :: proc(self: ^INetworkingSockets) -> HSteamNetPollGroup ---
    NetworkingSockets_DestroyPollGroup :: proc(self: ^INetworkingSockets, hPollGroup: HSteamNetPollGroup) -> bool ---
    NetworkingSockets_SetConnectionPollGroup :: proc(self: ^INetworkingSockets, hConn: HSteamNetConnection, hPollGroup: HSteamNetPollGroup) -> bool ---
    NetworkingSockets_ReceiveMessagesOnPollGroup :: proc(self: ^INetworkingSockets, hPollGroup: HSteamNetPollGroup, ppOutMessages: ^^SteamNetworkingMessage, nMaxMessages: c.int) -> c.int ---
    NetworkingSockets_ReceivedRelayAuthTicket :: proc(self: ^INetworkingSockets, pvTicket: rawptr, cbTicket: c.int, pOutParsedTicket: SteamDatagramRelayAuthTicketPtr) -> bool ---
    NetworkingSockets_FindRelayAuthTicketForServer :: proc(self: ^INetworkingSockets, identityGameServer: ^SteamNetworkingIdentity, nRemoteVirtualPort: c.int, pOutParsedTicket: SteamDatagramRelayAuthTicketPtr) -> c.int ---
    NetworkingSockets_ConnectToHostedDedicatedServer :: proc(self: ^INetworkingSockets, identityTarget: ^SteamNetworkingIdentity, nRemoteVirtualPort: c.int, nOptions: c.int, pOptions: ^SteamNetworkingConfigValue) -> HSteamNetConnection ---
    NetworkingSockets_GetHostedDedicatedServerPort :: proc(self: ^INetworkingSockets) -> uint16 ---
    NetworkingSockets_GetHostedDedicatedServerPOPID :: proc(self: ^INetworkingSockets) -> SteamNetworkingPOPID ---
    NetworkingSockets_GetHostedDedicatedServerAddress :: proc(self: ^INetworkingSockets, pRouting: ^SteamDatagramHostedAddress) -> EResult ---
    NetworkingSockets_CreateHostedDedicatedServerListenSocket :: proc(self: ^INetworkingSockets, nLocalVirtualPort: c.int, nOptions: c.int, pOptions: ^SteamNetworkingConfigValue) -> HSteamListenSocket ---
    NetworkingSockets_GetGameCoordinatorServerLogin :: proc(self: ^INetworkingSockets, pLoginInfo: ^SteamDatagramGameCoordinatorServerLogin, pcbSignedBlob: ^int, pBlob: rawptr) -> EResult ---
    NetworkingSockets_ConnectP2PCustomSignaling :: proc(self: ^INetworkingSockets, pSignaling: SteamDatagramRelayAuthTicketPtr, pPeerIdentity: ^SteamNetworkingIdentity, nRemoteVirtualPort: c.int, nOptions: c.int, pOptions: ^SteamNetworkingConfigValue) -> HSteamNetConnection ---
    NetworkingSockets_ReceivedP2PCustomSignal :: proc(self: ^INetworkingSockets, pMsg: rawptr, cbMsg: c.int, pContext: INetworkingSignalingRecvContextPtr) -> bool ---
    NetworkingSockets_GetCertificateRequest :: proc(self: ^INetworkingSockets, pcbBlob: ^int, pBlob: rawptr, errMsg: ^SteamNetworkingErrMsg) -> bool ---
    NetworkingSockets_SetCertificate :: proc(self: ^INetworkingSockets, pCertificate: rawptr, cbCertificate: c.int, errMsg: ^SteamNetworkingErrMsg) -> bool ---
    NetworkingSockets_ResetIdentity :: proc(self: ^INetworkingSockets, pIdentity: ^SteamNetworkingIdentity) ---
    NetworkingSockets_RunCallbacks :: proc(self: ^INetworkingSockets) ---
    NetworkingSockets_BeginAsyncRequestFakeIP :: proc(self: ^INetworkingSockets, nNumPorts: c.int) -> bool ---
    NetworkingSockets_GetFakeIP :: proc(self: ^INetworkingSockets, idxFirstPort: c.int, pInfo: ^SteamNetworkingFakeIPResult) ---
    NetworkingSockets_CreateListenSocketP2PFakeIP :: proc(self: ^INetworkingSockets, idxFakePort: c.int, nOptions: c.int, pOptions: ^SteamNetworkingConfigValue) -> HSteamListenSocket ---
    NetworkingSockets_GetRemoteFakeIPForConnection :: proc(self: ^INetworkingSockets, hConn: HSteamNetConnection, pOutAddr: ^SteamNetworkingIPAddr) -> EResult ---
    NetworkingSockets_CreateFakeUDPPort :: proc(self: ^INetworkingSockets, idxFakeServerPort: c.int) -> ^INetworkingFakeUDPPort ---

    NetworkingUtils_AllocateMessage :: proc(self: ^INetworkingUtils, cbAllocateBuffer: c.int) -> ^SteamNetworkingMessage ---
    NetworkingUtils_InitRelayNetworkAccess :: proc(self: ^INetworkingUtils) ---
    NetworkingUtils_GetRelayNetworkStatus :: proc(self: ^INetworkingUtils, pDetails: ^SteamRelayNetworkStatus) -> ESteamNetworkingAvailability ---
    NetworkingUtils_GetLocalPingLocation :: proc(self: ^INetworkingUtils, result: ^SteamNetworkPingLocation) -> f32 ---
    NetworkingUtils_EstimatePingTimeBetweenTwoLocations :: proc(self: ^INetworkingUtils, location1: ^SteamNetworkPingLocation, location2: ^SteamNetworkPingLocation) -> c.int ---
    NetworkingUtils_EstimatePingTimeFromLocalHost :: proc(self: ^INetworkingUtils, remoteLocation: ^SteamNetworkPingLocation) -> c.int ---
    NetworkingUtils_ConvertPingLocationToString :: proc(self: ^INetworkingUtils, location: ^SteamNetworkPingLocation, pszBuf: ^u8, cchBufSize: c.int) ---
    NetworkingUtils_ParsePingLocationString :: proc(self: ^INetworkingUtils, pszString: cstring, result: ^SteamNetworkPingLocation) -> bool ---
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
    NetworkingUtils_SetGlobalCallbacSteamNetConnectionStatusChanged :: proc(self: ^INetworkingUtils, fnCallback: FnSteamNetConnectionStatusChanged) -> bool ---
    NetworkingUtils_SetGlobalCallbacSteamNetAuthenticationStatusChanged :: proc(self: ^INetworkingUtils, fnCallback: FnSteamNetAuthenticationStatusChanged) -> bool ---
    NetworkingUtils_SetGlobalCallbacSteamRelayNetworkStatusChanged :: proc(self: ^INetworkingUtils, fnCallback: FnSteamRelayNetworkStatusChanged) -> bool ---
    NetworkingUtils_SetGlobalCallbacFakeIPResult :: proc(self: ^INetworkingUtils, fnCallback: FnSteamNetworkingFakeIPResult) -> bool ---
    NetworkingUtils_SetGlobalCallbacMessagesSessionRequest :: proc(self: ^INetworkingUtils, fnCallback: FnSteamNetworkingMessagesSessionRequest) -> bool ---
    NetworkingUtils_SetGlobalCallbacMessagesSessionFailed :: proc(self: ^INetworkingUtils, fnCallback: FnSteamNetworkingMessagesSessionFailed) -> bool ---
    NetworkingUtils_SetConfigValue :: proc(self: ^INetworkingUtils, eValue: ESteamNetworkingConfigValue, eScopeType: ESteamNetworkingConfigScope, scopeObj: intptr, eDataType: ESteamNetworkingConfigDataType, pArg: rawptr) -> bool ---
    NetworkingUtils_SetConfigValueStruct :: proc(self: ^INetworkingUtils, opt: ^SteamNetworkingConfigValue, eScopeType: ESteamNetworkingConfigScope, scopeObj: intptr) -> bool ---
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
    GameServer_UserHasLicenseForApp :: proc(self: ^IGameServer, steamID: CSteamID, appID: AppId) -> EUserHasLicenseForAppResult ---
    GameServer_RequestUserGroupStatus :: proc(self: ^IGameServer, steamIDUser: CSteamID, steamIDGroup: CSteamID) -> bool ---
    GameServer_GetGameplayStats :: proc(self: ^IGameServer) ---
    GameServer_GetServerReputation :: proc(self: ^IGameServer) -> SteamAPICall ---
    GameServer_GetPublicIP :: proc(self: ^IGameServer) -> SteamIPAddress ---
    GameServer_HandleIncomingPacket :: proc(self: ^IGameServer, pData: rawptr, cbData: c.int, srcIP: uint32, srcPort: uint16) -> bool ---
    GameServer_GetNextOutgoingPacket :: proc(self: ^IGameServer, pOut: rawptr, cbMaxOut: c.int, pNetAdr: ^uint32, pPort: ^uint16) -> c.int ---
    GameServer_AssociateWithClan :: proc(self: ^IGameServer, steamIDClan: CSteamID) -> SteamAPICall ---
    GameServer_ComputeNewPlayerCompatibility :: proc(self: ^IGameServer, steamIDNewPlayer: CSteamID) -> SteamAPICall ---
    GameServer_SendUserConnectAndAuthenticate_DEPRECATED :: proc(self: ^IGameServer, unIPClient: uint32, pvAuthBlob: rawptr, cubAuthBlobSize: uint32, pSteamIDUser: ^CSteamID) -> bool ---
    GameServer_CreateUnauthenticatedUserConnection :: proc(self: ^IGameServer) -> CSteamID ---
    GameServer_SendUserDisconnect_DEPRECATED :: proc(self: ^IGameServer, steamIDUser: CSteamID) ---
    GameServer_BUpdateUserData :: proc(self: ^IGameServer, steamIDUser: CSteamID, pchPlayerName: cstring, uScore: uint32) -> bool ---

    GameServerStats_RequestUserStats :: proc(self: ^IGameServerStats, steamIDUser: CSteamID) -> SteamAPICall ---
    GameServerStats_GetUserStatInt32 :: proc(self: ^IGameServerStats, steamIDUser: CSteamID, pchName: cstring, pData: ^int32) -> bool ---
    GameServerStats_GetUserStatFloat :: proc(self: ^IGameServerStats, steamIDUser: CSteamID, pchName: cstring, pData: ^f32) -> bool ---
    GameServerStats_GetUserAchievement :: proc(self: ^IGameServerStats, steamIDUser: CSteamID, pchName: cstring, pbAchieved: ^bool) -> bool ---
    GameServerStats_SetUserStatInt32 :: proc(self: ^IGameServerStats, steamIDUser: CSteamID, pchName: cstring, nData: int32) -> bool ---
    GameServerStats_SetUserStatFloat :: proc(self: ^IGameServerStats, steamIDUser: CSteamID, pchName: cstring, fData: f32) -> bool ---
    GameServerStats_UpdateUserAvgRateStat :: proc(self: ^IGameServerStats, steamIDUser: CSteamID, pchName: cstring, flCountThisSession: f32, dSessionLength: f64) -> bool ---
    GameServerStats_SetUserAchievement :: proc(self: ^IGameServerStats, steamIDUser: CSteamID, pchName: cstring) -> bool ---
    GameServerStats_ClearUserAchievement :: proc(self: ^IGameServerStats, steamIDUser: CSteamID, pchName: cstring) -> bool ---
    GameServerStats_StoreUserStats :: proc(self: ^IGameServerStats, steamIDUser: CSteamID) -> SteamAPICall ---

    NetworkingFakeUDPPort_DestroyFakeUDPPort :: proc(self: ^INetworkingFakeUDPPort) ---
    NetworkingFakeUDPPort_SendMessageToFakeIP :: proc(self: ^INetworkingFakeUDPPort, remoteAddress: ^SteamNetworkingIPAddr, pData: rawptr, cbData: uint32, nSendFlags: c.int) -> EResult ---
    NetworkingFakeUDPPort_ReceiveMessages :: proc(self: ^INetworkingFakeUDPPort, ppOutMessages: ^^SteamNetworkingMessage, nMaxMessages: c.int) -> c.int ---
    NetworkingFakeUDPPort_ScheduleCleanup :: proc(self: ^INetworkingFakeUDPPort, remoteAddress: ^SteamNetworkingIPAddr) ---

    SteamIPAddress_IsSet :: proc(self: ^SteamIPAddress) -> bool ---
    MatchMakingKeyValuePair_Construct :: proc(self: ^MatchMakingKeyValuePair) ---
    servernetadr_Construct :: proc(self: ^servernetadr) ---
    servernetadr_Init :: proc(self: ^servernetadr, ip: c.uint, usQueryPort: uint16, usConnectionPort: uint16) ---
    servernetadr_GetQueryPort :: proc(self: ^servernetadr) -> uint16 ---
    servernetadr_SetQueryPort :: proc(self: ^servernetadr, usPort: uint16) ---
    servernetadr_GetConnectionPort :: proc(self: ^servernetadr) -> uint16 ---
    servernetadr_SetConnectionPort :: proc(self: ^servernetadr, usPort: uint16) ---
    servernetadr_GetIP :: proc(self: ^servernetadr) -> uint32 ---
    servernetadr_SetIP :: proc(self: ^servernetadr, unIP: uint32) ---
    servernetadr_GetConnectionAddressString :: proc(self: ^servernetadr) -> cstring ---
    servernetadr_GetQueryAddressString :: proc(self: ^servernetadr) -> cstring ---
    gameserveritet_Construct :: proc(self: ^gameserveritet) ---
    gameserveritet_GetName :: proc(self: ^gameserveritet) -> cstring ---
    gameserveritet_SetName :: proc(self: ^gameserveritet, pName: cstring) ---
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
    SteamNetworkingMessage_Release :: proc(self: ^SteamNetworkingMessage) ---
    SteamNetworkingConfigValue_SetInt32 :: proc(self: ^SteamNetworkingConfigValue, eVal: ESteamNetworkingConfigValue, data: int32) ---
    SteamNetworkingConfigValue_SetInt64 :: proc(self: ^SteamNetworkingConfigValue, eVal: ESteamNetworkingConfigValue, data: int64) ---
    SteamNetworkingConfigValue_SetFloat :: proc(self: ^SteamNetworkingConfigValue, eVal: ESteamNetworkingConfigValue, data: f32) ---
    SteamNetworkingConfigValue_SetPtr :: proc(self: ^SteamNetworkingConfigValue, eVal: ESteamNetworkingConfigValue, data: rawptr) ---
    SteamNetworkingConfigValue_SetString :: proc(self: ^SteamNetworkingConfigValue, eVal: ESteamNetworkingConfigValue, data: cstring) ---
    SteamDatagramHostedAddress_Clear :: proc(self: ^SteamDatagramHostedAddress) ---
    SteamDatagramHostedAddress_GetPopID :: proc(self: ^SteamDatagramHostedAddress) -> SteamNetworkingPOPID ---
    SteamDatagramHostedAddress_SetDevAddress :: proc(self: ^SteamDatagramHostedAddress, nIP: uint32, nPort: uint16, popid: SteamNetworkingPOPID) ---
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
iSteamAppListCallbacks :: 3900
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

DlcInstalled_iCallback :: iSteamAppsCallbacks + 5

// Purpose: response to RegisterActivationCode()
RegisterActivationCodeResponse_iCallback :: iSteamAppsCallbacks + 8

// Purpose: posted after the user gains executes a Steam URL with command line or query parameters
// such as steam://run/<appid>//-commandline/?param1=value1&param2=value2&param3=value3 etc
// while the game is already running.  The new params can be queried
// with GetLaunchQueryParam and GetLaunchCommandLine
NewUrlLaunchParameters_iCallback :: iSteamAppsCallbacks + 14

// Purpose: response to RequestAppProofOfPurchaseKey/RequestAllProofOfPurchaseKeys
// for supporting third-party CD keys, or other proof-of-purchase systems.
AppProofOfPurchaseKeyResponse_iCallback :: iSteamAppsCallbacks + 21

// Purpose: response to GetFileDetails
FileDetailsResult_iCallback :: iSteamAppsCallbacks + 23

// Purpose: called for games in Timed Trial mode
TimedTrialStatus_iCallback :: iSteamAppsCallbacks + 30


// From: isteamfriends.h

// Purpose: called when a friends' status changes
PersonaStateChange_iCallback :: iSteamFriendsCallbacks + 4

// Purpose: posted when game overlay activates or deactivates
//			the game can use this to be pause or resume single player games
GameOverlayActivated_iCallback :: iSteamFriendsCallbacks + 31

// Purpose: called when the user tries to join a different game server from their friends list
//			game client should attempt to connect to specified server when this is received
GameServerChangeRequested_iCallback :: iSteamFriendsCallbacks + 32

// Purpose: called when the user tries to join a lobby from their friends list
//			game client should attempt to connect to specified lobby when this is received
GameLobbyJoinRequested_iCallback :: iSteamFriendsCallbacks + 33

// Purpose: called when an avatar is loaded in from a previous GetLargeFriendAvatar() call
//			if the image wasn't already available
AvatarImageLoaded_iCallback :: iSteamFriendsCallbacks + 34

// Purpose: marks the return of a request officer list call
ClanOfficerListResponse_iCallback :: iSteamFriendsCallbacks + 35

// Purpose: callback indicating updated data about friends rich presence information
FriendRichPresenceUpdate_iCallback :: iSteamFriendsCallbacks + 36

// Purpose: called when the user tries to join a game from their friends list
//			rich presence will have been set with the "connect" key which is set here
GameRichPresenceJoinRequested_iCallback :: iSteamFriendsCallbacks + 37

// Purpose: a chat message has been received for a clan chat the game has joined
GameConnectedClanChatMsg_iCallback :: iSteamFriendsCallbacks + 38

// Purpose: a user has joined a clan chat
GameConnectedChatJoin_iCallback :: iSteamFriendsCallbacks + 39

// Purpose: a user has left the chat we're in
GameConnectedChatLeave_iCallback :: iSteamFriendsCallbacks + 40

// Purpose: a DownloadClanActivityCounts() call has finished
DownloadClanActivityCountsResult_iCallback :: iSteamFriendsCallbacks + 41

// Purpose: a JoinClanChatRoom() call has finished
JoinClanChatRoomCompletionResult_iCallback :: iSteamFriendsCallbacks + 42

// Purpose: a chat message has been received from a user
GameConnectedFriendChatMsg_iCallback :: iSteamFriendsCallbacks + 43

FriendsGetFollowerCount_iCallback :: iSteamFriendsCallbacks + 44
FriendsIsFollowing_iCallback :: iSteamFriendsCallbacks + 45
FriendsEnumerateFollowingList_iCallback :: iSteamFriendsCallbacks + 46

// Purpose: reports the result of an attempt to change the user's persona name
SetPersonaNameResponse_iCallback :: iSteamFriendsCallbacks + 47

// Purpose: Invoked when the status of unread messages changes
UnreadChatMessagesChanged_iCallback :: iSteamFriendsCallbacks + 48

// Purpose: Dispatched when an overlay browser instance is navigated to a protocol/scheme registered by RegisterProtocolInOverlayBrowser()
OverlayBrowserProtocolNavigation_iCallback :: iSteamFriendsCallbacks + 49

// Purpose: A user's equipped profile items have changed
EquippedProfileItemsChanged_iCallback :: iSteamFriendsCallbacks + 50

EquippedProfileItems_iCallback :: iSteamFriendsCallbacks + 51


// From: isteamgamecoordinator.h

GCMessageAvailable_iCallback :: iSteamGameCoordinatorCallbacks + 1

// callback notification - A message failed to make it to the GC. It may be down temporarily
GCMessageFailed_iCallback :: iSteamGameCoordinatorCallbacks + 2


// From: isteamgameserver.h

// client has been approved to connect to this game server
GSClientApprove_iCallback :: iSteamGameServerCallbacks + 1

// client has been denied to connection to this game server
GSClientDeny_iCallback :: iSteamGameServerCallbacks + 2

// request the game server should kick the user
GSClientKick_iCallback :: iSteamGameServerCallbacks + 3

// NOTE: callback values 4 and 5 are skipped because they are used for old deprecated callbacks, 
// do not reuse them here.

// client achievement info
GSClientAchievementStatus_iCallback :: iSteamGameServerCallbacks + 6

// received when the game server requests to be displayed as secure (VAC protected)
// m_bSecure is true if the game server should display itself as secure to users, false otherwise
GSPolicyResponse_iCallback :: iSteamUserCallbacks + 15

// GS gameplay stats info
GSGameplayStats_iCallback :: iSteamGameServerCallbacks + 7

// send as a reply to RequestUserGroupStatus()
GSClientGroupStatus_iCallback :: iSteamGameServerCallbacks + 8

// Sent as a reply to GetServerReputation()
GSReputation_iCallback :: iSteamGameServerCallbacks + 9

// Sent as a reply to AssociateWithClan()
AssociateWithClanResult_iCallback :: iSteamGameServerCallbacks + 10

// Sent as a reply to ComputeNewPlayerCompatibility()
ComputeNewPlayerCompatibilityResult_iCallback :: iSteamGameServerCallbacks + 11


// From: isteamgameserverstats.h

// Purpose: called when the latests stats and achievements have been received
//			from the server
GSStatsReceived_iCallback :: iSteamGameServerStatsCallbacks

// Purpose: result of a request to store the user stats for a game
GSStatsStored_iCallback :: iSteamGameServerStatsCallbacks + 1

// Purpose: Callback indicating that a user's stats have been unloaded.
//  Call RequestUserStats again to access stats for this user
GSStatsUnloaded_iCallback :: iSteamUserStatsCallbacks + 8


// From: isteamhttp.h

HTTPRequestCompleted_iCallback :: iSteamHTTPCallbacks + 1
HTTPRequestHeadersReceived_iCallback :: iSteamHTTPCallbacks + 2
HTTPRequestDataReceived_iCallback :: iSteamHTTPCallbacks + 3


// From: isteaminput.h

// Purpose: called when a new controller has been connected, will fire once
// per controller if multiple new controllers connect in the same frame
SteamInputDeviceConnected_iCallback :: iSteamControllerCallbacks + 1

// Purpose: called when a new controller has been connected, will fire once
// per controller if multiple new controllers connect in the same frame
SteamInputDeviceDisconnected_iCallback :: iSteamControllerCallbacks + 2

// Purpose: called when a controller configuration has been loaded, will fire once
// per controller per focus change for Steam Input enabled controllers
SteamInputConfigurationLoaded_iCallback :: iSteamControllerCallbacks + 3


// From: isteaminventory.h

// SteamInventoryResultReady_t callbacks are fired whenever asynchronous
// results transition from "Pending" to "OK" or an error state. There will
// always be exactly one callback per handle.
SteamInventoryResultReady_iCallback :: iSteamInventoryCallbacks + 0

// SteamInventoryFullUpdate_t callbacks are triggered when GetAllItems
// successfully returns a result which is newer / fresher than the last
// known result. (It will not trigger if the inventory hasn't changed,
// or if results from two overlapping calls are reversed in flight and
// the earlier result is already known to be stale/out-of-date.)
// The normal ResultReady callback will still be triggered immediately
// afterwards; this is an additional notification for your convenience.
SteamInventoryFullUpdate_iCallback :: iSteamInventoryCallbacks + 1

// A SteamInventoryDefinitionUpdate_t callback is triggered whenever
// item definitions have been updated, which could be in response to 
// LoadItemDefinitions() or any other async request which required
// a definition update in order to process results from the server.
SteamInventoryDefinitionUpdate_iCallback :: iSteamInventoryCallbacks + 2

// Returned 
SteamInventoryEligiblePromoItemDefIDs_iCallback :: iSteamInventoryCallbacks + 3

// Triggered from StartPurchase call
SteamInventoryStartPurchaseResult_iCallback :: iSteamInventoryCallbacks + 4

// Triggered from RequestPrices
SteamInventoryRequestPricesResult_iCallback :: iSteamInventoryCallbacks + 5


// From: isteammatchmaking.h

// Callbacks for ISteamMatchmaking (which go through the regular Steam callback registration system)

// Purpose: a server was added/removed from the favorites list, you should refresh now
FavoritesListChanged_iCallback :: iSteamMatchmakingCallbacks + 2

// Purpose: Someone has invited you to join a Lobby
//			normally you don't need to do anything with this, since
//			the Steam UI will also display a '<user> has invited you to the lobby, join?' dialog
//
//			if the user outside a game chooses to join, your game will be launched with the parameter "+connect_lobby <64-bit lobby id>",
//			or with the callback GameLobbyJoinRequested_t if they're already in-game
LobbyInvite_iCallback :: iSteamMatchmakingCallbacks + 3

// Purpose: Sent on entering a lobby, or on failing to enter
//			m_EChatRoomEnterResponse will be set to k_EChatRoomEnterResponseSuccess on success,
//			or a higher value on failure (see enum EChatRoomEnterResponse)
LobbyEnter_iCallback :: iSteamMatchmakingCallbacks + 4

// Purpose: The lobby metadata has changed
//			if m_ulSteamIDMember is the steamID of a lobby member, use GetLobbyMemberData() to access per-user details
//			if m_ulSteamIDMember == m_ulSteamIDLobby, use GetLobbyData() to access lobby metadata
LobbyDataUpdate_iCallback :: iSteamMatchmakingCallbacks + 5

// Purpose: The lobby chat room state has changed
//			this is usually sent when a user has joined or left the lobby
LobbyChatUpdate_iCallback :: iSteamMatchmakingCallbacks + 6

// Purpose: A chat message for this lobby has been sent
//			use GetLobbyChatEntry( m_iChatID ) to retrieve the contents of this message
LobbyChatMsg_iCallback :: iSteamMatchmakingCallbacks + 7

// Purpose: A game created a game for all the members of the lobby to join,
//			as triggered by a SetLobbyGameServer()
//			it's up to the individual clients to take action on this; the usual
//			game behavior is to leave the lobby and connect to the specified game server
LobbyGameCreated_iCallback :: iSteamMatchmakingCallbacks + 9

// Purpose: Number of matching lobbies found
//			iterate the returned lobbies with GetLobbyByIndex(), from values 0 to m_nLobbiesMatching-1
LobbyMatchList_iCallback :: iSteamMatchmakingCallbacks + 10

// Purpose: posted if a user is forcefully removed from a lobby
//			can occur if a user loses connection to Steam
LobbyKicked_iCallback :: iSteamMatchmakingCallbacks + 12

// Purpose: Result of our request to create a Lobby
//			m_eResult == k_EResultOK on success
//			at this point, the lobby has been joined and is ready for use
//			a LobbyEnter_t callback will also be received (since the local user is joining their own lobby)
LobbyCreated_iCallback :: iSteamMatchmakingCallbacks + 13

// used by now obsolete RequestFriendsLobbiesResponse_t
// enum { k_iCallback = iSteamMatchmakingCallbacks + 14 };

// Purpose: Result of CheckForPSNGameBootInvite
//			m_eResult == k_EResultOK on success
//			at this point, the local user may not have finishing joining this lobby;
//			game code should wait until the subsequent LobbyEnter_t callback is received
PSNGameBootInviteResult_iCallback :: iSteamMatchmakingCallbacks + 15

// Purpose: Result of our request to create a Lobby
//			m_eResult == k_EResultOK on success
//			at this point, the lobby has been joined and is ready for use
//			a LobbyEnter_t callback will also be received (since the local user is joining their own lobby)
FavoritesListAccountsUpdated_iCallback :: iSteamMatchmakingCallbacks + 16

// Callbacks for ISteamGameSearch (which go through the regular Steam callback registration system)

SearchForGameProgressCallback_iCallback :: iSteamGameSearchCallbacks + 1

// notification to all players searching that a game has been found
SearchForGameResultCallback_iCallback :: iSteamGameSearchCallbacks + 2

// ISteamGameSearch : Game Host API callbacks

// callback from RequestPlayersForGame when the matchmaking service has started or ended search
// callback will also follow a call from CancelRequestPlayersForGame - m_bSearchInProgress will be false
RequestPlayersForGameProgressCallback_iCallback :: iSteamGameSearchCallbacks + 11

// callback from RequestPlayersForGame
// one of these will be sent per player 
// followed by additional callbacks when players accept or decline the game
RequestPlayersForGameResultCallback_iCallback :: iSteamGameSearchCallbacks + 12

RequestPlayersForGameFinalResultCallback_iCallback :: iSteamGameSearchCallbacks + 13

// this callback confirms that results were received by the matchmaking service for this player
SubmitPlayerResultResultCallback_iCallback :: iSteamGameSearchCallbacks + 14

// this callback confirms that the game is recorded as complete on the matchmaking service
// the next call to RequestPlayersForGame will generate a new unique game ID
EndGameResultCallback_iCallback :: iSteamGameSearchCallbacks + 15

// Steam has responded to the user request to join a party via the given Beacon ID.
// If successful, the connect string contains game-specific instructions to connect
// to the game with that party.
JoinPartyCallback_iCallback :: iSteamPartiesCallbacks + 1

// Response to CreateBeacon request. If successful, the beacon ID is provided.
CreateBeaconCallback_iCallback :: iSteamPartiesCallbacks + 2

// Someone has used the beacon to join your party - they are in-flight now
// and we've reserved one of the open slots for them.
// You should confirm when they join your party by calling OnReservationCompleted().
// Otherwise, Steam may timeout their reservation eventually.
ReservationNotificationCallback_iCallback :: iSteamPartiesCallbacks + 3

// Response to ChangeNumOpenSlots call
ChangeNumOpenSlotsCallback_iCallback :: iSteamPartiesCallbacks + 4

// The list of possible Party beacon locations has changed
AvailableBeaconLocationsUpdated_iCallback :: iSteamPartiesCallbacks + 5

// The list of active beacons may have changed
ActiveBeaconsUpdated_iCallback :: iSteamPartiesCallbacks + 6


// From: isteamnetworking.h

// callback notification - a user wants to talk to us over the P2P channel via the SendP2PPacket() API
// in response, a call to AcceptP2PPacketsFromUser() needs to be made, if you want to talk with them
P2PSessionRequest_iCallback :: iSteamNetworkingCallbacks + 2

// callback notification - packets can't get through to the specified user via the SendP2PPacket() API
// all packets queued packets unsent at this point will be dropped
// further attempts to send will retry making the connection (but will be dropped if we fail again)
P2PSessionConnectFail_iCallback :: iSteamNetworkingCallbacks + 3

// callback notification - status of a socket has changed
// used as part of the CreateListenSocket() / CreateP2PConnectionSocket() 
SocketStatusCallback_iCallback :: iSteamNetworkingCallbacks + 1


// From: isteamnetworkingmessages.h

/// Posted when a remote host is sending us a message, and we do not already have a session with them
SteamNetworkingMessagesSessionRequest_iCallback :: iSteamNetworkingMessagesCallbacks + 1

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
SteamNetworkingMessagesSessionFailed_iCallback :: iSteamNetworkingMessagesCallbacks + 2


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
///   See ISteamNetworkigSockets::AcceptConnection.
/// - A connection you initiated has been accepted by the remote host.
///   m_eOldState = k_ESteamNetworkingConnectionState_Connecting, and
///   m_info.m_eState = k_ESteamNetworkingConnectionState_Connected.
///   Some connections might transition to k_ESteamNetworkingConnectionState_FindingRoute first.
/// - A connection has been actively rejected or closed by the remote host.
///   m_eOldState = k_ESteamNetworkingConnectionState_Connecting or k_ESteamNetworkingConnectionState_Connected,
///   and m_info.m_eState = k_ESteamNetworkingConnectionState_ClosedByPeer.  m_info.m_eEndReason
///   and m_info.m_szEndDebug will have for more details.
///   NOTE: upon receiving this callback, you must still destroy the connection using
///   ISteamNetworkingSockets::CloseConnection to free up local resources.  (The details
///   passed to the function are not used in this case, since the connection is already closed.)
/// - A problem was detected with the connection, and it has been closed by the local host.
///   The most common failure is timeout, but other configuration or authentication failures
///   can cause this.  m_eOldState = k_ESteamNetworkingConnectionState_Connecting or
///   k_ESteamNetworkingConnectionState_Connected, and m_info.m_eState = k_ESteamNetworkingConnectionState_ProblemDetectedLocally.
///   m_info.m_eEndReason and m_info.m_szEndDebug will have for more details.
///   NOTE: upon receiving this callback, you must still destroy the connection using
///   ISteamNetworkingSockets::CloseConnection to free up local resources.  (The details
///   passed to the function are not used in this case, since the connection is already closed.)
///
/// Remember that callbacks are posted to a queue, and networking connections can
/// change at any time.  It is possible that the connection has already changed
/// state by the time you process this callback.
///
/// Also note that callbacks will be posted when connections are created and destroyed by your own API calls.
SteamNetConnectionStatusChangedCallback_iCallback :: iSteamNetworkingSocketsCallbacks + 1

/// A struct used to describe our readiness to participate in authenticated,
/// encrypted communication.  In order to do this we need:
///
/// - The list of trusted CA certificates that might be relevant for this
///   app.
/// - A valid certificate issued by a CA.
///
/// This callback is posted whenever the state of our readiness changes.
SteamNetAuthenticationStatus_iCallback :: iSteamNetworkingSocketsCallbacks + 2


// From: isteamnetworkingutils.h

/// A struct used to describe our readiness to use the relay network.
/// To do this we first need to fetch the network configuration,
/// which describes what POPs are available.
SteamRelayNetworkStatus_iCallback :: iSteamNetworkingUtilsCallbacks + 1


// From: isteamparentalsettings.h

// Purpose: Callback for querying UGC
SteamParentalSettingsChanged_iCallback :: ISteamParentalSettingsCallbacks + 1


// From: isteamremotestorage.h

// Purpose: The result of a call to FileShare()
RemoteStorageFileShareResult_iCallback :: iSteamRemoteStorageCallbacks + 7

// iSteamRemoteStorageCallbacks + 8 is deprecated! Do not reuse

// Purpose: The result of a call to PublishFile()
RemoteStoragePublishFileResult_iCallback :: iSteamRemoteStorageCallbacks + 9

// iSteamRemoteStorageCallbacks + 10 is deprecated! Do not reuse

// Purpose: The result of a call to DeletePublishedFile()
RemoteStorageDeletePublishedFileResult_iCallback :: iSteamRemoteStorageCallbacks + 11

// Purpose: The result of a call to EnumerateUserPublishedFiles()
RemoteStorageEnumerateUserPublishedFilesResult_iCallback :: iSteamRemoteStorageCallbacks + 12

// Purpose: The result of a call to SubscribePublishedFile()
RemoteStorageSubscribePublishedFileResult_iCallback :: iSteamRemoteStorageCallbacks + 13

// Purpose: The result of a call to EnumerateSubscribePublishedFiles()
RemoteStorageEnumerateUserSubscribedFilesResult_iCallback :: iSteamRemoteStorageCallbacks + 14

// Purpose: The result of a call to UnsubscribePublishedFile()
RemoteStorageUnsubscribePublishedFileResult_iCallback :: iSteamRemoteStorageCallbacks + 15

// Purpose: The result of a call to CommitPublishedFileUpdate()
RemoteStorageUpdatePublishedFileResult_iCallback :: iSteamRemoteStorageCallbacks + 16

// Purpose: The result of a call to UGCDownload()
RemoteStorageDownloadUGCResult_iCallback :: iSteamRemoteStorageCallbacks + 17

// Purpose: The result of a call to GetPublishedFileDetails()
RemoteStorageGetPublishedFileDetailsResult_iCallback :: iSteamRemoteStorageCallbacks + 18

RemoteStorageEnumerateWorkshopFilesResult_iCallback :: iSteamRemoteStorageCallbacks + 19

// Purpose: The result of GetPublishedItemVoteDetails
RemoteStorageGetPublishedItemVoteDetailsResult_iCallback :: iSteamRemoteStorageCallbacks + 20

// Purpose: User subscribed to a file for the app (from within the app or on the web)
RemoteStoragePublishedFileSubscribed_iCallback :: iSteamRemoteStorageCallbacks + 21

// Purpose: User unsubscribed from a file for the app (from within the app or on the web)
RemoteStoragePublishedFileUnsubscribed_iCallback :: iSteamRemoteStorageCallbacks + 22

// Purpose: Published file that a user owns was deleted (from within the app or the web)
RemoteStoragePublishedFileDeleted_iCallback :: iSteamRemoteStorageCallbacks + 23

// Purpose: The result of a call to UpdateUserPublishedItemVote()
RemoteStorageUpdateUserPublishedItemVoteResult_iCallback :: iSteamRemoteStorageCallbacks + 24

// Purpose: The result of a call to GetUserPublishedItemVoteDetails()
RemoteStorageUserVoteDetails_iCallback :: iSteamRemoteStorageCallbacks + 25

RemoteStorageEnumerateUserSharedWorkshopFilesResult_iCallback :: iSteamRemoteStorageCallbacks + 26

RemoteStorageSetUserPublishedFileActionResult_iCallback :: iSteamRemoteStorageCallbacks + 27

RemoteStorageEnumeratePublishedFilesByUserActionResult_iCallback :: iSteamRemoteStorageCallbacks + 28

// Purpose: Called periodically while a PublishWorkshopFile is in progress
RemoteStoragePublishFileProgress_iCallback :: iSteamRemoteStorageCallbacks + 29

// Purpose: Called when the content for a published file is updated
RemoteStoragePublishedFileUpdated_iCallback :: iSteamRemoteStorageCallbacks + 30

// Purpose: Called when a FileWriteAsync completes
RemoteStorageFileWriteAsyncComplete_iCallback :: iSteamRemoteStorageCallbacks + 31

// Purpose: Called when a FileReadAsync completes
RemoteStorageFileReadAsyncComplete_iCallback :: iSteamRemoteStorageCallbacks + 32


// From: isteamscreenshots.h

// Purpose: Screenshot successfully written or otherwise added to the library
// and can now be tagged
ScreenshotReady_iCallback :: iSteamScreenshotsCallbacks + 1

// Purpose: Screenshot has been requested by the user.  Only sent if
// HookScreenshots() has been called, in which case Steam will not take
// the screenshot itself.
ScreenshotRequested_iCallback :: iSteamScreenshotsCallbacks + 2


// From: isteamugc.h

// Purpose: Callback for querying UGC
SteamUGCQueryCompleted_iCallback :: iSteamUGCCallbacks + 1

// Purpose: Callback for requesting details on one piece of UGC
SteamUGCRequestUGCDetailsResult_iCallback :: iSteamUGCCallbacks + 2

// Purpose: result for ISteamUGC::CreateItem() 
CreateItemResult_iCallback :: iSteamUGCCallbacks + 3

// Purpose: result for ISteamUGC::SubmitItemUpdate() 
SubmitItemUpdateResult_iCallback :: iSteamUGCCallbacks + 4

// Purpose: a Workshop item has been installed or updated
ItemInstalled_iCallback :: iSteamUGCCallbacks + 5

// Purpose: result of DownloadItem(), existing item files can be accessed again
DownloadItemResult_iCallback :: iSteamUGCCallbacks + 6

// Purpose: result of AddItemToFavorites() or RemoveItemFromFavorites()
UserFavoriteItemsListChanged_iCallback :: iSteamUGCCallbacks + 7

// Purpose: The result of a call to SetUserItemVote()
SetUserItemVoteResult_iCallback :: iSteamUGCCallbacks + 8

// Purpose: The result of a call to GetUserItemVote()
GetUserItemVoteResult_iCallback :: iSteamUGCCallbacks + 9

// Purpose: The result of a call to StartPlaytimeTracking()
StartPlaytimeTrackingResult_iCallback :: iSteamUGCCallbacks + 10

// Purpose: The result of a call to StopPlaytimeTracking()
StopPlaytimeTrackingResult_iCallback :: iSteamUGCCallbacks + 11

// Purpose: The result of a call to AddDependency
AddUGCDependencyResult_iCallback :: iSteamUGCCallbacks + 12

// Purpose: The result of a call to RemoveDependency
RemoveUGCDependencyResult_iCallback :: iSteamUGCCallbacks + 13

// Purpose: The result of a call to AddAppDependency
AddAppDependencyResult_iCallback :: iSteamUGCCallbacks + 14

// Purpose: The result of a call to RemoveAppDependency
RemoveAppDependencyResult_iCallback :: iSteamUGCCallbacks + 15

// Purpose: The result of a call to GetAppDependencies.  Callback may be called
//			multiple times until all app dependencies have been returned.
GetAppDependenciesResult_iCallback :: iSteamUGCCallbacks + 16

// Purpose: The result of a call to DeleteItem
DeleteItemResult_iCallback :: iSteamUGCCallbacks + 17

// Purpose: signal that the list of subscribed items changed
UserSubscribedItemsListChanged_iCallback :: iSteamUGCCallbacks + 18

// Purpose: Status of the user's acceptable/rejection of the app's specific Workshop EULA
WorkshopEULAStatus_iCallback :: iSteamUGCCallbacks + 20


// From: isteamuser.h

// Purpose: called when a connections to the Steam back-end has been established
//			this means the Steam client now has a working connection to the Steam servers
//			usually this will have occurred before the game has launched, and should
//			only be seen if the user has dropped connection due to a networking issue
//			or a Steam server update
SteamServersConnected_iCallback :: iSteamUserCallbacks + 1

// Purpose: called when a connection attempt has failed
//			this will occur periodically if the Steam client is not connected, 
//			and has failed in it's retry to establish a connection
SteamServerConnectFailure_iCallback :: iSteamUserCallbacks + 2


// Purpose: called if the client has lost connection to the Steam servers
//			real-time services will be disabled until a matching SteamServersConnected_t has been posted
SteamServersDisconnected_iCallback :: iSteamUserCallbacks + 3


// Purpose: Sent by the Steam server to the client telling it to disconnect from the specified game server,
//			which it may be in the process of or already connected to.
//			The game client should immediately disconnect upon receiving this message.
//			This can usually occur if the user doesn't have rights to play on the game server.
ClientGameServerDeny_iCallback :: iSteamUserCallbacks + 13


// Purpose: called when the callback system for this client is in an error state (and has flushed pending callbacks)
//			When getting this message the client should disconnect from Steam, reset any stored Steam state and reconnect.
//			This usually occurs in the rare event the Steam client has some kind of fatal error.
IPCFailure_iCallback :: iSteamUserCallbacks + 17

// Purpose: Signaled whenever licenses change
LicensesUpdated_iCallback :: iSteamUserCallbacks + 25

// callback for BeginAuthSession
ValidateAuthTicketResponse_iCallback :: iSteamUserCallbacks + 43

// Purpose: called when a user has responded to a microtransaction authorization request
MicroTxnAuthorizationResponse_iCallback :: iSteamUserCallbacks + 52

// Purpose: Result from RequestEncryptedAppTicket
EncryptedAppTicketResponse_iCallback :: iSteamUserCallbacks + 54

// callback for GetAuthSessionTicket
GetAuthSessionTicketResponse_iCallback :: iSteamUserCallbacks + 63

// Purpose: sent to your game in response to a steam://gamewebcallback/ command
GameWebCallback_iCallback :: iSteamUserCallbacks + 64

// Purpose: sent to your game in response to ISteamUser::RequestStoreAuthURL
StoreAuthURLResponse_iCallback :: iSteamUserCallbacks + 65

// Purpose: sent in response to ISteamUser::GetMarketEligibility
MarketEligibilityResponse_iCallback :: iSteamUserCallbacks + 66

// Purpose: sent for games with enabled anti indulgence / duration control, for
// enabled users. Lets the game know whether the user can keep playing or
// whether the game should exit, and returns info about remaining gameplay time.
//
// This callback is fired asynchronously in response to timers triggering.
// It is also fired in response to calls to GetDurationControl().
DurationControl_iCallback :: iSteamUserCallbacks + 67


// From: isteamuserstats.h

// Purpose: called when the latests stats and achievements have been received
//			from the server
UserStatsReceived_iCallback :: iSteamUserStatsCallbacks + 1

// Purpose: result of a request to store the user stats for a game
UserStatsStored_iCallback :: iSteamUserStatsCallbacks + 2

// Purpose: result of a request to store the achievements for a game, or an 
//			"indicate progress" call. If both m_nCurProgress and m_nMaxProgress
//			are zero, that means the achievement has been fully unlocked.
UserAchievementStored_iCallback :: iSteamUserStatsCallbacks + 3

// Purpose: call result for finding a leaderboard, returned as a result of FindOrCreateLeaderboard() or FindLeaderboard()
//			use CCallResult<> to map this async result to a member function
LeaderboardFindResult_iCallback :: iSteamUserStatsCallbacks + 4

// Purpose: call result indicating scores for a leaderboard have been downloaded and are ready to be retrieved, returned as a result of DownloadLeaderboardEntries()
//			use CCallResult<> to map this async result to a member function
LeaderboardScoresDownloaded_iCallback :: iSteamUserStatsCallbacks + 5

// Purpose: call result indicating scores has been uploaded, returned as a result of UploadLeaderboardScore()
//			use CCallResult<> to map this async result to a member function
LeaderboardScoreUploaded_iCallback :: iSteamUserStatsCallbacks + 6

NumberOfCurrentPlayers_iCallback :: iSteamUserStatsCallbacks + 7

// Purpose: Callback indicating that a user's stats have been unloaded.
//  Call RequestUserStats again to access stats for this user
UserStatsUnloaded_iCallback :: iSteamUserStatsCallbacks + 8

// Purpose: Callback indicating that an achievement icon has been fetched
UserAchievementIconFetched_iCallback :: iSteamUserStatsCallbacks + 9

// Purpose: Callback indicating that global achievement percentages are fetched
GlobalAchievementPercentagesReady_iCallback :: iSteamUserStatsCallbacks + 10

// Purpose: call result indicating UGC has been uploaded, returned as a result of SetLeaderboardUGC()
LeaderboardUGCSet_iCallback :: iSteamUserStatsCallbacks + 11

// Purpose: callback indicating that PS3 trophies have been installed
PS3TrophiesInstalled_iCallback :: iSteamUserStatsCallbacks + 12
// Purpose: callback indicating global stats have been received.
//	Returned as a result of RequestGlobalStats()
GlobalStatsReceived_iCallback :: iSteamUserStatsCallbacks + 12


// From: isteamutils.h

// Purpose: The country of the user changed
IPCountry_iCallback :: iSteamUtilsCallbacks + 1

// Purpose: Fired when running on a laptop and less than 10 minutes of battery is left, fires then every minute
LowBatteryPower_iCallback :: iSteamUtilsCallbacks + 2

// Purpose: called when a SteamAsyncCall_t has completed (or failed)
SteamAPICallCompleted_iCallback :: iSteamUtilsCallbacks + 3

// called when Steam wants to shutdown
SteamShutdown_iCallback :: iSteamUtilsCallbacks + 4

CheckFileSignature_iCallback :: iSteamUtilsCallbacks + 5

// iSteamUtilsCallbacks + 13 is taken

// Full Screen gamepad text input has been closed
GamepadTextInputDismissed_iCallback :: iSteamUtilsCallbacks + 14

// iSteamUtilsCallbacks + 15 through 35 are taken

// iSteamUtilsCallbacks + 37 is taken

// The floating on-screen keyboard has been closed
FloatingGamepadTextInputDismissed_iCallback :: iSteamUtilsCallbacks + 38


/// Internal structure used in manual callback dispatch
CallbackMsg :: struct #align CALLBACK_ALIGN {
    hSteamUser: HSteamUser, // Specific user to whom this callback applies.
    iCallback:  c.int, // Callback identifier.  (Corresponds to the k_iCallback enum in the callback structure.)
    pubParam:   ^uint8, // Points to the callback structure
    cubParam:   c.int, // Size of the data pointed to by m_pubParam
}

package steamworks
import "core:c"
foreign import lib "steam_api64.lib"

intptr :: distinct int

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

SteamUser: proc "c" () -> ^ISteamUser : SteamUser_v021
SteamFriends: proc "c" () -> ^ISteamFriends : SteamFriends_v017
SteamUtils: proc "c" () -> ^ISteamUtils : SteamUtils_v010
SteamMatchmaking: proc "c" () -> ^ISteamMatchmaking : SteamMatchmaking_v009
SteamMatchmakingServers: proc "c" () -> ^ISteamMatchmakingServers : SteamMatchmakingServers_v002
SteamGameSearch: proc "c" () -> ^ISteamGameSearch : SteamGameSearch_v001
SteamParties: proc "c" () -> ^ISteamParties : SteamParties_v002
SteamRemoteStorage: proc "c" () -> ^ISteamRemoteStorage : SteamRemoteStorage_v016
SteamUserStats: proc "c" () -> ^ISteamUserStats : SteamUserStats_v012
SteamApps: proc "c" () -> ^ISteamApps : SteamApps_v008
SteamNetworking: proc "c" () -> ^ISteamNetworking : SteamNetworking_v006
SteamScreenshots: proc "c" () -> ^ISteamScreenshots : SteamScreenshots_v003
SteamMusic: proc "c" () -> ^ISteamMusic : SteamMusic_v001
SteamMusicRemote: proc "c" () -> ^ISteamMusicRemote : SteamMusicRemote_v001
SteamHTTP: proc "c" () -> ^ISteamHTTP : SteamHTTP_v003
SteamInput: proc "c" () -> ^ISteamInput : SteamInput_v006
SteamController: proc "c" () -> ^ISteamController : SteamController_v008
SteamUGC: proc "c" () -> ^ISteamUGC : SteamUGC_v016
SteamAppList: proc "c" () -> ^ISteamAppList : SteamAppList_v001

ISteamHTMLSurface_EHTMLMouseButton :: enum {
	eHTMLMouseButton_Left   = 0,
	eHTMLMouseButton_Right  = 1,
	eHTMLMouseButton_Middle = 2,
}

ISteamHTMLSurface_EMouseCursor :: enum {
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

ISteamHTMLSurface_EHTMLKeyModifiers :: enum {
	k_eHTMLKeyModifier_None      = 0,
	k_eHTMLKeyModifier_AltDown   = 1,
	k_eHTMLKeyModifier_CtrlDown  = 2,
	k_eHTMLKeyModifier_ShiftDown = 4,
}

SteamHTMLSurface: proc "c" () -> ^ISteamHTMLSurface : SteamHTMLSurface_v005
SteamInventory: proc "c" () -> ^ISteamInventory : SteamInventory_v003
SteamVideo: proc "c" () -> ^ISteamVideo : SteamVideo_v002
SteamParentalSettings: proc "c" () -> ^ISteamParentalSettings : SteamParentalSettings_v001
SteamRemotePlay: proc "c" () -> ^ISteamRemotePlay : SteamRemotePlay_v001
SteamNetworkingMessages_SteamAPI: proc "c" () -> ^ISteamNetworkingMessages : SteamNetworkingMessages_SteamAPI_v002
SteamNetworkingSockets_SteamAPI: proc "c" () -> ^ISteamNetworkingSockets : SteamNetworkingSockets_SteamAPI_v012

ISteamClient :: distinct rawptr
ISteamUser :: distinct rawptr
ISteamFriends :: distinct rawptr
ISteamUtils :: distinct rawptr
ISteamMatchmaking :: distinct rawptr
ISteamMatchmakingServerListResponse :: distinct rawptr
ISteamMatchmakingPingResponse :: distinct rawptr
ISteamMatchmakingPlayersResponse :: distinct rawptr
ISteamMatchmakingRulesResponse :: distinct rawptr
ISteamMatchmakingServers :: distinct rawptr
ISteamGameSearch :: distinct rawptr
ISteamParties :: distinct rawptr
ISteamRemoteStorage :: distinct rawptr
ISteamUserStats :: distinct rawptr
ISteamApps :: distinct rawptr
ISteamNetworking :: distinct rawptr
ISteamScreenshots :: distinct rawptr
ISteamMusic :: distinct rawptr
ISteamMusicRemote :: distinct rawptr
ISteamHTTP :: distinct rawptr
ISteamInput :: distinct rawptr
ISteamController :: distinct rawptr
ISteamUGC :: distinct rawptr
ISteamAppList :: distinct rawptr
ISteamHTMLSurface :: distinct rawptr
ISteamInventory :: distinct rawptr
ISteamVideo :: distinct rawptr
ISteamParentalSettings :: distinct rawptr
ISteamRemotePlay :: distinct rawptr
ISteamNetworkingMessages :: distinct rawptr
ISteamNetworkingSockets :: distinct rawptr
ISteamNetworkingUtils :: distinct rawptr
ISteamGameServer :: distinct rawptr
ISteamGameServerStats :: distinct rawptr
ISteamNetworkingFakeUDPPort :: distinct rawptr

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

SteamAPIWarningMessageHook_t :: proc "c" (_: int, _: cstring)

@(link_prefix = "SteamAPI_", default_calling_convention = "c")
foreign lib {
	ISteamClient_CreateSteamPipe :: proc(self: ^ISteamClient) -> HSteamPipe ---
	ISteamClient_BReleaseSteamPipe :: proc(self: ^ISteamClient, hSteamPipe: HSteamPipe) -> bool ---
	ISteamClient_ConnectToGlobalUser :: proc(self: ^ISteamClient, hSteamPipe: HSteamPipe) -> HSteamUser ---
	ISteamClient_CreateLocalUser :: proc(self: ^ISteamClient, phSteamPipe: ^HSteamPipe, eAccountType: EAccountType) -> HSteamUser ---
	ISteamClient_ReleaseUser :: proc(self: ^ISteamClient, hSteamPipe: HSteamPipe, hUser: HSteamUser) ---
	ISteamClient_GetISteamUser :: proc(self: ^ISteamClient, hSteamUser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: cstring) -> ^ISteamUser ---
	ISteamClient_GetISteamGameServer :: proc(self: ^ISteamClient, hSteamUser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: cstring) -> ^ISteamGameServer ---
	ISteamClient_SetLocalIPBinding :: proc(self: ^ISteamClient, unIP: ^SteamIPAddress_t, usPort: uint16) ---
	ISteamClient_GetISteamFriends :: proc(self: ^ISteamClient, hSteamUser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: cstring) -> ^ISteamFriends ---
	ISteamClient_GetISteamUtils :: proc(self: ^ISteamClient, hSteamPipe: HSteamPipe, pchVersion: cstring) -> ^ISteamUtils ---
	ISteamClient_GetISteamMatchmaking :: proc(self: ^ISteamClient, hSteamUser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: cstring) -> ^ISteamMatchmaking ---
	ISteamClient_GetISteamMatchmakingServers :: proc(self: ^ISteamClient, hSteamUser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: cstring) -> ^ISteamMatchmakingServers ---
	ISteamClient_GetISteamGenericInterface :: proc(self: ^ISteamClient, hSteamUser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: cstring) -> rawptr ---
	ISteamClient_GetISteamUserStats :: proc(self: ^ISteamClient, hSteamUser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: cstring) -> ^ISteamUserStats ---
	ISteamClient_GetISteamGameServerStats :: proc(self: ^ISteamClient, hSteamuser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: cstring) -> ^ISteamGameServerStats ---
	ISteamClient_GetISteamApps :: proc(self: ^ISteamClient, hSteamUser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: cstring) -> ^ISteamApps ---
	ISteamClient_GetISteamNetworking :: proc(self: ^ISteamClient, hSteamUser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: cstring) -> ^ISteamNetworking ---
	ISteamClient_GetISteamRemoteStorage :: proc(self: ^ISteamClient, hSteamuser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: cstring) -> ^ISteamRemoteStorage ---
	ISteamClient_GetISteamScreenshots :: proc(self: ^ISteamClient, hSteamuser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: cstring) -> ^ISteamScreenshots ---
	ISteamClient_GetISteamGameSearch :: proc(self: ^ISteamClient, hSteamuser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: cstring) -> ^ISteamGameSearch ---
	ISteamClient_GetIPCCallCount :: proc(self: ^ISteamClient) -> uint32 ---
	ISteamClient_SetWarningMessageHook :: proc(self: ^ISteamClient, pFunction: SteamAPIWarningMessageHook_t) ---
	ISteamClient_BShutdownIfAllPipesClosed :: proc(self: ^ISteamClient) -> bool ---
	ISteamClient_GetISteamHTTP :: proc(self: ^ISteamClient, hSteamuser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: cstring) -> ^ISteamHTTP ---
	ISteamClient_GetISteamController :: proc(self: ^ISteamClient, hSteamUser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: cstring) -> ^ISteamController ---
	ISteamClient_GetISteamUGC :: proc(self: ^ISteamClient, hSteamUser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: cstring) -> ^ISteamUGC ---
	ISteamClient_GetISteamAppList :: proc(self: ^ISteamClient, hSteamUser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: cstring) -> ^ISteamAppList ---
	ISteamClient_GetISteamMusic :: proc(self: ^ISteamClient, hSteamuser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: cstring) -> ^ISteamMusic ---
	ISteamClient_GetISteamMusicRemote :: proc(self: ^ISteamClient, hSteamuser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: cstring) -> ^ISteamMusicRemote ---
	ISteamClient_GetISteamHTMLSurface :: proc(self: ^ISteamClient, hSteamuser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: cstring) -> ^ISteamHTMLSurface ---
	ISteamClient_GetISteamInventory :: proc(self: ^ISteamClient, hSteamuser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: cstring) -> ^ISteamInventory ---
	ISteamClient_GetISteamVideo :: proc(self: ^ISteamClient, hSteamuser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: cstring) -> ^ISteamVideo ---
	ISteamClient_GetISteamParentalSettings :: proc(self: ^ISteamClient, hSteamuser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: cstring) -> ^ISteamParentalSettings ---
	ISteamClient_GetISteamInput :: proc(self: ^ISteamClient, hSteamUser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: cstring) -> ^ISteamInput ---
	ISteamClient_GetISteamParties :: proc(self: ^ISteamClient, hSteamUser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: cstring) -> ^ISteamParties ---
	ISteamClient_GetISteamRemotePlay :: proc(self: ^ISteamClient, hSteamUser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: cstring) -> ^ISteamRemotePlay ---

	ISteamUser_GetHSteamUser :: proc(self: ^ISteamUser) -> HSteamUser ---
	ISteamUser_BLoggedOn :: proc(self: ^ISteamUser) -> bool ---
	ISteamUser_GetSteamID :: proc(self: ^ISteamUser) -> CSteamID ---
	ISteamUser_InitiateGameConnection_DEPRECATED :: proc(self: ^ISteamUser, pAuthBlob: rawptr, cbMaxAuthBlob: c.int, steamIDGameServer: CSteamID, unIPServer: uint32, usPortServer: uint16, bSecure: bool) -> c.int ---
	ISteamUser_TerminateGameConnection_DEPRECATED :: proc(self: ^ISteamUser, unIPServer: uint32, usPortServer: uint16) ---
	ISteamUser_TrackAppUsageEvent :: proc(self: ^ISteamUser, gameID: CGameID, eAppUsageEvent: c.int, pchExtraInfo: cstring) ---
	ISteamUser_GetUserDataFolder :: proc(self: ^ISteamUser, pchBuffer: ^u8, cubBuffer: c.int) -> bool ---
	ISteamUser_StartVoiceRecording :: proc(self: ^ISteamUser) ---
	ISteamUser_StopVoiceRecording :: proc(self: ^ISteamUser) ---
	ISteamUser_GetAvailableVoice :: proc(self: ^ISteamUser, pcbCompressed: ^uint32, pcbUncompressed_Deprecated: ^uint32, nUncompressedVoiceDesiredSampleRate_Deprecated: uint32) -> EVoiceResult ---
	ISteamUser_GetVoice :: proc(self: ^ISteamUser, bWantCompressed: bool, pDestBuffer: rawptr, cbDestBufferSize: uint32, nBytesWritten: ^uint32, bWantUncompressed_Deprecated: bool, pUncompressedDestBuffer_Deprecated: rawptr, cbUncompressedDestBufferSize_Deprecated: uint32, nUncompressBytesWritten_Deprecated: ^uint32, nUncompressedVoiceDesiredSampleRate_Deprecated: uint32) -> EVoiceResult ---
	ISteamUser_DecompressVoice :: proc(self: ^ISteamUser, pCompressed: rawptr, cbCompressed: uint32, pDestBuffer: rawptr, cbDestBufferSize: uint32, nBytesWritten: ^uint32, nDesiredSampleRate: uint32) -> EVoiceResult ---
	ISteamUser_GetVoiceOptimalSampleRate :: proc(self: ^ISteamUser) -> uint32 ---
	ISteamUser_GetAuthSessionTicket :: proc(self: ^ISteamUser, pTicket: rawptr, cbMaxTicket: c.int, pcbTicket: ^uint32) -> HAuthTicket ---
	ISteamUser_BeginAuthSession :: proc(self: ^ISteamUser, pAuthTicket: rawptr, cbAuthTicket: c.int, steamID: CSteamID) -> EBeginAuthSessionResult ---
	ISteamUser_EndAuthSession :: proc(self: ^ISteamUser, steamID: CSteamID) ---
	ISteamUser_CancelAuthTicket :: proc(self: ^ISteamUser, hAuthTicket: HAuthTicket) ---
	ISteamUser_UserHasLicenseForApp :: proc(self: ^ISteamUser, steamID: CSteamID, appID: AppId_t) -> EUserHasLicenseForAppResult ---
	ISteamUser_BIsBehindNAT :: proc(self: ^ISteamUser) -> bool ---
	ISteamUser_AdvertiseGame :: proc(self: ^ISteamUser, steamIDGameServer: CSteamID, unIPServer: uint32, usPortServer: uint16) ---
	ISteamUser_RequestEncryptedAppTicket :: proc(self: ^ISteamUser, pDataToInclude: rawptr, cbDataToInclude: c.int) -> SteamAPICall_t ---
	ISteamUser_GetEncryptedAppTicket :: proc(self: ^ISteamUser, pTicket: rawptr, cbMaxTicket: c.int, pcbTicket: ^uint32) -> bool ---
	ISteamUser_GetGameBadgeLevel :: proc(self: ^ISteamUser, nSeries: c.int, bFoil: bool) -> c.int ---
	ISteamUser_GetPlayerSteamLevel :: proc(self: ^ISteamUser) -> c.int ---
	ISteamUser_RequestStoreAuthURL :: proc(self: ^ISteamUser, pchRedirectURL: cstring) -> SteamAPICall_t ---
	ISteamUser_BIsPhoneVerified :: proc(self: ^ISteamUser) -> bool ---
	ISteamUser_BIsTwoFactorEnabled :: proc(self: ^ISteamUser) -> bool ---
	ISteamUser_BIsPhoneIdentifying :: proc(self: ^ISteamUser) -> bool ---
	ISteamUser_BIsPhoneRequiringVerification :: proc(self: ^ISteamUser) -> bool ---
	ISteamUser_GetMarketEligibility :: proc(self: ^ISteamUser) -> SteamAPICall_t ---
	ISteamUser_GetDurationControl :: proc(self: ^ISteamUser) -> SteamAPICall_t ---
	ISteamUser_BSetDurationControlOnlineState :: proc(self: ^ISteamUser, eNewState: EDurationControlOnlineState) -> bool ---
	SteamUser_v021 :: proc() -> ^ISteamUser ---

	ISteamFriends_GetPersonaName :: proc(self: ^ISteamFriends) -> cstring ---
	ISteamFriends_SetPersonaName :: proc(self: ^ISteamFriends, pchPersonaName: cstring) -> SteamAPICall_t ---
	ISteamFriends_GetPersonaState :: proc(self: ^ISteamFriends) -> EPersonaState ---
	ISteamFriends_GetFriendCount :: proc(self: ^ISteamFriends, iFriendFlags: c.int) -> c.int ---
	ISteamFriends_GetFriendByIndex :: proc(self: ^ISteamFriends, iFriend: c.int, iFriendFlags: c.int) -> CSteamID ---
	ISteamFriends_GetFriendRelationship :: proc(self: ^ISteamFriends, steamIDFriend: CSteamID) -> EFriendRelationship ---
	ISteamFriends_GetFriendPersonaState :: proc(self: ^ISteamFriends, steamIDFriend: CSteamID) -> EPersonaState ---
	ISteamFriends_GetFriendPersonaName :: proc(self: ^ISteamFriends, steamIDFriend: CSteamID) -> cstring ---
	ISteamFriends_GetFriendGamePlayed :: proc(self: ^ISteamFriends, steamIDFriend: CSteamID, pFriendGameInfo: ^FriendGameInfo_t) -> bool ---
	ISteamFriends_GetFriendPersonaNameHistory :: proc(self: ^ISteamFriends, steamIDFriend: CSteamID, iPersonaName: c.int) -> cstring ---
	ISteamFriends_GetFriendSteamLevel :: proc(self: ^ISteamFriends, steamIDFriend: CSteamID) -> c.int ---
	ISteamFriends_GetPlayerNickname :: proc(self: ^ISteamFriends, steamIDPlayer: CSteamID) -> cstring ---
	ISteamFriends_GetFriendsGroupCount :: proc(self: ^ISteamFriends) -> c.int ---
	ISteamFriends_GetFriendsGroupIDByIndex :: proc(self: ^ISteamFriends, iFG: c.int) -> FriendsGroupID_t ---
	ISteamFriends_GetFriendsGroupName :: proc(self: ^ISteamFriends, friendsGroupID: FriendsGroupID_t) -> cstring ---
	ISteamFriends_GetFriendsGroupMembersCount :: proc(self: ^ISteamFriends, friendsGroupID: FriendsGroupID_t) -> c.int ---
	ISteamFriends_GetFriendsGroupMembersList :: proc(self: ^ISteamFriends, friendsGroupID: FriendsGroupID_t, pOutSteamIDMembers: ^CSteamID, nMembersCount: c.int) ---
	ISteamFriends_HasFriend :: proc(self: ^ISteamFriends, steamIDFriend: CSteamID, iFriendFlags: c.int) -> bool ---
	ISteamFriends_GetClanCount :: proc(self: ^ISteamFriends) -> c.int ---
	ISteamFriends_GetClanByIndex :: proc(self: ^ISteamFriends, iClan: c.int) -> CSteamID ---
	ISteamFriends_GetClanName :: proc(self: ^ISteamFriends, steamIDClan: CSteamID) -> cstring ---
	ISteamFriends_GetClanTag :: proc(self: ^ISteamFriends, steamIDClan: CSteamID) -> cstring ---
	ISteamFriends_GetClanActivityCounts :: proc(self: ^ISteamFriends, steamIDClan: CSteamID, pnOnline: ^int, pnInGame: ^int, pnChatting: ^int) -> bool ---
	ISteamFriends_DownloadClanActivityCounts :: proc(self: ^ISteamFriends, psteamIDClans: ^CSteamID, cClansToRequest: c.int) -> SteamAPICall_t ---
	ISteamFriends_GetFriendCountFromSource :: proc(self: ^ISteamFriends, steamIDSource: CSteamID) -> c.int ---
	ISteamFriends_GetFriendFromSourceByIndex :: proc(self: ^ISteamFriends, steamIDSource: CSteamID, iFriend: c.int) -> CSteamID ---
	ISteamFriends_IsUserInSource :: proc(self: ^ISteamFriends, steamIDUser: CSteamID, steamIDSource: CSteamID) -> bool ---
	ISteamFriends_SetInGameVoiceSpeaking :: proc(self: ^ISteamFriends, steamIDUser: CSteamID, bSpeaking: bool) ---
	ISteamFriends_ActivateGameOverlay :: proc(self: ^ISteamFriends, pchDialog: cstring) ---
	ISteamFriends_ActivateGameOverlayToUser :: proc(self: ^ISteamFriends, pchDialog: cstring, steamID: CSteamID) ---
	ISteamFriends_ActivateGameOverlayToWebPage :: proc(self: ^ISteamFriends, pchURL: cstring, eMode: EActivateGameOverlayToWebPageMode) ---
	ISteamFriends_ActivateGameOverlayToStore :: proc(self: ^ISteamFriends, nAppID: AppId_t, eFlag: EOverlayToStoreFlag) ---
	ISteamFriends_SetPlayedWith :: proc(self: ^ISteamFriends, steamIDUserPlayedWith: CSteamID) ---
	ISteamFriends_ActivateGameOverlayInviteDialog :: proc(self: ^ISteamFriends, steamIDLobby: CSteamID) ---
	ISteamFriends_GetSmallFriendAvatar :: proc(self: ^ISteamFriends, steamIDFriend: CSteamID) -> c.int ---
	ISteamFriends_GetMediumFriendAvatar :: proc(self: ^ISteamFriends, steamIDFriend: CSteamID) -> c.int ---
	ISteamFriends_GetLargeFriendAvatar :: proc(self: ^ISteamFriends, steamIDFriend: CSteamID) -> c.int ---
	ISteamFriends_RequestUserInformation :: proc(self: ^ISteamFriends, steamIDUser: CSteamID, bRequireNameOnly: bool) -> bool ---
	ISteamFriends_RequestClanOfficerList :: proc(self: ^ISteamFriends, steamIDClan: CSteamID) -> SteamAPICall_t ---
	ISteamFriends_GetClanOwner :: proc(self: ^ISteamFriends, steamIDClan: CSteamID) -> CSteamID ---
	ISteamFriends_GetClanOfficerCount :: proc(self: ^ISteamFriends, steamIDClan: CSteamID) -> c.int ---
	ISteamFriends_GetClanOfficerByIndex :: proc(self: ^ISteamFriends, steamIDClan: CSteamID, iOfficer: c.int) -> CSteamID ---
	ISteamFriends_GetUserRestrictions :: proc(self: ^ISteamFriends) -> uint32 ---
	ISteamFriends_SetRichPresence :: proc(self: ^ISteamFriends, pchKey: cstring, pchValue: cstring) -> bool ---
	ISteamFriends_ClearRichPresence :: proc(self: ^ISteamFriends) ---
	ISteamFriends_GetFriendRichPresence :: proc(self: ^ISteamFriends, steamIDFriend: CSteamID, pchKey: cstring) -> cstring ---
	ISteamFriends_GetFriendRichPresenceKeyCount :: proc(self: ^ISteamFriends, steamIDFriend: CSteamID) -> c.int ---
	ISteamFriends_GetFriendRichPresenceKeyByIndex :: proc(self: ^ISteamFriends, steamIDFriend: CSteamID, iKey: c.int) -> cstring ---
	ISteamFriends_RequestFriendRichPresence :: proc(self: ^ISteamFriends, steamIDFriend: CSteamID) ---
	ISteamFriends_InviteUserToGame :: proc(self: ^ISteamFriends, steamIDFriend: CSteamID, pchConnectString: cstring) -> bool ---
	ISteamFriends_GetCoplayFriendCount :: proc(self: ^ISteamFriends) -> c.int ---
	ISteamFriends_GetCoplayFriend :: proc(self: ^ISteamFriends, iCoplayFriend: c.int) -> CSteamID ---
	ISteamFriends_GetFriendCoplayTime :: proc(self: ^ISteamFriends, steamIDFriend: CSteamID) -> c.int ---
	ISteamFriends_GetFriendCoplayGame :: proc(self: ^ISteamFriends, steamIDFriend: CSteamID) -> AppId_t ---
	ISteamFriends_JoinClanChatRoom :: proc(self: ^ISteamFriends, steamIDClan: CSteamID) -> SteamAPICall_t ---
	ISteamFriends_LeaveClanChatRoom :: proc(self: ^ISteamFriends, steamIDClan: CSteamID) -> bool ---
	ISteamFriends_GetClanChatMemberCount :: proc(self: ^ISteamFriends, steamIDClan: CSteamID) -> c.int ---
	ISteamFriends_GetChatMemberByIndex :: proc(self: ^ISteamFriends, steamIDClan: CSteamID, iUser: c.int) -> CSteamID ---
	ISteamFriends_SendClanChatMessage :: proc(self: ^ISteamFriends, steamIDClanChat: CSteamID, pchText: cstring) -> bool ---
	ISteamFriends_GetClanChatMessage :: proc(self: ^ISteamFriends, steamIDClanChat: CSteamID, iMessage: c.int, prgchText: rawptr, cchTextMax: c.int, peChatEntryType: ^EChatEntryType, psteamidChatter: ^CSteamID) -> c.int ---
	ISteamFriends_IsClanChatAdmin :: proc(self: ^ISteamFriends, steamIDClanChat: CSteamID, steamIDUser: CSteamID) -> bool ---
	ISteamFriends_IsClanChatWindowOpenInSteam :: proc(self: ^ISteamFriends, steamIDClanChat: CSteamID) -> bool ---
	ISteamFriends_OpenClanChatWindowInSteam :: proc(self: ^ISteamFriends, steamIDClanChat: CSteamID) -> bool ---
	ISteamFriends_CloseClanChatWindowInSteam :: proc(self: ^ISteamFriends, steamIDClanChat: CSteamID) -> bool ---
	ISteamFriends_SetListenForFriendsMessages :: proc(self: ^ISteamFriends, bInterceptEnabled: bool) -> bool ---
	ISteamFriends_ReplyToFriendMessage :: proc(self: ^ISteamFriends, steamIDFriend: CSteamID, pchMsgToSend: cstring) -> bool ---
	ISteamFriends_GetFriendMessage :: proc(self: ^ISteamFriends, steamIDFriend: CSteamID, iMessageID: c.int, pvData: rawptr, cubData: c.int, peChatEntryType: ^EChatEntryType) -> c.int ---
	ISteamFriends_GetFollowerCount :: proc(self: ^ISteamFriends, steamID: CSteamID) -> SteamAPICall_t ---
	ISteamFriends_IsFollowing :: proc(self: ^ISteamFriends, steamID: CSteamID) -> SteamAPICall_t ---
	ISteamFriends_EnumerateFollowingList :: proc(self: ^ISteamFriends, unStartIndex: uint32) -> SteamAPICall_t ---
	ISteamFriends_IsClanPublic :: proc(self: ^ISteamFriends, steamIDClan: CSteamID) -> bool ---
	ISteamFriends_IsClanOfficialGameGroup :: proc(self: ^ISteamFriends, steamIDClan: CSteamID) -> bool ---
	ISteamFriends_GetNumChatsWithUnreadPriorityMessages :: proc(self: ^ISteamFriends) -> c.int ---
	ISteamFriends_ActivateGameOverlayRemotePlayTogetherInviteDialog :: proc(self: ^ISteamFriends, steamIDLobby: CSteamID) ---
	ISteamFriends_RegisterProtocolInOverlayBrowser :: proc(self: ^ISteamFriends, pchProtocol: cstring) -> bool ---
	ISteamFriends_ActivateGameOverlayInviteDialogConnectString :: proc(self: ^ISteamFriends, pchConnectString: cstring) ---
	ISteamFriends_RequestEquippedProfileItems :: proc(self: ^ISteamFriends, steamID: CSteamID) -> SteamAPICall_t ---
	ISteamFriends_BHasEquippedProfileItem :: proc(self: ^ISteamFriends, steamID: CSteamID, itemType: ECommunityProfileItemType) -> bool ---
	ISteamFriends_GetProfileItemPropertyString :: proc(self: ^ISteamFriends, steamID: CSteamID, itemType: ECommunityProfileItemType, prop: ECommunityProfileItemProperty) -> cstring ---
	ISteamFriends_GetProfileItemPropertyUint :: proc(self: ^ISteamFriends, steamID: CSteamID, itemType: ECommunityProfileItemType, prop: ECommunityProfileItemProperty) -> uint32 ---
	SteamFriends_v017 :: proc() -> ^ISteamFriends ---

	ISteamUtils_GetSecondsSinceAppActive :: proc(self: ^ISteamUtils) -> uint32 ---
	ISteamUtils_GetSecondsSinceComputerActive :: proc(self: ^ISteamUtils) -> uint32 ---
	ISteamUtils_GetConnectedUniverse :: proc(self: ^ISteamUtils) -> EUniverse ---
	ISteamUtils_GetServerRealTime :: proc(self: ^ISteamUtils) -> uint32 ---
	ISteamUtils_GetIPCountry :: proc(self: ^ISteamUtils) -> cstring ---
	ISteamUtils_GetImageSize :: proc(self: ^ISteamUtils, iImage: c.int, pnWidth: ^uint32, pnHeight: ^uint32) -> bool ---
	ISteamUtils_GetImageRGBA :: proc(self: ^ISteamUtils, iImage: c.int, pubDest: ^uint8, nDestBufferSize: c.int) -> bool ---
	ISteamUtils_GetCurrentBatteryPower :: proc(self: ^ISteamUtils) -> uint8 ---
	ISteamUtils_GetAppID :: proc(self: ^ISteamUtils) -> uint32 ---
	ISteamUtils_SetOverlayNotificationPosition :: proc(self: ^ISteamUtils, eNotificationPosition: ENotificationPosition) ---
	ISteamUtils_IsAPICallCompleted :: proc(self: ^ISteamUtils, hSteamAPICall: SteamAPICall_t, pbFailed: ^bool) -> bool ---
	ISteamUtils_GetAPICallFailureReason :: proc(self: ^ISteamUtils, hSteamAPICall: SteamAPICall_t) -> ESteamAPICallFailure ---
	ISteamUtils_GetAPICallResult :: proc(self: ^ISteamUtils, hSteamAPICall: SteamAPICall_t, pCallback: rawptr, cubCallback: c.int, iCallbackExpected: c.int, pbFailed: ^bool) -> bool ---
	ISteamUtils_GetIPCCallCount :: proc(self: ^ISteamUtils) -> uint32 ---
	ISteamUtils_SetWarningMessageHook :: proc(self: ^ISteamUtils, pFunction: SteamAPIWarningMessageHook_t) ---
	ISteamUtils_IsOverlayEnabled :: proc(self: ^ISteamUtils) -> bool ---
	ISteamUtils_BOverlayNeedsPresent :: proc(self: ^ISteamUtils) -> bool ---
	ISteamUtils_CheckFileSignature :: proc(self: ^ISteamUtils, szFileName: cstring) -> SteamAPICall_t ---
	ISteamUtils_ShowGamepadTextInput :: proc(self: ^ISteamUtils, eInputMode: EGamepadTextInputMode, eLineInputMode: EGamepadTextInputLineMode, pchDescription: cstring, unCharMax: uint32, pchExistingText: cstring) -> bool ---
	ISteamUtils_GetEnteredGamepadTextLength :: proc(self: ^ISteamUtils) -> uint32 ---
	ISteamUtils_GetEnteredGamepadTextInput :: proc(self: ^ISteamUtils, pchText: u8, cchText: uint32) -> bool ---
	ISteamUtils_GetSteamUILanguage :: proc(self: ^ISteamUtils) -> cstring ---
	ISteamUtils_IsSteamRunningInVR :: proc(self: ^ISteamUtils) -> bool ---
	ISteamUtils_SetOverlayNotificationInset :: proc(self: ^ISteamUtils, nHorizontalInset: c.int, nVerticalInset: c.int) ---
	ISteamUtils_IsSteamInBigPictureMode :: proc(self: ^ISteamUtils) -> bool ---
	ISteamUtils_StartVRDashboard :: proc(self: ^ISteamUtils) ---
	ISteamUtils_IsVRHeadsetStreamingEnabled :: proc(self: ^ISteamUtils) -> bool ---
	ISteamUtils_SetVRHeadsetStreamingEnabled :: proc(self: ^ISteamUtils, bEnabled: bool) ---
	ISteamUtils_IsSteamChinaLauncher :: proc(self: ^ISteamUtils) -> bool ---
	ISteamUtils_InitFilterText :: proc(self: ^ISteamUtils, unFilterOptions: uint32) -> bool ---
	ISteamUtils_FilterText :: proc(self: ^ISteamUtils, eContext: ETextFilteringContext, sourceSteamID: CSteamID, pchInputMessage: cstring, pchOutFilteredText: ^u8, nByteSizeOutFilteredText: uint32) -> c.int ---
	ISteamUtils_GetIPv6ConnectivityState :: proc(self: ^ISteamUtils, eProtocol: ESteamIPv6ConnectivityProtocol) -> ESteamIPv6ConnectivityState ---
	ISteamUtils_IsSteamRunningOnSteamDeck :: proc(self: ^ISteamUtils) -> bool ---
	ISteamUtils_Showf32ingGamepadTextInput :: proc(self: ^ISteamUtils, eKeyboardMode: Ef32ingGamepadTextInputMode, nTextFieldXPosition: c.int, nTextFieldYPosition: c.int, nTextFieldWidth: c.int, nTextFieldHeight: c.int) -> bool ---
	ISteamUtils_SetGameLauncherMode :: proc(self: ^ISteamUtils, bLauncherMode: bool) ---
	ISteamUtils_Dismissf32ingGamepadTextInput :: proc(self: ^ISteamUtils) -> bool ---
	SteamUtils_v010 :: proc() -> ^ISteamUtils ---

	ISteamMatchmaking_GetFavoriteGameCount :: proc(self: ^ISteamMatchmaking) -> c.int ---
	ISteamMatchmaking_GetFavoriteGame :: proc(self: ^ISteamMatchmaking, iGame: c.int, pnAppID: ^AppId_t, pnIP: ^uint32, pnConnPort: ^uint16, pnQueryPort: ^uint16, punFlags: ^uint32, pRTime32LastPlayedOnServer: ^uint32) -> bool ---
	ISteamMatchmaking_AddFavoriteGame :: proc(self: ^ISteamMatchmaking, nAppID: AppId_t, nIP: uint32, nConnPort: uint16, nQueryPort: uint16, unFlags: uint32, rTime32LastPlayedOnServer: uint32) -> c.int ---
	ISteamMatchmaking_RemoveFavoriteGame :: proc(self: ^ISteamMatchmaking, nAppID: AppId_t, nIP: uint32, nConnPort: uint16, nQueryPort: uint16, unFlags: uint32) -> bool ---
	ISteamMatchmaking_RequestLobbyList :: proc(self: ^ISteamMatchmaking) -> SteamAPICall_t ---
	ISteamMatchmaking_AddRequestLobbyListStringFilter :: proc(self: ^ISteamMatchmaking, pchKeyToMatch: cstring, pchValueToMatch: cstring, eComparisonType: ELobbyComparison) ---
	ISteamMatchmaking_AddRequestLobbyListNumericalFilter :: proc(self: ^ISteamMatchmaking, pchKeyToMatch: cstring, nValueToMatch: c.int, eComparisonType: ELobbyComparison) ---
	ISteamMatchmaking_AddRequestLobbyListNearValueFilter :: proc(self: ^ISteamMatchmaking, pchKeyToMatch: cstring, nValueToBeCloseTo: c.int) ---
	ISteamMatchmaking_AddRequestLobbyListFilterSlotsAvailable :: proc(self: ^ISteamMatchmaking, nSlotsAvailable: c.int) ---
	ISteamMatchmaking_AddRequestLobbyListDistanceFilter :: proc(self: ^ISteamMatchmaking, eLobbyDistanceFilter: ELobbyDistanceFilter) ---
	ISteamMatchmaking_AddRequestLobbyListResultCountFilter :: proc(self: ^ISteamMatchmaking, cMaxResults: c.int) ---
	ISteamMatchmaking_AddRequestLobbyListCompatibleMembersFilter :: proc(self: ^ISteamMatchmaking, steamIDLobby: CSteamID) ---
	ISteamMatchmaking_GetLobbyByIndex :: proc(self: ^ISteamMatchmaking, iLobby: c.int) -> CSteamID ---
	ISteamMatchmaking_CreateLobby :: proc(self: ^ISteamMatchmaking, eLobbyType: ELobbyType, cMaxMembers: c.int) -> SteamAPICall_t ---
	ISteamMatchmaking_JoinLobby :: proc(self: ^ISteamMatchmaking, steamIDLobby: CSteamID) -> SteamAPICall_t ---
	ISteamMatchmaking_LeaveLobby :: proc(self: ^ISteamMatchmaking, steamIDLobby: CSteamID) ---
	ISteamMatchmaking_InviteUserToLobby :: proc(self: ^ISteamMatchmaking, steamIDLobby: CSteamID, steamIDInvitee: CSteamID) -> bool ---
	ISteamMatchmaking_GetNumLobbyMembers :: proc(self: ^ISteamMatchmaking, steamIDLobby: CSteamID) -> c.int ---
	ISteamMatchmaking_GetLobbyMemberByIndex :: proc(self: ^ISteamMatchmaking, steamIDLobby: CSteamID, iMember: c.int) -> CSteamID ---
	ISteamMatchmaking_GetLobbyData :: proc(self: ^ISteamMatchmaking, steamIDLobby: CSteamID, pchKey: cstring) -> cstring ---
	ISteamMatchmaking_SetLobbyData :: proc(self: ^ISteamMatchmaking, steamIDLobby: CSteamID, pchKey: cstring, pchValue: cstring) -> bool ---
	ISteamMatchmaking_GetLobbyDataCount :: proc(self: ^ISteamMatchmaking, steamIDLobby: CSteamID) -> c.int ---
	ISteamMatchmaking_GetLobbyDataByIndex :: proc(self: ^ISteamMatchmaking, steamIDLobby: CSteamID, iLobbyData: c.int, pchKey: ^u8, cchKeyBufferSize: c.int, pchValue: ^u8, cchValueBufferSize: c.int) -> bool ---
	ISteamMatchmaking_DeleteLobbyData :: proc(self: ^ISteamMatchmaking, steamIDLobby: CSteamID, pchKey: cstring) -> bool ---
	ISteamMatchmaking_GetLobbyMemberData :: proc(self: ^ISteamMatchmaking, steamIDLobby: CSteamID, steamIDUser: CSteamID, pchKey: cstring) -> cstring ---
	ISteamMatchmaking_SetLobbyMemberData :: proc(self: ^ISteamMatchmaking, steamIDLobby: CSteamID, pchKey: cstring, pchValue: cstring) ---
	ISteamMatchmaking_SendLobbyChatMsg :: proc(self: ^ISteamMatchmaking, steamIDLobby: CSteamID, pvMsgBody: rawptr, cubMsgBody: c.int) -> bool ---
	ISteamMatchmaking_GetLobbyChatEntry :: proc(self: ^ISteamMatchmaking, steamIDLobby: CSteamID, iChatID: c.int, pSteamIDUser: ^CSteamID, pvData: rawptr, cubData: c.int, peChatEntryType: ^EChatEntryType) -> c.int ---
	ISteamMatchmaking_RequestLobbyData :: proc(self: ^ISteamMatchmaking, steamIDLobby: CSteamID) -> bool ---
	ISteamMatchmaking_SetLobbyGameServer :: proc(self: ^ISteamMatchmaking, steamIDLobby: CSteamID, unGameServerIP: uint32, unGameServerPort: uint16, steamIDGameServer: CSteamID) ---
	ISteamMatchmaking_GetLobbyGameServer :: proc(self: ^ISteamMatchmaking, steamIDLobby: CSteamID, punGameServerIP: ^uint32, punGameServerPort: ^uint16, psteamIDGameServer: ^CSteamID) -> bool ---
	ISteamMatchmaking_SetLobbyMemberLimit :: proc(self: ^ISteamMatchmaking, steamIDLobby: CSteamID, cMaxMembers: c.int) -> bool ---
	ISteamMatchmaking_GetLobbyMemberLimit :: proc(self: ^ISteamMatchmaking, steamIDLobby: CSteamID) -> c.int ---
	ISteamMatchmaking_SetLobbyType :: proc(self: ^ISteamMatchmaking, steamIDLobby: CSteamID, eLobbyType: ELobbyType) -> bool ---
	ISteamMatchmaking_SetLobbyJoinable :: proc(self: ^ISteamMatchmaking, steamIDLobby: CSteamID, bLobbyJoinable: bool) -> bool ---
	ISteamMatchmaking_GetLobbyOwner :: proc(self: ^ISteamMatchmaking, steamIDLobby: CSteamID) -> CSteamID ---
	ISteamMatchmaking_SetLobbyOwner :: proc(self: ^ISteamMatchmaking, steamIDLobby: CSteamID, steamIDNewOwner: CSteamID) -> bool ---
	ISteamMatchmaking_SetLinkedLobby :: proc(self: ^ISteamMatchmaking, steamIDLobby: CSteamID, steamIDLobbyDependent: CSteamID) -> bool ---
	SteamMatchmaking_v009 :: proc() -> ^ISteamMatchmaking ---

	ISteamMatchmakingServerListResponse_ServerResponded :: proc(self: ^ISteamMatchmakingServerListResponse, hRequest: HServerListRequest, iServer: c.int) ---
	ISteamMatchmakingServerListResponse_ServerFailedToRespond :: proc(self: ^ISteamMatchmakingServerListResponse, hRequest: HServerListRequest, iServer: c.int) ---
	ISteamMatchmakingServerListResponse_RefreshComplete :: proc(self: ^ISteamMatchmakingServerListResponse, hRequest: HServerListRequest, response: EMatchMakingServerResponse) ---

	ISteamMatchmakingPingResponse_ServerResponded :: proc(self: ^ISteamMatchmakingPingResponse, server: ^gameserveritem_t) ---
	ISteamMatchmakingPingResponse_ServerFailedToRespond :: proc(self: ^ISteamMatchmakingPingResponse) ---

	ISteamMatchmakingPlayersResponse_AddPlayerToList :: proc(self: ^ISteamMatchmakingPlayersResponse, pchName: cstring, nScore: c.int, flTimePlayed: f32) ---
	ISteamMatchmakingPlayersResponse_PlayersFailedToRespond :: proc(self: ^ISteamMatchmakingPlayersResponse) ---
	ISteamMatchmakingPlayersResponse_PlayersRefreshComplete :: proc(self: ^ISteamMatchmakingPlayersResponse) ---

	ISteamMatchmakingRulesResponse_RulesResponded :: proc(self: ^ISteamMatchmakingRulesResponse, pchRule: cstring, pchValue: cstring) ---
	ISteamMatchmakingRulesResponse_RulesFailedToRespond :: proc(self: ^ISteamMatchmakingRulesResponse) ---
	ISteamMatchmakingRulesResponse_RulesRefreshComplete :: proc(self: ^ISteamMatchmakingRulesResponse) ---

	ISteamMatchmakingServers_RequestInternetServerList :: proc(self: ^ISteamMatchmakingServers, iApp: AppId_t, ppchFilters: ^^MatchMakingKeyValuePair_t, nFilters: uint32, pRequestServersResponse: ^ISteamMatchmakingServerListResponse) -> HServerListRequest ---
	ISteamMatchmakingServers_RequestLANServerList :: proc(self: ^ISteamMatchmakingServers, iApp: AppId_t, pRequestServersResponse: ^ISteamMatchmakingServerListResponse) -> HServerListRequest ---
	ISteamMatchmakingServers_RequestFriendsServerList :: proc(self: ^ISteamMatchmakingServers, iApp: AppId_t, ppchFilters: ^^MatchMakingKeyValuePair_t, nFilters: uint32, pRequestServersResponse: ^ISteamMatchmakingServerListResponse) -> HServerListRequest ---
	ISteamMatchmakingServers_RequestFavoritesServerList :: proc(self: ^ISteamMatchmakingServers, iApp: AppId_t, ppchFilters: ^^MatchMakingKeyValuePair_t, nFilters: uint32, pRequestServersResponse: ^ISteamMatchmakingServerListResponse) -> HServerListRequest ---
	ISteamMatchmakingServers_RequestHistoryServerList :: proc(self: ^ISteamMatchmakingServers, iApp: AppId_t, ppchFilters: ^^MatchMakingKeyValuePair_t, nFilters: uint32, pRequestServersResponse: ^ISteamMatchmakingServerListResponse) -> HServerListRequest ---
	ISteamMatchmakingServers_RequestSpectatorServerList :: proc(self: ^ISteamMatchmakingServers, iApp: AppId_t, ppchFilters: ^^MatchMakingKeyValuePair_t, nFilters: uint32, pRequestServersResponse: ^ISteamMatchmakingServerListResponse) -> HServerListRequest ---
	ISteamMatchmakingServers_ReleaseRequest :: proc(self: ^ISteamMatchmakingServers, hServerListRequest: HServerListRequest) ---
	ISteamMatchmakingServers_GetServerDetails :: proc(self: ^ISteamMatchmakingServers, hRequest: HServerListRequest, iServer: c.int) -> ^gameserveritem_t ---
	ISteamMatchmakingServers_CancelQuery :: proc(self: ^ISteamMatchmakingServers, hRequest: HServerListRequest) ---
	ISteamMatchmakingServers_RefreshQuery :: proc(self: ^ISteamMatchmakingServers, hRequest: HServerListRequest) ---
	ISteamMatchmakingServers_IsRefreshing :: proc(self: ^ISteamMatchmakingServers, hRequest: HServerListRequest) -> bool ---
	ISteamMatchmakingServers_GetServerCount :: proc(self: ^ISteamMatchmakingServers, hRequest: HServerListRequest) -> c.int ---
	ISteamMatchmakingServers_RefreshServer :: proc(self: ^ISteamMatchmakingServers, hRequest: HServerListRequest, iServer: c.int) ---
	ISteamMatchmakingServers_PingServer :: proc(self: ^ISteamMatchmakingServers, unIP: uint32, usPort: uint16, pRequestServersResponse: ^ISteamMatchmakingPingResponse) -> HServerQuery ---
	ISteamMatchmakingServers_PlayerDetails :: proc(self: ^ISteamMatchmakingServers, unIP: uint32, usPort: uint16, pRequestServersResponse: ^ISteamMatchmakingPlayersResponse) -> HServerQuery ---
	ISteamMatchmakingServers_ServerRules :: proc(self: ^ISteamMatchmakingServers, unIP: uint32, usPort: uint16, pRequestServersResponse: ^ISteamMatchmakingRulesResponse) -> HServerQuery ---
	ISteamMatchmakingServers_CancelServerQuery :: proc(self: ^ISteamMatchmakingServers, hServerQuery: HServerQuery) ---
	SteamMatchmakingServers_v002 :: proc() -> ^ISteamMatchmakingServers ---

	ISteamGameSearch_AddGameSearchParams :: proc(self: ^ISteamGameSearch, pchKeyToFind: cstring, pchValuesToFind: cstring) -> EGameSearchErrorCode_t ---
	ISteamGameSearch_SearchForGameWithLobby :: proc(self: ^ISteamGameSearch, steamIDLobby: CSteamID, nPlayerMin: c.int, nPlayerMax: c.int) -> EGameSearchErrorCode_t ---
	ISteamGameSearch_SearchForGameSolo :: proc(self: ^ISteamGameSearch, nPlayerMin: c.int, nPlayerMax: c.int) -> EGameSearchErrorCode_t ---
	ISteamGameSearch_AcceptGame :: proc(self: ^ISteamGameSearch) -> EGameSearchErrorCode_t ---
	ISteamGameSearch_DeclineGame :: proc(self: ^ISteamGameSearch) -> EGameSearchErrorCode_t ---
	ISteamGameSearch_RetrieveConnectionDetails :: proc(self: ^ISteamGameSearch, steamIDHost: CSteamID, pchConnectionDetails: ^u8, cubConnectionDetails: c.int) -> EGameSearchErrorCode_t ---
	ISteamGameSearch_EndGameSearch :: proc(self: ^ISteamGameSearch) -> EGameSearchErrorCode_t ---
	ISteamGameSearch_SetGameHostParams :: proc(self: ^ISteamGameSearch, pchKey: cstring, pchValue: cstring) -> EGameSearchErrorCode_t ---
	ISteamGameSearch_SetConnectionDetails :: proc(self: ^ISteamGameSearch, pchConnectionDetails: cstring, cubConnectionDetails: c.int) -> EGameSearchErrorCode_t ---
	ISteamGameSearch_RequestPlayersForGame :: proc(self: ^ISteamGameSearch, nPlayerMin: c.int, nPlayerMax: c.int, nMaxTeamSize: c.int) -> EGameSearchErrorCode_t ---
	ISteamGameSearch_HostConfirmGameStart :: proc(self: ^ISteamGameSearch, ullUniqueGameID: uint64) -> EGameSearchErrorCode_t ---
	ISteamGameSearch_CancelRequestPlayersForGame :: proc(self: ^ISteamGameSearch) -> EGameSearchErrorCode_t ---
	ISteamGameSearch_SubmitPlayerResult :: proc(self: ^ISteamGameSearch, ullUniqueGameID: uint64, steamIDPlayer: CSteamID, EPlayerResult: EPlayerResult_t) -> EGameSearchErrorCode_t ---
	ISteamGameSearch_EndGame :: proc(self: ^ISteamGameSearch, ullUniqueGameID: uint64) -> EGameSearchErrorCode_t ---
	SteamGameSearch_v001 :: proc() -> ^ISteamGameSearch ---

	ISteamParties_GetNumActiveBeacons :: proc(self: ^ISteamParties) -> uint32 ---
	ISteamParties_GetBeaconByIndex :: proc(self: ^ISteamParties, unIndex: uint32) -> PartyBeaconID_t ---
	ISteamParties_GetBeaconDetails :: proc(self: ^ISteamParties, ulBeaconID: PartyBeaconID_t, pSteamIDBeaconOwner: ^CSteamID, pLocation: ^SteamPartyBeaconLocation_t, pchMetadata: ^u8, cchMetadata: c.int) -> bool ---
	ISteamParties_JoinParty :: proc(self: ^ISteamParties, ulBeaconID: PartyBeaconID_t) -> SteamAPICall_t ---
	ISteamParties_GetNumAvailableBeaconLocations :: proc(self: ^ISteamParties, puNumLocations: ^uint32) -> bool ---
	ISteamParties_GetAvailableBeaconLocations :: proc(self: ^ISteamParties, pLocationList: ^SteamPartyBeaconLocation_t, uMaxNumLocations: uint32) -> bool ---
	ISteamParties_CreateBeacon :: proc(self: ^ISteamParties, unOpenSlots: uint32, pBeaconLocation: ^SteamPartyBeaconLocation_t, pchConnectString: cstring, pchMetadata: cstring) -> SteamAPICall_t ---
	ISteamParties_OnReservationCompleted :: proc(self: ^ISteamParties, ulBeacon: PartyBeaconID_t, steamIDUser: CSteamID) ---
	ISteamParties_CancelReservation :: proc(self: ^ISteamParties, ulBeacon: PartyBeaconID_t, steamIDUser: CSteamID) ---
	ISteamParties_ChangeNumOpenSlots :: proc(self: ^ISteamParties, ulBeacon: PartyBeaconID_t, unOpenSlots: uint32) -> SteamAPICall_t ---
	ISteamParties_DestroyBeacon :: proc(self: ^ISteamParties, ulBeacon: PartyBeaconID_t) -> bool ---
	ISteamParties_GetBeaconLocationData :: proc(self: ^ISteamParties, BeaconLocation: SteamPartyBeaconLocation_t, eData: ESteamPartyBeaconLocationData, pchDataStringOut: ^u8, cchDataStringOut: c.int) -> bool ---
	SteamParties_v002 :: proc() -> ^ISteamParties ---

	ISteamRemoteStorage_FileWrite :: proc(self: ^ISteamRemoteStorage, pchFile: cstring, pvData: rawptr, cubData: int32) -> bool ---
	ISteamRemoteStorage_FileRead :: proc(self: ^ISteamRemoteStorage, pchFile: cstring, pvData: rawptr, cubDataToRead: int32) -> int32 ---
	ISteamRemoteStorage_FileWriteAsync :: proc(self: ^ISteamRemoteStorage, pchFile: cstring, pvData: rawptr, cubData: uint32) -> SteamAPICall_t ---
	ISteamRemoteStorage_FileReadAsync :: proc(self: ^ISteamRemoteStorage, pchFile: cstring, nOffset: uint32, cubToRead: uint32) -> SteamAPICall_t ---
	ISteamRemoteStorage_FileReadAsyncComplete :: proc(self: ^ISteamRemoteStorage, hReadCall: SteamAPICall_t, pvBuffer: rawptr, cubToRead: uint32) -> bool ---
	ISteamRemoteStorage_FileForget :: proc(self: ^ISteamRemoteStorage, pchFile: cstring) -> bool ---
	ISteamRemoteStorage_FileDelete :: proc(self: ^ISteamRemoteStorage, pchFile: cstring) -> bool ---
	ISteamRemoteStorage_FileShare :: proc(self: ^ISteamRemoteStorage, pchFile: cstring) -> SteamAPICall_t ---
	ISteamRemoteStorage_SetSyncPlatforms :: proc(self: ^ISteamRemoteStorage, pchFile: cstring, eRemoteStoragePlatform: ERemoteStoragePlatform) -> bool ---
	ISteamRemoteStorage_FileWriteStreamOpen :: proc(self: ^ISteamRemoteStorage, pchFile: cstring) -> UGCFileWriteStreamHandle_t ---
	ISteamRemoteStorage_FileWriteStreamWriteChunk :: proc(self: ^ISteamRemoteStorage, writeHandle: UGCFileWriteStreamHandle_t, pvData: rawptr, cubData: int32) -> bool ---
	ISteamRemoteStorage_FileWriteStreamClose :: proc(self: ^ISteamRemoteStorage, writeHandle: UGCFileWriteStreamHandle_t) -> bool ---
	ISteamRemoteStorage_FileWriteStreamCancel :: proc(self: ^ISteamRemoteStorage, writeHandle: UGCFileWriteStreamHandle_t) -> bool ---
	ISteamRemoteStorage_FileExists :: proc(self: ^ISteamRemoteStorage, pchFile: cstring) -> bool ---
	ISteamRemoteStorage_FilePersisted :: proc(self: ^ISteamRemoteStorage, pchFile: cstring) -> bool ---
	ISteamRemoteStorage_GetFileSize :: proc(self: ^ISteamRemoteStorage, pchFile: cstring) -> int32 ---
	ISteamRemoteStorage_GetFileTimestamp :: proc(self: ^ISteamRemoteStorage, pchFile: cstring) -> int64 ---
	ISteamRemoteStorage_GetSyncPlatforms :: proc(self: ^ISteamRemoteStorage, pchFile: cstring) -> ERemoteStoragePlatform ---
	ISteamRemoteStorage_GetFileCount :: proc(self: ^ISteamRemoteStorage) -> int32 ---
	ISteamRemoteStorage_GetFileNameAndSize :: proc(self: ^ISteamRemoteStorage, iFile: c.int, pnFileSizeInBytes: ^int32) -> cstring ---
	ISteamRemoteStorage_GetQuota :: proc(self: ^ISteamRemoteStorage, pnTotalBytes: ^uint64, puAvailableBytes: ^uint64) -> bool ---
	ISteamRemoteStorage_IsCloudEnabledForAccount :: proc(self: ^ISteamRemoteStorage) -> bool ---
	ISteamRemoteStorage_IsCloudEnabledForApp :: proc(self: ^ISteamRemoteStorage) -> bool ---
	ISteamRemoteStorage_SetCloudEnabledForApp :: proc(self: ^ISteamRemoteStorage, bEnabled: bool) ---
	ISteamRemoteStorage_UGCDownload :: proc(self: ^ISteamRemoteStorage, hContent: UGCHandle_t, unPriority: uint32) -> SteamAPICall_t ---
	ISteamRemoteStorage_GetUGCDownloadProgress :: proc(self: ^ISteamRemoteStorage, hContent: UGCHandle_t, pnBytesDownloaded: ^int32, pnBytesExpected: ^int32) -> bool ---
	ISteamRemoteStorage_GetUGCDetails :: proc(self: ^ISteamRemoteStorage, hContent: UGCHandle_t, pnAppID: ^AppId_t, ppchName: ^^u8, pnFileSizeInBytes: ^int32, pSteamIDOwner: ^CSteamID) -> bool ---
	ISteamRemoteStorage_UGCRead :: proc(self: ^ISteamRemoteStorage, hContent: UGCHandle_t, pvData: rawptr, cubDataToRead: int32, cOffset: uint32, eAction: EUGCReadAction) -> int32 ---
	ISteamRemoteStorage_GetCachedUGCCount :: proc(self: ^ISteamRemoteStorage) -> int32 ---
	ISteamRemoteStorage_GetCachedUGCHandle :: proc(self: ^ISteamRemoteStorage, iCachedContent: int32) -> UGCHandle_t ---
	ISteamRemoteStorage_PublishWorkshopFile :: proc(self: ^ISteamRemoteStorage, pchFile: cstring, pchPreviewFile: cstring, nConsumerAppId: AppId_t, pchTitle: cstring, pchDescription: cstring, eVisibility: ERemoteStoragePublishedFileVisibility, pTags: ^SteamParamStringArray_t, eWorkshopFileType: EWorkshopFileType) -> SteamAPICall_t ---
	ISteamRemoteStorage_CreatePublishedFileUpdateRequest :: proc(self: ^ISteamRemoteStorage, unPublishedFileId: PublishedFileId_t) -> PublishedFileUpdateHandle_t ---
	ISteamRemoteStorage_UpdatePublishedFileFile :: proc(self: ^ISteamRemoteStorage, updateHandle: PublishedFileUpdateHandle_t, pchFile: cstring) -> bool ---
	ISteamRemoteStorage_UpdatePublishedFilePreviewFile :: proc(self: ^ISteamRemoteStorage, updateHandle: PublishedFileUpdateHandle_t, pchPreviewFile: cstring) -> bool ---
	ISteamRemoteStorage_UpdatePublishedFileTitle :: proc(self: ^ISteamRemoteStorage, updateHandle: PublishedFileUpdateHandle_t, pchTitle: cstring) -> bool ---
	ISteamRemoteStorage_UpdatePublishedFileDescription :: proc(self: ^ISteamRemoteStorage, updateHandle: PublishedFileUpdateHandle_t, pchDescription: cstring) -> bool ---
	ISteamRemoteStorage_UpdatePublishedFileVisibility :: proc(self: ^ISteamRemoteStorage, updateHandle: PublishedFileUpdateHandle_t, eVisibility: ERemoteStoragePublishedFileVisibility) -> bool ---
	ISteamRemoteStorage_UpdatePublishedFileTags :: proc(self: ^ISteamRemoteStorage, updateHandle: PublishedFileUpdateHandle_t, pTags: ^SteamParamStringArray_t) -> bool ---
	ISteamRemoteStorage_CommitPublishedFileUpdate :: proc(self: ^ISteamRemoteStorage, updateHandle: PublishedFileUpdateHandle_t) -> SteamAPICall_t ---
	ISteamRemoteStorage_GetPublishedFileDetails :: proc(self: ^ISteamRemoteStorage, unPublishedFileId: PublishedFileId_t, unMaxSecondsOld: uint32) -> SteamAPICall_t ---
	ISteamRemoteStorage_DeletePublishedFile :: proc(self: ^ISteamRemoteStorage, unPublishedFileId: PublishedFileId_t) -> SteamAPICall_t ---
	ISteamRemoteStorage_EnumerateUserPublishedFiles :: proc(self: ^ISteamRemoteStorage, unStartIndex: uint32) -> SteamAPICall_t ---
	ISteamRemoteStorage_SubscribePublishedFile :: proc(self: ^ISteamRemoteStorage, unPublishedFileId: PublishedFileId_t) -> SteamAPICall_t ---
	ISteamRemoteStorage_EnumerateUserSubscribedFiles :: proc(self: ^ISteamRemoteStorage, unStartIndex: uint32) -> SteamAPICall_t ---
	ISteamRemoteStorage_UnsubscribePublishedFile :: proc(self: ^ISteamRemoteStorage, unPublishedFileId: PublishedFileId_t) -> SteamAPICall_t ---
	ISteamRemoteStorage_UpdatePublishedFileSetChangeDescription :: proc(self: ^ISteamRemoteStorage, updateHandle: PublishedFileUpdateHandle_t, pchChangeDescription: cstring) -> bool ---
	ISteamRemoteStorage_GetPublishedItemVoteDetails :: proc(self: ^ISteamRemoteStorage, unPublishedFileId: PublishedFileId_t) -> SteamAPICall_t ---
	ISteamRemoteStorage_UpdateUserPublishedItemVote :: proc(self: ^ISteamRemoteStorage, unPublishedFileId: PublishedFileId_t, bVoteUp: bool) -> SteamAPICall_t ---
	ISteamRemoteStorage_GetUserPublishedItemVoteDetails :: proc(self: ^ISteamRemoteStorage, unPublishedFileId: PublishedFileId_t) -> SteamAPICall_t ---
	ISteamRemoteStorage_EnumerateUserSharedWorkshopFiles :: proc(self: ^ISteamRemoteStorage, steamId: CSteamID, unStartIndex: uint32, pRequiredTags: ^SteamParamStringArray_t, pExcludedTags: ^SteamParamStringArray_t) -> SteamAPICall_t ---
	ISteamRemoteStorage_PublishVideo :: proc(self: ^ISteamRemoteStorage, eVideoProvider: EWorkshopVideoProvider, pchVideoAccount: cstring, pchVideoIdentifier: cstring, pchPreviewFile: cstring, nConsumerAppId: AppId_t, pchTitle: cstring, pchDescription: cstring, eVisibility: ERemoteStoragePublishedFileVisibility, pTags: ^SteamParamStringArray_t) -> SteamAPICall_t ---
	ISteamRemoteStorage_SetUserPublishedFileAction :: proc(self: ^ISteamRemoteStorage, unPublishedFileId: PublishedFileId_t, eAction: EWorkshopFileAction) -> SteamAPICall_t ---
	ISteamRemoteStorage_EnumeratePublishedFilesByUserAction :: proc(self: ^ISteamRemoteStorage, eAction: EWorkshopFileAction, unStartIndex: uint32) -> SteamAPICall_t ---
	ISteamRemoteStorage_EnumeratePublishedWorkshopFiles :: proc(self: ^ISteamRemoteStorage, eEnumerationType: EWorkshopEnumerationType, unStartIndex: uint32, unCount: uint32, unDays: uint32, pTags: ^SteamParamStringArray_t, pUserTags: ^SteamParamStringArray_t) -> SteamAPICall_t ---
	ISteamRemoteStorage_UGCDownloadToLocation :: proc(self: ^ISteamRemoteStorage, hContent: UGCHandle_t, pchLocation: cstring, unPriority: uint32) -> SteamAPICall_t ---
	ISteamRemoteStorage_GetLocalFileChangeCount :: proc(self: ^ISteamRemoteStorage) -> int32 ---
	ISteamRemoteStorage_GetLocalFileChange :: proc(self: ^ISteamRemoteStorage, iFile: c.int, pEChangeType: ^ERemoteStorageLocalFileChange, pEFilePathType: ^ERemoteStorageFilePathType) -> cstring ---
	ISteamRemoteStorage_BeginFileWriteBatch :: proc(self: ^ISteamRemoteStorage) -> bool ---
	ISteamRemoteStorage_EndFileWriteBatch :: proc(self: ^ISteamRemoteStorage) -> bool ---
	SteamRemoteStorage_v016 :: proc() -> ^ISteamRemoteStorage ---

	ISteamUserStats_RequestCurrentStats :: proc(self: ^ISteamUserStats) -> bool ---
	ISteamUserStats_GetStatInt32 :: proc(self: ^ISteamUserStats, pchName: cstring, pData: ^int32) -> bool ---
	ISteamUserStats_GetStatFloat :: proc(self: ^ISteamUserStats, pchName: cstring, pData: ^f32) -> bool ---
	ISteamUserStats_SetStatInt32 :: proc(self: ^ISteamUserStats, pchName: cstring, nData: int32) -> bool ---
	ISteamUserStats_SetStatFloat :: proc(self: ^ISteamUserStats, pchName: cstring, fData: f32) -> bool ---
	ISteamUserStats_UpdateAvgRateStat :: proc(self: ^ISteamUserStats, pchName: cstring, flCountThisSession: f32, dSessionLength: f64) -> bool ---
	ISteamUserStats_GetAchievement :: proc(self: ^ISteamUserStats, pchName: cstring, pbAchieved: ^bool) -> bool ---
	ISteamUserStats_SetAchievement :: proc(self: ^ISteamUserStats, pchName: cstring) -> bool ---
	ISteamUserStats_ClearAchievement :: proc(self: ^ISteamUserStats, pchName: cstring) -> bool ---
	ISteamUserStats_GetAchievementAndUnlockTime :: proc(self: ^ISteamUserStats, pchName: cstring, pbAchieved: ^bool, punUnlockTime: ^uint32) -> bool ---
	ISteamUserStats_StoreStats :: proc(self: ^ISteamUserStats) -> bool ---
	ISteamUserStats_GetAchievementIcon :: proc(self: ^ISteamUserStats, pchName: cstring) -> c.int ---
	ISteamUserStats_GetAchievementDisplayAttribute :: proc(self: ^ISteamUserStats, pchName: cstring, pchKey: cstring) -> cstring ---
	ISteamUserStats_IndicateAchievementProgress :: proc(self: ^ISteamUserStats, pchName: cstring, nCurProgress: uint32, nMaxProgress: uint32) -> bool ---
	ISteamUserStats_GetNumAchievements :: proc(self: ^ISteamUserStats) -> uint32 ---
	ISteamUserStats_GetAchievementName :: proc(self: ^ISteamUserStats, iAchievement: uint32) -> cstring ---
	ISteamUserStats_RequestUserStats :: proc(self: ^ISteamUserStats, steamIDUser: CSteamID) -> SteamAPICall_t ---
	ISteamUserStats_GetUserStatInt32 :: proc(self: ^ISteamUserStats, steamIDUser: CSteamID, pchName: cstring, pData: ^int32) -> bool ---
	ISteamUserStats_GetUserStatFloat :: proc(self: ^ISteamUserStats, steamIDUser: CSteamID, pchName: cstring, pData: ^f32) -> bool ---
	ISteamUserStats_GetUserAchievement :: proc(self: ^ISteamUserStats, steamIDUser: CSteamID, pchName: cstring, pbAchieved: ^bool) -> bool ---
	ISteamUserStats_GetUserAchievementAndUnlockTime :: proc(self: ^ISteamUserStats, steamIDUser: CSteamID, pchName: cstring, pbAchieved: ^bool, punUnlockTime: ^uint32) -> bool ---
	ISteamUserStats_ResetAllStats :: proc(self: ^ISteamUserStats, bAchievementsToo: bool) -> bool ---
	ISteamUserStats_FindOrCreateLeaderboard :: proc(self: ^ISteamUserStats, pchLeaderboardName: cstring, eLeaderboardSortMethod: ELeaderboardSortMethod, eLeaderboardDisplayType: ELeaderboardDisplayType) -> SteamAPICall_t ---
	ISteamUserStats_FindLeaderboard :: proc(self: ^ISteamUserStats, pchLeaderboardName: cstring) -> SteamAPICall_t ---
	ISteamUserStats_GetLeaderboardName :: proc(self: ^ISteamUserStats, hSteamLeaderboard: SteamLeaderboard_t) -> cstring ---
	ISteamUserStats_GetLeaderboardEntryCount :: proc(self: ^ISteamUserStats, hSteamLeaderboard: SteamLeaderboard_t) -> c.int ---
	ISteamUserStats_GetLeaderboardSortMethod :: proc(self: ^ISteamUserStats, hSteamLeaderboard: SteamLeaderboard_t) -> ELeaderboardSortMethod ---
	ISteamUserStats_GetLeaderboardDisplayType :: proc(self: ^ISteamUserStats, hSteamLeaderboard: SteamLeaderboard_t) -> ELeaderboardDisplayType ---
	ISteamUserStats_DownloadLeaderboardEntries :: proc(self: ^ISteamUserStats, hSteamLeaderboard: SteamLeaderboard_t, eLeaderboardDataRequest: ELeaderboardDataRequest, nRangeStart: c.int, nRangeEnd: c.int) -> SteamAPICall_t ---
	ISteamUserStats_DownloadLeaderboardEntriesForUsers :: proc(self: ^ISteamUserStats, hSteamLeaderboard: SteamLeaderboard_t, prgUsers: ^CSteamID, cUsers: c.int) -> SteamAPICall_t ---
	ISteamUserStats_GetDownloadedLeaderboardEntry :: proc(self: ^ISteamUserStats, hSteamLeaderboardEntries: SteamLeaderboardEntries_t, index: c.int, pLeaderboardEntry: ^LeaderboardEntry_t, pDetails: ^int32, cDetailsMax: c.int) -> bool ---
	ISteamUserStats_UploadLeaderboardScore :: proc(self: ^ISteamUserStats, hSteamLeaderboard: SteamLeaderboard_t, eLeaderboardUploadScoreMethod: ELeaderboardUploadScoreMethod, nScore: int32, pScoreDetails: ^int32, cScoreDetailsCount: c.int) -> SteamAPICall_t ---
	ISteamUserStats_AttachLeaderboardUGC :: proc(self: ^ISteamUserStats, hSteamLeaderboard: SteamLeaderboard_t, hUGC: UGCHandle_t) -> SteamAPICall_t ---
	ISteamUserStats_GetNumberOfCurrentPlayers :: proc(self: ^ISteamUserStats) -> SteamAPICall_t ---
	ISteamUserStats_RequestGlobalAchievementPercentages :: proc(self: ^ISteamUserStats) -> SteamAPICall_t ---
	ISteamUserStats_GetMostAchievedAchievementInfo :: proc(self: ^ISteamUserStats, pchName: ^u8, unNameBufLen: uint32, pflPercent: ^f32, pbAchieved: ^bool) -> c.int ---
	ISteamUserStats_GetNextMostAchievedAchievementInfo :: proc(self: ^ISteamUserStats, iIteratorPrevious: c.int, pchName: ^u8, unNameBufLen: uint32, pflPercent: ^f32, pbAchieved: ^bool) -> c.int ---
	ISteamUserStats_GetAchievementAchievedPercent :: proc(self: ^ISteamUserStats, pchName: cstring, pflPercent: ^f32) -> bool ---
	ISteamUserStats_RequestGlobalStats :: proc(self: ^ISteamUserStats, nHistoryDays: c.int) -> SteamAPICall_t ---
	ISteamUserStats_GetGlobalStatInt64 :: proc(self: ^ISteamUserStats, pchStatName: cstring, pData: ^int64) -> bool ---
	ISteamUserStats_GetGlobalStatFloat64 :: proc(self: ^ISteamUserStats, pchStatName: cstring, pData: ^f64) -> bool ---
	ISteamUserStats_GetGlobalStatHistoryInt64 :: proc(self: ^ISteamUserStats, pchStatName: cstring, pData: ^int64, cubData: uint32) -> int32 ---
	ISteamUserStats_GetGlobalStatHistoryFloat64 :: proc(self: ^ISteamUserStats, pchStatName: cstring, pData: ^f64, cubData: uint32) -> int32 ---
	ISteamUserStats_GetAchievementProgressLimitsInt32 :: proc(self: ^ISteamUserStats, pchName: cstring, pnMinProgress: ^int32, pnMaxProgress: ^int32) -> bool ---
	ISteamUserStats_GetAchievementProgressLimitsFloat :: proc(self: ^ISteamUserStats, pchName: cstring, pfMinProgress: ^f32, pfMaxProgress: ^f32) -> bool ---
	SteamUserStats_v012 :: proc() -> ^ISteamUserStats ---

	ISteamApps_BIsSubscribed :: proc(self: ^ISteamApps) -> bool ---
	ISteamApps_BIsLowViolence :: proc(self: ^ISteamApps) -> bool ---
	ISteamApps_BIsCybercafe :: proc(self: ^ISteamApps) -> bool ---
	ISteamApps_BIsVACBanned :: proc(self: ^ISteamApps) -> bool ---
	ISteamApps_GetCurrentGameLanguage :: proc(self: ^ISteamApps) -> cstring ---
	ISteamApps_GetAvailableGameLanguages :: proc(self: ^ISteamApps) -> cstring ---
	ISteamApps_BIsSubscribedApp :: proc(self: ^ISteamApps, appID: AppId_t) -> bool ---
	ISteamApps_BIsDlcInstalled :: proc(self: ^ISteamApps, appID: AppId_t) -> bool ---
	ISteamApps_GetEarliestPurchaseUnixTime :: proc(self: ^ISteamApps, nAppID: AppId_t) -> uint32 ---
	ISteamApps_BIsSubscribedFromFreeWeekend :: proc(self: ^ISteamApps) -> bool ---
	ISteamApps_GetDLCCount :: proc(self: ^ISteamApps) -> c.int ---
	ISteamApps_BGetDLCDataByIndex :: proc(self: ^ISteamApps, iDLC: c.int, pAppID: ^AppId_t, pbAvailable: ^bool, pchName: ^u8, cchNameBufferSize: c.int) -> bool ---
	ISteamApps_InstallDLC :: proc(self: ^ISteamApps, nAppID: AppId_t) ---
	ISteamApps_UninstallDLC :: proc(self: ^ISteamApps, nAppID: AppId_t) ---
	ISteamApps_RequestAppProofOfPurchaseKey :: proc(self: ^ISteamApps, nAppID: AppId_t) ---
	ISteamApps_GetCurrentBetaName :: proc(self: ^ISteamApps, pchName: ^u8, cchNameBufferSize: c.int) -> bool ---
	ISteamApps_MarkContentCorrupt :: proc(self: ^ISteamApps, bMissingFilesOnly: bool) -> bool ---
	ISteamApps_GetInstalledDepots :: proc(self: ^ISteamApps, appID: AppId_t, pvecDepots: ^DepotId_t, cMaxDepots: uint32) -> uint32 ---
	ISteamApps_GetAppInstallDir :: proc(self: ^ISteamApps, appID: AppId_t, pchFolder: ^u8, cchFolderBufferSize: uint32) -> uint32 ---
	ISteamApps_BIsAppInstalled :: proc(self: ^ISteamApps, appID: AppId_t) -> bool ---
	ISteamApps_GetAppOwner :: proc(self: ^ISteamApps) -> CSteamID ---
	ISteamApps_GetLaunchQueryParam :: proc(self: ^ISteamApps, pchKey: cstring) -> cstring ---
	ISteamApps_GetDlcDownloadProgress :: proc(self: ^ISteamApps, nAppID: AppId_t, punBytesDownloaded: ^uint64, punBytesTotal: ^uint64) -> bool ---
	ISteamApps_GetAppBuildId :: proc(self: ^ISteamApps) -> c.int ---
	ISteamApps_RequestAllProofOfPurchaseKeys :: proc(self: ^ISteamApps) ---
	ISteamApps_GetFileDetails :: proc(self: ^ISteamApps, pszFileName: cstring) -> SteamAPICall_t ---
	ISteamApps_GetLaunchCommandLine :: proc(self: ^ISteamApps, pszCommandLine: ^u8, cubCommandLine: c.int) -> c.int ---
	ISteamApps_BIsSubscribedFromFamilySharing :: proc(self: ^ISteamApps) -> bool ---
	ISteamApps_BIsTimedTrial :: proc(self: ^ISteamApps, punSecondsAllowed: ^uint32, punSecondsPlayed: ^uint32) -> bool ---
	ISteamApps_SetDlcContext :: proc(self: ^ISteamApps, nAppID: AppId_t) -> bool ---
	SteamApps_v008 :: proc() -> ^ISteamApps ---

	ISteamNetworking_SendP2PPacket :: proc(self: ^ISteamNetworking, steamIDRemote: CSteamID, pubData: rawptr, cubData: uint32, eP2PSendType: EP2PSend, nChannel: c.int) -> bool ---
	ISteamNetworking_IsP2PPacketAvailable :: proc(self: ^ISteamNetworking, pcubMsgSize: ^uint32, nChannel: c.int) -> bool ---
	ISteamNetworking_ReadP2PPacket :: proc(self: ^ISteamNetworking, pubDest: rawptr, cubDest: uint32, pcubMsgSize: ^uint32, psteamIDRemote: ^CSteamID, nChannel: c.int) -> bool ---
	ISteamNetworking_AcceptP2PSessionWithUser :: proc(self: ^ISteamNetworking, steamIDRemote: CSteamID) -> bool ---
	ISteamNetworking_CloseP2PSessionWithUser :: proc(self: ^ISteamNetworking, steamIDRemote: CSteamID) -> bool ---
	ISteamNetworking_CloseP2PChannelWithUser :: proc(self: ^ISteamNetworking, steamIDRemote: CSteamID, nChannel: c.int) -> bool ---
	ISteamNetworking_GetP2PSessionState :: proc(self: ^ISteamNetworking, steamIDRemote: CSteamID, pConnectionState: ^P2PSessionState_t) -> bool ---
	ISteamNetworking_AllowP2PPacketRelay :: proc(self: ^ISteamNetworking, bAllow: bool) -> bool ---
	ISteamNetworking_CreateListenSocket :: proc(self: ^ISteamNetworking, nVirtualP2PPort: c.int, nIP: SteamIPAddress_t, nPort: uint16, bAllowUseOfPacketRelay: bool) -> SNetListenSocket_t ---
	ISteamNetworking_CreateP2PConnectionSocket :: proc(self: ^ISteamNetworking, steamIDTarget: CSteamID, nVirtualPort: c.int, nTimeoutSec: c.int, bAllowUseOfPacketRelay: bool) -> SNetSocket_t ---
	ISteamNetworking_CreateConnectionSocket :: proc(self: ^ISteamNetworking, nIP: SteamIPAddress_t, nPort: uint16, nTimeoutSec: c.int) -> SNetSocket_t ---
	ISteamNetworking_DestroySocket :: proc(self: ^ISteamNetworking, hSocket: SNetSocket_t, bNotifyRemoteEnd: bool) -> bool ---
	ISteamNetworking_DestroyListenSocket :: proc(self: ^ISteamNetworking, hSocket: SNetListenSocket_t, bNotifyRemoteEnd: bool) -> bool ---
	ISteamNetworking_SendDataOnSocket :: proc(self: ^ISteamNetworking, hSocket: SNetSocket_t, pubData: rawptr, cubData: uint32, bReliable: bool) -> bool ---
	ISteamNetworking_IsDataAvailableOnSocket :: proc(self: ^ISteamNetworking, hSocket: SNetSocket_t, pcubMsgSize: ^uint32) -> bool ---
	ISteamNetworking_RetrieveDataFromSocket :: proc(self: ^ISteamNetworking, hSocket: SNetSocket_t, pubDest: rawptr, cubDest: uint32, pcubMsgSize: ^uint32) -> bool ---
	ISteamNetworking_IsDataAvailable :: proc(self: ^ISteamNetworking, hListenSocket: SNetListenSocket_t, pcubMsgSize: ^uint32, phSocket: ^SNetSocket_t) -> bool ---
	ISteamNetworking_RetrieveData :: proc(self: ^ISteamNetworking, hListenSocket: SNetListenSocket_t, pubDest: rawptr, cubDest: uint32, pcubMsgSize: ^uint32, phSocket: ^SNetSocket_t) -> bool ---
	ISteamNetworking_GetSocketInfo :: proc(self: ^ISteamNetworking, hSocket: SNetSocket_t, pSteamIDRemote: ^CSteamID, peSocketStatus: ^int, punIPRemote: ^SteamIPAddress_t, punPortRemote: ^uint16) -> bool ---
	ISteamNetworking_GetListenSocketInfo :: proc(self: ^ISteamNetworking, hListenSocket: SNetListenSocket_t, pnIP: ^SteamIPAddress_t, pnPort: ^uint16) -> bool ---
	ISteamNetworking_GetSocketConnectionType :: proc(self: ^ISteamNetworking, hSocket: SNetSocket_t) -> ESNetSocketConnectionType ---
	ISteamNetworking_GetMaxPacketSize :: proc(self: ^ISteamNetworking, hSocket: SNetSocket_t) -> c.int ---
	SteamNetworking_v006 :: proc() -> ^ISteamNetworking ---

	ISteamScreenshots_WriteScreenshot :: proc(self: ^ISteamScreenshots, pubRGB: rawptr, cubRGB: uint32, nWidth: c.int, nHeight: c.int) -> ScreenshotHandle ---
	ISteamScreenshots_AddScreenshotToLibrary :: proc(self: ^ISteamScreenshots, pchFilename: cstring, pchThumbnailFilename: cstring, nWidth: c.int, nHeight: c.int) -> ScreenshotHandle ---
	ISteamScreenshots_TriggerScreenshot :: proc(self: ^ISteamScreenshots) ---
	ISteamScreenshots_HookScreenshots :: proc(self: ^ISteamScreenshots, bHook: bool) ---
	ISteamScreenshots_SetLocation :: proc(self: ^ISteamScreenshots, hScreenshot: ScreenshotHandle, pchLocation: cstring) -> bool ---
	ISteamScreenshots_TagUser :: proc(self: ^ISteamScreenshots, hScreenshot: ScreenshotHandle, steamID: CSteamID) -> bool ---
	ISteamScreenshots_TagPublishedFile :: proc(self: ^ISteamScreenshots, hScreenshot: ScreenshotHandle, unPublishedFileID: PublishedFileId_t) -> bool ---
	ISteamScreenshots_IsScreenshotsHooked :: proc(self: ^ISteamScreenshots) -> bool ---
	ISteamScreenshots_AddVRScreenshotToLibrary :: proc(self: ^ISteamScreenshots, eType: EVRScreenshotType, pchFilename: cstring, pchVRFilename: cstring) -> ScreenshotHandle ---
	SteamScreenshots_v003 :: proc() -> ^ISteamScreenshots ---

	ISteamMusic_BIsEnabled :: proc(self: ^ISteamMusic) -> bool ---
	ISteamMusic_BIsPlaying :: proc(self: ^ISteamMusic) -> bool ---
	ISteamMusic_GetPlaybackStatus :: proc(self: ^ISteamMusic) -> AudioPlayback_Status ---
	ISteamMusic_Play :: proc(self: ^ISteamMusic) ---
	ISteamMusic_Pause :: proc(self: ^ISteamMusic) ---
	ISteamMusic_PlayPrevious :: proc(self: ^ISteamMusic) ---
	ISteamMusic_PlayNext :: proc(self: ^ISteamMusic) ---
	ISteamMusic_SetVolume :: proc(self: ^ISteamMusic, flVolume: f32) ---
	ISteamMusic_GetVolume :: proc(self: ^ISteamMusic) -> f32 ---
	SteamMusic_v001 :: proc() -> ^ISteamMusic ---

	ISteamMusicRemote_RegisterSteamMusicRemote :: proc(self: ^ISteamMusicRemote, pchName: cstring) -> bool ---
	ISteamMusicRemote_DeregisterSteamMusicRemote :: proc(self: ^ISteamMusicRemote) -> bool ---
	ISteamMusicRemote_BIsCurrentMusicRemote :: proc(self: ^ISteamMusicRemote) -> bool ---
	ISteamMusicRemote_BActivationSuccess :: proc(self: ^ISteamMusicRemote, bValue: bool) -> bool ---
	ISteamMusicRemote_SetDisplayName :: proc(self: ^ISteamMusicRemote, pchDisplayName: cstring) -> bool ---
	ISteamMusicRemote_SetPNGIcon_64x64 :: proc(self: ^ISteamMusicRemote, pvBuffer: rawptr, cbBufferLength: uint32) -> bool ---
	ISteamMusicRemote_EnablePlayPrevious :: proc(self: ^ISteamMusicRemote, bValue: bool) -> bool ---
	ISteamMusicRemote_EnablePlayNext :: proc(self: ^ISteamMusicRemote, bValue: bool) -> bool ---
	ISteamMusicRemote_EnableShuffled :: proc(self: ^ISteamMusicRemote, bValue: bool) -> bool ---
	ISteamMusicRemote_EnableLooped :: proc(self: ^ISteamMusicRemote, bValue: bool) -> bool ---
	ISteamMusicRemote_EnableQueue :: proc(self: ^ISteamMusicRemote, bValue: bool) -> bool ---
	ISteamMusicRemote_EnablePlaylists :: proc(self: ^ISteamMusicRemote, bValue: bool) -> bool ---
	ISteamMusicRemote_UpdatePlaybackStatus :: proc(self: ^ISteamMusicRemote, nStatus: AudioPlayback_Status) -> bool ---
	ISteamMusicRemote_UpdateShuffled :: proc(self: ^ISteamMusicRemote, bValue: bool) -> bool ---
	ISteamMusicRemote_UpdateLooped :: proc(self: ^ISteamMusicRemote, bValue: bool) -> bool ---
	ISteamMusicRemote_UpdateVolume :: proc(self: ^ISteamMusicRemote, flValue: f32) -> bool ---
	ISteamMusicRemote_CurrentEntryWillChange :: proc(self: ^ISteamMusicRemote) -> bool ---
	ISteamMusicRemote_CurrentEntryIsAvailable :: proc(self: ^ISteamMusicRemote, bAvailable: bool) -> bool ---
	ISteamMusicRemote_UpdateCurrentEntryText :: proc(self: ^ISteamMusicRemote, pchText: cstring) -> bool ---
	ISteamMusicRemote_UpdateCurrentEntryElapsedSeconds :: proc(self: ^ISteamMusicRemote, nValue: c.int) -> bool ---
	ISteamMusicRemote_UpdateCurrentEntryCoverArt :: proc(self: ^ISteamMusicRemote, pvBuffer: rawptr, cbBufferLength: uint32) -> bool ---
	ISteamMusicRemote_CurrentEntryDidChange :: proc(self: ^ISteamMusicRemote) -> bool ---
	ISteamMusicRemote_QueueWillChange :: proc(self: ^ISteamMusicRemote) -> bool ---
	ISteamMusicRemote_ResetQueueEntries :: proc(self: ^ISteamMusicRemote) -> bool ---
	ISteamMusicRemote_SetQueueEntry :: proc(self: ^ISteamMusicRemote, nID: c.int, nPosition: c.int, pchEntryText: cstring) -> bool ---
	ISteamMusicRemote_SetCurrentQueueEntry :: proc(self: ^ISteamMusicRemote, nID: c.int) -> bool ---
	ISteamMusicRemote_QueueDidChange :: proc(self: ^ISteamMusicRemote) -> bool ---
	ISteamMusicRemote_PlaylistWillChange :: proc(self: ^ISteamMusicRemote) -> bool ---
	ISteamMusicRemote_ResetPlaylistEntries :: proc(self: ^ISteamMusicRemote) -> bool ---
	ISteamMusicRemote_SetPlaylistEntry :: proc(self: ^ISteamMusicRemote, nID: c.int, nPosition: c.int, pchEntryText: cstring) -> bool ---
	ISteamMusicRemote_SetCurrentPlaylistEntry :: proc(self: ^ISteamMusicRemote, nID: c.int) -> bool ---
	ISteamMusicRemote_PlaylistDidChange :: proc(self: ^ISteamMusicRemote) -> bool ---
	SteamMusicRemote_v001 :: proc() -> ^ISteamMusicRemote ---

	ISteamHTTP_CreateHTTPRequest :: proc(self: ^ISteamHTTP, eHTTPRequestMethod: EHTTPMethod, pchAbsoluteURL: cstring) -> HTTPRequestHandle ---
	ISteamHTTP_SetHTTPRequestContextValue :: proc(self: ^ISteamHTTP, hRequest: HTTPRequestHandle, ulContextValue: uint64) -> bool ---
	ISteamHTTP_SetHTTPRequestNetworkActivityTimeout :: proc(self: ^ISteamHTTP, hRequest: HTTPRequestHandle, unTimeoutSeconds: uint32) -> bool ---
	ISteamHTTP_SetHTTPRequestHeaderValue :: proc(self: ^ISteamHTTP, hRequest: HTTPRequestHandle, pchHeaderName: cstring, pchHeaderValue: cstring) -> bool ---
	ISteamHTTP_SetHTTPRequestGetOrPostParameter :: proc(self: ^ISteamHTTP, hRequest: HTTPRequestHandle, pchParamName: cstring, pchParamValue: cstring) -> bool ---
	ISteamHTTP_SendHTTPRequest :: proc(self: ^ISteamHTTP, hRequest: HTTPRequestHandle, pCallHandle: ^SteamAPICall_t) -> bool ---
	ISteamHTTP_SendHTTPRequestAndStreamResponse :: proc(self: ^ISteamHTTP, hRequest: HTTPRequestHandle, pCallHandle: ^SteamAPICall_t) -> bool ---
	ISteamHTTP_DeferHTTPRequest :: proc(self: ^ISteamHTTP, hRequest: HTTPRequestHandle) -> bool ---
	ISteamHTTP_PrioritizeHTTPRequest :: proc(self: ^ISteamHTTP, hRequest: HTTPRequestHandle) -> bool ---
	ISteamHTTP_GetHTTPResponseHeaderSize :: proc(self: ^ISteamHTTP, hRequest: HTTPRequestHandle, pchHeaderName: cstring, unResponseHeaderSize: ^uint32) -> bool ---
	ISteamHTTP_GetHTTPResponseHeaderValue :: proc(self: ^ISteamHTTP, hRequest: HTTPRequestHandle, pchHeaderName: cstring, pHeaderValueBuffer: ^uint8, unBufferSize: uint32) -> bool ---
	ISteamHTTP_GetHTTPResponseBodySize :: proc(self: ^ISteamHTTP, hRequest: HTTPRequestHandle, unBodySize: ^uint32) -> bool ---
	ISteamHTTP_GetHTTPResponseBodyData :: proc(self: ^ISteamHTTP, hRequest: HTTPRequestHandle, pBodyDataBuffer: ^uint8, unBufferSize: uint32) -> bool ---
	ISteamHTTP_GetHTTPStreamingResponseBodyData :: proc(self: ^ISteamHTTP, hRequest: HTTPRequestHandle, cOffset: uint32, pBodyDataBuffer: ^uint8, unBufferSize: uint32) -> bool ---
	ISteamHTTP_ReleaseHTTPRequest :: proc(self: ^ISteamHTTP, hRequest: HTTPRequestHandle) -> bool ---
	ISteamHTTP_GetHTTPDownloadProgressPct :: proc(self: ^ISteamHTTP, hRequest: HTTPRequestHandle, pflPercentOut: ^f32) -> bool ---
	ISteamHTTP_SetHTTPRequestRawPostBody :: proc(self: ^ISteamHTTP, hRequest: HTTPRequestHandle, pchContentType: cstring, pubBody: ^uint8, unBodyLen: uint32) -> bool ---
	ISteamHTTP_CreateCookieContainer :: proc(self: ^ISteamHTTP, bAllowResponsesToModify: bool) -> HTTPCookieContainerHandle ---
	ISteamHTTP_ReleaseCookieContainer :: proc(self: ^ISteamHTTP, hCookieContainer: HTTPCookieContainerHandle) -> bool ---
	ISteamHTTP_SetCookie :: proc(self: ^ISteamHTTP, hCookieContainer: HTTPCookieContainerHandle, pchHost: cstring, pchUrl: cstring, pchCookie: cstring) -> bool ---
	ISteamHTTP_SetHTTPRequestCookieContainer :: proc(self: ^ISteamHTTP, hRequest: HTTPRequestHandle, hCookieContainer: HTTPCookieContainerHandle) -> bool ---
	ISteamHTTP_SetHTTPRequestUserAgentInfo :: proc(self: ^ISteamHTTP, hRequest: HTTPRequestHandle, pchUserAgentInfo: cstring) -> bool ---
	ISteamHTTP_SetHTTPRequestRequiresVerifiedCertificate :: proc(self: ^ISteamHTTP, hRequest: HTTPRequestHandle, bRequireVerifiedCertificate: bool) -> bool ---
	ISteamHTTP_SetHTTPRequestAbsoluteTimeoutMS :: proc(self: ^ISteamHTTP, hRequest: HTTPRequestHandle, unMilliseconds: uint32) -> bool ---
	ISteamHTTP_GetHTTPRequestWasTimedOut :: proc(self: ^ISteamHTTP, hRequest: HTTPRequestHandle, pbWasTimedOut: ^bool) -> bool ---
	SteamHTTP_v003 :: proc() -> ^ISteamHTTP ---

	ISteamInput_Init :: proc(self: ^ISteamInput, bExplicitlyCallRunFrame: bool) -> bool ---
	ISteamInput_Shutdown :: proc(self: ^ISteamInput) -> bool ---
	ISteamInput_SetInputActionManifestFilePath :: proc(self: ^ISteamInput, pchInputActionManifestAbsolutePath: cstring) -> bool ---
	ISteamInput_RunFrame :: proc(self: ^ISteamInput, bReservedValue: bool) ---
	ISteamInput_BWaitForData :: proc(self: ^ISteamInput, bWaitForever: bool, unTimeout: uint32) -> bool ---
	ISteamInput_BNewDataAvailable :: proc(self: ^ISteamInput) -> bool ---
	ISteamInput_GetConnectedControllers :: proc(self: ^ISteamInput, handlesOut: ^InputHandle_t) -> c.int ---
	ISteamInput_EnableDeviceCallbacks :: proc(self: ^ISteamInput) ---
	ISteamInput_EnableActionEventCallbacks :: proc(self: ^ISteamInput, pCallback: SteamInputActionEventCallbackPointer) ---
	ISteamInput_GetActionSetHandle :: proc(self: ^ISteamInput, pszActionSetName: cstring) -> InputActionSetHandle_t ---
	ISteamInput_ActivateActionSet :: proc(self: ^ISteamInput, inputHandle: InputHandle_t, actionSetHandle: InputActionSetHandle_t) ---
	ISteamInput_GetCurrentActionSet :: proc(self: ^ISteamInput, inputHandle: InputHandle_t) -> InputActionSetHandle_t ---
	ISteamInput_ActivateActionSetLayer :: proc(self: ^ISteamInput, inputHandle: InputHandle_t, actionSetLayerHandle: InputActionSetHandle_t) ---
	ISteamInput_DeactivateActionSetLayer :: proc(self: ^ISteamInput, inputHandle: InputHandle_t, actionSetLayerHandle: InputActionSetHandle_t) ---
	ISteamInput_DeactivateAllActionSetLayers :: proc(self: ^ISteamInput, inputHandle: InputHandle_t) ---
	ISteamInput_GetActiveActionSetLayers :: proc(self: ^ISteamInput, inputHandle: InputHandle_t, handlesOut: ^InputActionSetHandle_t) -> c.int ---
	ISteamInput_GetDigitalActionHandle :: proc(self: ^ISteamInput, pszActionName: cstring) -> InputDigitalActionHandle_t ---
	ISteamInput_GetDigitalActionData :: proc(self: ^ISteamInput, inputHandle: InputHandle_t, digitalActionHandle: InputDigitalActionHandle_t) -> InputDigitalActionData_t ---
	ISteamInput_GetDigitalActionOrigins :: proc(self: ^ISteamInput, inputHandle: InputHandle_t, actionSetHandle: InputActionSetHandle_t, digitalActionHandle: InputDigitalActionHandle_t, originsOut: ^EInputActionOrigin) -> c.int ---
	ISteamInput_GetStringForDigitalActionName :: proc(self: ^ISteamInput, eActionHandle: InputDigitalActionHandle_t) -> cstring ---
	ISteamInput_GetAnalogActionHandle :: proc(self: ^ISteamInput, pszActionName: cstring) -> InputAnalogActionHandle_t ---
	ISteamInput_GetAnalogActionData :: proc(self: ^ISteamInput, inputHandle: InputHandle_t, analogActionHandle: InputAnalogActionHandle_t) -> InputAnalogActionData_t ---
	ISteamInput_GetAnalogActionOrigins :: proc(self: ^ISteamInput, inputHandle: InputHandle_t, actionSetHandle: InputActionSetHandle_t, analogActionHandle: InputAnalogActionHandle_t, originsOut: ^EInputActionOrigin) -> c.int ---
	ISteamInput_GetGlyphPNGForActionOrigin :: proc(self: ^ISteamInput, eOrigin: EInputActionOrigin, eSize: ESteamInputGlyphSize, unFlags: uint32) -> cstring ---
	ISteamInput_GetGlyphSVGForActionOrigin :: proc(self: ^ISteamInput, eOrigin: EInputActionOrigin, unFlags: uint32) -> cstring ---
	ISteamInput_GetGlyphForActionOrigin_Legacy :: proc(self: ^ISteamInput, eOrigin: EInputActionOrigin) -> cstring ---
	ISteamInput_GetStringForActionOrigin :: proc(self: ^ISteamInput, eOrigin: EInputActionOrigin) -> cstring ---
	ISteamInput_GetStringForAnalogActionName :: proc(self: ^ISteamInput, eActionHandle: InputAnalogActionHandle_t) -> cstring ---
	ISteamInput_StopAnalogActionMomentum :: proc(self: ^ISteamInput, inputHandle: InputHandle_t, eAction: InputAnalogActionHandle_t) ---
	ISteamInput_GetMotionData :: proc(self: ^ISteamInput, inputHandle: InputHandle_t) -> InputMotionData_t ---
	ISteamInput_TriggerVibration :: proc(self: ^ISteamInput, inputHandle: InputHandle_t, usLeftSpeed: c.ushort, usRightSpeed: c.ushort) ---
	ISteamInput_TriggerVibrationExtended :: proc(self: ^ISteamInput, inputHandle: InputHandle_t, usLeftSpeed: c.ushort, usRightSpeed: c.ushort, usLeftTriggerSpeed: c.ushort, usRightTriggerSpeed: c.ushort) ---
	ISteamInput_TriggerSimpleHapticEvent :: proc(self: ^ISteamInput, inputHandle: InputHandle_t, eHapticLocation: EControllerHapticLocation, nIntensity: uint8, nGainDB: i8, nOtherIntensity: uint8, nOtherGainDB: i8) ---
	ISteamInput_SetLEDColor :: proc(self: ^ISteamInput, inputHandle: InputHandle_t, nColorR: uint8, nColorG: uint8, nColorB: uint8, nFlags: c.uint) ---
	ISteamInput_Legacy_TriggerHapticPulse :: proc(self: ^ISteamInput, inputHandle: InputHandle_t, eTargetPad: ESteamControllerPad, usDurationMicroSec: c.ushort) ---
	ISteamInput_Legacy_TriggerRepeatedHapticPulse :: proc(self: ^ISteamInput, inputHandle: InputHandle_t, eTargetPad: ESteamControllerPad, usDurationMicroSec: c.ushort, usOffMicroSec: c.ushort, unRepeat: c.ushort, nFlags: c.uint) ---
	ISteamInput_ShowBindingPanel :: proc(self: ^ISteamInput, inputHandle: InputHandle_t) -> bool ---
	ISteamInput_GetInputTypeForHandle :: proc(self: ^ISteamInput, inputHandle: InputHandle_t) -> ESteamInputType ---
	ISteamInput_GetControllerForGamepadIndex :: proc(self: ^ISteamInput, nIndex: c.int) -> InputHandle_t ---
	ISteamInput_GetGamepadIndexForController :: proc(self: ^ISteamInput, ulinputHandle: InputHandle_t) -> c.int ---
	ISteamInput_GetStringForXboxOrigin :: proc(self: ^ISteamInput, eOrigin: EXboxOrigin) -> cstring ---
	ISteamInput_GetGlyphForXboxOrigin :: proc(self: ^ISteamInput, eOrigin: EXboxOrigin) -> cstring ---
	ISteamInput_GetActionOriginFromXboxOrigin :: proc(self: ^ISteamInput, inputHandle: InputHandle_t, eOrigin: EXboxOrigin) -> EInputActionOrigin ---
	ISteamInput_TranslateActionOrigin :: proc(self: ^ISteamInput, eDestinationInputType: ESteamInputType, eSourceOrigin: EInputActionOrigin) -> EInputActionOrigin ---
	ISteamInput_GetDeviceBindingRevision :: proc(self: ^ISteamInput, inputHandle: InputHandle_t, pMajor: ^int, pMinor: ^int) -> bool ---
	ISteamInput_GetRemotePlaySessionID :: proc(self: ^ISteamInput, inputHandle: InputHandle_t) -> uint32 ---
	ISteamInput_GetSessionInputConfigurationSettings :: proc(self: ^ISteamInput) -> uint16 ---
	// ISteamInput_SetDualSenseTriggerEffect :: proc(self: ^ISteamInput, inputHandle: InputHandle_t, pParam: ^ScePadTriggerEffectParam) ---
	SteamInput_v006 :: proc() -> ^ISteamInput ---

	ISteamController_Init :: proc(self: ^ISteamController) -> bool ---
	ISteamController_Shutdown :: proc(self: ^ISteamController) -> bool ---
	ISteamController_RunFrame :: proc(self: ^ISteamController) ---
	ISteamController_GetConnectedControllers :: proc(self: ^ISteamController, handlesOut: ^ControllerHandle_t) -> c.int ---
	ISteamController_GetActionSetHandle :: proc(self: ^ISteamController, pszActionSetName: cstring) -> ControllerActionSetHandle_t ---
	ISteamController_ActivateActionSet :: proc(self: ^ISteamController, controllerHandle: ControllerHandle_t, actionSetHandle: ControllerActionSetHandle_t) ---
	ISteamController_GetCurrentActionSet :: proc(self: ^ISteamController, controllerHandle: ControllerHandle_t) -> ControllerActionSetHandle_t ---
	ISteamController_ActivateActionSetLayer :: proc(self: ^ISteamController, controllerHandle: ControllerHandle_t, actionSetLayerHandle: ControllerActionSetHandle_t) ---
	ISteamController_DeactivateActionSetLayer :: proc(self: ^ISteamController, controllerHandle: ControllerHandle_t, actionSetLayerHandle: ControllerActionSetHandle_t) ---
	ISteamController_DeactivateAllActionSetLayers :: proc(self: ^ISteamController, controllerHandle: ControllerHandle_t) ---
	ISteamController_GetActiveActionSetLayers :: proc(self: ^ISteamController, controllerHandle: ControllerHandle_t, handlesOut: ^ControllerActionSetHandle_t) -> c.int ---
	ISteamController_GetDigitalActionHandle :: proc(self: ^ISteamController, pszActionName: cstring) -> ControllerDigitalActionHandle_t ---
	ISteamController_GetDigitalActionData :: proc(self: ^ISteamController, controllerHandle: ControllerHandle_t, digitalActionHandle: ControllerDigitalActionHandle_t) -> InputDigitalActionData_t ---
	ISteamController_GetDigitalActionOrigins :: proc(self: ^ISteamController, controllerHandle: ControllerHandle_t, actionSetHandle: ControllerActionSetHandle_t, digitalActionHandle: ControllerDigitalActionHandle_t, originsOut: ^EControllerActionOrigin) -> c.int ---
	ISteamController_GetAnalogActionHandle :: proc(self: ^ISteamController, pszActionName: cstring) -> ControllerAnalogActionHandle_t ---
	ISteamController_GetAnalogActionData :: proc(self: ^ISteamController, controllerHandle: ControllerHandle_t, analogActionHandle: ControllerAnalogActionHandle_t) -> InputAnalogActionData_t ---
	ISteamController_GetAnalogActionOrigins :: proc(self: ^ISteamController, controllerHandle: ControllerHandle_t, actionSetHandle: ControllerActionSetHandle_t, analogActionHandle: ControllerAnalogActionHandle_t, originsOut: ^EControllerActionOrigin) -> c.int ---
	ISteamController_GetGlyphForActionOrigin :: proc(self: ^ISteamController, eOrigin: EControllerActionOrigin) -> cstring ---
	ISteamController_GetStringForActionOrigin :: proc(self: ^ISteamController, eOrigin: EControllerActionOrigin) -> cstring ---
	ISteamController_StopAnalogActionMomentum :: proc(self: ^ISteamController, controllerHandle: ControllerHandle_t, eAction: ControllerAnalogActionHandle_t) ---
	ISteamController_GetMotionData :: proc(self: ^ISteamController, controllerHandle: ControllerHandle_t) -> InputMotionData_t ---
	ISteamController_TriggerHapticPulse :: proc(self: ^ISteamController, controllerHandle: ControllerHandle_t, eTargetPad: ESteamControllerPad, usDurationMicroSec: c.ushort) ---
	ISteamController_TriggerRepeatedHapticPulse :: proc(self: ^ISteamController, controllerHandle: ControllerHandle_t, eTargetPad: ESteamControllerPad, usDurationMicroSec: c.ushort, usOffMicroSec: c.ushort, unRepeat: c.ushort, nFlags: c.uint) ---
	ISteamController_TriggerVibration :: proc(self: ^ISteamController, controllerHandle: ControllerHandle_t, usLeftSpeed: c.ushort, usRightSpeed: c.ushort) ---
	ISteamController_SetLEDColor :: proc(self: ^ISteamController, controllerHandle: ControllerHandle_t, nColorR: uint8, nColorG: uint8, nColorB: uint8, nFlags: c.uint) ---
	ISteamController_ShowBindingPanel :: proc(self: ^ISteamController, controllerHandle: ControllerHandle_t) -> bool ---
	ISteamController_GetInputTypeForHandle :: proc(self: ^ISteamController, controllerHandle: ControllerHandle_t) -> ESteamInputType ---
	ISteamController_GetControllerForGamepadIndex :: proc(self: ^ISteamController, nIndex: c.int) -> ControllerHandle_t ---
	ISteamController_GetGamepadIndexForController :: proc(self: ^ISteamController, ulControllerHandle: ControllerHandle_t) -> c.int ---
	ISteamController_GetStringForXboxOrigin :: proc(self: ^ISteamController, eOrigin: EXboxOrigin) -> cstring ---
	ISteamController_GetGlyphForXboxOrigin :: proc(self: ^ISteamController, eOrigin: EXboxOrigin) -> cstring ---
	ISteamController_GetActionOriginFromXboxOrigin :: proc(self: ^ISteamController, controllerHandle: ControllerHandle_t, eOrigin: EXboxOrigin) -> EControllerActionOrigin ---
	ISteamController_TranslateActionOrigin :: proc(self: ^ISteamController, eDestinationInputType: ESteamInputType, eSourceOrigin: EControllerActionOrigin) -> EControllerActionOrigin ---
	ISteamController_GetControllerBindingRevision :: proc(self: ^ISteamController, controllerHandle: ControllerHandle_t, pMajor: ^int, pMinor: ^int) -> bool ---
	SteamController_v008 :: proc() -> ^ISteamController ---

	ISteamUGC_CreateQueryUserUGCRequest :: proc(self: ^ISteamUGC, unAccountID: AccountID_t, eListType: EUserUGCList, eMatchingUGCType: EUGCMatchingUGCType, eSortOrder: EUserUGCListSortOrder, nCreatorAppID: AppId_t, nConsumerAppID: AppId_t, unPage: uint32) -> UGCQueryHandle_t ---
	ISteamUGC_CreateQueryAllUGCRequestByPage :: proc(self: ^ISteamUGC, eQueryType: EUGCQuery, eMatchingeMatchingUGCTypeFileType: EUGCMatchingUGCType, nCreatorAppID: AppId_t, nConsumerAppID: AppId_t, unPage: uint32) -> UGCQueryHandle_t ---
	ISteamUGC_CreateQueryAllUGCRequestByCursor :: proc(self: ^ISteamUGC, eQueryType: EUGCQuery, eMatchingeMatchingUGCTypeFileType: EUGCMatchingUGCType, nCreatorAppID: AppId_t, nConsumerAppID: AppId_t, pchCursor: cstring) -> UGCQueryHandle_t ---
	ISteamUGC_CreateQueryUGCDetailsRequest :: proc(self: ^ISteamUGC, pvecPublishedFileID: ^PublishedFileId_t, unNumPublishedFileIDs: uint32) -> UGCQueryHandle_t ---
	ISteamUGC_SendQueryUGCRequest :: proc(self: ^ISteamUGC, handle: UGCQueryHandle_t) -> SteamAPICall_t ---
	ISteamUGC_GetQueryUGCResult :: proc(self: ^ISteamUGC, handle: UGCQueryHandle_t, index: uint32, pDetails: ^SteamUGCDetails_t) -> bool ---
	ISteamUGC_GetQueryUGCNumTags :: proc(self: ^ISteamUGC, handle: UGCQueryHandle_t, index: uint32) -> uint32 ---
	ISteamUGC_GetQueryUGCTag :: proc(self: ^ISteamUGC, handle: UGCQueryHandle_t, index: uint32, indexTag: uint32, pchValue: ^u8, cchValueSize: uint32) -> bool ---
	ISteamUGC_GetQueryUGCTagDisplayName :: proc(self: ^ISteamUGC, handle: UGCQueryHandle_t, index: uint32, indexTag: uint32, pchValue: ^u8, cchValueSize: uint32) -> bool ---
	ISteamUGC_GetQueryUGCPreviewURL :: proc(self: ^ISteamUGC, handle: UGCQueryHandle_t, index: uint32, pchURL: ^u8, cchURLSize: uint32) -> bool ---
	ISteamUGC_GetQueryUGCMetadata :: proc(self: ^ISteamUGC, handle: UGCQueryHandle_t, index: uint32, pchMetadata: ^u8, cchMetadatasize: uint32) -> bool ---
	ISteamUGC_GetQueryUGCChildren :: proc(self: ^ISteamUGC, handle: UGCQueryHandle_t, index: uint32, pvecPublishedFileID: ^PublishedFileId_t, cMaxEntries: uint32) -> bool ---
	ISteamUGC_GetQueryUGCStatistic :: proc(self: ^ISteamUGC, handle: UGCQueryHandle_t, index: uint32, eStatType: EItemStatistic, pStatValue: ^uint64) -> bool ---
	ISteamUGC_GetQueryUGCNumAdditionalPreviews :: proc(self: ^ISteamUGC, handle: UGCQueryHandle_t, index: uint32) -> uint32 ---
	ISteamUGC_GetQueryUGCAdditionalPreview :: proc(self: ^ISteamUGC, handle: UGCQueryHandle_t, index: uint32, previewIndex: uint32, pchURLOrVideoID: ^u8, cchURLSize: uint32, pchOriginalFileName: ^u8, cchOriginalFileNameSize: uint32, pPreviewType: ^EItemPreviewType) -> bool ---
	ISteamUGC_GetQueryUGCNumKeyValueTags :: proc(self: ^ISteamUGC, handle: UGCQueryHandle_t, index: uint32) -> uint32 ---
	ISteamUGC_GetQueryUGCKeyValueTag :: proc(self: ^ISteamUGC, handle: UGCQueryHandle_t, index: uint32, pchKey: cstring, pchValue: ^u8, cchValueSize: uint32) -> bool ---
	ISteamUGC_ReleaseQueryUGCRequest :: proc(self: ^ISteamUGC, handle: UGCQueryHandle_t) -> bool ---
	ISteamUGC_AddRequiredTag :: proc(self: ^ISteamUGC, handle: UGCQueryHandle_t, pTagName: cstring) -> bool ---
	ISteamUGC_AddRequiredTagGroup :: proc(self: ^ISteamUGC, handle: UGCQueryHandle_t, pTagGroups: ^SteamParamStringArray_t) -> bool ---
	ISteamUGC_AddExcludedTag :: proc(self: ^ISteamUGC, handle: UGCQueryHandle_t, pTagName: cstring) -> bool ---
	ISteamUGC_SetReturnOnlyIDs :: proc(self: ^ISteamUGC, handle: UGCQueryHandle_t, bReturnOnlyIDs: bool) -> bool ---
	ISteamUGC_SetReturnKeyValueTags :: proc(self: ^ISteamUGC, handle: UGCQueryHandle_t, bReturnKeyValueTags: bool) -> bool ---
	ISteamUGC_SetReturnLongDescription :: proc(self: ^ISteamUGC, handle: UGCQueryHandle_t, bReturnLongDescription: bool) -> bool ---
	ISteamUGC_SetReturnMetadata :: proc(self: ^ISteamUGC, handle: UGCQueryHandle_t, bReturnMetadata: bool) -> bool ---
	ISteamUGC_SetReturnChildren :: proc(self: ^ISteamUGC, handle: UGCQueryHandle_t, bReturnChildren: bool) -> bool ---
	ISteamUGC_SetReturnAdditionalPreviews :: proc(self: ^ISteamUGC, handle: UGCQueryHandle_t, bReturnAdditionalPreviews: bool) -> bool ---
	ISteamUGC_SetReturnTotalOnly :: proc(self: ^ISteamUGC, handle: UGCQueryHandle_t, bReturnTotalOnly: bool) -> bool ---
	ISteamUGC_SetReturnPlaytimeStats :: proc(self: ^ISteamUGC, handle: UGCQueryHandle_t, unDays: uint32) -> bool ---
	ISteamUGC_SetLanguage :: proc(self: ^ISteamUGC, handle: UGCQueryHandle_t, pchLanguage: cstring) -> bool ---
	ISteamUGC_SetAllowCachedResponse :: proc(self: ^ISteamUGC, handle: UGCQueryHandle_t, unMaxAgeSeconds: uint32) -> bool ---
	ISteamUGC_SetCloudFileNameFilter :: proc(self: ^ISteamUGC, handle: UGCQueryHandle_t, pMatchCloudFileName: cstring) -> bool ---
	ISteamUGC_SetMatchAnyTag :: proc(self: ^ISteamUGC, handle: UGCQueryHandle_t, bMatchAnyTag: bool) -> bool ---
	ISteamUGC_SetSearchText :: proc(self: ^ISteamUGC, handle: UGCQueryHandle_t, pSearchText: cstring) -> bool ---
	ISteamUGC_SetRankedByTrendDays :: proc(self: ^ISteamUGC, handle: UGCQueryHandle_t, unDays: uint32) -> bool ---
	ISteamUGC_SetTimeCreatedDateRange :: proc(self: ^ISteamUGC, handle: UGCQueryHandle_t, rtStart: RTime32, rtEnd: RTime32) -> bool ---
	ISteamUGC_SetTimeUpdatedDateRange :: proc(self: ^ISteamUGC, handle: UGCQueryHandle_t, rtStart: RTime32, rtEnd: RTime32) -> bool ---
	ISteamUGC_AddRequiredKeyValueTag :: proc(self: ^ISteamUGC, handle: UGCQueryHandle_t, pKey: cstring, pValue: cstring) -> bool ---
	ISteamUGC_RequestUGCDetails :: proc(self: ^ISteamUGC, nPublishedFileID: PublishedFileId_t, unMaxAgeSeconds: uint32) -> SteamAPICall_t ---
	ISteamUGC_CreateItem :: proc(self: ^ISteamUGC, nConsumerAppId: AppId_t, eFileType: EWorkshopFileType) -> SteamAPICall_t ---
	ISteamUGC_StartItemUpdate :: proc(self: ^ISteamUGC, nConsumerAppId: AppId_t, nPublishedFileID: PublishedFileId_t) -> UGCUpdateHandle_t ---
	ISteamUGC_SetItemTitle :: proc(self: ^ISteamUGC, handle: UGCUpdateHandle_t, pchTitle: cstring) -> bool ---
	ISteamUGC_SetItemDescription :: proc(self: ^ISteamUGC, handle: UGCUpdateHandle_t, pchDescription: cstring) -> bool ---
	ISteamUGC_SetItemUpdateLanguage :: proc(self: ^ISteamUGC, handle: UGCUpdateHandle_t, pchLanguage: cstring) -> bool ---
	ISteamUGC_SetItemMetadata :: proc(self: ^ISteamUGC, handle: UGCUpdateHandle_t, pchMetaData: cstring) -> bool ---
	ISteamUGC_SetItemVisibility :: proc(self: ^ISteamUGC, handle: UGCUpdateHandle_t, eVisibility: ERemoteStoragePublishedFileVisibility) -> bool ---
	ISteamUGC_SetItemTags :: proc(self: ^ISteamUGC, updateHandle: UGCUpdateHandle_t, pTags: ^SteamParamStringArray_t) -> bool ---
	ISteamUGC_SetItemContent :: proc(self: ^ISteamUGC, handle: UGCUpdateHandle_t, pszContentFolder: cstring) -> bool ---
	ISteamUGC_SetItemPreview :: proc(self: ^ISteamUGC, handle: UGCUpdateHandle_t, pszPreviewFile: cstring) -> bool ---
	ISteamUGC_SetAllowLegacyUpload :: proc(self: ^ISteamUGC, handle: UGCUpdateHandle_t, bAllowLegacyUpload: bool) -> bool ---
	ISteamUGC_RemoveAllItemKeyValueTags :: proc(self: ^ISteamUGC, handle: UGCUpdateHandle_t) -> bool ---
	ISteamUGC_RemoveItemKeyValueTags :: proc(self: ^ISteamUGC, handle: UGCUpdateHandle_t, pchKey: cstring) -> bool ---
	ISteamUGC_AddItemKeyValueTag :: proc(self: ^ISteamUGC, handle: UGCUpdateHandle_t, pchKey: cstring, pchValue: cstring) -> bool ---
	ISteamUGC_AddItemPreviewFile :: proc(self: ^ISteamUGC, handle: UGCUpdateHandle_t, pszPreviewFile: cstring, type: EItemPreviewType) -> bool ---
	ISteamUGC_AddItemPreviewVideo :: proc(self: ^ISteamUGC, handle: UGCUpdateHandle_t, pszVideoID: cstring) -> bool ---
	ISteamUGC_UpdateItemPreviewFile :: proc(self: ^ISteamUGC, handle: UGCUpdateHandle_t, index: uint32, pszPreviewFile: cstring) -> bool ---
	ISteamUGC_UpdateItemPreviewVideo :: proc(self: ^ISteamUGC, handle: UGCUpdateHandle_t, index: uint32, pszVideoID: cstring) -> bool ---
	ISteamUGC_RemoveItemPreview :: proc(self: ^ISteamUGC, handle: UGCUpdateHandle_t, index: uint32) -> bool ---
	ISteamUGC_SubmitItemUpdate :: proc(self: ^ISteamUGC, handle: UGCUpdateHandle_t, pchChangeNote: cstring) -> SteamAPICall_t ---
	ISteamUGC_GetItemUpdateProgress :: proc(self: ^ISteamUGC, handle: UGCUpdateHandle_t, punBytesProcessed: ^uint64, punBytesTotal: ^uint64) -> EItemUpdateStatus ---
	ISteamUGC_SetUserItemVote :: proc(self: ^ISteamUGC, nPublishedFileID: PublishedFileId_t, bVoteUp: bool) -> SteamAPICall_t ---
	ISteamUGC_GetUserItemVote :: proc(self: ^ISteamUGC, nPublishedFileID: PublishedFileId_t) -> SteamAPICall_t ---
	ISteamUGC_AddItemToFavorites :: proc(self: ^ISteamUGC, nAppId: AppId_t, nPublishedFileID: PublishedFileId_t) -> SteamAPICall_t ---
	ISteamUGC_RemoveItemFromFavorites :: proc(self: ^ISteamUGC, nAppId: AppId_t, nPublishedFileID: PublishedFileId_t) -> SteamAPICall_t ---
	ISteamUGC_SubscribeItem :: proc(self: ^ISteamUGC, nPublishedFileID: PublishedFileId_t) -> SteamAPICall_t ---
	ISteamUGC_UnsubscribeItem :: proc(self: ^ISteamUGC, nPublishedFileID: PublishedFileId_t) -> SteamAPICall_t ---
	ISteamUGC_GetNumSubscribedItems :: proc(self: ^ISteamUGC) -> uint32 ---
	ISteamUGC_GetSubscribedItems :: proc(self: ^ISteamUGC, pvecPublishedFileID: ^PublishedFileId_t, cMaxEntries: uint32) -> uint32 ---
	ISteamUGC_GetItemState :: proc(self: ^ISteamUGC, nPublishedFileID: PublishedFileId_t) -> uint32 ---
	ISteamUGC_GetItemInstallInfo :: proc(self: ^ISteamUGC, nPublishedFileID: PublishedFileId_t, punSizeOnDisk: ^uint64, pchFolder: ^u8, cchFolderSize: uint32, punTimeStamp: ^uint32) -> bool ---
	ISteamUGC_GetItemDownloadInfo :: proc(self: ^ISteamUGC, nPublishedFileID: PublishedFileId_t, punBytesDownloaded: ^uint64, punBytesTotal: ^uint64) -> bool ---
	ISteamUGC_DownloadItem :: proc(self: ^ISteamUGC, nPublishedFileID: PublishedFileId_t, bHighPriority: bool) -> bool ---
	ISteamUGC_BInitWorkshopForGameServer :: proc(self: ^ISteamUGC, unWorkshopDepotID: DepotId_t, pszFolder: cstring) -> bool ---
	ISteamUGC_SuspendDownloads :: proc(self: ^ISteamUGC, bSuspend: bool) ---
	ISteamUGC_StartPlaytimeTracking :: proc(self: ^ISteamUGC, pvecPublishedFileID: ^PublishedFileId_t, unNumPublishedFileIDs: uint32) -> SteamAPICall_t ---
	ISteamUGC_StopPlaytimeTracking :: proc(self: ^ISteamUGC, pvecPublishedFileID: ^PublishedFileId_t, unNumPublishedFileIDs: uint32) -> SteamAPICall_t ---
	ISteamUGC_StopPlaytimeTrackingForAllItems :: proc(self: ^ISteamUGC) -> SteamAPICall_t ---
	ISteamUGC_AddDependency :: proc(self: ^ISteamUGC, nParentPublishedFileID: PublishedFileId_t, nChildPublishedFileID: PublishedFileId_t) -> SteamAPICall_t ---
	ISteamUGC_RemoveDependency :: proc(self: ^ISteamUGC, nParentPublishedFileID: PublishedFileId_t, nChildPublishedFileID: PublishedFileId_t) -> SteamAPICall_t ---
	ISteamUGC_AddAppDependency :: proc(self: ^ISteamUGC, nPublishedFileID: PublishedFileId_t, nAppID: AppId_t) -> SteamAPICall_t ---
	ISteamUGC_RemoveAppDependency :: proc(self: ^ISteamUGC, nPublishedFileID: PublishedFileId_t, nAppID: AppId_t) -> SteamAPICall_t ---
	ISteamUGC_GetAppDependencies :: proc(self: ^ISteamUGC, nPublishedFileID: PublishedFileId_t) -> SteamAPICall_t ---
	ISteamUGC_DeleteItem :: proc(self: ^ISteamUGC, nPublishedFileID: PublishedFileId_t) -> SteamAPICall_t ---
	ISteamUGC_ShowWorkshopEULA :: proc(self: ^ISteamUGC) -> bool ---
	ISteamUGC_GetWorkshopEULAStatus :: proc(self: ^ISteamUGC) -> SteamAPICall_t ---
	SteamUGC_v016 :: proc() -> ^ISteamUGC ---

	ISteamAppList_GetNumInstalledApps :: proc(self: ^ISteamAppList) -> uint32 ---
	ISteamAppList_GetInstalledApps :: proc(self: ^ISteamAppList, pvecAppID: ^AppId_t, unMaxAppIDs: uint32) -> uint32 ---
	ISteamAppList_GetAppName :: proc(self: ^ISteamAppList, nAppID: AppId_t, pchName: ^u8, cchNameMax: c.int) -> c.int ---
	ISteamAppList_GetAppInstallDir :: proc(self: ^ISteamAppList, nAppID: AppId_t, pchDirectory: ^u8, cchNameMax: c.int) -> c.int ---
	ISteamAppList_GetAppBuildId :: proc(self: ^ISteamAppList, nAppID: AppId_t) -> c.int ---
	SteamAppList_v001 :: proc() -> ^ISteamAppList ---

	ISteamHTMLSurface_Init :: proc(self: ^ISteamHTMLSurface) -> bool ---
	ISteamHTMLSurface_Shutdown :: proc(self: ^ISteamHTMLSurface) -> bool ---
	ISteamHTMLSurface_CreateBrowser :: proc(self: ^ISteamHTMLSurface, pchUserAgent: cstring, pchUserCSS: cstring) -> SteamAPICall_t ---
	ISteamHTMLSurface_RemoveBrowser :: proc(self: ^ISteamHTMLSurface, unBrowserHandle: HHTMLBrowser) ---
	ISteamHTMLSurface_LoadURL :: proc(self: ^ISteamHTMLSurface, unBrowserHandle: HHTMLBrowser, pchURL: cstring, pchPostData: cstring) ---
	ISteamHTMLSurface_SetSize :: proc(self: ^ISteamHTMLSurface, unBrowserHandle: HHTMLBrowser, unWidth: uint32, unHeight: uint32) ---
	ISteamHTMLSurface_StopLoad :: proc(self: ^ISteamHTMLSurface, unBrowserHandle: HHTMLBrowser) ---
	ISteamHTMLSurface_Reload :: proc(self: ^ISteamHTMLSurface, unBrowserHandle: HHTMLBrowser) ---
	ISteamHTMLSurface_GoBack :: proc(self: ^ISteamHTMLSurface, unBrowserHandle: HHTMLBrowser) ---
	ISteamHTMLSurface_GoForward :: proc(self: ^ISteamHTMLSurface, unBrowserHandle: HHTMLBrowser) ---
	ISteamHTMLSurface_AddHeader :: proc(self: ^ISteamHTMLSurface, unBrowserHandle: HHTMLBrowser, pchKey: cstring, pchValue: cstring) ---
	ISteamHTMLSurface_ExecuteJavascript :: proc(self: ^ISteamHTMLSurface, unBrowserHandle: HHTMLBrowser, pchScript: cstring) ---
	ISteamHTMLSurface_MouseUp :: proc(self: ^ISteamHTMLSurface, unBrowserHandle: HHTMLBrowser, eMouseButton: ISteamHTMLSurface_EHTMLMouseButton) ---
	ISteamHTMLSurface_MouseDown :: proc(self: ^ISteamHTMLSurface, unBrowserHandle: HHTMLBrowser, eMouseButton: ISteamHTMLSurface_EHTMLMouseButton) ---
	ISteamHTMLSurface_MouseDoubleClick :: proc(self: ^ISteamHTMLSurface, unBrowserHandle: HHTMLBrowser, eMouseButton: ISteamHTMLSurface_EHTMLMouseButton) ---
	ISteamHTMLSurface_MouseMove :: proc(self: ^ISteamHTMLSurface, unBrowserHandle: HHTMLBrowser, x: c.int, y: c.int) ---
	ISteamHTMLSurface_MouseWheel :: proc(self: ^ISteamHTMLSurface, unBrowserHandle: HHTMLBrowser, nDelta: int32) ---
	ISteamHTMLSurface_KeyDown :: proc(self: ^ISteamHTMLSurface, unBrowserHandle: HHTMLBrowser, nNativeKeyCode: uint32, eHTMLKeyModifiers: ISteamHTMLSurface_EHTMLKeyModifiers, bIsSystemKey: bool) ---
	ISteamHTMLSurface_KeyUp :: proc(self: ^ISteamHTMLSurface, unBrowserHandle: HHTMLBrowser, nNativeKeyCode: uint32, eHTMLKeyModifiers: ISteamHTMLSurface_EHTMLKeyModifiers) ---
	ISteamHTMLSurface_KeyChar :: proc(self: ^ISteamHTMLSurface, unBrowserHandle: HHTMLBrowser, cUnicodeChar: uint32, eHTMLKeyModifiers: ISteamHTMLSurface_EHTMLKeyModifiers) ---
	ISteamHTMLSurface_SetHorizontalScroll :: proc(self: ^ISteamHTMLSurface, unBrowserHandle: HHTMLBrowser, nAbsolutePixelScroll: uint32) ---
	ISteamHTMLSurface_SetVerticalScroll :: proc(self: ^ISteamHTMLSurface, unBrowserHandle: HHTMLBrowser, nAbsolutePixelScroll: uint32) ---
	ISteamHTMLSurface_SetKeyFocus :: proc(self: ^ISteamHTMLSurface, unBrowserHandle: HHTMLBrowser, bHasKeyFocus: bool) ---
	ISteamHTMLSurface_ViewSource :: proc(self: ^ISteamHTMLSurface, unBrowserHandle: HHTMLBrowser) ---
	ISteamHTMLSurface_CopyToClipboard :: proc(self: ^ISteamHTMLSurface, unBrowserHandle: HHTMLBrowser) ---
	ISteamHTMLSurface_PasteFromClipboard :: proc(self: ^ISteamHTMLSurface, unBrowserHandle: HHTMLBrowser) ---
	ISteamHTMLSurface_Find :: proc(self: ^ISteamHTMLSurface, unBrowserHandle: HHTMLBrowser, pchSearchStr: cstring, bCurrentlyInFind: bool, bReverse: bool) ---
	ISteamHTMLSurface_StopFind :: proc(self: ^ISteamHTMLSurface, unBrowserHandle: HHTMLBrowser) ---
	ISteamHTMLSurface_GetLinkAtPosition :: proc(self: ^ISteamHTMLSurface, unBrowserHandle: HHTMLBrowser, x: c.int, y: c.int) ---
	ISteamHTMLSurface_SetCookie :: proc(self: ^ISteamHTMLSurface, pchHostname: cstring, pchKey: cstring, pchValue: cstring, pchPath: cstring, nExpires: RTime32, bSecure: bool, bHTTPOnly: bool) ---
	ISteamHTMLSurface_SetPageScaleFactor :: proc(self: ^ISteamHTMLSurface, unBrowserHandle: HHTMLBrowser, flZoom: f32, nPointX: c.int, nPointY: c.int) ---
	ISteamHTMLSurface_SetBackgroundMode :: proc(self: ^ISteamHTMLSurface, unBrowserHandle: HHTMLBrowser, bBackgroundMode: bool) ---
	ISteamHTMLSurface_SetDPIScalingFactor :: proc(self: ^ISteamHTMLSurface, unBrowserHandle: HHTMLBrowser, flDPIScaling: f32) ---
	ISteamHTMLSurface_OpenDeveloperTools :: proc(self: ^ISteamHTMLSurface, unBrowserHandle: HHTMLBrowser) ---
	ISteamHTMLSurface_AllowStartRequest :: proc(self: ^ISteamHTMLSurface, unBrowserHandle: HHTMLBrowser, bAllowed: bool) ---
	ISteamHTMLSurface_JSDialogResponse :: proc(self: ^ISteamHTMLSurface, unBrowserHandle: HHTMLBrowser, bResult: bool) ---
	ISteamHTMLSurface_FileLoadDialogResponse :: proc(self: ^ISteamHTMLSurface, unBrowserHandle: HHTMLBrowser, pchSelectedFiles: ^cstring) ---
	SteamHTMLSurface_v005 :: proc() -> ^ISteamHTMLSurface ---

	ISteamInventory_GetResultStatus :: proc(self: ^ISteamInventory, resultHandle: SteamInventoryResult_t) -> EResult ---
	ISteamInventory_GetResultItems :: proc(self: ^ISteamInventory, resultHandle: SteamInventoryResult_t, pOutItemsArray: ^SteamItemDetails_t, punOutItemsArraySize: ^uint32) -> bool ---
	ISteamInventory_GetResultItemProperty :: proc(self: ^ISteamInventory, resultHandle: SteamInventoryResult_t, unItemIndex: uint32, pchPropertyName: cstring, pchValueBuffer: ^u8, punValueBufferSizeOut: ^uint32) -> bool ---
	ISteamInventory_GetResultTimestamp :: proc(self: ^ISteamInventory, resultHandle: SteamInventoryResult_t) -> uint32 ---
	ISteamInventory_CheckResultSteamID :: proc(self: ^ISteamInventory, resultHandle: SteamInventoryResult_t, steamIDExpected: CSteamID) -> bool ---
	ISteamInventory_DestroyResult :: proc(self: ^ISteamInventory, resultHandle: SteamInventoryResult_t) ---
	ISteamInventory_GetAllItems :: proc(self: ^ISteamInventory, pResultHandle: ^SteamInventoryResult_t) -> bool ---
	ISteamInventory_GetItemsByID :: proc(self: ^ISteamInventory, pResultHandle: ^SteamInventoryResult_t, pInstanceIDs: ^SteamItemInstanceID_t, unCountInstanceIDs: uint32) -> bool ---
	ISteamInventory_SerializeResult :: proc(self: ^ISteamInventory, resultHandle: SteamInventoryResult_t, pOutBuffer: rawptr, punOutBufferSize: ^uint32) -> bool ---
	ISteamInventory_DeserializeResult :: proc(self: ^ISteamInventory, pOutResultHandle: ^SteamInventoryResult_t, pBuffer: rawptr, unBufferSize: uint32, bRESERVED_MUST_BE_FALSE: bool) -> bool ---
	ISteamInventory_GenerateItems :: proc(self: ^ISteamInventory, pResultHandle: ^SteamInventoryResult_t, pArrayItemDefs: ^SteamItemDef_t, punArrayQuantity: ^uint32, unArrayLength: uint32) -> bool ---
	ISteamInventory_GrantPromoItems :: proc(self: ^ISteamInventory, pResultHandle: ^SteamInventoryResult_t) -> bool ---
	ISteamInventory_AddPromoItem :: proc(self: ^ISteamInventory, pResultHandle: ^SteamInventoryResult_t, itemDef: SteamItemDef_t) -> bool ---
	ISteamInventory_AddPromoItems :: proc(self: ^ISteamInventory, pResultHandle: ^SteamInventoryResult_t, pArrayItemDefs: ^SteamItemDef_t, unArrayLength: uint32) -> bool ---
	ISteamInventory_ConsumeItem :: proc(self: ^ISteamInventory, pResultHandle: ^SteamInventoryResult_t, itemConsume: SteamItemInstanceID_t, unQuantity: uint32) -> bool ---
	ISteamInventory_ExchangeItems :: proc(self: ^ISteamInventory, pResultHandle: ^SteamInventoryResult_t, pArrayGenerate: ^SteamItemDef_t, punArrayGenerateQuantity: ^uint32, unArrayGenerateLength: uint32, pArrayDestroy: ^SteamItemInstanceID_t, punArrayDestroyQuantity: ^uint32, unArrayDestroyLength: uint32) -> bool ---
	ISteamInventory_TransferItemQuantity :: proc(self: ^ISteamInventory, pResultHandle: ^SteamInventoryResult_t, itemIdSource: SteamItemInstanceID_t, unQuantity: uint32, itemIdDest: SteamItemInstanceID_t) -> bool ---
	ISteamInventory_SendItemDropHeartbeat :: proc(self: ^ISteamInventory) ---
	ISteamInventory_TriggerItemDrop :: proc(self: ^ISteamInventory, pResultHandle: ^SteamInventoryResult_t, dropListDefinition: SteamItemDef_t) -> bool ---
	ISteamInventory_TradeItems :: proc(self: ^ISteamInventory, pResultHandle: ^SteamInventoryResult_t, steamIDTradePartner: CSteamID, pArrayGive: ^SteamItemInstanceID_t, pArrayGiveQuantity: ^uint32, nArrayGiveLength: uint32, pArrayGet: ^SteamItemInstanceID_t, pArrayGetQuantity: ^uint32, nArrayGetLength: uint32) -> bool ---
	ISteamInventory_LoadItemDefinitions :: proc(self: ^ISteamInventory) -> bool ---
	ISteamInventory_GetItemDefinitionIDs :: proc(self: ^ISteamInventory, pItemDefIDs: ^SteamItemDef_t, punItemDefIDsArraySize: ^uint32) -> bool ---
	ISteamInventory_GetItemDefinitionProperty :: proc(self: ^ISteamInventory, iDefinition: SteamItemDef_t, pchPropertyName: cstring, pchValueBuffer: ^u8, punValueBufferSizeOut: ^uint32) -> bool ---
	ISteamInventory_RequestEligiblePromoItemDefinitionsIDs :: proc(self: ^ISteamInventory, steamID: CSteamID) -> SteamAPICall_t ---
	ISteamInventory_GetEligiblePromoItemDefinitionIDs :: proc(self: ^ISteamInventory, steamID: CSteamID, pItemDefIDs: ^SteamItemDef_t, punItemDefIDsArraySize: ^uint32) -> bool ---
	ISteamInventory_StartPurchase :: proc(self: ^ISteamInventory, pArrayItemDefs: ^SteamItemDef_t, punArrayQuantity: ^uint32, unArrayLength: uint32) -> SteamAPICall_t ---
	ISteamInventory_RequestPrices :: proc(self: ^ISteamInventory) -> SteamAPICall_t ---
	ISteamInventory_GetNumItemsWithPrices :: proc(self: ^ISteamInventory) -> uint32 ---
	ISteamInventory_GetItemsWithPrices :: proc(self: ^ISteamInventory, pArrayItemDefs: ^SteamItemDef_t, pCurrentPrices: ^uint64, pBasePrices: ^uint64, unArrayLength: uint32) -> bool ---
	ISteamInventory_GetItemPrice :: proc(self: ^ISteamInventory, iDefinition: SteamItemDef_t, pCurrentPrice: ^uint64, pBasePrice: ^uint64) -> bool ---
	ISteamInventory_StartUpdateProperties :: proc(self: ^ISteamInventory) -> SteamInventoryUpdateHandle_t ---
	ISteamInventory_RemoveProperty :: proc(self: ^ISteamInventory, handle: SteamInventoryUpdateHandle_t, nItemID: SteamItemInstanceID_t, pchPropertyName: cstring) -> bool ---
	ISteamInventory_SetProperty :: proc(self: ^ISteamInventory, handle: SteamInventoryUpdateHandle_t, nItemID: SteamItemInstanceID_t, pchPropertyName: cstring, pchPropertyValue: cstring) -> bool ---
	ISteamInventory_SetPropertyBool :: proc(self: ^ISteamInventory, handle: SteamInventoryUpdateHandle_t, nItemID: SteamItemInstanceID_t, pchPropertyName: cstring, bValue: bool) -> bool ---
	ISteamInventory_SetPropertyInt64 :: proc(self: ^ISteamInventory, handle: SteamInventoryUpdateHandle_t, nItemID: SteamItemInstanceID_t, pchPropertyName: cstring, nValue: int64) -> bool ---
	ISteamInventory_SetPropertyFloat :: proc(self: ^ISteamInventory, handle: SteamInventoryUpdateHandle_t, nItemID: SteamItemInstanceID_t, pchPropertyName: cstring, flValue: f32) -> bool ---
	ISteamInventory_SubmitUpdateProperties :: proc(self: ^ISteamInventory, handle: SteamInventoryUpdateHandle_t, pResultHandle: ^SteamInventoryResult_t) -> bool ---
	ISteamInventory_InspectItem :: proc(self: ^ISteamInventory, pResultHandle: ^SteamInventoryResult_t, pchItemToken: cstring) -> bool ---
	SteamInventory_v003 :: proc() -> ^ISteamInventory ---

	ISteamVideo_GetVideoURL :: proc(self: ^ISteamVideo, unVideoAppID: AppId_t) ---
	ISteamVideo_IsBroadcasting :: proc(self: ^ISteamVideo, pnNumViewers: ^int) -> bool ---
	ISteamVideo_GetOPFSettings :: proc(self: ^ISteamVideo, unVideoAppID: AppId_t) ---
	ISteamVideo_GetOPFStringForApp :: proc(self: ^ISteamVideo, unVideoAppID: AppId_t, pchBuffer: ^u8, pnBufferSize: ^int32) -> bool ---
	SteamVideo_v002 :: proc() -> ^ISteamVideo ---

	ISteamParentalSettings_BIsParentalLockEnabled :: proc(self: ^ISteamParentalSettings) -> bool ---
	ISteamParentalSettings_BIsParentalLockLocked :: proc(self: ^ISteamParentalSettings) -> bool ---
	ISteamParentalSettings_BIsAppBlocked :: proc(self: ^ISteamParentalSettings, nAppID: AppId_t) -> bool ---
	ISteamParentalSettings_BIsAppInBlockList :: proc(self: ^ISteamParentalSettings, nAppID: AppId_t) -> bool ---
	ISteamParentalSettings_BIsFeatureBlocked :: proc(self: ^ISteamParentalSettings, eFeature: EParentalFeature) -> bool ---
	ISteamParentalSettings_BIsFeatureInBlockList :: proc(self: ^ISteamParentalSettings, eFeature: EParentalFeature) -> bool ---
	SteamParentalSettings_v001 :: proc() -> ^ISteamParentalSettings ---

	ISteamRemotePlay_GetSessionCount :: proc(self: ^ISteamRemotePlay) -> uint32 ---
	ISteamRemotePlay_GetSessionID :: proc(self: ^ISteamRemotePlay, iSessionIndex: c.int) -> RemotePlaySessionID_t ---
	ISteamRemotePlay_GetSessionSteamID :: proc(self: ^ISteamRemotePlay, unSessionID: RemotePlaySessionID_t) -> CSteamID ---
	ISteamRemotePlay_GetSessionClientName :: proc(self: ^ISteamRemotePlay, unSessionID: RemotePlaySessionID_t) -> cstring ---
	ISteamRemotePlay_GetSessionClientFormFactor :: proc(self: ^ISteamRemotePlay, unSessionID: RemotePlaySessionID_t) -> ESteamDeviceFormFactor ---
	ISteamRemotePlay_BGetSessionClientResolution :: proc(self: ^ISteamRemotePlay, unSessionID: RemotePlaySessionID_t, pnResolutionX: ^int, pnResolutionY: ^int) -> bool ---
	ISteamRemotePlay_BSendRemotePlayTogetherInvite :: proc(self: ^ISteamRemotePlay, steamIDFriend: CSteamID) -> bool ---
	SteamRemotePlay_v001 :: proc() -> ^ISteamRemotePlay ---

	ISteamNetworkingMessages_SendMessageToUser :: proc(self: ^ISteamNetworkingMessages, identityRemote: ^SteamNetworkingIdentity, pubData: rawptr, cubData: uint32, nSendFlags: c.int, nRemoteChannel: c.int) -> EResult ---
	ISteamNetworkingMessages_ReceiveMessagesOnChannel :: proc(self: ^ISteamNetworkingMessages, nLocalChannel: c.int, ppOutMessages: ^^SteamNetworkingMessage_t, nMaxMessages: c.int) -> c.int ---
	ISteamNetworkingMessages_AcceptSessionWithUser :: proc(self: ^ISteamNetworkingMessages, identityRemote: ^SteamNetworkingIdentity) -> bool ---
	ISteamNetworkingMessages_CloseSessionWithUser :: proc(self: ^ISteamNetworkingMessages, identityRemote: ^SteamNetworkingIdentity) -> bool ---
	ISteamNetworkingMessages_CloseChannelWithUser :: proc(self: ^ISteamNetworkingMessages, identityRemote: ^SteamNetworkingIdentity, nLocalChannel: c.int) -> bool ---
	ISteamNetworkingMessages_GetSessionConnectionInfo :: proc(self: ^ISteamNetworkingMessages, identityRemote: ^SteamNetworkingIdentity, pConnectionInfo: ^SteamNetConnectionInfo_t, pQuickStatus: ^SteamNetConnectionRealTimeStatus_t) -> ESteamNetworkingConnectionState ---
	SteamNetworkingMessages_SteamAPI_v002 :: proc() -> ^ISteamNetworkingMessages ---

	ISteamNetworkingSockets_CreateListenSocketIP :: proc(self: ^ISteamNetworkingSockets, localAddress: ^SteamNetworkingIPAddr, nOptions: c.int, pOptions: ^SteamNetworkingConfigValue_t) -> HSteamListenSocket ---
	ISteamNetworkingSockets_ConnectByIPAddress :: proc(self: ^ISteamNetworkingSockets, address: ^SteamNetworkingIPAddr, nOptions: c.int, pOptions: ^SteamNetworkingConfigValue_t) -> HSteamNetConnection ---
	ISteamNetworkingSockets_CreateListenSocketP2P :: proc(self: ^ISteamNetworkingSockets, nLocalVirtualPort: c.int, nOptions: c.int, pOptions: ^SteamNetworkingConfigValue_t) -> HSteamListenSocket ---
	ISteamNetworkingSockets_ConnectP2P :: proc(self: ^ISteamNetworkingSockets, identityRemote: ^SteamNetworkingIdentity, nRemoteVirtualPort: c.int, nOptions: c.int, pOptions: ^SteamNetworkingConfigValue_t) -> HSteamNetConnection ---
	ISteamNetworkingSockets_AcceptConnection :: proc(self: ^ISteamNetworkingSockets, hConn: HSteamNetConnection) -> EResult ---
	ISteamNetworkingSockets_CloseConnection :: proc(self: ^ISteamNetworkingSockets, hPeer: HSteamNetConnection, nReason: c.int, pszDebug: cstring, bEnableLinger: bool) -> bool ---
	ISteamNetworkingSockets_CloseListenSocket :: proc(self: ^ISteamNetworkingSockets, hSocket: HSteamListenSocket) -> bool ---
	ISteamNetworkingSockets_SetConnectionUserData :: proc(self: ^ISteamNetworkingSockets, hPeer: HSteamNetConnection, nUserData: int64) -> bool ---
	ISteamNetworkingSockets_GetConnectionUserData :: proc(self: ^ISteamNetworkingSockets, hPeer: HSteamNetConnection) -> int64 ---
	ISteamNetworkingSockets_SetConnectionName :: proc(self: ^ISteamNetworkingSockets, hPeer: HSteamNetConnection, pszName: cstring) ---
	ISteamNetworkingSockets_GetConnectionName :: proc(self: ^ISteamNetworkingSockets, hPeer: HSteamNetConnection, pszName: ^u8, nMaxLen: c.int) -> bool ---
	ISteamNetworkingSockets_SendMessageToConnection :: proc(self: ^ISteamNetworkingSockets, hConn: HSteamNetConnection, pData: rawptr, cbData: uint32, nSendFlags: c.int, pOutMessageNumber: ^int64) -> EResult ---
	ISteamNetworkingSockets_FlushMessagesOnConnection :: proc(self: ^ISteamNetworkingSockets, hConn: HSteamNetConnection) -> EResult ---
	ISteamNetworkingSockets_ReceiveMessagesOnConnection :: proc(self: ^ISteamNetworkingSockets, hConn: HSteamNetConnection, ppOutMessages: ^^SteamNetworkingMessage_t, nMaxMessages: c.int) -> c.int ---
	ISteamNetworkingSockets_GetConnectionInfo :: proc(self: ^ISteamNetworkingSockets, hConn: HSteamNetConnection, pInfo: ^SteamNetConnectionInfo_t) -> bool ---
	ISteamNetworkingSockets_GetConnectionRealTimeStatus :: proc(self: ^ISteamNetworkingSockets, hConn: HSteamNetConnection, pStatus: ^SteamNetConnectionRealTimeStatus_t, nLanes: c.int, pLanes: ^SteamNetConnectionRealTimeLaneStatus_t) -> EResult ---
	ISteamNetworkingSockets_GetDetailedConnectionStatus :: proc(self: ^ISteamNetworkingSockets, hConn: HSteamNetConnection, pszBuf: ^u8, cbBuf: c.int) -> c.int ---
	ISteamNetworkingSockets_GetListenSocketAddress :: proc(self: ^ISteamNetworkingSockets, hSocket: HSteamListenSocket, address: ^SteamNetworkingIPAddr) -> bool ---
	ISteamNetworkingSockets_CreateSocketPair :: proc(self: ^ISteamNetworkingSockets, pOutConnection1: ^HSteamNetConnection, pOutConnection2: ^HSteamNetConnection, bUseNetworkLoopback: bool, pIdentity1: ^SteamNetworkingIdentity, pIdentity2: ^SteamNetworkingIdentity) -> bool ---
	ISteamNetworkingSockets_ConfigureConnectionLanes :: proc(self: ^ISteamNetworkingSockets, hConn: HSteamNetConnection, nNumLanes: c.int, pLanePriorities: ^int, pLaneWeights: ^uint16) -> EResult ---
	ISteamNetworkingSockets_GetIdentity :: proc(self: ^ISteamNetworkingSockets, pIdentity: ^SteamNetworkingIdentity) -> bool ---
	ISteamNetworkingSockets_InitAuthentication :: proc(self: ^ISteamNetworkingSockets) -> ESteamNetworkingAvailability ---
	ISteamNetworkingSockets_GetAuthenticationStatus :: proc(self: ^ISteamNetworkingSockets, pDetails: ^SteamNetAuthenticationStatus_t) -> ESteamNetworkingAvailability ---
	ISteamNetworkingSockets_CreatePollGroup :: proc(self: ^ISteamNetworkingSockets) -> HSteamNetPollGroup ---
	ISteamNetworkingSockets_DestroyPollGroup :: proc(self: ^ISteamNetworkingSockets, hPollGroup: HSteamNetPollGroup) -> bool ---
	ISteamNetworkingSockets_SetConnectionPollGroup :: proc(self: ^ISteamNetworkingSockets, hConn: HSteamNetConnection, hPollGroup: HSteamNetPollGroup) -> bool ---
	ISteamNetworkingSockets_ReceiveMessagesOnPollGroup :: proc(self: ^ISteamNetworkingSockets, hPollGroup: HSteamNetPollGroup, ppOutMessages: ^^SteamNetworkingMessage_t, nMaxMessages: c.int) -> c.int ---
	ISteamNetworkingSockets_ReceivedRelayAuthTicket :: proc(self: ^ISteamNetworkingSockets, pvTicket: rawptr, cbTicket: c.int, pOutParsedTicket: SteamDatagramRelayAuthTicketPtr) -> bool ---
	ISteamNetworkingSockets_FindRelayAuthTicketForServer :: proc(self: ^ISteamNetworkingSockets, identityGameServer: ^SteamNetworkingIdentity, nRemoteVirtualPort: c.int, pOutParsedTicket: SteamDatagramRelayAuthTicketPtr) -> c.int ---
	ISteamNetworkingSockets_ConnectToHostedDedicatedServer :: proc(self: ^ISteamNetworkingSockets, identityTarget: ^SteamNetworkingIdentity, nRemoteVirtualPort: c.int, nOptions: c.int, pOptions: ^SteamNetworkingConfigValue_t) -> HSteamNetConnection ---
	ISteamNetworkingSockets_GetHostedDedicatedServerPort :: proc(self: ^ISteamNetworkingSockets) -> uint16 ---
	ISteamNetworkingSockets_GetHostedDedicatedServerPOPID :: proc(self: ^ISteamNetworkingSockets) -> SteamNetworkingPOPID ---
	ISteamNetworkingSockets_GetHostedDedicatedServerAddress :: proc(self: ^ISteamNetworkingSockets, pRouting: ^SteamDatagramHostedAddress) -> EResult ---
	ISteamNetworkingSockets_CreateHostedDedicatedServerListenSocket :: proc(self: ^ISteamNetworkingSockets, nLocalVirtualPort: c.int, nOptions: c.int, pOptions: ^SteamNetworkingConfigValue_t) -> HSteamListenSocket ---
	ISteamNetworkingSockets_GetGameCoordinatorServerLogin :: proc(self: ^ISteamNetworkingSockets, pLoginInfo: ^SteamDatagramGameCoordinatorServerLogin, pcbSignedBlob: ^int, pBlob: rawptr) -> EResult ---
	ISteamNetworkingSockets_ConnectP2PCustomSignaling :: proc(self: ^ISteamNetworkingSockets, pSignaling: SteamDatagramRelayAuthTicketPtr, pPeerIdentity: ^SteamNetworkingIdentity, nRemoteVirtualPort: c.int, nOptions: c.int, pOptions: ^SteamNetworkingConfigValue_t) -> HSteamNetConnection ---
	ISteamNetworkingSockets_ReceivedP2PCustomSignal :: proc(self: ^ISteamNetworkingSockets, pMsg: rawptr, cbMsg: c.int, pContext: ISteamNetworkingSignalingRecvContextPtr) -> bool ---
	ISteamNetworkingSockets_GetCertificateRequest :: proc(self: ^ISteamNetworkingSockets, pcbBlob: ^int, pBlob: rawptr, errMsg: ^SteamNetworkingErrMsg) -> bool ---
	ISteamNetworkingSockets_SetCertificate :: proc(self: ^ISteamNetworkingSockets, pCertificate: rawptr, cbCertificate: c.int, errMsg: ^SteamNetworkingErrMsg) -> bool ---
	ISteamNetworkingSockets_ResetIdentity :: proc(self: ^ISteamNetworkingSockets, pIdentity: ^SteamNetworkingIdentity) ---
	ISteamNetworkingSockets_RunCallbacks :: proc(self: ^ISteamNetworkingSockets) ---
	ISteamNetworkingSockets_BeginAsyncRequestFakeIP :: proc(self: ^ISteamNetworkingSockets, nNumPorts: c.int) -> bool ---
	ISteamNetworkingSockets_GetFakeIP :: proc(self: ^ISteamNetworkingSockets, idxFirstPort: c.int, pInfo: ^SteamNetworkingFakeIPResult_t) ---
	ISteamNetworkingSockets_CreateListenSocketP2PFakeIP :: proc(self: ^ISteamNetworkingSockets, idxFakePort: c.int, nOptions: c.int, pOptions: ^SteamNetworkingConfigValue_t) -> HSteamListenSocket ---
	ISteamNetworkingSockets_GetRemoteFakeIPForConnection :: proc(self: ^ISteamNetworkingSockets, hConn: HSteamNetConnection, pOutAddr: ^SteamNetworkingIPAddr) -> EResult ---
	ISteamNetworkingSockets_CreateFakeUDPPort :: proc(self: ^ISteamNetworkingSockets, idxFakeServerPort: c.int) -> ^ISteamNetworkingFakeUDPPort ---
	SteamNetworkingSockets_SteamAPI_v012 :: proc() -> ^ISteamNetworkingSockets ---

	ISteamNetworkingUtils_AllocateMessage :: proc(self: ^ISteamNetworkingUtils, cbAllocateBuffer: c.int) -> ^SteamNetworkingMessage_t ---
	ISteamNetworkingUtils_InitRelayNetworkAccess :: proc(self: ^ISteamNetworkingUtils) ---
	ISteamNetworkingUtils_GetRelayNetworkStatus :: proc(self: ^ISteamNetworkingUtils, pDetails: ^SteamRelayNetworkStatus_t) -> ESteamNetworkingAvailability ---
	ISteamNetworkingUtils_GetLocalPingLocation :: proc(self: ^ISteamNetworkingUtils, result: ^SteamNetworkPingLocation_t) -> f32 ---
	ISteamNetworkingUtils_EstimatePingTimeBetweenTwoLocations :: proc(self: ^ISteamNetworkingUtils, location1: ^SteamNetworkPingLocation_t, location2: ^SteamNetworkPingLocation_t) -> c.int ---
	ISteamNetworkingUtils_EstimatePingTimeFromLocalHost :: proc(self: ^ISteamNetworkingUtils, remoteLocation: ^SteamNetworkPingLocation_t) -> c.int ---
	ISteamNetworkingUtils_ConvertPingLocationToString :: proc(self: ^ISteamNetworkingUtils, location: ^SteamNetworkPingLocation_t, pszBuf: ^u8, cchBufSize: c.int) ---
	ISteamNetworkingUtils_ParsePingLocationString :: proc(self: ^ISteamNetworkingUtils, pszString: cstring, result: ^SteamNetworkPingLocation_t) -> bool ---
	ISteamNetworkingUtils_CheckPingDataUpToDate :: proc(self: ^ISteamNetworkingUtils, flMaxAgeSeconds: f32) -> bool ---
	ISteamNetworkingUtils_GetPingToDataCenter :: proc(self: ^ISteamNetworkingUtils, popID: SteamNetworkingPOPID, pViaRelayPoP: ^SteamNetworkingPOPID) -> c.int ---
	ISteamNetworkingUtils_GetDirectPingToPOP :: proc(self: ^ISteamNetworkingUtils, popID: SteamNetworkingPOPID) -> c.int ---
	ISteamNetworkingUtils_GetPOPCount :: proc(self: ^ISteamNetworkingUtils) -> c.int ---
	ISteamNetworkingUtils_GetPOPList :: proc(self: ^ISteamNetworkingUtils, list: ^SteamNetworkingPOPID, nListSz: c.int) -> c.int ---
	ISteamNetworkingUtils_GetLocalTimestamp :: proc(self: ^ISteamNetworkingUtils) -> SteamNetworkingMicroseconds ---
	ISteamNetworkingUtils_SetDebugOutputFunction :: proc(self: ^ISteamNetworkingUtils, eDetailLevel: ESteamNetworkingSocketsDebugOutputType, pfnFunc: FSteamNetworkingSocketsDebugOutput) ---
	ISteamNetworkingUtils_IsFakeIPv4 :: proc(self: ^ISteamNetworkingUtils, nIPv4: uint32) -> bool ---
	ISteamNetworkingUtils_GetIPv4FakeIPType :: proc(self: ^ISteamNetworkingUtils, nIPv4: uint32) -> ESteamNetworkingFakeIPType ---
	ISteamNetworkingUtils_GetRealIdentityForFakeIP :: proc(self: ^ISteamNetworkingUtils, fakeIP: ^SteamNetworkingIPAddr, pOutRealIdentity: ^SteamNetworkingIdentity) -> EResult ---
	ISteamNetworkingUtils_SetGlobalConfigValueInt32 :: proc(self: ^ISteamNetworkingUtils, eValue: ESteamNetworkingConfigValue, val: int32) -> bool ---
	ISteamNetworkingUtils_SetGlobalConfigValueFloat :: proc(self: ^ISteamNetworkingUtils, eValue: ESteamNetworkingConfigValue, val: f32) -> bool ---
	ISteamNetworkingUtils_SetGlobalConfigValueString :: proc(self: ^ISteamNetworkingUtils, eValue: ESteamNetworkingConfigValue, val: cstring) -> bool ---
	ISteamNetworkingUtils_SetGlobalConfigValuePtr :: proc(self: ^ISteamNetworkingUtils, eValue: ESteamNetworkingConfigValue, val: rawptr) -> bool ---
	ISteamNetworkingUtils_SetConnectionConfigValueInt32 :: proc(self: ^ISteamNetworkingUtils, hConn: HSteamNetConnection, eValue: ESteamNetworkingConfigValue, val: int32) -> bool ---
	ISteamNetworkingUtils_SetConnectionConfigValueFloat :: proc(self: ^ISteamNetworkingUtils, hConn: HSteamNetConnection, eValue: ESteamNetworkingConfigValue, val: f32) -> bool ---
	ISteamNetworkingUtils_SetConnectionConfigValueString :: proc(self: ^ISteamNetworkingUtils, hConn: HSteamNetConnection, eValue: ESteamNetworkingConfigValue, val: cstring) -> bool ---
	ISteamNetworkingUtils_SetGlobalCallback_SteamNetConnectionStatusChanged :: proc(self: ^ISteamNetworkingUtils, fnCallback: FnSteamNetConnectionStatusChanged) -> bool ---
	ISteamNetworkingUtils_SetGlobalCallback_SteamNetAuthenticationStatusChanged :: proc(self: ^ISteamNetworkingUtils, fnCallback: FnSteamNetAuthenticationStatusChanged) -> bool ---
	ISteamNetworkingUtils_SetGlobalCallback_SteamRelayNetworkStatusChanged :: proc(self: ^ISteamNetworkingUtils, fnCallback: FnSteamRelayNetworkStatusChanged) -> bool ---
	ISteamNetworkingUtils_SetGlobalCallback_FakeIPResult :: proc(self: ^ISteamNetworkingUtils, fnCallback: FnSteamNetworkingFakeIPResult) -> bool ---
	ISteamNetworkingUtils_SetGlobalCallback_MessagesSessionRequest :: proc(self: ^ISteamNetworkingUtils, fnCallback: FnSteamNetworkingMessagesSessionRequest) -> bool ---
	ISteamNetworkingUtils_SetGlobalCallback_MessagesSessionFailed :: proc(self: ^ISteamNetworkingUtils, fnCallback: FnSteamNetworkingMessagesSessionFailed) -> bool ---
	ISteamNetworkingUtils_SetConfigValue :: proc(self: ^ISteamNetworkingUtils, eValue: ESteamNetworkingConfigValue, eScopeType: ESteamNetworkingConfigScope, scopeObj: intptr, eDataType: ESteamNetworkingConfigDataType, pArg: rawptr) -> bool ---
	ISteamNetworkingUtils_SetConfigValueStruct :: proc(self: ^ISteamNetworkingUtils, opt: ^SteamNetworkingConfigValue_t, eScopeType: ESteamNetworkingConfigScope, scopeObj: intptr) -> bool ---
	ISteamNetworkingUtils_GetConfigValue :: proc(self: ^ISteamNetworkingUtils, eValue: ESteamNetworkingConfigValue, eScopeType: ESteamNetworkingConfigScope, scopeObj: intptr, pOutDataType: ^ESteamNetworkingConfigDataType, pResult: rawptr, cbResult: ^int) -> ESteamNetworkingGetConfigValueResult ---
	ISteamNetworkingUtils_GetConfigValueInfo :: proc(self: ^ISteamNetworkingUtils, eValue: ESteamNetworkingConfigValue, pOutDataType: ^ESteamNetworkingConfigDataType, pOutScope: ^ESteamNetworkingConfigScope) -> cstring ---
	ISteamNetworkingUtils_IterateGenericEditableConfigValues :: proc(self: ^ISteamNetworkingUtils, eCurrent: ESteamNetworkingConfigValue, bEnumerateDevVars: bool) -> ESteamNetworkingConfigValue ---
	ISteamNetworkingUtils_SteamNetworkingIPAddr_ToString :: proc(self: ^ISteamNetworkingUtils, addr: ^SteamNetworkingIPAddr, buf: ^u8, cbBuf: uint32, bWithPort: bool) ---
	ISteamNetworkingUtils_SteamNetworkingIPAddr_ParseString :: proc(self: ^ISteamNetworkingUtils, pAddr: ^SteamNetworkingIPAddr, pszStr: cstring) -> bool ---
	ISteamNetworkingUtils_SteamNetworkingIPAddr_GetFakeIPType :: proc(self: ^ISteamNetworkingUtils, addr: ^SteamNetworkingIPAddr) -> ESteamNetworkingFakeIPType ---
	ISteamNetworkingUtils_SteamNetworkingIdentity_ToString :: proc(self: ^ISteamNetworkingUtils, identity: ^SteamNetworkingIdentity, buf: ^u8, cbBuf: uint32) ---
	ISteamNetworkingUtils_SteamNetworkingIdentity_ParseString :: proc(self: ^ISteamNetworkingUtils, pIdentity: ^SteamNetworkingIdentity, pszStr: cstring) -> bool ---

	ISteamGameServer_SetProduct :: proc(self: ^ISteamGameServer, pszProduct: cstring) ---
	ISteamGameServer_SetGameDescription :: proc(self: ^ISteamGameServer, pszGameDescription: cstring) ---
	ISteamGameServer_SetModDir :: proc(self: ^ISteamGameServer, pszModDir: cstring) ---
	ISteamGameServer_SetDedicatedServer :: proc(self: ^ISteamGameServer, bDedicated: bool) ---
	ISteamGameServer_LogOn :: proc(self: ^ISteamGameServer, pszToken: cstring) ---
	ISteamGameServer_LogOnAnonymous :: proc(self: ^ISteamGameServer) ---
	ISteamGameServer_LogOff :: proc(self: ^ISteamGameServer) ---
	ISteamGameServer_BLoggedOn :: proc(self: ^ISteamGameServer) -> bool ---
	ISteamGameServer_BSecure :: proc(self: ^ISteamGameServer) -> bool ---
	ISteamGameServer_GetSteamID :: proc(self: ^ISteamGameServer) -> CSteamID ---
	ISteamGameServer_WasRestartRequested :: proc(self: ^ISteamGameServer) -> bool ---
	ISteamGameServer_SetMaxPlayerCount :: proc(self: ^ISteamGameServer, cPlayersMax: c.int) ---
	ISteamGameServer_SetBotPlayerCount :: proc(self: ^ISteamGameServer, cBotplayers: c.int) ---
	ISteamGameServer_SetServerName :: proc(self: ^ISteamGameServer, pszServerName: cstring) ---
	ISteamGameServer_SetMapName :: proc(self: ^ISteamGameServer, pszMapName: cstring) ---
	ISteamGameServer_SetPasswordProtected :: proc(self: ^ISteamGameServer, bPasswordProtected: bool) ---
	ISteamGameServer_SetSpectatorPort :: proc(self: ^ISteamGameServer, unSpectatorPort: uint16) ---
	ISteamGameServer_SetSpectatorServerName :: proc(self: ^ISteamGameServer, pszSpectatorServerName: cstring) ---
	ISteamGameServer_ClearAllKeyValues :: proc(self: ^ISteamGameServer) ---
	ISteamGameServer_SetKeyValue :: proc(self: ^ISteamGameServer, pKey: cstring, pValue: cstring) ---
	ISteamGameServer_SetGameTags :: proc(self: ^ISteamGameServer, pchGameTags: cstring) ---
	ISteamGameServer_SetGameData :: proc(self: ^ISteamGameServer, pchGameData: cstring) ---
	ISteamGameServer_SetRegion :: proc(self: ^ISteamGameServer, pszRegion: cstring) ---
	ISteamGameServer_SetAdvertiseServerActive :: proc(self: ^ISteamGameServer, bActive: bool) ---
	ISteamGameServer_GetAuthSessionTicket :: proc(self: ^ISteamGameServer, pTicket: rawptr, cbMaxTicket: c.int, pcbTicket: ^uint32) -> HAuthTicket ---
	ISteamGameServer_BeginAuthSession :: proc(self: ^ISteamGameServer, pAuthTicket: rawptr, cbAuthTicket: c.int, steamID: CSteamID) -> EBeginAuthSessionResult ---
	ISteamGameServer_EndAuthSession :: proc(self: ^ISteamGameServer, steamID: CSteamID) ---
	ISteamGameServer_CancelAuthTicket :: proc(self: ^ISteamGameServer, hAuthTicket: HAuthTicket) ---
	ISteamGameServer_UserHasLicenseForApp :: proc(self: ^ISteamGameServer, steamID: CSteamID, appID: AppId_t) -> EUserHasLicenseForAppResult ---
	ISteamGameServer_RequestUserGroupStatus :: proc(self: ^ISteamGameServer, steamIDUser: CSteamID, steamIDGroup: CSteamID) -> bool ---
	ISteamGameServer_GetGameplayStats :: proc(self: ^ISteamGameServer) ---
	ISteamGameServer_GetServerReputation :: proc(self: ^ISteamGameServer) -> SteamAPICall_t ---
	ISteamGameServer_GetPublicIP :: proc(self: ^ISteamGameServer) -> SteamIPAddress_t ---
	ISteamGameServer_HandleIncomingPacket :: proc(self: ^ISteamGameServer, pData: rawptr, cbData: c.int, srcIP: uint32, srcPort: uint16) -> bool ---
	ISteamGameServer_GetNextOutgoingPacket :: proc(self: ^ISteamGameServer, pOut: rawptr, cbMaxOut: c.int, pNetAdr: ^uint32, pPort: ^uint16) -> c.int ---
	ISteamGameServer_AssociateWithClan :: proc(self: ^ISteamGameServer, steamIDClan: CSteamID) -> SteamAPICall_t ---
	ISteamGameServer_ComputeNewPlayerCompatibility :: proc(self: ^ISteamGameServer, steamIDNewPlayer: CSteamID) -> SteamAPICall_t ---
	ISteamGameServer_SendUserConnectAndAuthenticate_DEPRECATED :: proc(self: ^ISteamGameServer, unIPClient: uint32, pvAuthBlob: rawptr, cubAuthBlobSize: uint32, pSteamIDUser: ^CSteamID) -> bool ---
	ISteamGameServer_CreateUnauthenticatedUserConnection :: proc(self: ^ISteamGameServer) -> CSteamID ---
	ISteamGameServer_SendUserDisconnect_DEPRECATED :: proc(self: ^ISteamGameServer, steamIDUser: CSteamID) ---
	ISteamGameServer_BUpdateUserData :: proc(self: ^ISteamGameServer, steamIDUser: CSteamID, pchPlayerName: cstring, uScore: uint32) -> bool ---

	ISteamGameServerStats_RequestUserStats :: proc(self: ^ISteamGameServerStats, steamIDUser: CSteamID) -> SteamAPICall_t ---
	ISteamGameServerStats_GetUserStatInt32 :: proc(self: ^ISteamGameServerStats, steamIDUser: CSteamID, pchName: cstring, pData: ^int32) -> bool ---
	ISteamGameServerStats_GetUserStatFloat :: proc(self: ^ISteamGameServerStats, steamIDUser: CSteamID, pchName: cstring, pData: ^f32) -> bool ---
	ISteamGameServerStats_GetUserAchievement :: proc(self: ^ISteamGameServerStats, steamIDUser: CSteamID, pchName: cstring, pbAchieved: ^bool) -> bool ---
	ISteamGameServerStats_SetUserStatInt32 :: proc(self: ^ISteamGameServerStats, steamIDUser: CSteamID, pchName: cstring, nData: int32) -> bool ---
	ISteamGameServerStats_SetUserStatFloat :: proc(self: ^ISteamGameServerStats, steamIDUser: CSteamID, pchName: cstring, fData: f32) -> bool ---
	ISteamGameServerStats_UpdateUserAvgRateStat :: proc(self: ^ISteamGameServerStats, steamIDUser: CSteamID, pchName: cstring, flCountThisSession: f32, dSessionLength: f64) -> bool ---
	ISteamGameServerStats_SetUserAchievement :: proc(self: ^ISteamGameServerStats, steamIDUser: CSteamID, pchName: cstring) -> bool ---
	ISteamGameServerStats_ClearUserAchievement :: proc(self: ^ISteamGameServerStats, steamIDUser: CSteamID, pchName: cstring) -> bool ---
	ISteamGameServerStats_StoreUserStats :: proc(self: ^ISteamGameServerStats, steamIDUser: CSteamID) -> SteamAPICall_t ---

	ISteamNetworkingFakeUDPPort_DestroyFakeUDPPort :: proc(self: ^ISteamNetworkingFakeUDPPort) ---
	ISteamNetworkingFakeUDPPort_SendMessageToFakeIP :: proc(self: ^ISteamNetworkingFakeUDPPort, remoteAddress: ^SteamNetworkingIPAddr, pData: rawptr, cbData: uint32, nSendFlags: c.int) -> EResult ---
	ISteamNetworkingFakeUDPPort_ReceiveMessages :: proc(self: ^ISteamNetworkingFakeUDPPort, ppOutMessages: ^^SteamNetworkingMessage_t, nMaxMessages: c.int) -> c.int ---
	ISteamNetworkingFakeUDPPort_ScheduleCleanup :: proc(self: ^ISteamNetworkingFakeUDPPort, remoteAddress: ^SteamNetworkingIPAddr) ---

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

CGameID_EGameIDType :: enum {
	k_EGameIDTypeApp      = 0,
	k_EGameIDTypeGameMod  = 1,
	k_EGameIDTypeShortcut = 2,
	k_EGameIDTypeP2P      = 3,
}

// HACK
CGameID :: struct #packed {
	m_ulGameID: uint64,
}

SteamDatagramRelayAuthTicketPtr :: distinct rawptr
ISteamNetworkingConnectionSignalingPtr :: distinct rawptr
ISteamNetworkingSignalingRecvContextPtr :: distinct rawptr

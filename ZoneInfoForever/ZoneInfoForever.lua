local ZIF_WELCOME_VERSION = "1.7.1"
-- Zone Info: Forever
-- Standalone addon to show zone levels on the map

local mapTable = {
    -- Eastern Kingdoms
    --[[Alterac Mountains]]		[1416] = {minLevel = 30, 	maxLevel = 40,		minFish = "130",       dungeons = {{id=16560, text=" (28-33)"}}, transport = "Sky Boats: Zephras Isle", faction = "Contested", herbs = {2453, 3355, 3356, 3357, 3818, 3821}, mining = {2771, 2775, 2772, 2776, 3858}},
    --[[Arathi Highlands]]		[1417] = {minLevel = 30, 	maxLevel = 40,		minFish = "130",       faction = "Contested", herbs = {2453, 3355, 3356, 3357, 3818, 3821}, mining = {2771, 2775, 2772, 2776, 3858}},
    --[[Badlands]]				[1418] = {minLevel = 35, 	maxLevel = 45,		dungeons = {{id=1337, text=" (35-45)"}}, transport = "Boats: Steamwheedle Port", faction = "Contested", herbs = {3355, 3356, 3818, 3821, 4625}, mining = {2772, 2776, 3858, 7911}},
    --[[Blasted Lands]]			[1419] = {minLevel = 45, 	maxLevel = 55,                             faction = "Contested", herbs = {3818, 3821, 3358, 4625, 8838, 8846}, mining = {2772, 2776, 3858, 7911, 10620}},
    --[[Burning Steppes]]		[1428] = {minLevel = 50, 	maxLevel = 58,		minFish = "330",       dungeons = {{id=17803, text=" (52-60)"}, {id=17804, text=" (55-60)"}, {id=2717, text=" (60)"}, {id=2677, text=" (60)"}}, faction = "Contested", herbs = {4625, 13464, 13463, 13465, 13468}, mining = {3858, 7911, 10620, 10620}},
    --[[Deadwind Pass]]			[1430] = {minLevel = 55, 	maxLevel = 60,		minFish = "330",       faction = "Contested", herbs = {13463, 13465}, mining = {3858, 7911, 10620}},
    --[[Dun Morogh]]			[1426] = {minLevel = 1, 	maxLevel = 10,		minFish = "1",         dungeons = {{id=16919, text=" (13-18)"}, {id=721, text=" (24-34)"}}, transport = "Deeprun Tram: Stormwind", faction = "Alliance", herbs = {2447, 765, 2449}, mining = {2770}},
    --[[Duskwood]]				[1431] = {minLevel = 18, 	maxLevel = 30,		minFish = "55",        faction = "Contested", herbs = {785, 2450, 2453, 3369, 3356}, mining = {2770, 2771, 2775, 2772}},
    --[[Eastern Plaguelands]]	[1423] = {minLevel = 53, 	maxLevel = 60,		minFish = "330",       dungeons = {{id=2017, text=" (55-60)"}, {id=3456, text=" (60)"}}, faction = "Contested", herbs = {8836, 8838, 13466, 13463, 13468}, mining = {3858, 7911, 10620, 10620}},
    --[[Elwynn Forest]]			[1429] = {minLevel = 1, 	maxLevel = 10,		minFish = "1",         transport = "Deeprun Tram: Ironforge", faction = "Alliance", herbs = {2447, 765, 2449}, mining = {2770}},
    --[[Hillsbrad Foothills]]	[1424] = {minLevel = 20, 	maxLevel = 30,		minFish = "55",        transport = "Boats: Auberdine", faction = "Contested", herbs = {785, 2450, 2453, 3356, 3357}, mining = {2770, 2771, 2775, 2772}},
    --[[Ironforge]]				[1455] = {minFish = 1,                                                 faction = "Alliance"},
    --[[Loch Modan]]			[1432] = {minLevel = 10,	maxLevel = 20,		minFish = "1",         faction = "Alliance", herbs = {2447, 765, 2449, 785, 2450}, mining = {2770, 2771, 2775}},
    --[[Redridge Mountains]]	[1433] = {minLevel = 15, 	maxLevel = 25,		minFish = "55",        faction = "Contested", herbs = {785, 2450, 2453}, mining = {2770, 2771, 2775}},
    --[[Searing Gorge]]			[1427] = {minLevel = 43, 	maxLevel = 50,                             dungeons = {{id=17803, text=" (52-60)"}, {id=17804, text=" (55-60)"}, {id=2717, text=" (60)"}, {id=2677, text=" (60)"}}, faction = "Contested", herbs = {4625, 3821}, mining = {2772, 2776, 3858, 7911, 10620}},
    --[[Silverpine Forest]]		[1421] = {minLevel = 10, 	maxLevel = 20,		minFish = "1",         dungeons = {{id=209, text=" (18-28)"}}, faction = "Horde", herbs = {2447, 765, 2449, 785, 2450}, mining = {2770, 2771, 2775}},
    --[[Stormwind City]]		[1453] = {minFish = 1,                                                 dungeons = {{id=717, text=" (22-30)"}}, faction = "Alliance"},
    --[[Stranglethorn Vale]]	[1434] = {minLevel = 30, 	maxLevel = 45,		minFish = "130 (205)", dungeons = {{text="The Drowned City (35-40)"}, {id=1977, text=" (60)"}}, transport = "Zeppelins: Orgrimmar, Undercity\\nBoats: Ratchet", faction = "Contested", herbs = {3356, 3357, 3818, 3821, 3358}, mining = {2772, 2776, 3858, 7911}},
    --[[Swamp of Sorrows]]		[1435] = {minLevel = 35, 	maxLevel = 45,		minFish = "130",       dungeons = {{id=1417, text=" (45-55)"}}, faction = "Contested", herbs = {3356, 3357, 3818, 3821, 8839}, mining = {2772, 2776, 3858}},
    --[[The Hinterlands]]		[1425] = {minLevel = 40, 	maxLevel = 50,		minFish = "205",       faction = "Contested", herbs = {3818, 3821, 3358, 8838, 8845}, mining = {2772, 2776, 3858, 7911}},
    --[[Tirisfal Glades]]		[1420] = {minLevel = 1, 	maxLevel = 10,		minFish = "1",         dungeons = {{id=16611, text=" (15-20)"}, {id=796, text=" (26-45)"}}, transport = "Zeppelins: Orgrimmar, Grom'gol", faction = "Horde", herbs = {2447, 765, 2449}, mining = {2770}},
    --[[Undercity]]				[1458] = {minFish = 1,                                                 faction = "Horde"},
    --[[Westfall]]				[1436] = {minLevel = 10, 	maxLevel = 20,		minFish = "1",         dungeons = {{id=1581, text=" (15-25)"}}, faction = "Alliance", herbs = {2447, 765, 2449, 785, 2450}, mining = {2770, 2771, 2775}},
    --[[Western Plaguelands]]	[1422] = {minLevel = 51, 	maxLevel = 58,		minFish = "205",       dungeons = {{id=2057, text=" (55-60)"}}, faction = "Contested", herbs = {8836, 8838, 13466, 13463}, mining = {3858, 7911, 10620, 10620}},
    --[[Wetlands]]				[1437] = {minLevel = 20, 	maxLevel = 30,		minFish = "55",        dungeons = {{id=16732, text=" (24-29)"}}, transport = "Boats: Theramore, Auberdine", faction = "Contested", herbs = {2450, 2453, 3355, 3356, 3357}, mining = {2771, 2775, 2772}},

    -- Kalimdor
    --[[Ashenvale]]				[1440] = {minLevel = 18, 	maxLevel = 30,		minFish = "55",        dungeons = {{id=719, text=" (20-30)"}}, faction = "Contested", herbs = {785, 2450, 2453, 3356, 3357}, mining = {2770, 2771, 2775, 2772, 2776}},
    --[[Azshara]]				[1447] = {minLevel = 45, 	maxLevel = 55,		minFish = "205 (330)", dungeons = {{text="Blackmaw Hold (55-60)"}}, faction = "Contested", herbs = {8838, 8831, 8846, 13463, 13465}, mining = {3858, 7911, 10620, 10620}},
    --[[Darkshore]]				[1439] = {minLevel = 10,	maxLevel = 20,		minFish = "1",         transport = "Boats: Menethil Harbor, Rut'theran, Southshore", faction = "Alliance", herbs = {785, 2450, 3820}, mining = {2770, 2771, 2775}},
    --[[Darnassus]]				[1457] = {minFish = 1,                                                 faction = "Alliance"},
    --[[Desolace]]				[1443] = {minLevel = 30, 	maxLevel = 40,		minFish = "130",       dungeons = {{id=2100, text=" (40-50)"}}, faction = "Contested", herbs = {2453, 3355, 3356, 3357, 3818, 3821}, mining = {2772, 2776, 3858, 7911}},
    --[[Durotar]]				[1411] = {minLevel = 1, 	maxLevel = 10,		minFish = "1",         transport = "Zeppelins: Undercity, Grom'gol", faction = "Horde", herbs = {2447, 765, 2449}, mining = {2770}},
    --[[Dustwallow Marsh]]		[1445] = {minLevel = 35, 	maxLevel = 45,		minFish = "130",       dungeons = {{id=3140, text=" (48-53)"}, {id=2159, text=" (60)"}}, transport = "Boats: Menethil Harbor", faction = "Contested", herbs = {3356, 3357, 3358, 3820}, mining = {2772, 2776, 3858}},
    --[[Felwood]]				[1448] = {minLevel = 48, 	maxLevel = 55,		minFish = "205",       faction = "Contested", herbs = {8838, 8846, 13464, 13463, 13466}, mining = {3858, 7911, 10620}},
    --[[Feralas]]				[1444] = {minLevel = 40, 	maxLevel = 50,		minFish = "205 (330)", dungeons = {{id=2557, text=" (54-60)"}}, transport = "Boats: Feathermoon, Forgotten Coast", faction = "Contested", herbs = {3356, 3357, 3818, 3821, 3358, 8838}, mining = {2772, 2776, 3858, 7911}},
    --[[Moonglade]]				[1450] = {minFish = 205,                                               faction = "Sanctuary", herbs = {2447, 765, 2449}},
    --[[Mulgore]]				[1412] = {minLevel = 1, 	maxLevel = 10,		minFish = "1",         faction = "Horde", herbs = {2447, 765, 2449}, mining = {2770}},
    --[[Orgrimmar]]				[1454] = {minFish = 1,                                                 dungeons = {{id=2437, text=" (13-18)"}}, faction = "Horde"},
    --[[Silithus]]				[1451] = {minLevel = 55, 	maxLevel = 60,		minFish = "330",       dungeons = {{id=3429, text=" (60)"}, {id=3428, text=" (60)"}}, faction = "Contested", herbs = {8838, 13464, 13463, 13465, 13468}, mining = {3858, 7911, 10620, 10620}},
    --[[Stonetalon Mountains]]	[1442] = {minLevel = 15, 	maxLevel = 27,		minFish = "55",        transport = "Sky Boats: Zephras Isle", faction = "Contested", herbs = {785, 2450, 2453, 3355}, mining = {2770, 2771, 2775, 2772}},
    --[[Tanaris]]				[1446] = {minLevel = 40, 	maxLevel = 50,		minFish = "205",       dungeons = {{id=978, text=" (42-52)"}}, transport = "Boats: Powderfuse Port", faction = "Contested", herbs = {4625, 8831}, mining = {2772, 2776, 3858, 7911, 10620}},
    --[[Teldrassil]]			[1438] = {minLevel = 1, 	maxLevel = 10,		minFish = "1",         transport = "Boats: Auberdine", faction = "Alliance", herbs = {2447, 765, 2449}, mining = {2770}},
    --[[The Barrens]]			[1413] = {minLevel = 10, 	maxLevel = 25,		minFish = "1",         dungeons = {{id=718, text=" (15-25)"}, {id=491, text=" (25-35)"}, {id=722, text=" (35-45)"}}, transport = "Boats: Booty Bay", faction = "Horde", herbs = {785, 2450, 2453, 3820}, mining = {2770, 2771, 2775, 2772}},
    --[[Thousand Needles]]		[1441] = {minLevel = 25, 	maxLevel = 35,		minFish = "130",       faction = "Contested", herbs = {2453, 3355, 3356, 3357}, mining = {2771, 2775, 2772, 2776, 3858}},
    --[[Thunder Bluff]]			[1456] = {minFish = 1,                                                 faction = "Horde"},
    --[[Un'Goro Crater]]		[1449] = {minLevel = 48, 	maxLevel = 55,		minFish = "205",       dungeons = {{text="Shaper's Terrace (58-60)"}}, faction = "Contested", herbs = {8839, 13465, 13464, 13468}, mining = {3858, 7911, 10620, 10620}},
    --[[Winterspring]]			[1452] = {minLevel = 55, 	maxLevel = 60,		minFish = "330",       faction = "Contested", herbs = {13467, 13465, 13463, 13468}, mining = {3858, 7911, 10620, 10620}},
    
    -- Forever
    --[[Hyjal]]					[2482] = {minLevel = 60, 	maxLevel = 60,                             dungeons = {{id=2743, text=" (60)"}, {id=3277, text=" (60)"}}, faction = "Contested"},
    --[[Zephras Isle]]			[2521] = {minLevel = 1, 	maxLevel = 12,                             transport = "Sky Boats: Dalaran, Skywatcher Plateau", faction = "Contested"},
    --[[Riverglades]]			[2548] = {minLevel = 35, 	maxLevel = 45,                             dungeons = {{text="Krol'dok Stronghold (40-55)"}}, faction = "Contested", herbs = {3818, 3821, 3358}, mining = {2772, 2776, 3858}},
    --[[Shen'dralas]]			[2652] = {minLevel = 35, 	maxLevel = 45,                             faction = "Contested", herbs = {3818, 3821, 3358}, mining = {2772, 2776, 3858}},
}

local factionIcons = {
    ["Alliance"]  = "|TInterface\\TargetingFrame\\UI-PVP-Alliance:24:24:6:-5|t",
    ["Horde"]     = "|TInterface\\TargetingFrame\\UI-PVP-Horde:24:24:6:-5|t",
    ["Contested"] = "|TInterface\\TargetingFrame\\UI-PVP-FFA:24:24:6:-5|t",
    ["Sanctuary"] = "",
}

-- Optimization caching
local lastCursorX, lastCursorY, lastName
local zifTargetProvider = nil
local ZIF_InfoWindow = nil
local C_Map_GetMapInfoAtPosition = C_Map.GetMapInfoAtPosition
local MapUtil_FindBestAreaNameAtMouse = MapUtil.FindBestAreaNameAtMouse

local function UpdateZIF_FontStyles()
    if not zifTargetProvider or not zifTargetProvider.Label then return end
    local font = "Fonts\\FRIZQT__.TTF"
    if zifTargetProvider.Label.zifLevelText then
        zifTargetProvider.Label.zifLevelText:SetFont(font, ZoneInfoForeverDB.fontSizeLevel, "OUTLINE")
        zifTargetProvider.Label.zifFishingText:SetFont(font, ZoneInfoForeverDB.fontSizeFishing, "OUTLINE")
        zifTargetProvider.Label.zifDungeonText:SetFont(font, ZoneInfoForeverDB.fontSizeDungeons, "OUTLINE")
        zifTargetProvider.Label.zifTransportText:SetFont(font, ZoneInfoForeverDB.fontSizeTransport, "OUTLINE")
        if zifTargetProvider.Label.zifHerbsText then zifTargetProvider.Label.zifHerbsText:SetFont(font, ZoneInfoForeverDB.fontSizeHerbs, "OUTLINE") end
        if zifTargetProvider.Label.zifMiningText then zifTargetProvider.Label.zifMiningText:SetFont(font, ZoneInfoForeverDB.fontSizeMining, "OUTLINE") end

        local cF = ZoneInfoForeverDB.colorFishing
        zifTargetProvider.Label.zifFishingText:SetTextColor(cF.r, cF.g, cF.b)
        
        local cD = ZoneInfoForeverDB.colorDungeons
        zifTargetProvider.Label.zifDungeonText:SetTextColor(cD.r, cD.g, cD.b)
        
        local cT = ZoneInfoForeverDB.colorTransport
        zifTargetProvider.Label.zifTransportText:SetTextColor(cT.r, cT.g, cT.b)

        local cH = ZoneInfoForeverDB.colorHerbs
        if zifTargetProvider.Label.zifHerbsText then zifTargetProvider.Label.zifHerbsText:SetTextColor(cH.r, cH.g, cH.b) end

        local cM = ZoneInfoForeverDB.colorMining
        if zifTargetProvider.Label.zifMiningText then zifTargetProvider.Label.zifMiningText:SetTextColor(cM.r, cM.g, cM.b) end
    end
    lastCursorX = nil -- force map update
    UpdateMinimapPanel()
end

-- Configuration & String Builder

-- Minimap Panel Logic
local ZIF_MinimapPanel = nil

function UpdateMinimapPanel()
    if not ZoneInfoForeverDB then return end
    if ZoneInfoForeverDB.hideInCombat and (InCombatLockdown() or UnitAffectingCombat("player")) then
        if ZIF_MinimapPanel and not ZIF_MinimapPanel.isTesting then ZIF_MinimapPanel:Hide() end
        return
    end
    
    if not ZoneInfoForeverDB.showMinimapPanel then
        if ZIF_MinimapPanel and not ZIF_MinimapPanel.isTesting then ZIF_MinimapPanel:Hide() end
        return
    end

    if not ZIF_MinimapPanel then
        ZIF_MinimapPanel = CreateFrame("Frame", "ZIF_MinimapPanel", UIParent, "BackdropTemplate")
        ZIF_MinimapPanel:SetBackdrop({
            bgFile = "Interface\\Tooltips\\UI-Tooltip-Background",
            edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
            tile = true, tileSize = 16, edgeSize = 16,
            insets = { left = 4, right = 4, top = 4, bottom = 4 }
        })
        ZIF_MinimapPanel:SetBackdropColor(0, 0, 0, 0.9)
        ZIF_MinimapPanel:SetBackdropBorderColor(1, 1, 1, 0.5)
        ZIF_MinimapPanel:SetMovable(true)
        ZIF_MinimapPanel:EnableMouse(false)
        ZIF_MinimapPanel:RegisterForDrag("LeftButton")
        ZIF_MinimapPanel:SetScript("OnDragStart", ZIF_MinimapPanel.StartMoving)
        ZIF_MinimapPanel:SetScript("OnDragStop", function(s)
            s:StopMovingOrSizing()
            local p, _, rp, x, y = s:GetPoint()
            ZoneInfoForeverDB.minimapPanelPoint = p
            ZoneInfoForeverDB.minimapPanelRelPoint = rp
            ZoneInfoForeverDB.minimapPanelX = x
            ZoneInfoForeverDB.minimapPanelY = y
        end)
        ZIF_MinimapPanel:SetFrameStrata("BACKGROUND")

        if ZoneInfoForeverDB.minimapPanelPoint then
            ZIF_MinimapPanel:SetPoint(ZoneInfoForeverDB.minimapPanelPoint, UIParent, ZoneInfoForeverDB.minimapPanelRelPoint or ZoneInfoForeverDB.minimapPanelPoint, ZoneInfoForeverDB.minimapPanelX or 0, ZoneInfoForeverDB.minimapPanelY or 0)
        else
            ZIF_MinimapPanel:SetPoint("BOTTOMRIGHT", UIParent, "BOTTOMRIGHT", -20, 20)
        end
        
        ZIF_MinimapPanel.header = ZIF_MinimapPanel:CreateFontString(nil, "OVERLAY", "GameFontHighlightLarge")
        ZIF_MinimapPanel.header:SetPoint("TOPLEFT", 12, -12)

        ZIF_MinimapPanel.zifFishingText = ZIF_MinimapPanel:CreateFontString(nil, "OVERLAY", "GameFontNormal")
        ZIF_MinimapPanel.zifDungeonText = ZIF_MinimapPanel:CreateFontString(nil, "OVERLAY", "GameFontNormal")
        ZIF_MinimapPanel.zifTransportText = ZIF_MinimapPanel:CreateFontString(nil, "OVERLAY", "GameFontNormal")
        ZIF_MinimapPanel.zifHerbsText = ZIF_MinimapPanel:CreateFontString(nil, "OVERLAY", "GameFontNormal")
        ZIF_MinimapPanel.zifMiningText = ZIF_MinimapPanel:CreateFontString(nil, "OVERLAY", "GameFontNormal")
        
        ZIF_MinimapPanel.zifFishingText:SetJustifyH("LEFT")
        ZIF_MinimapPanel.zifDungeonText:SetJustifyH("LEFT")
        ZIF_MinimapPanel.zifTransportText:SetJustifyH("LEFT")
        ZIF_MinimapPanel.zifHerbsText:SetJustifyH("LEFT")
        ZIF_MinimapPanel.zifMiningText:SetJustifyH("LEFT")
    end
    
    if ZIF_MinimapPanel.isTesting then return end

    local mapID = C_Map.GetBestMapForUnit("player")
    if not mapID then 
        ZIF_MinimapPanel:Hide()
        return 
    end
    
    local mapInfo = C_Map.GetMapInfo(mapID)
    if not mapInfo then
        ZIF_MinimapPanel:Hide()
        return
    end
    
    local name = mapInfo.name
    local zoneData = mapTable[mapID]
    
    if zoneData then
        ZIF_MinimapPanel.header:SetText((zoneData.iconString or "") .. name .. (zoneData.levelString or ""))
        
        local font = "Fonts\\FRIZQT__.TTF"
        ZIF_MinimapPanel.zifFishingText:SetFont(font, ZoneInfoForeverDB.fontSizeFishing, "OUTLINE")
        ZIF_MinimapPanel.zifDungeonText:SetFont(font, ZoneInfoForeverDB.fontSizeDungeons, "OUTLINE")
        ZIF_MinimapPanel.zifTransportText:SetFont(font, ZoneInfoForeverDB.fontSizeTransport, "OUTLINE")
        ZIF_MinimapPanel.zifHerbsText:SetFont(font, ZoneInfoForeverDB.fontSizeHerbs, "OUTLINE")
        ZIF_MinimapPanel.zifMiningText:SetFont(font, ZoneInfoForeverDB.fontSizeMining, "OUTLINE")

        local cF = ZoneInfoForeverDB.colorFishing
        ZIF_MinimapPanel.zifFishingText:SetTextColor(cF.r, cF.g, cF.b)
        local cD = ZoneInfoForeverDB.colorDungeons
        ZIF_MinimapPanel.zifDungeonText:SetTextColor(cD.r, cD.g, cD.b)
        local cT = ZoneInfoForeverDB.colorTransport
        ZIF_MinimapPanel.zifTransportText:SetTextColor(cT.r, cT.g, cT.b)
        local cH = ZoneInfoForeverDB.colorHerbs
        ZIF_MinimapPanel.zifHerbsText:SetTextColor(cH.r, cH.g, cH.b)
        local cM = ZoneInfoForeverDB.colorMining
        ZIF_MinimapPanel.zifMiningText:SetTextColor(cM.r, cM.g, cM.b)

        local currentAnchor = ZIF_MinimapPanel.header
        local maxWidth = ZIF_MinimapPanel.header:GetStringWidth()
        local totalHeight = 15 + ZIF_MinimapPanel.header:GetStringHeight()
        
        if zoneData.fishingString and zoneData.fishingString ~= "" then
            ZIF_MinimapPanel.zifFishingText:SetText(zoneData.fishingString)
            ZIF_MinimapPanel.zifFishingText:ClearAllPoints()
            ZIF_MinimapPanel.zifFishingText:SetPoint("TOPLEFT", currentAnchor, "BOTTOMLEFT", 0, -6)
            ZIF_MinimapPanel.zifFishingText:Show()
            currentAnchor = ZIF_MinimapPanel.zifFishingText
            totalHeight = totalHeight + 6 + ZIF_MinimapPanel.zifFishingText:GetStringHeight()
            maxWidth = max(maxWidth, ZIF_MinimapPanel.zifFishingText:GetStringWidth())
        else
            ZIF_MinimapPanel.zifFishingText:Hide()
        end
        
        if zoneData.dungeonString and zoneData.dungeonString ~= "" then
            ZIF_MinimapPanel.zifDungeonText:SetText(zoneData.dungeonString)
            ZIF_MinimapPanel.zifDungeonText:ClearAllPoints()
            ZIF_MinimapPanel.zifDungeonText:SetPoint("TOPLEFT", currentAnchor, "BOTTOMLEFT", 0, -6)
            ZIF_MinimapPanel.zifDungeonText:Show()
            currentAnchor = ZIF_MinimapPanel.zifDungeonText
            totalHeight = totalHeight + 6 + ZIF_MinimapPanel.zifDungeonText:GetStringHeight()
            maxWidth = max(maxWidth, ZIF_MinimapPanel.zifDungeonText:GetStringWidth())
        else
            ZIF_MinimapPanel.zifDungeonText:Hide()
        end

        if zoneData.transportString and zoneData.transportString ~= "" then
            ZIF_MinimapPanel.zifTransportText:SetText(zoneData.transportString)
            ZIF_MinimapPanel.zifTransportText:ClearAllPoints()
            ZIF_MinimapPanel.zifTransportText:SetPoint("TOPLEFT", currentAnchor, "BOTTOMLEFT", 0, -6)
            ZIF_MinimapPanel.zifTransportText:Show()
            currentAnchor = ZIF_MinimapPanel.zifTransportText
            totalHeight = totalHeight + 6 + ZIF_MinimapPanel.zifTransportText:GetStringHeight()
            maxWidth = max(maxWidth, ZIF_MinimapPanel.zifTransportText:GetStringWidth())
        else
            ZIF_MinimapPanel.zifTransportText:Hide()
        end
        
        if zoneData.herbsString and zoneData.herbsString ~= "" then
            ZIF_MinimapPanel.zifHerbsText:SetText(zoneData.herbsString)
            ZIF_MinimapPanel.zifHerbsText:ClearAllPoints()
            ZIF_MinimapPanel.zifHerbsText:SetPoint("TOPLEFT", currentAnchor, "BOTTOMLEFT", 0, -6)
            ZIF_MinimapPanel.zifHerbsText:Show()
            currentAnchor = ZIF_MinimapPanel.zifHerbsText
            totalHeight = totalHeight + 6 + ZIF_MinimapPanel.zifHerbsText:GetStringHeight()
            maxWidth = max(maxWidth, ZIF_MinimapPanel.zifHerbsText:GetStringWidth())
        else
            ZIF_MinimapPanel.zifHerbsText:Hide()
        end

        if zoneData.miningString and zoneData.miningString ~= "" then
            ZIF_MinimapPanel.zifMiningText:SetText(zoneData.miningString)
            ZIF_MinimapPanel.zifMiningText:ClearAllPoints()
            ZIF_MinimapPanel.zifMiningText:SetPoint("TOPLEFT", currentAnchor, "BOTTOMLEFT", 0, -6)
            ZIF_MinimapPanel.zifMiningText:Show()
            currentAnchor = ZIF_MinimapPanel.zifMiningText
            totalHeight = totalHeight + 6 + ZIF_MinimapPanel.zifMiningText:GetStringHeight()
            maxWidth = max(maxWidth, ZIF_MinimapPanel.zifMiningText:GetStringWidth())
        else
            ZIF_MinimapPanel.zifMiningText:Hide()
        end
        
        ZIF_MinimapPanel:SetSize(maxWidth + 24, totalHeight + 15)
        ZIF_MinimapPanel:Show()
    else
        ZIF_MinimapPanel:Hide()
    end
end

local function UpdateZoneStrings()
    if not ZoneInfoForeverDB then return end
    
    lastCursorX = nil -- Invalidate cache when settings change
    
    for k, v in pairs(mapTable) do
        if ZoneInfoForeverDB.showIcons and v.faction and factionIcons[v.faction] then
            v.iconString = factionIcons[v.faction]
        else
            v.iconString = ""
        end

        if ZoneInfoForeverDB.showFishing and v.minFish then
            v.fishingString = (ZIF_L and ZIF_L["PREFIX_FISHING"] or "Fishing: ") .. v.minFish
        else
            v.fishingString = nil
        end
        
        if ZoneInfoForeverDB.showDungeons and v.dungeons then
            if type(v.dungeons) == "table" then
                local dNames = {}
                for _, d in ipairs(v.dungeons) do
                                        local name = d.id and C_Map.GetAreaInfo(d.id)
                    if not name then 
                        name = d.text or "???" 
                        if ZIF_L and ZIF_L["DUNGEON_" .. name] then
                            name = ZIF_L["DUNGEON_" .. name]
                        end
                    else
                        if name ~= d.text then name = name .. (d.text or "") end
                    end
                    table.insert(dNames, name)
                end
                v.dungeonString = table.concat(dNames, "\n")
            else
                local d = v.dungeons
                if ZIF_L then
                    -- Translate known dungeon names if they exist in Locales
                    for eng, loc in pairs(ZIF_L) do
                        if type(eng) == "string" and type(loc) == "string" and eng ~= loc and string.match(eng, "^DUNGEON_") then
                            d = string.gsub(d, string.sub(eng, 9), loc)
                        end
                    end
                end
                v.dungeonString = d
            end
        else
            v.dungeonString = nil
        end
        
        if ZoneInfoForeverDB.showTransport and v.transport then
            if type(v.transport) == "table" then
                local tNames = {}
                for _, tInfo in ipairs(v.transport) do
                    local prefixStr = tInfo.prefix
                    if ZIF_L then
                        prefixStr = string.gsub(prefixStr, "Boats:", ZIF_L["PREFIX_BOATS"] or "Boats:")
                        prefixStr = string.gsub(prefixStr, "Sky Boats:", ZIF_L["PREFIX_SKY_BOATS"] or "Sky Boats:")
                        prefixStr = string.gsub(prefixStr, "Zeppelins:", ZIF_L["PREFIX_ZEPPELINS"] or "Zeppelins:")
                        prefixStr = string.gsub(prefixStr, "Deeprun Tram:", ZIF_L["PREFIX_TRAM"] or "Deeprun Tram:")
                    end
                    local destNames = {}
                    for _, destId in ipairs(tInfo.dests) do
                        local name = C_Map.GetAreaInfo(destId)
                        if not name then name = "???" end
                        table.insert(destNames, name)
                    end
                    table.insert(tNames, prefixStr .. " " .. table.concat(destNames, ", "))
                end
                v.transportString = table.concat(tNames, "\n")
            else
                local t = v.transport
                if ZIF_L then
                    t = string.gsub(t, "Boats:", ZIF_L["PREFIX_BOATS"] or "Boats:")
                    t = string.gsub(t, "Sky Boats:", ZIF_L["PREFIX_SKY_BOATS"] or "Sky Boats:")
                    t = string.gsub(t, "Zeppelins:", ZIF_L["PREFIX_ZEPPELINS"] or "Zeppelins:")
                    t = string.gsub(t, "Deeprun Tram:", ZIF_L["PREFIX_TRAM"] or "Deeprun Tram:")
                    
                    -- Translate known locations if they exist in Locales
                    for eng, loc in pairs(ZIF_L) do
                        if type(eng) == "string" and type(loc) == "string" and eng ~= loc and string.match(eng, "^LOC_") then
                            t = string.gsub(t, string.sub(eng, 5), loc)
                        end
                    end
                end
                v.transportString = t
            end
        else
            v.transportString = nil
        end

        if ZoneInfoForeverDB.showHerbs and v.herbs then
            if type(v.herbs) == "table" then
                local names = {}
                for _, id in ipairs(v.herbs) do
                    if type(id) == "number" then
                        local GetItemInfoFunc = (C_Item and C_Item.GetItemInfo) or GetItemInfo
                        local itemName = GetItemInfoFunc and GetItemInfoFunc(id)
                        if itemName then
                            table.insert(names, itemName)
                        else
                            if C_Item and C_Item.RequestLoadItemDataByID then
                                C_Item.RequestLoadItemDataByID(id)
                            end
                            table.insert(names, "...")
                        end
                    else
                        table.insert(names, id)
                    end
                end
                v.herbsString = (ZIF_L and ZIF_L["PREFIX_HERBS"] or "Herbs: ") .. table.concat(names, ", ")
            else
                v.herbsString = (ZIF_L and ZIF_L["PREFIX_HERBS"] or "Herbs: ") .. v.herbs
            end
        else
            v.herbsString = nil
        end

        if ZoneInfoForeverDB.showMining and v.mining then
            if type(v.mining) == "table" then
                local names = {}
                for _, id in ipairs(v.mining) do
                    if type(id) == "number" then
                        local GetItemInfoFunc = (C_Item and C_Item.GetItemInfo) or GetItemInfo
                        local itemName = GetItemInfoFunc and GetItemInfoFunc(id)
                        if itemName then
                            table.insert(names, itemName)
                        else
                            if C_Item and C_Item.RequestLoadItemDataByID then
                                C_Item.RequestLoadItemDataByID(id)
                            end
                            table.insert(names, "...")
                        end
                    else
                        table.insert(names, id)
                    end
                end
                v.miningString = (ZIF_L and ZIF_L["PREFIX_MINING"] or "Mining: ") .. table.concat(names, ", ")
            else
                v.miningString = (ZIF_L and ZIF_L["PREFIX_MINING"] or "Mining: ") .. v.mining
            end
        else
            v.miningString = nil
        end
    end
    UpdateMinimapPanel()
end

local function InitializeDB()
    if not ZoneInfoForeverDB then
        ZoneInfoForeverDB = {
            showFishing = true,
            showDungeons = true,
            showIcons = true,
            showTransport = true,
            useOwnWindow = false,
            fontSizeLevel = 18,
            fontSizeFishing = 18,
            fontSizeDungeons = 18,
            fontSizeTransport = 18,
            colorFishing = {r = 1, g = 1, b = 1},
            colorDungeons = {r = 1, g = 0.82, b = 0},
            colorTransport = {r = 0, g = 0.8, b = 1},
            showMinimapPanel = false,
            showHerbs = false,
            showMining = false,
            fontSizeHerbs = 16,
            fontSizeMining = 16,
            colorHerbs = {r = 0.2, g = 0.8, b = 0.2},
            colorMining = {r = 0.8, g = 0.4, b = 0.1},
        }
    else
        -- Provide defaults for newly added fields
        if ZoneInfoForeverDB.showFishing == nil then ZoneInfoForeverDB.showFishing = true end
        if ZoneInfoForeverDB.showDungeons == nil then ZoneInfoForeverDB.showDungeons = true end
        if ZoneInfoForeverDB.showIcons == nil then ZoneInfoForeverDB.showIcons = true end
        if ZoneInfoForeverDB.showTransport == nil then ZoneInfoForeverDB.showTransport = true end
        if ZoneInfoForeverDB.useOwnWindow == nil then ZoneInfoForeverDB.useOwnWindow = false end
        if ZoneInfoForeverDB.showHerbs == nil then ZoneInfoForeverDB.showHerbs = false end
        if ZoneInfoForeverDB.showMining == nil then ZoneInfoForeverDB.showMining = false end
        if ZoneInfoForeverDB.fontSizeLevel == nil then ZoneInfoForeverDB.fontSizeLevel = 18 end
        if ZoneInfoForeverDB.fontSizeFishing == nil then ZoneInfoForeverDB.fontSizeFishing = 18 end
        if ZoneInfoForeverDB.fontSizeDungeons == nil then ZoneInfoForeverDB.fontSizeDungeons = 18 end
        if ZoneInfoForeverDB.fontSizeTransport == nil then ZoneInfoForeverDB.fontSizeTransport = 18 end
        if ZoneInfoForeverDB.fontSizeHerbs == nil then ZoneInfoForeverDB.fontSizeHerbs = 16 end
        if ZoneInfoForeverDB.fontSizeMining == nil then ZoneInfoForeverDB.fontSizeMining = 16 end
        if ZoneInfoForeverDB.colorFishing == nil then ZoneInfoForeverDB.colorFishing = {r = 1, g = 1, b = 1} end
        if ZoneInfoForeverDB.colorDungeons == nil then ZoneInfoForeverDB.colorDungeons = {r = 1, g = 0.82, b = 0} end
        if ZoneInfoForeverDB.colorTransport == nil then ZoneInfoForeverDB.colorTransport = {r = 0, g = 0.8, b = 1} end
        if ZoneInfoForeverDB.colorHerbs == nil then ZoneInfoForeverDB.colorHerbs = {r = 0.1, g = 1.0, b = 0.1} end
        if ZoneInfoForeverDB.colorMining == nil then ZoneInfoForeverDB.colorMining = {r = 0.8, g = 0.6, b = 0.2} end
        if ZoneInfoForeverDB.showMinimapPanel == nil then ZoneInfoForeverDB.showMinimapPanel = false end
        if ZoneInfoForeverDB.hideInCombat == nil then ZoneInfoForeverDB.hideInCombat = false end
        if ZoneInfoForeverDB.lastSeenWelcomeVersion == nil then ZoneInfoForeverDB.lastSeenWelcomeVersion = "0.0.0" end
    end
    if ZIF_UpdateLocale then ZIF_UpdateLocale() end
end

local function CreateOptionsPanel()
    local panel = CreateFrame("Frame", "ZoneInfoForeverOptionsPanel", UIParent)
    panel.name = "Zone Info: Forever"
    
    local title = panel:CreateFontString(nil, "ARTWORK", "GameFontNormalLarge")
    title:SetPoint("TOPLEFT", 16, -16)
    title:SetText(ZIF_L and ZIF_L["OPT_TITLE"] or "Zone Info: Forever Settings")

    local function CreateCheckbox(name, labelText, dbKey, yOffset, xOffset)
        local cb = CreateFrame("CheckButton", name, panel, "InterfaceOptionsCheckButtonTemplate")
        cb:SetPoint("TOPLEFT", xOffset or 16, yOffset)
        _G[cb:GetName() .. "Text"]:SetText(labelText)
        cb:SetChecked(ZoneInfoForeverDB[dbKey])
        cb:SetScript("OnClick", function(self)
            ZoneInfoForeverDB[dbKey] = self:GetChecked()
            UpdateZoneStrings()
        end)
        return cb
    end

    local function CreateSlider(name, labelText, dbKey, xOffset, yOffset, minV, maxV, step)
        local slider = CreateFrame("Slider", name, panel, "OptionsSliderTemplate")
        slider:SetPoint("TOPLEFT", xOffset, yOffset)
        slider:SetMinMaxValues(minV, maxV)
        slider:SetValueStep(step)
        slider:SetObeyStepOnDrag(true)
        slider:SetValue(ZoneInfoForeverDB[dbKey])
        
        _G[name .. "Text"]:SetText(labelText)
        _G[name .. "Low"]:SetText(minV)
        _G[name .. "High"]:SetText(maxV)

        local valText = slider:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall")
        valText:SetPoint("TOP", slider, "BOTTOM", 0, -3)
        valText:SetText(ZoneInfoForeverDB[dbKey])

        slider:SetScript("OnValueChanged", function(self, value)
            local rounded = math.floor(value + 0.5)
            ZoneInfoForeverDB[dbKey] = rounded
            valText:SetText(rounded)
            UpdateZIF_FontStyles()
        end)
        return slider
    end

    local function CreateColorSwatch(name, labelText, dbKey, xOffset, yOffset)
        local button = CreateFrame("Button", name, panel)
        button:SetSize(16, 16)
        button:SetPoint("TOPLEFT", xOffset, yOffset)
        
        local bg = button:CreateTexture(nil, "BACKGROUND")
        bg:SetSize(14, 14)
        bg:SetPoint("CENTER")
        bg:SetColorTexture(1, 1, 1)

        local tex = button:CreateTexture(nil, "ARTWORK")
        tex:SetSize(12, 12)
        tex:SetPoint("CENTER")
        local dbColor = ZoneInfoForeverDB[dbKey]
        tex:SetColorTexture(dbColor.r, dbColor.g, dbColor.b)
        button.tex = tex

        local text = button:CreateFontString(nil, "ARTWORK", "GameFontHighlight")
        text:SetPoint("LEFT", button, "RIGHT", 5, 0)
        text:SetText(labelText)

        button:SetScript("OnClick", function()
            local c = ZoneInfoForeverDB[dbKey]
            
            local function OnColorChanged()
                local r, g, b = ColorPickerFrame:GetColorRGB()
                ZoneInfoForeverDB[dbKey] = {r = r, g = g, b = b}
                button.tex:SetColorTexture(r, g, b)
                UpdateZIF_FontStyles()
            end
            
            local function OnColorCanceled()
                ZoneInfoForeverDB[dbKey] = {r = c.r, g = c.g, b = c.b}
                button.tex:SetColorTexture(c.r, c.g, c.b)
                UpdateZIF_FontStyles()
            end

            if ColorPickerFrame.SetupColorPickerAndShow then
                local info = {
                    r = c.r,
                    g = c.g,
                    b = c.b,
                    hasOpacity = false,
                    swatchFunc = OnColorChanged,
                    cancelFunc = OnColorCanceled,
                }
                ColorPickerFrame:SetupColorPickerAndShow(info)
            else
                ColorPickerFrame.func = OnColorChanged
                ColorPickerFrame.cancelFunc = OnColorCanceled
                ColorPickerFrame.previousValues = {r = c.r, g = c.g, b = c.b}
                ColorPickerFrame:SetColorRGB(c.r, c.g, c.b)
                ColorPickerFrame.hasOpacity = false
                ColorPickerFrame:Hide()
                ColorPickerFrame:Show()
            end
        end)
        
        return button
    end

    CreateCheckbox("ZIF_CheckFishing", ZIF_L and ZIF_L["OPT_SHOW_FISHING"] or "Show Fishing Levels", "showFishing", -50)
    CreateCheckbox("ZIF_CheckDungeons", ZIF_L and ZIF_L["OPT_SHOW_DUNGEONS"] or "Show Dungeons", "showDungeons", -80)
    CreateCheckbox("ZIF_CheckTransport", ZIF_L and ZIF_L["OPT_SHOW_TRANSPORT"] or "Show Transportation Routes", "showTransport", -110)
    CreateCheckbox("ZIF_CheckIcons", ZIF_L and ZIF_L["OPT_SHOW_ICONS"] or "Show Faction Icons", "showIcons", -140)
    CreateCheckbox("ZIF_CheckWindow", ZIF_L and ZIF_L["OPT_SHOW_WINDOW"] or "Use Dedicated Window", "useOwnWindow", -170)
    local cbMinimap = CreateCheckbox("ZIF_CheckMinimapPanel", ZIF_L and ZIF_L["OPT_SHOW_MINIMAP"] or "Show Minimap Panel", "showMinimapPanel", -200)
    local cbHideCombat = CreateCheckbox("ZIF_CheckHideInCombat", ZIF_L and ZIF_L["OPT_HIDE_IN_COMBAT"] or "Hide Current Zone Panel in Combat", "hideInCombat", -230, 36)
    
    local oldMinimapClick = cbMinimap:GetScript("OnClick")
    cbMinimap:SetScript("OnClick", function(self)
        oldMinimapClick(self)
        if self:GetChecked() then
            cbHideCombat:Enable()
            _G[cbHideCombat:GetName().."Text"]:SetTextColor(1, 1, 1)
        else
            cbHideCombat:Disable()
            _G[cbHideCombat:GetName().."Text"]:SetTextColor(0.5, 0.5, 0.5)
        end
    end)
    
    if cbMinimap:GetChecked() then
        cbHideCombat:Enable()
        _G[cbHideCombat:GetName().."Text"]:SetTextColor(1, 1, 1)
    else
        cbHideCombat:Disable()
        _G[cbHideCombat:GetName().."Text"]:SetTextColor(0.5, 0.5, 0.5)
    end

    CreateCheckbox("ZIF_CheckHerbs", ZIF_L and ZIF_L["OPT_SHOW_HERBS"] or "Show Herbs", "showHerbs", -260)
    CreateCheckbox("ZIF_CheckMining", ZIF_L and ZIF_L["OPT_SHOW_MINING"] or "Show Mining", "showMining", -290)

    CreateSlider("ZIF_SliderLevel", "Level Font Size", "fontSizeLevel", 250, -60, 8, 24, 1)
    CreateSlider("ZIF_SliderFishing", "Fishing Font Size", "fontSizeFishing", 250, -100, 8, 24, 1)
    CreateSlider("ZIF_SliderDungeons", "Dungeons Font Size", "fontSizeDungeons", 250, -140, 8, 24, 1)
    CreateSlider("ZIF_SliderTransport", "Transport Font Size", "fontSizeTransport", 250, -180, 8, 24, 1)
    CreateSlider("ZIF_SliderHerbs", "Herbs Font Size", "fontSizeHerbs", 250, -220, 8, 24, 1)
    CreateSlider("ZIF_SliderMining", "Mining Font Size", "fontSizeMining", 250, -260, 8, 24, 1)

    CreateColorSwatch("ZIF_ColorFishing", "Fishing Color", "colorFishing", 420, -100)
    CreateColorSwatch("ZIF_ColorDungeons", "Dungeons Color", "colorDungeons", 420, -140)
    CreateColorSwatch("ZIF_ColorTransport", "Transport Color", "colorTransport", 420, -180)
    CreateColorSwatch("ZIF_ColorHerbs", "Herbs Color", "colorHerbs", 420, -220)
    CreateColorSwatch("ZIF_ColorMining", "Mining Color", "colorMining", 420, -260)

    local moveBtn = CreateFrame("Button", "ZIF_MoveWindowBtn", panel, "UIPanelButtonTemplate")
    moveBtn:SetSize(150, 24)
    moveBtn:SetPoint("TOPLEFT", 16, -320)
    moveBtn:SetText("Unlock Windows")
    moveBtn:SetScript("OnClick", function()
        if ZIF_InfoWindow and ZIF_InfoWindow.isTesting then
            ZIF_InfoWindow.isTesting = false
            ZIF_InfoWindow:EnableMouse(false)
            ZIF_InfoWindow:Hide()
            if ZIF_MinimapPanel then
                ZIF_MinimapPanel.isTesting = false
                ZIF_MinimapPanel:EnableMouse(false)
                UpdateMinimapPanel()
            end
            moveBtn:SetText("Unlock Windows")
        else
            ZoneInfoForeverDB.useOwnWindow = true
            _G["ZIF_CheckWindow"]:SetChecked(true)
            ZoneInfoForeverDB.showMinimapPanel = true
            _G["ZIF_CheckMinimapPanel"]:SetChecked(true)
            
            if ZIF_InfoWindow then
                ZIF_InfoWindow.header:SetText("Drag Me (Map)!")
                if zifTargetProvider and zifTargetProvider.Label then
                    zifTargetProvider.Label.zifLevelText:Hide()
                    zifTargetProvider.Label.zifFishingText:Hide()
                    zifTargetProvider.Label.zifDungeonText:Hide()
                    zifTargetProvider.Label.zifTransportText:Hide()
                end
                ZIF_InfoWindow:SetSize(200, 80)
                ZIF_InfoWindow.isTesting = true
                ZIF_InfoWindow:EnableMouse(true)
                ZIF_InfoWindow:Show()
            end
            
            if ZIF_MinimapPanel then
                ZIF_MinimapPanel.isTesting = true
                ZIF_MinimapPanel:EnableMouse(true)
                ZIF_MinimapPanel.header:SetText("Drag Me (Minimap)!")
                ZIF_MinimapPanel.zifFishingText:Hide()
                ZIF_MinimapPanel.zifDungeonText:Hide()
                ZIF_MinimapPanel.zifTransportText:Hide()
                ZIF_MinimapPanel:SetSize(200, 80)
                ZIF_MinimapPanel:Show()
            end
            moveBtn:SetText("Lock Windows")
        end
    end)

    
    

    local resetBtn = CreateFrame("Button", "ZIF_ResetBtn", panel, "UIPanelButtonTemplate")
    resetBtn:SetSize(150, 24)
    resetBtn:SetPoint("TOPLEFT", 16, -350)
    resetBtn:SetText(ZIF_L and ZIF_L["OPT_RESET"] or "Reset Defaults")
    resetBtn:SetScript("OnClick", function()
        ZoneInfoForeverDB = nil
        InitializeDB()
        
        _G["ZIF_CheckFishing"]:SetChecked(ZoneInfoForeverDB.showFishing)
        _G["ZIF_CheckDungeons"]:SetChecked(ZoneInfoForeverDB.showDungeons)
        _G["ZIF_CheckTransport"]:SetChecked(ZoneInfoForeverDB.showTransport)
        _G["ZIF_CheckIcons"]:SetChecked(ZoneInfoForeverDB.showIcons)
        _G["ZIF_CheckWindow"]:SetChecked(ZoneInfoForeverDB.useOwnWindow)
        _G["ZIF_CheckMinimapPanel"]:SetChecked(ZoneInfoForeverDB.showMinimapPanel)
        _G["ZIF_CheckHerbs"]:SetChecked(ZoneInfoForeverDB.showHerbs)
        _G["ZIF_CheckMining"]:SetChecked(ZoneInfoForeverDB.showMining)

        _G["ZIF_SliderLevel"]:SetValue(ZoneInfoForeverDB.fontSizeLevel)
        _G["ZIF_SliderFishing"]:SetValue(ZoneInfoForeverDB.fontSizeFishing)
        _G["ZIF_SliderDungeons"]:SetValue(ZoneInfoForeverDB.fontSizeDungeons)
        _G["ZIF_SliderTransport"]:SetValue(ZoneInfoForeverDB.fontSizeTransport)
        _G["ZIF_SliderHerbs"]:SetValue(ZoneInfoForeverDB.fontSizeHerbs)
        _G["ZIF_SliderMining"]:SetValue(ZoneInfoForeverDB.fontSizeMining)

        local cf = ZoneInfoForeverDB.colorFishing
        _G["ZIF_ColorFishing"].tex:SetColorTexture(cf.r, cf.g, cf.b)
        local cd = ZoneInfoForeverDB.colorDungeons
        _G["ZIF_ColorDungeons"].tex:SetColorTexture(cd.r, cd.g, cd.b)
        local ct = ZoneInfoForeverDB.colorTransport
        _G["ZIF_ColorTransport"].tex:SetColorTexture(ct.r, ct.g, ct.b)
        local ch = ZoneInfoForeverDB.colorHerbs
        if ch and _G["ZIF_ColorHerbs"] then _G["ZIF_ColorHerbs"].tex:SetColorTexture(ch.r, ch.g, ch.b) end
        local cm = ZoneInfoForeverDB.colorMining
        if cm and _G["ZIF_ColorMining"] then _G["ZIF_ColorMining"].tex:SetColorTexture(cm.r, cm.g, cm.b) end

        if ZIF_InfoWindow then
            ZIF_InfoWindow:ClearAllPoints()
            local parentAnchor = WorldMapFrame.ScrollContainer or WorldMapFrame
            ZIF_InfoWindow:SetPoint("BOTTOMRIGHT", parentAnchor, "BOTTOMRIGHT", -10, 60)
            if ZIF_InfoWindow.isTesting then
                ZIF_InfoWindow.isTesting = false
                ZIF_InfoWindow:EnableMouse(false)
                ZIF_InfoWindow:Hide()
                _G["ZIF_MoveWindowBtn"]:SetText("Unlock Windows")
            end
        end
        if ZIF_MinimapPanel then
            ZIF_MinimapPanel:ClearAllPoints()
            ZIF_MinimapPanel:SetPoint("BOTTOMRIGHT", UIParent, "BOTTOMRIGHT", -20, 20)
            if ZIF_MinimapPanel.isTesting then
                ZIF_MinimapPanel.isTesting = false
                ZIF_MinimapPanel:EnableMouse(false)
            end
        end

        if ZIF_MapButton then
            ZIF_MapButton:ClearAllPoints()
            ZIF_MapButton:SetPoint("BOTTOMLEFT", WorldMapFrame, "BOTTOMLEFT", 10, 10)
        end

        UpdateZoneStrings()
        UpdateZIF_FontStyles()
        UpdateMinimapPanel()
    end)

    -- Integrate into Blizzard Interface Options
    if Settings and Settings.RegisterCanvasLayoutCategory then
        local category = Settings.RegisterCanvasLayoutCategory(panel, panel.name)
        Settings.RegisterAddOnCategory(category)
        ZoneInfoForeverOptionsPanel.category = category
    elseif InterfaceOptions_AddCategory then
        InterfaceOptions_AddCategory(panel)
    end
end

SLASH_ZONEINFOFOREVER1 = "/zif"
SlashCmdList["ZONEINFOFOREVER"] = function(msg)
    if InCombatLockdown() then
        print("|cffffff00Zone Info: Forever - Cannot open settings in combat.|r")
        return
    end
    if Settings and Settings.OpenToCategory and ZoneInfoForeverOptionsPanel.category then
        Settings.OpenToCategory(ZoneInfoForeverOptionsPanel.category:GetID())
    elseif InterfaceOptionsFrame_OpenToCategory then
        InterfaceOptionsFrame_OpenToCategory(ZoneInfoForeverOptionsPanel)
        InterfaceOptionsFrame_OpenToCategory(ZoneInfoForeverOptionsPanel) -- Repeated to fix Blizzard bug where it opens to wrong page initially
    end
end

-- Update zone level colors based on current player level
local function UpdateZoneInfoColors()
    lastCursorX = nil -- Invalidate cache when colors change
    local currentLevel = UnitLevel("player")
    for k, v in pairs(mapTable) do
        if v.minLevel and v.maxLevel then
            local color
            if currentLevel < v.minLevel then
                color = GetQuestDifficultyColor(v.minLevel)
            elseif currentLevel > v.maxLevel then
                color = GetQuestDifficultyColor(v.maxLevel - 2)
            else
                color = QuestDifficultyColors["difficult"]
            end
            
            -- Convert RGB table to Hex string safely
            if type(color) == "table" then
                local r = math.floor((color.r or 1) * 255 + 0.5)
                local g = math.floor((color.g or 1) * 255 + 0.5)
                local b = math.floor((color.b or 1) * 255 + 0.5)
                color = string.format("|cff%02x%02x%02x", r, g, b)
            else
                color = "|cffffffff"
            end

            if v.minLevel ~= v.maxLevel then
                v.levelString = " " .. color .. "(" .. v.minLevel .. "-" .. v.maxLevel .. ")" .. (FONT_COLOR_CODE_CLOSE or "|r")
            else
                v.levelString = " " .. color .. "(" .. v.maxLevel .. ")" .. (FONT_COLOR_CODE_CLOSE or "|r")
            end
        else
            v.levelString = ""
        end
    end
end

local lastHoveredMapID = nil

-- Hook AreaLabelFrameMixin.OnUpdate
local function AreaLabelOnUpdate(self)
    local map = self.dataProvider:GetMap()
    if map:IsCanvasMouseFocus() then
        local normalizedCursorX, normalizedCursorY = map:GetNormalizedCursorPosition()
        
        if lastCursorX == normalizedCursorX and lastCursorY == normalizedCursorY then
            if lastName then
                self:SetLabel(MAP_AREA_LABEL_TYPE.AREA_NAME, lastName, nil)
            end
        else
            lastCursorX, lastCursorY = normalizedCursorX, normalizedCursorY
            local name
            local mapID = map:GetMapID()
            local positionMapInfo = C_Map_GetMapInfoAtPosition(mapID, normalizedCursorX, normalizedCursorY)
            local hoveredMapID = positionMapInfo and positionMapInfo.mapID or nil

            if hoveredMapID and hoveredMapID ~= mapID then
                name = positionMapInfo.name
                if hoveredMapID ~= lastHoveredMapID then
                    lastHoveredMapID = hoveredMapID
                    local zoneData = mapTable[hoveredMapID]
                    
                    if zoneData then
                        self.zifLevelText:SetText(zoneData.levelString)
                        self.zifFishingText:SetText(zoneData.fishingString)
                        self.zifDungeonText:SetText(zoneData.dungeonString)
                        self.zifTransportText:SetText(zoneData.transportString)
                        self.zifHerbsText:SetText(zoneData.herbsString)
                        self.zifMiningText:SetText(zoneData.miningString)
                        
                        if ZoneInfoForeverDB.useOwnWindow then
                            if ZIF_InfoWindow then
                                ZIF_InfoWindow.header:SetText((zoneData.iconString or "") .. name .. (zoneData.levelString or ""))
                                self.zifLevelText:Hide()
                                
                                local currentAnchor = ZIF_InfoWindow.header
                                local maxWidth = ZIF_InfoWindow.header:GetStringWidth()
                                local totalHeight = 15 + ZIF_InfoWindow.header:GetStringHeight()
                                
                                self.zifFishingText:SetParent(ZIF_InfoWindow)
                                self.zifDungeonText:SetParent(ZIF_InfoWindow)
                                self.zifTransportText:SetParent(ZIF_InfoWindow)
                                self.zifHerbsText:SetParent(ZIF_InfoWindow)
                                self.zifMiningText:SetParent(ZIF_InfoWindow)

                                self.zifFishingText:SetJustifyH("LEFT")
                                self.zifDungeonText:SetJustifyH("LEFT")
                                self.zifTransportText:SetJustifyH("LEFT")
                                self.zifHerbsText:SetJustifyH("LEFT")
                                self.zifMiningText:SetJustifyH("LEFT")

                                if zoneData.fishingString and zoneData.fishingString ~= "" then
                                    self.zifFishingText:ClearAllPoints()
                                    self.zifFishingText:SetPoint("TOPLEFT", currentAnchor, "BOTTOMLEFT", 0, -6)
                                    self.zifFishingText:Show()
                                    currentAnchor = self.zifFishingText
                                    totalHeight = totalHeight + 6 + self.zifFishingText:GetStringHeight()
                                    maxWidth = max(maxWidth, self.zifFishingText:GetStringWidth())
                                else
                                    self.zifFishingText:Hide()
                                end
                                
                                if zoneData.dungeonString and zoneData.dungeonString ~= "" then
                                    self.zifDungeonText:ClearAllPoints()
                                    self.zifDungeonText:SetPoint("TOPLEFT", currentAnchor, "BOTTOMLEFT", 0, -6)
                                    self.zifDungeonText:Show()
                                    currentAnchor = self.zifDungeonText
                                    totalHeight = totalHeight + 6 + self.zifDungeonText:GetStringHeight()
                                    maxWidth = max(maxWidth, self.zifDungeonText:GetStringWidth())
                                else
                                    self.zifDungeonText:Hide()
                                end

                                if zoneData.transportString and zoneData.transportString ~= "" then
                                    self.zifTransportText:ClearAllPoints()
                                    self.zifTransportText:SetPoint("TOPLEFT", currentAnchor, "BOTTOMLEFT", 0, -6)
                                    self.zifTransportText:Show()
                                    currentAnchor = self.zifTransportText
                                    totalHeight = totalHeight + 6 + self.zifTransportText:GetStringHeight()
                                    maxWidth = max(maxWidth, self.zifTransportText:GetStringWidth())
                                else
                                    self.zifTransportText:Hide()
                                end
                                
                                if zoneData.herbsString and zoneData.herbsString ~= "" then
                                    self.zifHerbsText:ClearAllPoints()
                                    self.zifHerbsText:SetPoint("TOPLEFT", currentAnchor, "BOTTOMLEFT", 0, -6)
                                    self.zifHerbsText:Show()
                                    currentAnchor = self.zifHerbsText
                                    totalHeight = totalHeight + 6 + self.zifHerbsText:GetStringHeight()
                                    maxWidth = max(maxWidth, self.zifHerbsText:GetStringWidth())
                                else
                                    self.zifHerbsText:Hide()
                                end

                                if zoneData.miningString and zoneData.miningString ~= "" then
                                    self.zifMiningText:ClearAllPoints()
                                    self.zifMiningText:SetPoint("TOPLEFT", currentAnchor, "BOTTOMLEFT", 0, -6)
                                    self.zifMiningText:Show()
                                    currentAnchor = self.zifMiningText
                                    totalHeight = totalHeight + 6 + self.zifMiningText:GetStringHeight()
                                    maxWidth = max(maxWidth, self.zifMiningText:GetStringWidth())
                                else
                                    self.zifMiningText:Hide()
                                end
                                
                                ZIF_InfoWindow:SetSize(maxWidth + 24, totalHeight + 15)
                                ZIF_InfoWindow:Show()
                            end
                        else
                            if ZIF_InfoWindow and not ZIF_InfoWindow.isTesting then ZIF_InfoWindow:Hide() end
                            name = (zoneData.iconString or "") .. name
                            
                            self.zifLevelText:SetParent(self)
                            self.zifFishingText:SetParent(self)
                            self.zifDungeonText:SetParent(self)
                            self.zifTransportText:SetParent(self)

                            self.zifFishingText:SetJustifyH("CENTER")
                            self.zifDungeonText:SetJustifyH("CENTER")
                            self.zifTransportText:SetJustifyH("CENTER")
                            
                            local currentAnchor = self.Name or (self.labels and self.labels[MAP_AREA_LABEL_TYPE.AREA_NAME])
                            
                            if zoneData.levelString and zoneData.levelString ~= "" then
                                self.zifLevelText:SetText(zoneData.levelString)
                                self.zifLevelText:ClearAllPoints()
                                self.zifLevelText:SetPoint("LEFT", currentAnchor, "RIGHT", 4, 0)
                                self.zifLevelText:Show()
                            else
                                self.zifLevelText:Hide()
                            end
                            
                            if zoneData.fishingString and zoneData.fishingString ~= "" then
                                self.zifFishingText:ClearAllPoints()
                                self.zifFishingText:SetPoint("TOP", currentAnchor, "BOTTOM", 0, -4)
                                self.zifFishingText:Show()
                                currentAnchor = self.zifFishingText
                            else
                                self.zifFishingText:Hide()
                            end
                            
                            if zoneData.dungeonString and zoneData.dungeonString ~= "" then
                                self.zifDungeonText:ClearAllPoints()
                                self.zifDungeonText:SetPoint("TOP", currentAnchor, "BOTTOM", 0, -4)
                                self.zifDungeonText:Show()
                                currentAnchor = self.zifDungeonText
                            else
                                self.zifDungeonText:Hide()
                            end

                            if zoneData.transportString and zoneData.transportString ~= "" then
                                self.zifTransportText:ClearAllPoints()
                                self.zifTransportText:SetPoint("TOP", currentAnchor, "BOTTOM", 0, -4)
                                self.zifTransportText:Show()
                                currentAnchor = self.zifTransportText
                            else
                                self.zifTransportText:Hide()
                            end

                            if zoneData.herbsString and zoneData.herbsString ~= "" then
                                self.zifHerbsText:ClearAllPoints()
                                self.zifHerbsText:SetPoint("TOP", currentAnchor, "BOTTOM", 0, -4)
                                self.zifHerbsText:Show()
                                currentAnchor = self.zifHerbsText
                            else
                                self.zifHerbsText:Hide()
                            end

                            if zoneData.miningString and zoneData.miningString ~= "" then
                                self.zifMiningText:ClearAllPoints()
                                self.zifMiningText:SetPoint("TOP", currentAnchor, "BOTTOM", 0, -4)
                                self.zifMiningText:Show()
                            else
                                self.zifMiningText:Hide()
                            end
                        end
                    else
                        if ZIF_InfoWindow and not ZIF_InfoWindow.isTesting then ZIF_InfoWindow:Hide() end
                        self.zifLevelText:Hide()
                        self.zifFishingText:Hide()
                        self.zifDungeonText:Hide()
                        self.zifTransportText:Hide()
                        self.zifHerbsText:Hide()
                        self.zifMiningText:Hide()
                    end
                end
            else
                name = MapUtil_FindBestAreaNameAtMouse(mapID, normalizedCursorX, normalizedCursorY)
                if lastHoveredMapID ~= nil then
                    lastHoveredMapID = nil
                    if ZIF_InfoWindow and not ZIF_InfoWindow.isTesting then ZIF_InfoWindow:Hide() end
                    if self.zifLevelText then
                        self.zifLevelText:Hide()
                        self.zifFishingText:Hide()
                        self.zifDungeonText:Hide()
                        self.zifTransportText:Hide()
                        self.zifHerbsText:Hide()
                        self.zifMiningText:Hide()
                    end
                end
            end
            
            if name ~= lastName then
                lastName = name
                if name then
                    self:SetLabel(MAP_AREA_LABEL_TYPE.AREA_NAME, name, nil)
                end
                self:EvaluateLabels()
            end
        end
    else
        if lastCursorX or lastCursorY then
            lastCursorX, lastCursorY, lastName, lastHoveredMapID = nil, nil, nil, nil
            if ZIF_InfoWindow and not ZIF_InfoWindow.isTesting then ZIF_InfoWindow:Hide() end
            if self.zifLevelText then
                self.zifLevelText:Hide()
                self.zifFishingText:Hide()
                self.zifDungeonText:Hide()
                self.zifTransportText:Hide()
                self.zifHerbsText:Hide()
                self.zifMiningText:Hide()
                self.zifDungeonText:Hide()
                self.zifTransportText:Hide()
            end
            self:EvaluateLabels()
        end
    end
end

local function InitializeZoneInfoForever()
    UpdateZoneInfoColors()

    if WorldMapFrame and WorldMapFrame.dataProviders then
        for provider in next, WorldMapFrame.dataProviders do
            if provider.Label then
                zifTargetProvider = provider
                break
            end
        end
    end

    if zifTargetProvider then
        if not ZIF_InfoWindow then
            ZIF_InfoWindow = CreateFrame("Frame", "ZIF_InfoWindow", WorldMapFrame, "BackdropTemplate")
            ZIF_InfoWindow:SetBackdrop({
                bgFile = "Interface\\Tooltips\\UI-Tooltip-Background",
                edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
                tile = true, tileSize = 16, edgeSize = 16,
                insets = { left = 4, right = 4, top = 4, bottom = 4 }
            })
            ZIF_InfoWindow:SetBackdropColor(0, 0, 0, 0.9)
            ZIF_InfoWindow:SetBackdropBorderColor(1, 1, 1, 0.5)
            ZIF_InfoWindow:SetMovable(true)
            ZIF_InfoWindow:EnableMouse(false)
            ZIF_InfoWindow:RegisterForDrag("LeftButton")
            ZIF_InfoWindow:SetScript("OnDragStart", ZIF_InfoWindow.StartMoving)
            ZIF_InfoWindow:SetScript("OnDragStop", function(s)
                s:StopMovingOrSizing()
                local parentAnchor = WorldMapFrame.ScrollContainer or WorldMapFrame
                local sLeft = s:GetLeft()
                local sTop = s:GetTop()
                local pLeft = parentAnchor:GetLeft()
                local pTop = parentAnchor:GetTop()
                
                if sLeft and sTop and pLeft and pTop then
                    local x = (sLeft - pLeft) / parentAnchor:GetEffectiveScale()
                    local y = (sTop - pTop) / parentAnchor:GetEffectiveScale()
                    -- Wait, GetLeft is already in scaled coordinates relative to screen, so sLeft - pLeft is the distance in pixels.
                    -- But wait! GetLeft returns coordinates relative to the screen, NOT scaled! They are effectively scaled.
                    -- So to set point, we must divide by parent's effective scale so that UI element scales correctly.
                    
                    s:ClearAllPoints()
                    s:SetPoint("TOPLEFT", parentAnchor, "BOTTOMLEFT", (sLeft - pLeft), (sTop - pTop) + parentAnchor:GetHeight()) 
                    -- Actually TOPLEFT to BOTTOMLEFT makes y offset positive? No, TOPLEFT to TOPLEFT is easiest!
                    -- But wait, TOPLEFT to BOTTOMLEFT of parent...
                end
                
                -- The easiest foolproof way is just Center to Center
                if sLeft and sTop and pLeft and pTop then
                    local sX, sY = s:GetCenter()
                    local pX, pY = parentAnchor:GetCenter()
                    local scale = s:GetEffectiveScale()
                    
                    -- dx, dy in UI coordinates
                    local dx = (sX - pX) 
                    local dy = (sY - pY) 
                    s:ClearAllPoints()
                    s:SetPoint("CENTER", parentAnchor, "CENTER", dx, dy)
                    ZoneInfoForeverDB.windowPosX = dx
                    ZoneInfoForeverDB.windowPosY = dy
                    ZoneInfoForeverDB.windowPoint = "CENTER"
                else
                    local p, rt, rp, x, y = s:GetPoint()
                    ZoneInfoForeverDB.windowPosX = x
                    ZoneInfoForeverDB.windowPosY = y
                    ZoneInfoForeverDB.windowPoint = p
                end
            end)
            ZIF_InfoWindow:SetFrameStrata("TOOLTIP")
            
            local pt = ZoneInfoForeverDB.windowPoint or "BOTTOMRIGHT"
            local x = ZoneInfoForeverDB.windowPosX or -10
            local y = ZoneInfoForeverDB.windowPosY or 60
            local parentAnchor = WorldMapFrame.ScrollContainer or WorldMapFrame
            ZIF_InfoWindow:SetPoint(pt, parentAnchor, pt, x, y)
            
            ZIF_InfoWindow.header = ZIF_InfoWindow:CreateFontString(nil, "OVERLAY", "GameFontHighlightLarge")
            ZIF_InfoWindow.header:SetPoint("TOPLEFT", 12, -12)
            ZIF_InfoWindow:Hide()
        end

        if not zifTargetProvider.Label.zifLevelText then
            zifTargetProvider.Label.zifLevelText = zifTargetProvider.Label:CreateFontString(nil, "OVERLAY", "GameFontNormal")
            zifTargetProvider.Label.zifFishingText = zifTargetProvider.Label:CreateFontString(nil, "OVERLAY", "GameFontNormal")
            zifTargetProvider.Label.zifDungeonText = zifTargetProvider.Label:CreateFontString(nil, "OVERLAY", "GameFontNormal")
            zifTargetProvider.Label.zifTransportText = zifTargetProvider.Label:CreateFontString(nil, "OVERLAY", "GameFontNormal")
            zifTargetProvider.Label.zifHerbsText = zifTargetProvider.Label:CreateFontString(nil, "OVERLAY", "GameFontNormal")
            zifTargetProvider.Label.zifMiningText = zifTargetProvider.Label:CreateFontString(nil, "OVERLAY", "GameFontNormal")
            UpdateZIF_FontStyles()
        end

        -- Securely hook SetScript to detect when other addons (like Leatrix) try to overwrite the label script
        hooksecurefunc(zifTargetProvider.Label, "SetScript", function(self, scriptType, handler)
            if scriptType == "OnUpdate" and not self.ZIF_Rehooking then
                self.ZIF_Rehooking = true
                self:HookScript("OnUpdate", AreaLabelOnUpdate)
                self.ZIF_Rehooking = false
            end
        end)

        -- Apply initial hook
        if not zifTargetProvider.Label.ZIF_Rehooking then
            zifTargetProvider.Label.ZIF_Rehooking = true
            zifTargetProvider.Label:HookScript("OnUpdate", AreaLabelOnUpdate)
            zifTargetProvider.Label.ZIF_Rehooking = false
        end
    end

    if not ZIF_MapButton and WorldMapFrame then
        ZIF_MapButton = CreateFrame("Button", "ZIF_MapButton", WorldMapFrame)
        ZIF_MapButton:SetSize(32, 32)
        
        local pt = ZoneInfoForeverDB.mapBtnPoint or "BOTTOMLEFT"
        local x = ZoneInfoForeverDB.mapBtnX or 10
        local y = ZoneInfoForeverDB.mapBtnY or 10
        ZIF_MapButton:SetPoint(pt, WorldMapFrame, pt, x, y)
        ZIF_MapButton:SetFrameLevel(WorldMapFrame:GetFrameLevel() + 5)
        
        local icon = ZIF_MapButton:CreateTexture(nil, "BACKGROUND")
        icon:SetTexture("Interface\\WorldMap\\UI-World-Icon")
        icon:SetSize(20, 20)
        icon:SetPoint("TOPLEFT", 6, -6)
        
        local border = ZIF_MapButton:CreateTexture(nil, "OVERLAY")
        border:SetTexture("Interface\\Minimap\\MiniMap-TrackingBorder")
        border:SetSize(54, 54)
        border:SetPoint("TOPLEFT", 0, 0)

        ZIF_MapButton:SetHighlightTexture("Interface\\Minimap\\UI-Minimap-ZoomButton-Highlight", "ADD")
        
        ZIF_MapButton:SetMovable(true)
        ZIF_MapButton:RegisterForDrag("LeftButton", "RightButton")
        ZIF_MapButton:SetScript("OnDragStart", function(s)
            if IsShiftKeyDown() then s:StartMoving() end
        end)
        ZIF_MapButton:SetScript("OnDragStop", function(s)
            s:StopMovingOrSizing()
            local p, rt, rp, curX, curY = s:GetPoint()
            ZoneInfoForeverDB.mapBtnX = curX
            ZoneInfoForeverDB.mapBtnY = curY
            ZoneInfoForeverDB.mapBtnPoint = p
        end)

        ZIF_MapButton:SetScript("OnClick", function()
            if InCombatLockdown() then
                print("|cffffff00Zone Info: Forever - Cannot open settings in combat.|r")
                return
            end
            if Settings and Settings.OpenToCategory and ZoneInfoForeverOptionsPanel.category then
                Settings.OpenToCategory(ZoneInfoForeverOptionsPanel.category:GetID())
            elseif InterfaceOptionsFrame_OpenToCategory then
                InterfaceOptionsFrame_OpenToCategory(ZoneInfoForeverOptionsPanel)
                InterfaceOptionsFrame_OpenToCategory(ZoneInfoForeverOptionsPanel)
            end
        end)
        
        ZIF_MapButton:SetScript("OnEnter", function(self)
            GameTooltip:SetOwner(self, "ANCHOR_BOTTOMRIGHT")
            GameTooltip:SetText("Zone Info: Forever")
            GameTooltip:AddLine("Click to open settings.", 1, 1, 1)
            GameTooltip:AddLine("Shift-Drag to move this button.", 0.7, 0.7, 0.7)
            GameTooltip:Show()
        end)
        ZIF_MapButton:SetScript("OnLeave", function()
            GameTooltip:Hide()
        end)
    end
end

-- Event handling

local ZIF_WelcomeFrame = nil
local function ShowWelcomeWindow()
    if ZIF_WelcomeFrame then
        ZIF_WelcomeFrame:Show()
        return
    end

    local frame = CreateFrame("Frame", "ZIF_WelcomeWindow", UIParent, "BackdropTemplate")
    frame:SetSize(450, 320)
    frame:SetPoint("CENTER", UIParent, "CENTER", 0, 100)
    frame:SetFrameStrata("DIALOG")
    
    frame:SetBackdrop({
        bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background",
        edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
        tile = true, tileSize = 32, edgeSize = 32,
        insets = { left = 11, right = 12, top = 12, bottom = 11 }
    })
    
    local header = frame:CreateFontString(nil, "OVERLAY", "GameFontHighlightLarge")
    header:SetPoint("TOP", 0, -20)
    header:SetText("Welcome to Zone Info: Forever!")
    header:SetTextColor(1, 0.82, 0)

    local body = frame:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
    body:SetPoint("TOPLEFT", 30, -60)
    body:SetPoint("BOTTOMRIGHT", -30, 60)
    body:SetJustifyH("LEFT")
    body:SetJustifyV("TOP")
    
    local text = "Thank you so much for using Zone Info: Forever! (Formerly Zone Level)\n\n"
    text = text .. "I truly hope you enjoy the addon and that we will all meet again after the WoW: Forever beta is finished.\n\n"
    text = text .. "|cffffff00Quick Tips:|r\n"
    text = text .. "• Type |cff00ccff/zif|r or click the World Map button to open the Settings.\n"
    text = text .. "• Hold |cff00ccffShift|r and drag to freely move the World Map settings button.\n\n"
    text = text .. "Also, if you want to easily highlight newly added quests, be sure to check out my other addon: |cff00ff00Forever Quests|r!\n\n"
    text = text .. "If you have any feedback, dont be shy to comment on CurseForge page :)"
    
    body:SetText(text)
    
    local closeBtn = CreateFrame("Button", nil, frame, "UIPanelButtonTemplate")
    closeBtn:SetSize(120, 26)
    closeBtn:SetPoint("BOTTOM", 0, 25)
    closeBtn:SetText("Awesome, thanks!")
    closeBtn:SetScript("OnClick", function()
        ZoneInfoForeverDB.lastSeenWelcomeVersion = ZIF_WELCOME_VERSION
        frame:Hide()
    end)
    
    ZIF_WelcomeFrame = frame
end

local frame = CreateFrame("Frame")
frame:RegisterEvent("ADDON_LOADED")
frame:RegisterEvent("PLAYER_LOGIN")
frame:RegisterEvent("PLAYER_LEVEL_UP")
frame:RegisterEvent("PLAYER_ENTERING_WORLD")
frame:RegisterEvent("ZONE_CHANGED_NEW_AREA")
frame:RegisterEvent("GET_ITEM_INFO_RECEIVED")
    frame:RegisterEvent("PLAYER_REGEN_DISABLED")
    frame:RegisterEvent("PLAYER_REGEN_ENABLED")
frame:SetScript("OnEvent", function(self, event, arg1)
    if event == "GET_ITEM_INFO_RECEIVED" then
        UpdateZoneStrings()
        return
    end
    if event == "ADDON_LOADED" and arg1 == "ZoneInfoForever" then
        InitializeDB()
        UpdateZoneStrings()
        CreateOptionsPanel()
    elseif event == "PLAYER_LOGIN" then
        InitializeZoneInfoForever()
    elseif event == "PLAYER_LEVEL_UP" then
        UpdateZoneInfoColors()
    elseif event == "PLAYER_ENTERING_WORLD" or event == "ZONE_CHANGED_NEW_AREA" then
        if event == "PLAYER_ENTERING_WORLD" and ZoneInfoForeverDB and ZoneInfoForeverDB.lastSeenWelcomeVersion ~= ZIF_WELCOME_VERSION then
            ShowWelcomeWindow()
        end
        UpdateMinimapPanel()
    elseif event == "PLAYER_REGEN_DISABLED" then
        if ZoneInfoForeverDB and ZoneInfoForeverDB.hideInCombat then
            if ZIF_MinimapPanel and not ZIF_MinimapPanel.isTesting then ZIF_MinimapPanel:Hide() end
        end
    elseif event == "PLAYER_REGEN_ENABLED" then
        UpdateMinimapPanel()
    end
end)

-- Just in case it's loaded after PLAYER_LOGIN
if IsLoggedIn() then
    InitializeZoneInfoForever()
end

local ZLF_WELCOME_VERSION = "1.7"
-- Zone Level: Forever
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
local zlfTargetProvider = nil
local ZLF_InfoWindow = nil
local C_Map_GetMapInfoAtPosition = C_Map.GetMapInfoAtPosition
local MapUtil_FindBestAreaNameAtMouse = MapUtil.FindBestAreaNameAtMouse

local function UpdateZLF_FontStyles()
    if not zlfTargetProvider or not zlfTargetProvider.Label then return end
    local font = "Fonts\\FRIZQT__.TTF"
    if zlfTargetProvider.Label.zlfLevelText then
        zlfTargetProvider.Label.zlfLevelText:SetFont(font, ZoneLevelForeverDB.fontSizeLevel, "OUTLINE")
        zlfTargetProvider.Label.zlfFishingText:SetFont(font, ZoneLevelForeverDB.fontSizeFishing, "OUTLINE")
        zlfTargetProvider.Label.zlfDungeonText:SetFont(font, ZoneLevelForeverDB.fontSizeDungeons, "OUTLINE")
        zlfTargetProvider.Label.zlfTransportText:SetFont(font, ZoneLevelForeverDB.fontSizeTransport, "OUTLINE")
        if zlfTargetProvider.Label.zlfHerbsText then zlfTargetProvider.Label.zlfHerbsText:SetFont(font, ZoneLevelForeverDB.fontSizeHerbs, "OUTLINE") end
        if zlfTargetProvider.Label.zlfMiningText then zlfTargetProvider.Label.zlfMiningText:SetFont(font, ZoneLevelForeverDB.fontSizeMining, "OUTLINE") end

        local cF = ZoneLevelForeverDB.colorFishing
        zlfTargetProvider.Label.zlfFishingText:SetTextColor(cF.r, cF.g, cF.b)
        
        local cD = ZoneLevelForeverDB.colorDungeons
        zlfTargetProvider.Label.zlfDungeonText:SetTextColor(cD.r, cD.g, cD.b)
        
        local cT = ZoneLevelForeverDB.colorTransport
        zlfTargetProvider.Label.zlfTransportText:SetTextColor(cT.r, cT.g, cT.b)

        local cH = ZoneLevelForeverDB.colorHerbs
        if zlfTargetProvider.Label.zlfHerbsText then zlfTargetProvider.Label.zlfHerbsText:SetTextColor(cH.r, cH.g, cH.b) end

        local cM = ZoneLevelForeverDB.colorMining
        if zlfTargetProvider.Label.zlfMiningText then zlfTargetProvider.Label.zlfMiningText:SetTextColor(cM.r, cM.g, cM.b) end
    end
    lastCursorX = nil -- force map update
    UpdateMinimapPanel()
end

-- Configuration & String Builder

-- Minimap Panel Logic
local ZLF_MinimapPanel = nil

function UpdateMinimapPanel()
    if not ZoneLevelForeverDB then return end
    if ZoneLevelForeverDB.hideInCombat and (InCombatLockdown() or UnitAffectingCombat("player")) then
        if ZLF_MinimapPanel and not ZLF_MinimapPanel.isTesting then ZLF_MinimapPanel:Hide() end
        return
    end
    
    if not ZoneLevelForeverDB.showMinimapPanel then
        if ZLF_MinimapPanel and not ZLF_MinimapPanel.isTesting then ZLF_MinimapPanel:Hide() end
        return
    end

    if not ZLF_MinimapPanel then
        ZLF_MinimapPanel = CreateFrame("Frame", "ZLF_MinimapPanel", UIParent, "BackdropTemplate")
        ZLF_MinimapPanel:SetBackdrop({
            bgFile = "Interface\\Tooltips\\UI-Tooltip-Background",
            edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
            tile = true, tileSize = 16, edgeSize = 16,
            insets = { left = 4, right = 4, top = 4, bottom = 4 }
        })
        ZLF_MinimapPanel:SetBackdropColor(0, 0, 0, 0.9)
        ZLF_MinimapPanel:SetBackdropBorderColor(1, 1, 1, 0.5)
        ZLF_MinimapPanel:SetMovable(true)
        ZLF_MinimapPanel:EnableMouse(false)
        ZLF_MinimapPanel:RegisterForDrag("LeftButton")
        ZLF_MinimapPanel:SetScript("OnDragStart", ZLF_MinimapPanel.StartMoving)
        ZLF_MinimapPanel:SetScript("OnDragStop", function(s)
            s:StopMovingOrSizing()
            local p, _, rp, x, y = s:GetPoint()
            ZoneLevelForeverDB.minimapPanelPoint = p
            ZoneLevelForeverDB.minimapPanelRelPoint = rp
            ZoneLevelForeverDB.minimapPanelX = x
            ZoneLevelForeverDB.minimapPanelY = y
        end)
        ZLF_MinimapPanel:SetFrameStrata("BACKGROUND")

        if ZoneLevelForeverDB.minimapPanelPoint then
            ZLF_MinimapPanel:SetPoint(ZoneLevelForeverDB.minimapPanelPoint, UIParent, ZoneLevelForeverDB.minimapPanelRelPoint or ZoneLevelForeverDB.minimapPanelPoint, ZoneLevelForeverDB.minimapPanelX or 0, ZoneLevelForeverDB.minimapPanelY or 0)
        else
            ZLF_MinimapPanel:SetPoint("BOTTOMRIGHT", UIParent, "BOTTOMRIGHT", -20, 20)
        end
        
        ZLF_MinimapPanel.header = ZLF_MinimapPanel:CreateFontString(nil, "OVERLAY", "GameFontHighlightLarge")
        ZLF_MinimapPanel.header:SetPoint("TOPLEFT", 12, -12)

        ZLF_MinimapPanel.zlfFishingText = ZLF_MinimapPanel:CreateFontString(nil, "OVERLAY", "GameFontNormal")
        ZLF_MinimapPanel.zlfDungeonText = ZLF_MinimapPanel:CreateFontString(nil, "OVERLAY", "GameFontNormal")
        ZLF_MinimapPanel.zlfTransportText = ZLF_MinimapPanel:CreateFontString(nil, "OVERLAY", "GameFontNormal")
        ZLF_MinimapPanel.zlfHerbsText = ZLF_MinimapPanel:CreateFontString(nil, "OVERLAY", "GameFontNormal")
        ZLF_MinimapPanel.zlfMiningText = ZLF_MinimapPanel:CreateFontString(nil, "OVERLAY", "GameFontNormal")
        
        ZLF_MinimapPanel.zlfFishingText:SetJustifyH("LEFT")
        ZLF_MinimapPanel.zlfDungeonText:SetJustifyH("LEFT")
        ZLF_MinimapPanel.zlfTransportText:SetJustifyH("LEFT")
        ZLF_MinimapPanel.zlfHerbsText:SetJustifyH("LEFT")
        ZLF_MinimapPanel.zlfMiningText:SetJustifyH("LEFT")
    end
    
    if ZLF_MinimapPanel.isTesting then return end

    local mapID = C_Map.GetBestMapForUnit("player")
    if not mapID then 
        ZLF_MinimapPanel:Hide()
        return 
    end
    
    local mapInfo = C_Map.GetMapInfo(mapID)
    if not mapInfo then
        ZLF_MinimapPanel:Hide()
        return
    end
    
    local name = mapInfo.name
    local zoneData = mapTable[mapID]
    
    if zoneData then
        ZLF_MinimapPanel.header:SetText((zoneData.iconString or "") .. name .. (zoneData.levelString or ""))
        
        local font = "Fonts\\FRIZQT__.TTF"
        ZLF_MinimapPanel.zlfFishingText:SetFont(font, ZoneLevelForeverDB.fontSizeFishing, "OUTLINE")
        ZLF_MinimapPanel.zlfDungeonText:SetFont(font, ZoneLevelForeverDB.fontSizeDungeons, "OUTLINE")
        ZLF_MinimapPanel.zlfTransportText:SetFont(font, ZoneLevelForeverDB.fontSizeTransport, "OUTLINE")
        ZLF_MinimapPanel.zlfHerbsText:SetFont(font, ZoneLevelForeverDB.fontSizeHerbs, "OUTLINE")
        ZLF_MinimapPanel.zlfMiningText:SetFont(font, ZoneLevelForeverDB.fontSizeMining, "OUTLINE")

        local cF = ZoneLevelForeverDB.colorFishing
        ZLF_MinimapPanel.zlfFishingText:SetTextColor(cF.r, cF.g, cF.b)
        local cD = ZoneLevelForeverDB.colorDungeons
        ZLF_MinimapPanel.zlfDungeonText:SetTextColor(cD.r, cD.g, cD.b)
        local cT = ZoneLevelForeverDB.colorTransport
        ZLF_MinimapPanel.zlfTransportText:SetTextColor(cT.r, cT.g, cT.b)
        local cH = ZoneLevelForeverDB.colorHerbs
        ZLF_MinimapPanel.zlfHerbsText:SetTextColor(cH.r, cH.g, cH.b)
        local cM = ZoneLevelForeverDB.colorMining
        ZLF_MinimapPanel.zlfMiningText:SetTextColor(cM.r, cM.g, cM.b)

        local currentAnchor = ZLF_MinimapPanel.header
        local maxWidth = ZLF_MinimapPanel.header:GetStringWidth()
        local totalHeight = 15 + ZLF_MinimapPanel.header:GetStringHeight()
        
        if zoneData.fishingString and zoneData.fishingString ~= "" then
            ZLF_MinimapPanel.zlfFishingText:SetText(zoneData.fishingString)
            ZLF_MinimapPanel.zlfFishingText:ClearAllPoints()
            ZLF_MinimapPanel.zlfFishingText:SetPoint("TOPLEFT", currentAnchor, "BOTTOMLEFT", 0, -6)
            ZLF_MinimapPanel.zlfFishingText:Show()
            currentAnchor = ZLF_MinimapPanel.zlfFishingText
            totalHeight = totalHeight + 6 + ZLF_MinimapPanel.zlfFishingText:GetStringHeight()
            maxWidth = max(maxWidth, ZLF_MinimapPanel.zlfFishingText:GetStringWidth())
        else
            ZLF_MinimapPanel.zlfFishingText:Hide()
        end
        
        if zoneData.dungeonString and zoneData.dungeonString ~= "" then
            ZLF_MinimapPanel.zlfDungeonText:SetText(zoneData.dungeonString)
            ZLF_MinimapPanel.zlfDungeonText:ClearAllPoints()
            ZLF_MinimapPanel.zlfDungeonText:SetPoint("TOPLEFT", currentAnchor, "BOTTOMLEFT", 0, -6)
            ZLF_MinimapPanel.zlfDungeonText:Show()
            currentAnchor = ZLF_MinimapPanel.zlfDungeonText
            totalHeight = totalHeight + 6 + ZLF_MinimapPanel.zlfDungeonText:GetStringHeight()
            maxWidth = max(maxWidth, ZLF_MinimapPanel.zlfDungeonText:GetStringWidth())
        else
            ZLF_MinimapPanel.zlfDungeonText:Hide()
        end

        if zoneData.transportString and zoneData.transportString ~= "" then
            ZLF_MinimapPanel.zlfTransportText:SetText(zoneData.transportString)
            ZLF_MinimapPanel.zlfTransportText:ClearAllPoints()
            ZLF_MinimapPanel.zlfTransportText:SetPoint("TOPLEFT", currentAnchor, "BOTTOMLEFT", 0, -6)
            ZLF_MinimapPanel.zlfTransportText:Show()
            currentAnchor = ZLF_MinimapPanel.zlfTransportText
            totalHeight = totalHeight + 6 + ZLF_MinimapPanel.zlfTransportText:GetStringHeight()
            maxWidth = max(maxWidth, ZLF_MinimapPanel.zlfTransportText:GetStringWidth())
        else
            ZLF_MinimapPanel.zlfTransportText:Hide()
        end
        
        if zoneData.herbsString and zoneData.herbsString ~= "" then
            ZLF_MinimapPanel.zlfHerbsText:SetText(zoneData.herbsString)
            ZLF_MinimapPanel.zlfHerbsText:ClearAllPoints()
            ZLF_MinimapPanel.zlfHerbsText:SetPoint("TOPLEFT", currentAnchor, "BOTTOMLEFT", 0, -6)
            ZLF_MinimapPanel.zlfHerbsText:Show()
            currentAnchor = ZLF_MinimapPanel.zlfHerbsText
            totalHeight = totalHeight + 6 + ZLF_MinimapPanel.zlfHerbsText:GetStringHeight()
            maxWidth = max(maxWidth, ZLF_MinimapPanel.zlfHerbsText:GetStringWidth())
        else
            ZLF_MinimapPanel.zlfHerbsText:Hide()
        end

        if zoneData.miningString and zoneData.miningString ~= "" then
            ZLF_MinimapPanel.zlfMiningText:SetText(zoneData.miningString)
            ZLF_MinimapPanel.zlfMiningText:ClearAllPoints()
            ZLF_MinimapPanel.zlfMiningText:SetPoint("TOPLEFT", currentAnchor, "BOTTOMLEFT", 0, -6)
            ZLF_MinimapPanel.zlfMiningText:Show()
            currentAnchor = ZLF_MinimapPanel.zlfMiningText
            totalHeight = totalHeight + 6 + ZLF_MinimapPanel.zlfMiningText:GetStringHeight()
            maxWidth = max(maxWidth, ZLF_MinimapPanel.zlfMiningText:GetStringWidth())
        else
            ZLF_MinimapPanel.zlfMiningText:Hide()
        end
        
        ZLF_MinimapPanel:SetSize(maxWidth + 24, totalHeight + 15)
        ZLF_MinimapPanel:Show()
    else
        ZLF_MinimapPanel:Hide()
    end
end

local function UpdateZoneStrings()
    if not ZoneLevelForeverDB then return end
    
    lastCursorX = nil -- Invalidate cache when settings change
    
    for k, v in pairs(mapTable) do
        if ZoneLevelForeverDB.showIcons and v.faction and factionIcons[v.faction] then
            v.iconString = factionIcons[v.faction]
        else
            v.iconString = ""
        end

        if ZoneLevelForeverDB.showFishing and v.minFish then
            v.fishingString = (ZLF_L and ZLF_L["PREFIX_FISHING"] or "Fishing: ") .. v.minFish
        else
            v.fishingString = nil
        end
        
        if ZoneLevelForeverDB.showDungeons and v.dungeons then
            if type(v.dungeons) == "table" then
                local dNames = {}
                for _, d in ipairs(v.dungeons) do
                                        local name = d.id and C_Map.GetAreaInfo(d.id)
                    if not name then 
                        name = d.text or "???" 
                        if ZLF_L and ZLF_L["DUNGEON_" .. name] then
                            name = ZLF_L["DUNGEON_" .. name]
                        end
                    else
                        if name ~= d.text then name = name .. (d.text or "") end
                    end
                    table.insert(dNames, name)
                end
                v.dungeonString = table.concat(dNames, "\n")
            else
                local d = v.dungeons
                if ZLF_L then
                    -- Translate known dungeon names if they exist in Locales
                    for eng, loc in pairs(ZLF_L) do
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
        
        if ZoneLevelForeverDB.showTransport and v.transport then
            if type(v.transport) == "table" then
                local tNames = {}
                for _, tInfo in ipairs(v.transport) do
                    local prefixStr = tInfo.prefix
                    if ZLF_L then
                        prefixStr = string.gsub(prefixStr, "Boats:", ZLF_L["PREFIX_BOATS"] or "Boats:")
                        prefixStr = string.gsub(prefixStr, "Sky Boats:", ZLF_L["PREFIX_SKY_BOATS"] or "Sky Boats:")
                        prefixStr = string.gsub(prefixStr, "Zeppelins:", ZLF_L["PREFIX_ZEPPELINS"] or "Zeppelins:")
                        prefixStr = string.gsub(prefixStr, "Deeprun Tram:", ZLF_L["PREFIX_TRAM"] or "Deeprun Tram:")
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
                if ZLF_L then
                    t = string.gsub(t, "Boats:", ZLF_L["PREFIX_BOATS"] or "Boats:")
                    t = string.gsub(t, "Sky Boats:", ZLF_L["PREFIX_SKY_BOATS"] or "Sky Boats:")
                    t = string.gsub(t, "Zeppelins:", ZLF_L["PREFIX_ZEPPELINS"] or "Zeppelins:")
                    t = string.gsub(t, "Deeprun Tram:", ZLF_L["PREFIX_TRAM"] or "Deeprun Tram:")
                    
                    -- Translate known locations if they exist in Locales
                    for eng, loc in pairs(ZLF_L) do
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

        if ZoneLevelForeverDB.showHerbs and v.herbs then
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
                v.herbsString = (ZLF_L and ZLF_L["PREFIX_HERBS"] or "Herbs: ") .. table.concat(names, ", ")
            else
                v.herbsString = (ZLF_L and ZLF_L["PREFIX_HERBS"] or "Herbs: ") .. v.herbs
            end
        else
            v.herbsString = nil
        end

        if ZoneLevelForeverDB.showMining and v.mining then
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
                v.miningString = (ZLF_L and ZLF_L["PREFIX_MINING"] or "Mining: ") .. table.concat(names, ", ")
            else
                v.miningString = (ZLF_L and ZLF_L["PREFIX_MINING"] or "Mining: ") .. v.mining
            end
        else
            v.miningString = nil
        end
    end
    UpdateMinimapPanel()
end

local function InitializeDB()
    if not ZoneLevelForeverDB then
        ZoneLevelForeverDB = {
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
        if ZoneLevelForeverDB.showFishing == nil then ZoneLevelForeverDB.showFishing = true end
        if ZoneLevelForeverDB.showDungeons == nil then ZoneLevelForeverDB.showDungeons = true end
        if ZoneLevelForeverDB.showIcons == nil then ZoneLevelForeverDB.showIcons = true end
        if ZoneLevelForeverDB.showTransport == nil then ZoneLevelForeverDB.showTransport = true end
        if ZoneLevelForeverDB.useOwnWindow == nil then ZoneLevelForeverDB.useOwnWindow = false end
        if ZoneLevelForeverDB.showHerbs == nil then ZoneLevelForeverDB.showHerbs = false end
        if ZoneLevelForeverDB.showMining == nil then ZoneLevelForeverDB.showMining = false end
        if ZoneLevelForeverDB.fontSizeLevel == nil then ZoneLevelForeverDB.fontSizeLevel = 18 end
        if ZoneLevelForeverDB.fontSizeFishing == nil then ZoneLevelForeverDB.fontSizeFishing = 18 end
        if ZoneLevelForeverDB.fontSizeDungeons == nil then ZoneLevelForeverDB.fontSizeDungeons = 18 end
        if ZoneLevelForeverDB.fontSizeTransport == nil then ZoneLevelForeverDB.fontSizeTransport = 18 end
        if ZoneLevelForeverDB.fontSizeHerbs == nil then ZoneLevelForeverDB.fontSizeHerbs = 16 end
        if ZoneLevelForeverDB.fontSizeMining == nil then ZoneLevelForeverDB.fontSizeMining = 16 end
        if ZoneLevelForeverDB.colorFishing == nil then ZoneLevelForeverDB.colorFishing = {r = 1, g = 1, b = 1} end
        if ZoneLevelForeverDB.colorDungeons == nil then ZoneLevelForeverDB.colorDungeons = {r = 1, g = 0.82, b = 0} end
        if ZoneLevelForeverDB.colorTransport == nil then ZoneLevelForeverDB.colorTransport = {r = 0, g = 0.8, b = 1} end
        if ZoneLevelForeverDB.colorHerbs == nil then ZoneLevelForeverDB.colorHerbs = {r = 0.1, g = 1.0, b = 0.1} end
        if ZoneLevelForeverDB.colorMining == nil then ZoneLevelForeverDB.colorMining = {r = 0.8, g = 0.6, b = 0.2} end
        if ZoneLevelForeverDB.showMinimapPanel == nil then ZoneLevelForeverDB.showMinimapPanel = false end
        if ZoneLevelForeverDB.hideInCombat == nil then ZoneLevelForeverDB.hideInCombat = false end
        if ZoneLevelForeverDB.lastSeenWelcomeVersion == nil then ZoneLevelForeverDB.lastSeenWelcomeVersion = "0.0.0" end
    end
    if ZLF_UpdateLocale then ZLF_UpdateLocale() end
end

local function CreateOptionsPanel()
    local panel = CreateFrame("Frame", "ZoneLevelForeverOptionsPanel", UIParent)
    panel.name = "ZoneLevel: Forever"
    
    local title = panel:CreateFontString(nil, "ARTWORK", "GameFontNormalLarge")
    title:SetPoint("TOPLEFT", 16, -16)
    title:SetText(ZLF_L and ZLF_L["OPT_TITLE"] or "ZoneLevel: Forever Settings")

    local function CreateCheckbox(name, labelText, dbKey, yOffset, xOffset)
        local cb = CreateFrame("CheckButton", name, panel, "InterfaceOptionsCheckButtonTemplate")
        cb:SetPoint("TOPLEFT", xOffset or 16, yOffset)
        _G[cb:GetName() .. "Text"]:SetText(labelText)
        cb:SetChecked(ZoneLevelForeverDB[dbKey])
        cb:SetScript("OnClick", function(self)
            ZoneLevelForeverDB[dbKey] = self:GetChecked()
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
        slider:SetValue(ZoneLevelForeverDB[dbKey])
        
        _G[name .. "Text"]:SetText(labelText)
        _G[name .. "Low"]:SetText(minV)
        _G[name .. "High"]:SetText(maxV)

        local valText = slider:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall")
        valText:SetPoint("TOP", slider, "BOTTOM", 0, -3)
        valText:SetText(ZoneLevelForeverDB[dbKey])

        slider:SetScript("OnValueChanged", function(self, value)
            local rounded = math.floor(value + 0.5)
            ZoneLevelForeverDB[dbKey] = rounded
            valText:SetText(rounded)
            UpdateZLF_FontStyles()
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
        local dbColor = ZoneLevelForeverDB[dbKey]
        tex:SetColorTexture(dbColor.r, dbColor.g, dbColor.b)
        button.tex = tex

        local text = button:CreateFontString(nil, "ARTWORK", "GameFontHighlight")
        text:SetPoint("LEFT", button, "RIGHT", 5, 0)
        text:SetText(labelText)

        button:SetScript("OnClick", function()
            local c = ZoneLevelForeverDB[dbKey]
            
            local function OnColorChanged()
                local r, g, b = ColorPickerFrame:GetColorRGB()
                ZoneLevelForeverDB[dbKey] = {r = r, g = g, b = b}
                button.tex:SetColorTexture(r, g, b)
                UpdateZLF_FontStyles()
            end
            
            local function OnColorCanceled()
                ZoneLevelForeverDB[dbKey] = {r = c.r, g = c.g, b = c.b}
                button.tex:SetColorTexture(c.r, c.g, c.b)
                UpdateZLF_FontStyles()
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

    CreateCheckbox("ZLF_CheckFishing", ZLF_L and ZLF_L["OPT_SHOW_FISHING"] or "Show Fishing Levels", "showFishing", -50)
    CreateCheckbox("ZLF_CheckDungeons", ZLF_L and ZLF_L["OPT_SHOW_DUNGEONS"] or "Show Dungeons", "showDungeons", -80)
    CreateCheckbox("ZLF_CheckTransport", ZLF_L and ZLF_L["OPT_SHOW_TRANSPORT"] or "Show Transportation Routes", "showTransport", -110)
    CreateCheckbox("ZLF_CheckIcons", ZLF_L and ZLF_L["OPT_SHOW_ICONS"] or "Show Faction Icons", "showIcons", -140)
    CreateCheckbox("ZLF_CheckWindow", ZLF_L and ZLF_L["OPT_SHOW_WINDOW"] or "Use Dedicated Window", "useOwnWindow", -170)
    local cbMinimap = CreateCheckbox("ZLF_CheckMinimapPanel", ZLF_L and ZLF_L["OPT_SHOW_MINIMAP"] or "Show Minimap Panel", "showMinimapPanel", -200)
    local cbHideCombat = CreateCheckbox("ZLF_CheckHideInCombat", ZLF_L and ZLF_L["OPT_HIDE_IN_COMBAT"] or "Hide Current Zone Panel in Combat", "hideInCombat", -230, 36)
    
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

    CreateCheckbox("ZLF_CheckHerbs", ZLF_L and ZLF_L["OPT_SHOW_HERBS"] or "Show Herbs", "showHerbs", -260)
    CreateCheckbox("ZLF_CheckMining", ZLF_L and ZLF_L["OPT_SHOW_MINING"] or "Show Mining", "showMining", -290)

    CreateSlider("ZLF_SliderLevel", "Level Font Size", "fontSizeLevel", 250, -60, 8, 24, 1)
    CreateSlider("ZLF_SliderFishing", "Fishing Font Size", "fontSizeFishing", 250, -100, 8, 24, 1)
    CreateSlider("ZLF_SliderDungeons", "Dungeons Font Size", "fontSizeDungeons", 250, -140, 8, 24, 1)
    CreateSlider("ZLF_SliderTransport", "Transport Font Size", "fontSizeTransport", 250, -180, 8, 24, 1)
    CreateSlider("ZLF_SliderHerbs", "Herbs Font Size", "fontSizeHerbs", 250, -220, 8, 24, 1)
    CreateSlider("ZLF_SliderMining", "Mining Font Size", "fontSizeMining", 250, -260, 8, 24, 1)

    CreateColorSwatch("ZLF_ColorFishing", "Fishing Color", "colorFishing", 420, -100)
    CreateColorSwatch("ZLF_ColorDungeons", "Dungeons Color", "colorDungeons", 420, -140)
    CreateColorSwatch("ZLF_ColorTransport", "Transport Color", "colorTransport", 420, -180)
    CreateColorSwatch("ZLF_ColorHerbs", "Herbs Color", "colorHerbs", 420, -220)
    CreateColorSwatch("ZLF_ColorMining", "Mining Color", "colorMining", 420, -260)

    local moveBtn = CreateFrame("Button", "ZLF_MoveWindowBtn", panel, "UIPanelButtonTemplate")
    moveBtn:SetSize(150, 24)
    moveBtn:SetPoint("TOPLEFT", 16, -320)
    moveBtn:SetText("Unlock Windows")
    moveBtn:SetScript("OnClick", function()
        if ZLF_InfoWindow and ZLF_InfoWindow.isTesting then
            ZLF_InfoWindow.isTesting = false
            ZLF_InfoWindow:EnableMouse(false)
            ZLF_InfoWindow:Hide()
            if ZLF_MinimapPanel then
                ZLF_MinimapPanel.isTesting = false
                ZLF_MinimapPanel:EnableMouse(false)
                UpdateMinimapPanel()
            end
            moveBtn:SetText("Unlock Windows")
        else
            ZoneLevelForeverDB.useOwnWindow = true
            _G["ZLF_CheckWindow"]:SetChecked(true)
            ZoneLevelForeverDB.showMinimapPanel = true
            _G["ZLF_CheckMinimapPanel"]:SetChecked(true)
            
            if ZLF_InfoWindow then
                ZLF_InfoWindow.header:SetText("Drag Me (Map)!")
                if zlfTargetProvider and zlfTargetProvider.Label then
                    zlfTargetProvider.Label.zlfLevelText:Hide()
                    zlfTargetProvider.Label.zlfFishingText:Hide()
                    zlfTargetProvider.Label.zlfDungeonText:Hide()
                    zlfTargetProvider.Label.zlfTransportText:Hide()
                end
                ZLF_InfoWindow:SetSize(200, 80)
                ZLF_InfoWindow.isTesting = true
                ZLF_InfoWindow:EnableMouse(true)
                ZLF_InfoWindow:Show()
            end
            
            if ZLF_MinimapPanel then
                ZLF_MinimapPanel.isTesting = true
                ZLF_MinimapPanel:EnableMouse(true)
                ZLF_MinimapPanel.header:SetText("Drag Me (Minimap)!")
                ZLF_MinimapPanel.zlfFishingText:Hide()
                ZLF_MinimapPanel.zlfDungeonText:Hide()
                ZLF_MinimapPanel.zlfTransportText:Hide()
                ZLF_MinimapPanel:SetSize(200, 80)
                ZLF_MinimapPanel:Show()
            end
            moveBtn:SetText("Lock Windows")
        end
    end)

    
    

    local resetBtn = CreateFrame("Button", "ZLF_ResetBtn", panel, "UIPanelButtonTemplate")
    resetBtn:SetSize(150, 24)
    resetBtn:SetPoint("TOPLEFT", 16, -350)
    resetBtn:SetText(ZLF_L and ZLF_L["OPT_RESET"] or "Reset Defaults")
    resetBtn:SetScript("OnClick", function()
        ZoneLevelForeverDB = nil
        InitializeDB()
        
        _G["ZLF_CheckFishing"]:SetChecked(ZoneLevelForeverDB.showFishing)
        _G["ZLF_CheckDungeons"]:SetChecked(ZoneLevelForeverDB.showDungeons)
        _G["ZLF_CheckTransport"]:SetChecked(ZoneLevelForeverDB.showTransport)
        _G["ZLF_CheckIcons"]:SetChecked(ZoneLevelForeverDB.showIcons)
        _G["ZLF_CheckWindow"]:SetChecked(ZoneLevelForeverDB.useOwnWindow)
        _G["ZLF_CheckMinimapPanel"]:SetChecked(ZoneLevelForeverDB.showMinimapPanel)
        _G["ZLF_CheckHerbs"]:SetChecked(ZoneLevelForeverDB.showHerbs)
        _G["ZLF_CheckMining"]:SetChecked(ZoneLevelForeverDB.showMining)

        _G["ZLF_SliderLevel"]:SetValue(ZoneLevelForeverDB.fontSizeLevel)
        _G["ZLF_SliderFishing"]:SetValue(ZoneLevelForeverDB.fontSizeFishing)
        _G["ZLF_SliderDungeons"]:SetValue(ZoneLevelForeverDB.fontSizeDungeons)
        _G["ZLF_SliderTransport"]:SetValue(ZoneLevelForeverDB.fontSizeTransport)
        _G["ZLF_SliderHerbs"]:SetValue(ZoneLevelForeverDB.fontSizeHerbs)
        _G["ZLF_SliderMining"]:SetValue(ZoneLevelForeverDB.fontSizeMining)

        local cf = ZoneLevelForeverDB.colorFishing
        _G["ZLF_ColorFishing"].tex:SetColorTexture(cf.r, cf.g, cf.b)
        local cd = ZoneLevelForeverDB.colorDungeons
        _G["ZLF_ColorDungeons"].tex:SetColorTexture(cd.r, cd.g, cd.b)
        local ct = ZoneLevelForeverDB.colorTransport
        _G["ZLF_ColorTransport"].tex:SetColorTexture(ct.r, ct.g, ct.b)
        local ch = ZoneLevelForeverDB.colorHerbs
        if ch and _G["ZLF_ColorHerbs"] then _G["ZLF_ColorHerbs"].tex:SetColorTexture(ch.r, ch.g, ch.b) end
        local cm = ZoneLevelForeverDB.colorMining
        if cm and _G["ZLF_ColorMining"] then _G["ZLF_ColorMining"].tex:SetColorTexture(cm.r, cm.g, cm.b) end

        if ZLF_InfoWindow then
            ZLF_InfoWindow:ClearAllPoints()
            local parentAnchor = WorldMapFrame.ScrollContainer or WorldMapFrame
            ZLF_InfoWindow:SetPoint("BOTTOMRIGHT", parentAnchor, "BOTTOMRIGHT", -10, 60)
            if ZLF_InfoWindow.isTesting then
                ZLF_InfoWindow.isTesting = false
                ZLF_InfoWindow:EnableMouse(false)
                ZLF_InfoWindow:Hide()
                _G["ZLF_MoveWindowBtn"]:SetText("Unlock Windows")
            end
        end
        if ZLF_MinimapPanel then
            ZLF_MinimapPanel:ClearAllPoints()
            ZLF_MinimapPanel:SetPoint("BOTTOMRIGHT", UIParent, "BOTTOMRIGHT", -20, 20)
            if ZLF_MinimapPanel.isTesting then
                ZLF_MinimapPanel.isTesting = false
                ZLF_MinimapPanel:EnableMouse(false)
            end
        end

        if ZLF_MapButton then
            ZLF_MapButton:ClearAllPoints()
            ZLF_MapButton:SetPoint("BOTTOMLEFT", WorldMapFrame, "BOTTOMLEFT", 10, 10)
        end

        UpdateZoneStrings()
        UpdateZLF_FontStyles()
        UpdateMinimapPanel()
    end)

    -- Integrate into Blizzard Interface Options
    if Settings and Settings.RegisterCanvasLayoutCategory then
        local category = Settings.RegisterCanvasLayoutCategory(panel, panel.name)
        Settings.RegisterAddOnCategory(category)
        ZoneLevelForeverOptionsPanel.category = category
    elseif InterfaceOptions_AddCategory then
        InterfaceOptions_AddCategory(panel)
    end
end

SLASH_ZONELEVELFOREVER1 = "/zlf"
SlashCmdList["ZONELEVELFOREVER"] = function(msg)
    if InCombatLockdown() then
        print("|cffffff00ZoneLevel: Forever - Cannot open settings in combat.|r")
        return
    end
    if Settings and Settings.OpenToCategory and ZoneLevelForeverOptionsPanel.category then
        Settings.OpenToCategory(ZoneLevelForeverOptionsPanel.category:GetID())
    elseif InterfaceOptionsFrame_OpenToCategory then
        InterfaceOptionsFrame_OpenToCategory(ZoneLevelForeverOptionsPanel)
        InterfaceOptionsFrame_OpenToCategory(ZoneLevelForeverOptionsPanel) -- Repeated to fix Blizzard bug where it opens to wrong page initially
    end
end

-- Update zone level colors based on current player level
local function UpdateZoneLevelColors()
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
                        self.zlfLevelText:SetText(zoneData.levelString)
                        self.zlfFishingText:SetText(zoneData.fishingString)
                        self.zlfDungeonText:SetText(zoneData.dungeonString)
                        self.zlfTransportText:SetText(zoneData.transportString)
                        self.zlfHerbsText:SetText(zoneData.herbsString)
                        self.zlfMiningText:SetText(zoneData.miningString)
                        
                        if ZoneLevelForeverDB.useOwnWindow then
                            if ZLF_InfoWindow then
                                ZLF_InfoWindow.header:SetText((zoneData.iconString or "") .. name .. (zoneData.levelString or ""))
                                self.zlfLevelText:Hide()
                                
                                local currentAnchor = ZLF_InfoWindow.header
                                local maxWidth = ZLF_InfoWindow.header:GetStringWidth()
                                local totalHeight = 15 + ZLF_InfoWindow.header:GetStringHeight()
                                
                                self.zlfFishingText:SetParent(ZLF_InfoWindow)
                                self.zlfDungeonText:SetParent(ZLF_InfoWindow)
                                self.zlfTransportText:SetParent(ZLF_InfoWindow)
                                self.zlfHerbsText:SetParent(ZLF_InfoWindow)
                                self.zlfMiningText:SetParent(ZLF_InfoWindow)

                                self.zlfFishingText:SetJustifyH("LEFT")
                                self.zlfDungeonText:SetJustifyH("LEFT")
                                self.zlfTransportText:SetJustifyH("LEFT")
                                self.zlfHerbsText:SetJustifyH("LEFT")
                                self.zlfMiningText:SetJustifyH("LEFT")

                                if zoneData.fishingString and zoneData.fishingString ~= "" then
                                    self.zlfFishingText:ClearAllPoints()
                                    self.zlfFishingText:SetPoint("TOPLEFT", currentAnchor, "BOTTOMLEFT", 0, -6)
                                    self.zlfFishingText:Show()
                                    currentAnchor = self.zlfFishingText
                                    totalHeight = totalHeight + 6 + self.zlfFishingText:GetStringHeight()
                                    maxWidth = max(maxWidth, self.zlfFishingText:GetStringWidth())
                                else
                                    self.zlfFishingText:Hide()
                                end
                                
                                if zoneData.dungeonString and zoneData.dungeonString ~= "" then
                                    self.zlfDungeonText:ClearAllPoints()
                                    self.zlfDungeonText:SetPoint("TOPLEFT", currentAnchor, "BOTTOMLEFT", 0, -6)
                                    self.zlfDungeonText:Show()
                                    currentAnchor = self.zlfDungeonText
                                    totalHeight = totalHeight + 6 + self.zlfDungeonText:GetStringHeight()
                                    maxWidth = max(maxWidth, self.zlfDungeonText:GetStringWidth())
                                else
                                    self.zlfDungeonText:Hide()
                                end

                                if zoneData.transportString and zoneData.transportString ~= "" then
                                    self.zlfTransportText:ClearAllPoints()
                                    self.zlfTransportText:SetPoint("TOPLEFT", currentAnchor, "BOTTOMLEFT", 0, -6)
                                    self.zlfTransportText:Show()
                                    currentAnchor = self.zlfTransportText
                                    totalHeight = totalHeight + 6 + self.zlfTransportText:GetStringHeight()
                                    maxWidth = max(maxWidth, self.zlfTransportText:GetStringWidth())
                                else
                                    self.zlfTransportText:Hide()
                                end
                                
                                if zoneData.herbsString and zoneData.herbsString ~= "" then
                                    self.zlfHerbsText:ClearAllPoints()
                                    self.zlfHerbsText:SetPoint("TOPLEFT", currentAnchor, "BOTTOMLEFT", 0, -6)
                                    self.zlfHerbsText:Show()
                                    currentAnchor = self.zlfHerbsText
                                    totalHeight = totalHeight + 6 + self.zlfHerbsText:GetStringHeight()
                                    maxWidth = max(maxWidth, self.zlfHerbsText:GetStringWidth())
                                else
                                    self.zlfHerbsText:Hide()
                                end

                                if zoneData.miningString and zoneData.miningString ~= "" then
                                    self.zlfMiningText:ClearAllPoints()
                                    self.zlfMiningText:SetPoint("TOPLEFT", currentAnchor, "BOTTOMLEFT", 0, -6)
                                    self.zlfMiningText:Show()
                                    currentAnchor = self.zlfMiningText
                                    totalHeight = totalHeight + 6 + self.zlfMiningText:GetStringHeight()
                                    maxWidth = max(maxWidth, self.zlfMiningText:GetStringWidth())
                                else
                                    self.zlfMiningText:Hide()
                                end
                                
                                ZLF_InfoWindow:SetSize(maxWidth + 24, totalHeight + 15)
                                ZLF_InfoWindow:Show()
                            end
                        else
                            if ZLF_InfoWindow and not ZLF_InfoWindow.isTesting then ZLF_InfoWindow:Hide() end
                            name = (zoneData.iconString or "") .. name
                            
                            self.zlfLevelText:SetParent(self)
                            self.zlfFishingText:SetParent(self)
                            self.zlfDungeonText:SetParent(self)
                            self.zlfTransportText:SetParent(self)

                            self.zlfFishingText:SetJustifyH("CENTER")
                            self.zlfDungeonText:SetJustifyH("CENTER")
                            self.zlfTransportText:SetJustifyH("CENTER")
                            
                            local currentAnchor = self.Name or (self.labels and self.labels[MAP_AREA_LABEL_TYPE.AREA_NAME])
                            
                            if zoneData.levelString and zoneData.levelString ~= "" then
                                self.zlfLevelText:SetText(zoneData.levelString)
                                self.zlfLevelText:ClearAllPoints()
                                self.zlfLevelText:SetPoint("LEFT", currentAnchor, "RIGHT", 4, 0)
                                self.zlfLevelText:Show()
                            else
                                self.zlfLevelText:Hide()
                            end
                            
                            if zoneData.fishingString and zoneData.fishingString ~= "" then
                                self.zlfFishingText:ClearAllPoints()
                                self.zlfFishingText:SetPoint("TOP", currentAnchor, "BOTTOM", 0, -4)
                                self.zlfFishingText:Show()
                                currentAnchor = self.zlfFishingText
                            else
                                self.zlfFishingText:Hide()
                            end
                            
                            if zoneData.dungeonString and zoneData.dungeonString ~= "" then
                                self.zlfDungeonText:ClearAllPoints()
                                self.zlfDungeonText:SetPoint("TOP", currentAnchor, "BOTTOM", 0, -4)
                                self.zlfDungeonText:Show()
                                currentAnchor = self.zlfDungeonText
                            else
                                self.zlfDungeonText:Hide()
                            end

                            if zoneData.transportString and zoneData.transportString ~= "" then
                                self.zlfTransportText:ClearAllPoints()
                                self.zlfTransportText:SetPoint("TOP", currentAnchor, "BOTTOM", 0, -4)
                                self.zlfTransportText:Show()
                                currentAnchor = self.zlfTransportText
                            else
                                self.zlfTransportText:Hide()
                            end

                            if zoneData.herbsString and zoneData.herbsString ~= "" then
                                self.zlfHerbsText:ClearAllPoints()
                                self.zlfHerbsText:SetPoint("TOP", currentAnchor, "BOTTOM", 0, -4)
                                self.zlfHerbsText:Show()
                                currentAnchor = self.zlfHerbsText
                            else
                                self.zlfHerbsText:Hide()
                            end

                            if zoneData.miningString and zoneData.miningString ~= "" then
                                self.zlfMiningText:ClearAllPoints()
                                self.zlfMiningText:SetPoint("TOP", currentAnchor, "BOTTOM", 0, -4)
                                self.zlfMiningText:Show()
                            else
                                self.zlfMiningText:Hide()
                            end
                        end
                    else
                        if ZLF_InfoWindow and not ZLF_InfoWindow.isTesting then ZLF_InfoWindow:Hide() end
                        self.zlfLevelText:Hide()
                        self.zlfFishingText:Hide()
                        self.zlfDungeonText:Hide()
                        self.zlfTransportText:Hide()
                        self.zlfHerbsText:Hide()
                        self.zlfMiningText:Hide()
                    end
                end
            else
                name = MapUtil_FindBestAreaNameAtMouse(mapID, normalizedCursorX, normalizedCursorY)
                if lastHoveredMapID ~= nil then
                    lastHoveredMapID = nil
                    if ZLF_InfoWindow and not ZLF_InfoWindow.isTesting then ZLF_InfoWindow:Hide() end
                    if self.zlfLevelText then
                        self.zlfLevelText:Hide()
                        self.zlfFishingText:Hide()
                        self.zlfDungeonText:Hide()
                        self.zlfTransportText:Hide()
                        self.zlfHerbsText:Hide()
                        self.zlfMiningText:Hide()
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
            if ZLF_InfoWindow and not ZLF_InfoWindow.isTesting then ZLF_InfoWindow:Hide() end
            if self.zlfLevelText then
                self.zlfLevelText:Hide()
                self.zlfFishingText:Hide()
                self.zlfDungeonText:Hide()
                self.zlfTransportText:Hide()
                self.zlfHerbsText:Hide()
                self.zlfMiningText:Hide()
                self.zlfDungeonText:Hide()
                self.zlfTransportText:Hide()
            end
            self:EvaluateLabels()
        end
    end
end

local function InitializeZoneLevelForever()
    UpdateZoneLevelColors()

    if WorldMapFrame and WorldMapFrame.dataProviders then
        for provider in next, WorldMapFrame.dataProviders do
            if provider.Label then
                zlfTargetProvider = provider
                break
            end
        end
    end

    if zlfTargetProvider then
        if not ZLF_InfoWindow then
            ZLF_InfoWindow = CreateFrame("Frame", "ZLF_InfoWindow", WorldMapFrame, "BackdropTemplate")
            ZLF_InfoWindow:SetBackdrop({
                bgFile = "Interface\\Tooltips\\UI-Tooltip-Background",
                edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
                tile = true, tileSize = 16, edgeSize = 16,
                insets = { left = 4, right = 4, top = 4, bottom = 4 }
            })
            ZLF_InfoWindow:SetBackdropColor(0, 0, 0, 0.9)
            ZLF_InfoWindow:SetBackdropBorderColor(1, 1, 1, 0.5)
            ZLF_InfoWindow:SetMovable(true)
            ZLF_InfoWindow:EnableMouse(false)
            ZLF_InfoWindow:RegisterForDrag("LeftButton")
            ZLF_InfoWindow:SetScript("OnDragStart", ZLF_InfoWindow.StartMoving)
            ZLF_InfoWindow:SetScript("OnDragStop", function(s)
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
                    ZoneLevelForeverDB.windowPosX = dx
                    ZoneLevelForeverDB.windowPosY = dy
                    ZoneLevelForeverDB.windowPoint = "CENTER"
                else
                    local p, rt, rp, x, y = s:GetPoint()
                    ZoneLevelForeverDB.windowPosX = x
                    ZoneLevelForeverDB.windowPosY = y
                    ZoneLevelForeverDB.windowPoint = p
                end
            end)
            ZLF_InfoWindow:SetFrameStrata("TOOLTIP")
            
            local pt = ZoneLevelForeverDB.windowPoint or "BOTTOMRIGHT"
            local x = ZoneLevelForeverDB.windowPosX or -10
            local y = ZoneLevelForeverDB.windowPosY or 60
            local parentAnchor = WorldMapFrame.ScrollContainer or WorldMapFrame
            ZLF_InfoWindow:SetPoint(pt, parentAnchor, pt, x, y)
            
            ZLF_InfoWindow.header = ZLF_InfoWindow:CreateFontString(nil, "OVERLAY", "GameFontHighlightLarge")
            ZLF_InfoWindow.header:SetPoint("TOPLEFT", 12, -12)
            ZLF_InfoWindow:Hide()
        end

        if not zlfTargetProvider.Label.zlfLevelText then
            zlfTargetProvider.Label.zlfLevelText = zlfTargetProvider.Label:CreateFontString(nil, "OVERLAY", "GameFontNormal")
            zlfTargetProvider.Label.zlfFishingText = zlfTargetProvider.Label:CreateFontString(nil, "OVERLAY", "GameFontNormal")
            zlfTargetProvider.Label.zlfDungeonText = zlfTargetProvider.Label:CreateFontString(nil, "OVERLAY", "GameFontNormal")
            zlfTargetProvider.Label.zlfTransportText = zlfTargetProvider.Label:CreateFontString(nil, "OVERLAY", "GameFontNormal")
            zlfTargetProvider.Label.zlfHerbsText = zlfTargetProvider.Label:CreateFontString(nil, "OVERLAY", "GameFontNormal")
            zlfTargetProvider.Label.zlfMiningText = zlfTargetProvider.Label:CreateFontString(nil, "OVERLAY", "GameFontNormal")
            UpdateZLF_FontStyles()
        end

        -- Securely hook SetScript to detect when other addons (like Leatrix) try to overwrite the label script
        hooksecurefunc(zlfTargetProvider.Label, "SetScript", function(self, scriptType, handler)
            if scriptType == "OnUpdate" and not self.ZLF_Rehooking then
                self.ZLF_Rehooking = true
                self:HookScript("OnUpdate", AreaLabelOnUpdate)
                self.ZLF_Rehooking = false
            end
        end)

        -- Apply initial hook
        if not zlfTargetProvider.Label.ZLF_Rehooking then
            zlfTargetProvider.Label.ZLF_Rehooking = true
            zlfTargetProvider.Label:HookScript("OnUpdate", AreaLabelOnUpdate)
            zlfTargetProvider.Label.ZLF_Rehooking = false
        end
    end

    if not ZLF_MapButton and WorldMapFrame then
        ZLF_MapButton = CreateFrame("Button", "ZLF_MapButton", WorldMapFrame)
        ZLF_MapButton:SetSize(32, 32)
        
        local pt = ZoneLevelForeverDB.mapBtnPoint or "BOTTOMLEFT"
        local x = ZoneLevelForeverDB.mapBtnX or 10
        local y = ZoneLevelForeverDB.mapBtnY or 10
        ZLF_MapButton:SetPoint(pt, WorldMapFrame, pt, x, y)
        ZLF_MapButton:SetFrameLevel(WorldMapFrame:GetFrameLevel() + 5)
        
        local icon = ZLF_MapButton:CreateTexture(nil, "BACKGROUND")
        icon:SetTexture("Interface\\WorldMap\\UI-World-Icon")
        icon:SetSize(20, 20)
        icon:SetPoint("TOPLEFT", 6, -6)
        
        local border = ZLF_MapButton:CreateTexture(nil, "OVERLAY")
        border:SetTexture("Interface\\Minimap\\MiniMap-TrackingBorder")
        border:SetSize(54, 54)
        border:SetPoint("TOPLEFT", 0, 0)

        ZLF_MapButton:SetHighlightTexture("Interface\\Minimap\\UI-Minimap-ZoomButton-Highlight", "ADD")
        
        ZLF_MapButton:SetMovable(true)
        ZLF_MapButton:RegisterForDrag("LeftButton", "RightButton")
        ZLF_MapButton:SetScript("OnDragStart", function(s)
            if IsShiftKeyDown() then s:StartMoving() end
        end)
        ZLF_MapButton:SetScript("OnDragStop", function(s)
            s:StopMovingOrSizing()
            local p, rt, rp, curX, curY = s:GetPoint()
            ZoneLevelForeverDB.mapBtnX = curX
            ZoneLevelForeverDB.mapBtnY = curY
            ZoneLevelForeverDB.mapBtnPoint = p
        end)

        ZLF_MapButton:SetScript("OnClick", function()
            if InCombatLockdown() then
                print("|cffffff00ZoneLevel: Forever - Cannot open settings in combat.|r")
                return
            end
            if Settings and Settings.OpenToCategory and ZoneLevelForeverOptionsPanel.category then
                Settings.OpenToCategory(ZoneLevelForeverOptionsPanel.category:GetID())
            elseif InterfaceOptionsFrame_OpenToCategory then
                InterfaceOptionsFrame_OpenToCategory(ZoneLevelForeverOptionsPanel)
                InterfaceOptionsFrame_OpenToCategory(ZoneLevelForeverOptionsPanel)
            end
        end)
        
        ZLF_MapButton:SetScript("OnEnter", function(self)
            GameTooltip:SetOwner(self, "ANCHOR_BOTTOMRIGHT")
            GameTooltip:SetText("ZoneLevel: Forever")
            GameTooltip:AddLine("Click to open settings.", 1, 1, 1)
            GameTooltip:AddLine("Shift-Drag to move this button.", 0.7, 0.7, 0.7)
            GameTooltip:Show()
        end)
        ZLF_MapButton:SetScript("OnLeave", function()
            GameTooltip:Hide()
        end)
    end
end

-- Event handling

local ZLF_WelcomeFrame = nil
local function ShowWelcomeWindow()
    if ZLF_WelcomeFrame then
        ZLF_WelcomeFrame:Show()
        return
    end

    local frame = CreateFrame("Frame", "ZLF_WelcomeWindow", UIParent, "BackdropTemplate")
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
    header:SetText("Welcome to Zone Level: Forever!")
    header:SetTextColor(1, 0.82, 0)

    local body = frame:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
    body:SetPoint("TOPLEFT", 30, -60)
    body:SetPoint("BOTTOMRIGHT", -30, 60)
    body:SetJustifyH("LEFT")
    body:SetJustifyV("TOP")
    
    local text = "Thank you so much for using Zone Level: Forever!\n\n"
    text = text .. "I truly hope you enjoy the addon and that we will all meet together after the WoW: Forever beta is finished.\n\n"
    text = text .. "|cffffff00Quick Tips:|r\n"
    text = text .. "• Type |cff00ccff/zlf|r or click the World Map button to open the Settings.\n"
    text = text .. "• Hold |cff00ccffShift|r and drag to freely move the World Map settings button.\n\n"
    text = text .. "Also, if you want to easily highlight newly added quests, be sure to check out my other addon: |cff00ff00Forever Quests|r!\n\n"
    text = text .. "If you have any feedback, dont be shy to comment on CurseForge page :)"
    
    body:SetText(text)
    
    local closeBtn = CreateFrame("Button", nil, frame, "UIPanelButtonTemplate")
    closeBtn:SetSize(120, 26)
    closeBtn:SetPoint("BOTTOM", 0, 25)
    closeBtn:SetText("Awesome, thanks!")
    closeBtn:SetScript("OnClick", function()
        ZoneLevelForeverDB.lastSeenWelcomeVersion = ZLF_WELCOME_VERSION
        frame:Hide()
    end)
    
    ZLF_WelcomeFrame = frame
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
    if event == "ADDON_LOADED" and arg1 == "ZoneLevelForever" then
        InitializeDB()
        UpdateZoneStrings()
        CreateOptionsPanel()
    elseif event == "PLAYER_LOGIN" then
        InitializeZoneLevelForever()
    elseif event == "PLAYER_LEVEL_UP" then
        UpdateZoneLevelColors()
    elseif event == "PLAYER_ENTERING_WORLD" or event == "ZONE_CHANGED_NEW_AREA" then
        if event == "PLAYER_ENTERING_WORLD" and ZoneLevelForeverDB and ZoneLevelForeverDB.lastSeenWelcomeVersion ~= ZLF_WELCOME_VERSION then
            ShowWelcomeWindow()
        end
        UpdateMinimapPanel()
    elseif event == "PLAYER_REGEN_DISABLED" then
        if ZoneLevelForeverDB and ZoneLevelForeverDB.hideInCombat then
            if ZLF_MinimapPanel and not ZLF_MinimapPanel.isTesting then ZLF_MinimapPanel:Hide() end
        end
    elseif event == "PLAYER_REGEN_ENABLED" then
        UpdateMinimapPanel()
    end
end)

-- Just in case it's loaded after PLAYER_LOGIN
if IsLoggedIn() then
    InitializeZoneLevelForever()
end

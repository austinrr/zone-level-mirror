local ZIF_WELCOME_VERSION = "1.9.1"
-- Zone Info: Forever
-- Standalone addon to show zone levels on the map

local mapTable = {
    -- Eastern Kingdoms
    --[[Alterac Mountains]]		[1416] = {minLevel = 30, 	maxLevel = 40,		minFish = "130",       dungeons = {{id=16560, text=" (28-33)"}}, transport = "Sky Boats: Zephras Isle", faction = "Contested", herbs = {2453, 3355, 3356, 3357, 3818, 3821}, mining = {2771, 2775, 2772, 2776, 3858}},
    --[[Arathi Highlands]]		[1417] = {minLevel = 30, 	maxLevel = 40,		minFish = "130",       faction = "Contested", herbs = {2453, 3355, 3356, 3357, 3818, 3821}, mining = {2771, 2775, 2772, 2776, 3858}},
    --[[Badlands]]				[1418] = {minLevel = 35, 	maxLevel = 45,		dungeons = {{id=1337, text=" (35-45)"}}, transport = "Boats: Steamwheedle Port", faction = "Contested", herbs = {3355, 3356, 3818, 3821, 4625}, mining = {2772, 2776, 3858, 7911}},
    --[[Blasted Lands]]			[1419] = {minLevel = 45, 	maxLevel = 55,                             faction = "Contested", herbs = {3818, 3821, 3358, 4625, 8838, 8846}, mining = {2772, 2776, 3858, 7911, 10620}},
    --[[Burning Steppes]]		[1428] = {minLevel = 50, 	maxLevel = 58,		minFish = "330",       dungeons = {{id=17803, text=" (52-60)"}, {id=17804, text=" (55-60)"}, {id=2717, text=" (60)"}, {id=2677, text=" (60)"}}, faction = "Contested", herbs = {4625, 13464, 13463, 13465, 13468}, mining = {3858, 7911, 10620}},
    --[[Deadwind Pass]]			[1430] = {minLevel = 55, 	maxLevel = 60,		minFish = "330",       faction = "Contested", herbs = {13463, 13465}, mining = {3858, 7911, 10620}},
    --[[Dun Morogh]]			[1426] = {minLevel = 1, 	maxLevel = 10,		minFish = "1",         dungeons = {{id=16919, text=" (13-18)"}, {id=721, text=" (24-34)"}}, transport = "Deeprun Tram: Stormwind", faction = "Alliance", herbs = {2447, 765, 2449}, mining = {2770}},
    --[[Duskwood]]				[1431] = {minLevel = 18, 	maxLevel = 30,		minFish = "55",        faction = "Contested", herbs = {785, 2450, 2453, 3369, 3356}, mining = {2770, 2771, 2775, 2772}},
    --[[Eastern Plaguelands]]	[1423] = {minLevel = 53, 	maxLevel = 60,		minFish = "330",       dungeons = {{id=2017, text=" (55-60)"}, {id=3456, text=" (60)"}}, faction = "Contested", herbs = {8836, 8838, 13466, 13463, 13468}, mining = {3858, 7911, 10620}},
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
    --[[Western Plaguelands]]	[1422] = {minLevel = 51, 	maxLevel = 58,		minFish = "205",       dungeons = {{id=2057, text=" (55-60)"}}, faction = "Contested", herbs = {8836, 8838, 13466, 13463}, mining = {3858, 7911, 10620}},
    --[[Wetlands]]				[1437] = {minLevel = 20, 	maxLevel = 30,		minFish = "55",        dungeons = {{id=16732, text=" (24-29)"}}, transport = "Boats: Theramore, Auberdine", faction = "Contested", herbs = {2450, 2453, 3355, 3356, 3357}, mining = {2771, 2775, 2772}},

    -- Kalimdor
    --[[Ashenvale]]				[1440] = {minLevel = 18, 	maxLevel = 30,		minFish = "55",        dungeons = {{id=719, text=" (20-30)"}}, faction = "Contested", herbs = {785, 2450, 2453, 3356, 3357}, mining = {2770, 2771, 2775, 2772, 2776}},
    --[[Azshara]]				[1447] = {minLevel = 45, 	maxLevel = 55,		minFish = "205 (330)", dungeons = {{text="Blackmaw Hold (55-60)"}}, faction = "Contested", herbs = {8838, 8831, 8846, 13463, 13465}, mining = {3858, 7911, 10620}},
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
    --[[Silithus]]				[1451] = {minLevel = 55, 	maxLevel = 60,		minFish = "330",       dungeons = {{id=3429, text=" (60)"}, {id=3428, text=" (60)"}}, faction = "Contested", herbs = {8838, 13464, 13463, 13465, 13468}, mining = {3858, 7911, 10620}},
    --[[Stonetalon Mountains]]	[1442] = {minLevel = 15, 	maxLevel = 27,		minFish = "55",        transport = "Sky Boats: Zephras Isle", faction = "Contested", herbs = {785, 2450, 2453, 3355}, mining = {2770, 2771, 2775, 2772}},
    --[[Tanaris]]				[1446] = {minLevel = 40, 	maxLevel = 50,		minFish = "205",       dungeons = {{id=978, text=" (42-52)"}}, transport = "Boats: Powderfuse Port", faction = "Contested", herbs = {4625, 8831}, mining = {2772, 2776, 3858, 7911, 10620}},
    --[[Teldrassil]]			[1438] = {minLevel = 1, 	maxLevel = 10,		minFish = "1",         transport = "Boats: Auberdine", faction = "Alliance", herbs = {2447, 765, 2449}, mining = {2770}},
    --[[The Barrens]]			[1413] = {minLevel = 10, 	maxLevel = 25,		minFish = "1",         dungeons = {{id=718, text=" (15-25)"}, {id=491, text=" (25-35)"}, {id=722, text=" (35-45)"}}, transport = "Boats: Booty Bay", faction = "Horde", herbs = {785, 2450, 2453, 3820}, mining = {2770, 2771, 2775, 2772}},
    --[[Thousand Needles]]		[1441] = {minLevel = 25, 	maxLevel = 35,		minFish = "130",       faction = "Contested", herbs = {2453, 3355, 3356, 3357}, mining = {2771, 2775, 2772, 2776, 3858}},
    --[[Thunder Bluff]]			[1456] = {minFish = 1,                                                 faction = "Horde"},
    --[[Un'Goro Crater]]		[1449] = {minLevel = 48, 	maxLevel = 55,		minFish = "205",       dungeons = {{text="Shaper's Terrace (58-60)"}}, faction = "Contested", herbs = {8839, 13465, 13464, 13468}, mining = {3858, 7911, 10620}},
    --[[Winterspring]]			[1452] = {minLevel = 55, 	maxLevel = 60,		minFish = "330",       faction = "Contested", herbs = {13467, 13465, 13463, 13468}, mining = {3858, 7911, 10620}},

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

-- Use the client's own font so Cyrillic, Korean and Chinese text doesn't render as squares
local FONT = GameFontNormal:GetFont()

-- Info lines shown under the zone name, in display order
local LINES = {
    { text = "zifFishingText",   str = "fishingString",   size = "fontSizeFishing",   color = "colorFishing" },
    { text = "zifDungeonText",   str = "dungeonString",   size = "fontSizeDungeons",  color = "colorDungeons" },
    { text = "zifTransportText", str = "transportString", size = "fontSizeTransport", color = "colorTransport" },
    { text = "zifHerbsText",     str = "herbsString",     size = "fontSizeHerbs",     color = "colorHerbs" },
    { text = "zifMiningText",    str = "miningString",    size = "fontSizeMining",    color = "colorMining" },
}

local DEFAULTS = {
    showFishing = true,
    showDungeons = true,
    showIcons = true,
    showTransport = true,
    useOwnWindow = false,
    showMinimapPanel = false,
    hideInCombat = false,
    showHerbs = false,
    showMining = false,
    fontSizeLevel = 18,
    fontSizeFishing = 18,
    fontSizeDungeons = 18,
    fontSizeTransport = 18,
    fontSizeHerbs = 16,
    fontSizeMining = 16,
    colorFishing = {r = 1, g = 1, b = 1},
    colorDungeons = {r = 1, g = 0.82, b = 0},
    colorTransport = {r = 0, g = 0.8, b = 1},
    colorHerbs = {r = 0.2, g = 0.8, b = 0.2},
    colorMining = {r = 0.8, g = 0.4, b = 0.1},
}

local PANEL_BACKDROP = {
    bgFile = "Interface\\Tooltips\\UI-Tooltip-Background",
    edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
    tile = true, tileSize = 16, edgeSize = 16,
    insets = { left = 4, right = 4, top = 4, bottom = 4 }
}

-- Optimization caching
local lastCursorX, lastCursorY, lastName
local lastHoveredMapID, lastHoveredName
local QUERY_INTERVAL = 0.05
local nextQueryTime = 0
local zifTargetProvider = nil
local ZIF_InfoWindow = nil
local ZIF_MinimapPanel = nil
local ZIF_MapButton = nil
local C_Map_GetMapInfoAtPosition = C_Map.GetMapInfoAtPosition
local MapUtil_FindBestAreaNameAtMouse = MapUtil.FindBestAreaNameAtMouse
local GetItemName = (C_Item and C_Item.GetItemInfo) or GetItemInfo
local RequestLoadItemDataByID = C_Item and C_Item.RequestLoadItemDataByID

local eventFrame = CreateFrame("Frame")
local UpdateMinimapPanel

-- EllesmereUI skinning facade, handed to us at login when EllesmereUI is installed (nil otherwise)
local skin

-- The user's EllesmereUI font when skinned, otherwise the client's own font
local function GetLineFont()
    return skin and skin.GetFont() or FONT
end

local function L(key, fallback)
    return ZIF_L and ZIF_L[key] or fallback
end

-- Forces the map label to re-layout on the next frame (false differs from every map ID and from nil)
local function InvalidateHover()
    lastCursorX = nil
    lastHoveredMapID = false
end

-- Font string helpers shared by the map label, info window and minimap panel

local function CreateLineFontStrings(owner)
    for _, line in ipairs(LINES) do
        owner[line.text] = owner:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    end
end

local function ApplyLineStyles(owner)
    for _, line in ipairs(LINES) do
        local c = ZoneInfoForeverDB[line.color]
        owner[line.text]:SetFont(GetLineFont(), ZoneInfoForeverDB[line.size], "OUTLINE")
        owner[line.text]:SetTextColor(c.r, c.g, c.b)
    end
end

local function HideLines(owner)
    for _, line in ipairs(LINES) do
        owner[line.text]:Hide()
    end
end

-- Stacks the zone's info lines (owned by owner) inside a backdrop panel and sizes the panel to fit
local function LayoutPanel(panel, owner, zoneData, name)
    panel.header:SetText((zoneData.iconString or "") .. name .. (zoneData.levelString or ""))

    local currentAnchor = panel.header
    local maxWidth = panel.header:GetStringWidth()
    local totalHeight = 15 + panel.header:GetStringHeight()

    for _, line in ipairs(LINES) do
        local fs = owner[line.text]
        local s = zoneData[line.str]
        if s and s ~= "" then
            fs:SetParent(panel)
            fs:SetJustifyH("LEFT")
            fs:SetText(s)
            fs:ClearAllPoints()
            fs:SetPoint("TOPLEFT", currentAnchor, "BOTTOMLEFT", 0, -6)
            fs:Show()
            currentAnchor = fs
            totalHeight = totalHeight + 6 + fs:GetStringHeight()
            maxWidth = max(maxWidth, fs:GetStringWidth())
        else
            fs:Hide()
        end
    end

    panel:SetSize(maxWidth + 24, totalHeight + 15)
    panel:Show()
end

-- Shows the level next to the map's area label and stacks the info lines below it
local function LayoutMapLabel(label, zoneData)
    local currentAnchor = label.Name or (label.labels and label.labels[MAP_AREA_LABEL_TYPE.AREA_NAME])

    label.zifLevelText:SetParent(label)
    if zoneData.levelString and zoneData.levelString ~= "" then
        label.zifLevelText:SetText(zoneData.levelString)
        label.zifLevelText:ClearAllPoints()
        label.zifLevelText:SetPoint("LEFT", currentAnchor, "RIGHT", 4, 0)
        label.zifLevelText:Show()
    else
        label.zifLevelText:Hide()
    end

    for _, line in ipairs(LINES) do
        local fs = label[line.text]
        local s = zoneData[line.str]
        if s and s ~= "" then
            fs:SetParent(label)
            fs:SetJustifyH("CENTER")
            fs:SetText(s)
            fs:ClearAllPoints()
            fs:SetPoint("TOP", currentAnchor, "BOTTOM", 0, -4)
            fs:Show()
            currentAnchor = fs
        else
            fs:Hide()
        end
    end
end

-- EllesmereUI skins. Each one is a no-op without EllesmereUI and safe to call again on the same frame.

-- Flat EllesmereUI panel in place of the tooltip backdrop (the backdrop textures get faded out)
local function SkinInfoPanel(panel)
    if not skin or not panel then return end
    skin.Panel(panel)
    skin.Font(panel.header)
end

-- Square EllesmereUI button in place of the round minimap-style border
local function SkinMapButton(button)
    if not skin or not button then return end
    skin.Button(button, { "Icon" })
    button.Border:SetAlpha(0)
    button.Icon:ClearAllPoints()
    button.Icon:SetPoint("CENTER")
    button.Icon:SetSize(22, 22)
end

local function SkinOptionsPanel(panel)
    if not skin or not panel or not panel.zifCheckboxes then return end
    for _, cb in pairs(panel.zifCheckboxes) do
        skin.Checkbox(cb)
    end
    for _, button in ipairs(panel.zifButtons) do
        skin.Button(button)
        skin.WhiteButtonLabel(button)
    end
end

local function CreateInfoPanel(name, parent, strata)
    local panel = CreateFrame("Frame", name, parent, "BackdropTemplate")
    panel:SetBackdrop(PANEL_BACKDROP)
    panel:SetBackdropColor(0, 0, 0, 0.9)
    panel:SetBackdropBorderColor(1, 1, 1, 0.5)
    panel:SetMovable(true)
    panel:EnableMouse(false)
    panel:RegisterForDrag("LeftButton")
    panel:SetScript("OnDragStart", panel.StartMoving)
    panel:SetFrameStrata(strata)

    panel.header = panel:CreateFontString(nil, "OVERLAY", "GameFontHighlightLarge")
    panel.header:SetPoint("TOPLEFT", 12, -12)

    SkinInfoPanel(panel)
    return panel
end

local function UpdateZIF_FontStyles()
    local label = zifTargetProvider and zifTargetProvider.Label
    if label and label.zifLevelText then
        label.zifLevelText:SetFont(GetLineFont(), ZoneInfoForeverDB.fontSizeLevel, "OUTLINE")
        ApplyLineStyles(label)
    end
    if ZIF_MinimapPanel then ApplyLineStyles(ZIF_MinimapPanel) end
    InvalidateHover()
    UpdateMinimapPanel()
end

-- Minimap Panel Logic

local function GetMinimapPanel()
    if ZIF_MinimapPanel then return ZIF_MinimapPanel end

    local panel = CreateInfoPanel("ZIF_MinimapPanel", UIParent, "BACKGROUND")
    panel:SetScript("OnDragStop", function(s)
        s:StopMovingOrSizing()
        local p, _, rp, x, y = s:GetPoint()
        ZoneInfoForeverDB.minimapPanelPoint = p
        ZoneInfoForeverDB.minimapPanelRelPoint = rp
        ZoneInfoForeverDB.minimapPanelX = x
        ZoneInfoForeverDB.minimapPanelY = y
    end)

    if ZoneInfoForeverDB.minimapPanelPoint then
        panel:SetPoint(ZoneInfoForeverDB.minimapPanelPoint, UIParent, ZoneInfoForeverDB.minimapPanelRelPoint or ZoneInfoForeverDB.minimapPanelPoint, ZoneInfoForeverDB.minimapPanelX or 0, ZoneInfoForeverDB.minimapPanelY or 0)
    else
        panel:SetPoint("BOTTOMRIGHT", UIParent, "BOTTOMRIGHT", -20, 20)
    end

    CreateLineFontStrings(panel)
    ApplyLineStyles(panel)

    ZIF_MinimapPanel = panel
    return panel
end

function UpdateMinimapPanel()
    if not ZoneInfoForeverDB then return end

    local hidden = not ZoneInfoForeverDB.showMinimapPanel
        or (ZoneInfoForeverDB.hideInCombat and (InCombatLockdown() or UnitAffectingCombat("player")))
    if hidden then
        if ZIF_MinimapPanel and not ZIF_MinimapPanel.isTesting then ZIF_MinimapPanel:Hide() end
        return
    end

    local panel = GetMinimapPanel()
    if panel.isTesting then return end

    local mapID = C_Map.GetBestMapForUnit("player")
    local mapInfo = mapID and C_Map.GetMapInfo(mapID)
    local zoneData = mapInfo and mapTable[mapID]

    if zoneData then
        LayoutPanel(panel, panel, zoneData, mapInfo.name)
    else
        panel:Hide()
    end
end

-- Configuration & String Builder

local TRANSPORT_PREFIXES = {
    ["Boats:"] = "PREFIX_BOATS",
    ["Sky Boats:"] = "PREFIX_SKY_BOATS",
    ["Zeppelins:"] = "PREFIX_ZEPPELINS",
    ["Deeprun Tram:"] = "PREFIX_TRAM",
}

-- Translates "Prefix: Dest1, Dest2" segments separated by a literal \n
local function TranslateTransport(t)
    local segments = {}
    for segment in (t .. "\\n"):gmatch("(.-)\\n") do
        local prefix, dests = segment:match("^(.-:)%s*(.*)$")
        if prefix and TRANSPORT_PREFIXES[prefix] then
            local names = {}
            for rawDest in dests:gmatch("[^,]+") do
                local dest = rawDest:match("^%s*(.-)%s*$")
                names[#names + 1] = L("LOC_" .. dest, dest)
            end
            segments[#segments + 1] = L(TRANSPORT_PREFIXES[prefix], prefix) .. " " .. table.concat(names, ", ")
        else
            segments[#segments + 1] = segment
        end
    end
    return table.concat(segments, "\\n")
end

local function BuildDungeonString(dungeons)
    local names = {}
    for i, d in ipairs(dungeons) do
        local name = d.id and C_Map.GetAreaInfo(d.id)
        if name then
            if name ~= d.text then name = name .. (d.text or "") end
        else
            name = d.text or "???"
            name = L("DUNGEON_" .. name, name)
        end
        names[i] = name
    end
    return table.concat(names, "\n")
end

-- Locale-dependent strings never change during a session, so they are built once
local function BuildStaticStrings()
    local fishingPrefix = L("PREFIX_FISHING", "Fishing: ")
    for _, v in pairs(mapTable) do
        v.fishingBase = v.minFish and (fishingPrefix .. v.minFish)
        v.dungeonBase = v.dungeons and BuildDungeonString(v.dungeons)
        v.transportBase = v.transport and TranslateTransport(v.transport)
    end
end

local itemNames = {}
local pendingItems = {}

local function ItemListString(prefix, ids)
    local names = {}
    for i, id in ipairs(ids) do
        local name = itemNames[id]
        if not name then
            name = GetItemName and GetItemName(id)
            if name then
                itemNames[id] = name
            else
                pendingItems[id] = true
                if RequestLoadItemDataByID then RequestLoadItemDataByID(id) end
                name = "..."
            end
        end
        names[i] = name
    end
    return prefix .. table.concat(names, ", ")
end

local function UpdateZoneStrings()
    local db = ZoneInfoForeverDB
    if not db then return end

    local herbsPrefix = L("PREFIX_HERBS", "Herbs: ")
    local miningPrefix = L("PREFIX_MINING", "Mining: ")

    for _, v in pairs(mapTable) do
        v.iconString = db.showIcons and factionIcons[v.faction] or ""
        v.fishingString = db.showFishing and v.fishingBase or nil
        v.dungeonString = db.showDungeons and v.dungeonBase or nil
        v.transportString = db.showTransport and v.transportBase or nil
        v.herbsString = db.showHerbs and v.herbs and ItemListString(herbsPrefix, v.herbs) or nil
        v.miningString = db.showMining and v.mining and ItemListString(miningPrefix, v.mining) or nil
    end

    -- Only listen for item data while some of our item names are still missing
    if next(pendingItems) then
        eventFrame:RegisterEvent("GET_ITEM_INFO_RECEIVED")
    else
        eventFrame:UnregisterEvent("GET_ITEM_INFO_RECEIVED")
    end

    InvalidateHover()
    UpdateMinimapPanel()
end

local rebuildQueued = false
local function QueueZoneStringsRebuild()
    if rebuildQueued then return end
    rebuildQueued = true
    C_Timer.After(0.2, function()
        rebuildQueued = false
        UpdateZoneStrings()
    end)
end

local function InitializeDB()
    ZoneInfoForeverDB = ZoneInfoForeverDB or {}
    for k, v in pairs(DEFAULTS) do
        if ZoneInfoForeverDB[k] == nil then
            ZoneInfoForeverDB[k] = type(v) == "table" and {r = v.r, g = v.g, b = v.b} or v
        end
    end
end

local function OpenSettings()
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

local function CreateOptionsPanel()
    local panel = CreateFrame("Frame", "ZoneInfoForeverOptionsPanel", UIParent)
    panel.name = "Zone Info: Forever"

    local checkboxes, sliders, swatches = {}, {}, {}
    local unlocked = false

    local title = panel:CreateFontString(nil, "ARTWORK", "GameFontNormalLarge")
    title:SetPoint("TOPLEFT", 16, -16)
    title:SetText(L("OPT_TITLE", "Zone Info: Forever Settings"))

    local function CreateCheckbox(name, labelText, dbKey, yOffset, xOffset)
        local cb = CreateFrame("CheckButton", name, panel, "InterfaceOptionsCheckButtonTemplate")
        cb:SetPoint("TOPLEFT", xOffset or 16, yOffset)
        _G[cb:GetName() .. "Text"]:SetText(labelText)
        cb:SetChecked(ZoneInfoForeverDB[dbKey])
        cb:SetScript("OnClick", function(self)
            ZoneInfoForeverDB[dbKey] = self:GetChecked()
            UpdateZoneStrings()
        end)
        checkboxes[dbKey] = cb
        return cb
    end

    local function CreateSlider(name, labelText, dbKey, xOffset, yOffset, minV, maxV, step)
        local slider = CreateFrame("Slider", name, panel, "OptionsSliderTemplate")
        slider:SetPoint("TOPLEFT", xOffset, yOffset)
        slider:SetMinMaxValues(minV, maxV)
        slider:SetValueStep(step)
        slider:SetObeyStepOnDrag(true)
        slider:SetValue(ZoneInfoForeverDB[dbKey])

        -- Current value goes in the title so nothing hangs below the slider
        local title = _G[name .. "Text"]
        title:SetText(labelText .. ": " .. ZoneInfoForeverDB[dbKey])
        _G[name .. "Low"]:SetText(minV)
        _G[name .. "High"]:SetText(maxV)

        slider:SetScript("OnValueChanged", function(self, value)
            local rounded = math.floor(value + 0.5)
            ZoneInfoForeverDB[dbKey] = rounded
            title:SetText(labelText .. ": " .. rounded)
            UpdateZIF_FontStyles()
        end)
        sliders[dbKey] = slider
        return slider
    end

    -- Placed to the right of its slider so each row reads as one setting
    local function CreateColorSwatch(name, labelText, dbKey, slider)
        local button = CreateFrame("Button", name, panel)
        button:SetSize(16, 16)
        button:SetPoint("LEFT", slider, "RIGHT", 24, 0)

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

        swatches[dbKey] = button
        return button
    end

    CreateCheckbox("ZIF_CheckFishing", L("OPT_SHOW_FISHING", "Show Fishing Levels"), "showFishing", -50)
    CreateCheckbox("ZIF_CheckDungeons", L("OPT_SHOW_DUNGEONS", "Show Dungeons"), "showDungeons", -80)
    CreateCheckbox("ZIF_CheckTransport", L("OPT_SHOW_TRANSPORT", "Show Transportation Routes"), "showTransport", -110)
    CreateCheckbox("ZIF_CheckIcons", L("OPT_SHOW_ICONS", "Show Faction Icons"), "showIcons", -140)
    CreateCheckbox("ZIF_CheckWindow", L("OPT_SHOW_WINDOW", "Use Dedicated Window"), "useOwnWindow", -170)
    local cbMinimap = CreateCheckbox("ZIF_CheckMinimapPanel", L("OPT_SHOW_MINIMAP", "Show Minimap Panel"), "showMinimapPanel", -200)
    local cbHideCombat = CreateCheckbox("ZIF_CheckHideInCombat", L("OPT_HIDE_IN_COMBAT", "Hide Current Zone Panel in Combat"), "hideInCombat", -230, 36)

    local function RefreshHideCombatState()
        local label = _G[cbHideCombat:GetName() .. "Text"]
        if ZoneInfoForeverDB.showMinimapPanel then
            cbHideCombat:Enable()
            label:SetTextColor(1, 1, 1)
        else
            cbHideCombat:Disable()
            label:SetTextColor(0.5, 0.5, 0.5)
        end
    end

    cbMinimap:HookScript("OnClick", RefreshHideCombatState)
    RefreshHideCombatState()

    CreateCheckbox("ZIF_CheckHerbs", L("OPT_SHOW_HERBS", "Show Herbs"), "showHerbs", -260)
    CreateCheckbox("ZIF_CheckMining", L("OPT_SHOW_MINING", "Show Mining"), "showMining", -290)

    -- Right column: one row per text type, slider with its color swatch beside it
    local SLIDER_X, SLIDER_TOP, SLIDER_ROW = 340, -70, 50
    local function RowY(row) return SLIDER_TOP - (row - 1) * SLIDER_ROW end

    CreateSlider("ZIF_SliderLevel", "Level Font Size", "fontSizeLevel", SLIDER_X, RowY(1), 8, 24, 1)
    local sFishing = CreateSlider("ZIF_SliderFishing", "Fishing Font Size", "fontSizeFishing", SLIDER_X, RowY(2), 8, 24, 1)
    local sDungeons = CreateSlider("ZIF_SliderDungeons", "Dungeons Font Size", "fontSizeDungeons", SLIDER_X, RowY(3), 8, 24, 1)
    local sTransport = CreateSlider("ZIF_SliderTransport", "Transport Font Size", "fontSizeTransport", SLIDER_X, RowY(4), 8, 24, 1)
    local sHerbs = CreateSlider("ZIF_SliderHerbs", "Herbs Font Size", "fontSizeHerbs", SLIDER_X, RowY(5), 8, 24, 1)
    local sMining = CreateSlider("ZIF_SliderMining", "Mining Font Size", "fontSizeMining", SLIDER_X, RowY(6), 8, 24, 1)

    CreateColorSwatch("ZIF_ColorFishing", "Fishing Color", "colorFishing", sFishing)
    CreateColorSwatch("ZIF_ColorDungeons", "Dungeons Color", "colorDungeons", sDungeons)
    CreateColorSwatch("ZIF_ColorTransport", "Transport Color", "colorTransport", sTransport)
    CreateColorSwatch("ZIF_ColorHerbs", "Herbs Color", "colorHerbs", sHerbs)
    CreateColorSwatch("ZIF_ColorMining", "Mining Color", "colorMining", sMining)

    local moveBtn = CreateFrame("Button", "ZIF_MoveWindowBtn", panel, "UIPanelButtonTemplate")
    moveBtn:SetSize(150, 24)
    moveBtn:SetPoint("TOPLEFT", 16, -345)
    moveBtn:SetText("Unlock Windows")

    local function LockWindows()
        unlocked = false
        if ZIF_InfoWindow then
            ZIF_InfoWindow.isTesting = false
            ZIF_InfoWindow:EnableMouse(false)
            ZIF_InfoWindow:Hide()
        end
        if ZIF_MinimapPanel then
            ZIF_MinimapPanel.isTesting = false
            ZIF_MinimapPanel:EnableMouse(false)
        end
        moveBtn:SetText("Unlock Windows")
        InvalidateHover()
        UpdateMinimapPanel()
    end

    moveBtn:SetScript("OnClick", function()
        if unlocked then
            LockWindows()
            return
        end

        unlocked = true
        ZoneInfoForeverDB.useOwnWindow = true
        checkboxes.useOwnWindow:SetChecked(true)
        ZoneInfoForeverDB.showMinimapPanel = true
        checkboxes.showMinimapPanel:SetChecked(true)
        RefreshHideCombatState()

        if ZIF_InfoWindow then
            local label = zifTargetProvider and zifTargetProvider.Label
            if label and label.zifLevelText then
                label.zifLevelText:Hide()
                HideLines(label)
            end
            ZIF_InfoWindow.header:SetText("Drag Me (Map)!")
            ZIF_InfoWindow:SetSize(200, 80)
            ZIF_InfoWindow.isTesting = true
            ZIF_InfoWindow:EnableMouse(true)
            ZIF_InfoWindow:Show()
        end

        UpdateMinimapPanel() -- creates the panel if it was never shown before
        if ZIF_MinimapPanel then
            ZIF_MinimapPanel.isTesting = true
            ZIF_MinimapPanel:EnableMouse(true)
            ZIF_MinimapPanel.header:SetText("Drag Me (Minimap)!")
            HideLines(ZIF_MinimapPanel)
            ZIF_MinimapPanel:SetSize(200, 80)
            ZIF_MinimapPanel:Show()
        end
        moveBtn:SetText("Lock Windows")
    end)

    local resetBtn = CreateFrame("Button", "ZIF_ResetBtn", panel, "UIPanelButtonTemplate")
    resetBtn:SetSize(150, 24)
    resetBtn:SetPoint("TOPLEFT", 16, -377)
    resetBtn:SetText(L("OPT_RESET", "Reset Defaults"))
    resetBtn:SetScript("OnClick", function()
        local lastSeenWelcomeVersion = ZoneInfoForeverDB.lastSeenWelcomeVersion
        ZoneInfoForeverDB = nil
        InitializeDB()
        ZoneInfoForeverDB.lastSeenWelcomeVersion = lastSeenWelcomeVersion

        for dbKey, cb in pairs(checkboxes) do cb:SetChecked(ZoneInfoForeverDB[dbKey]) end
        RefreshHideCombatState()
        for dbKey, slider in pairs(sliders) do slider:SetValue(ZoneInfoForeverDB[dbKey]) end
        for dbKey, button in pairs(swatches) do
            local c = ZoneInfoForeverDB[dbKey]
            button.tex:SetColorTexture(c.r, c.g, c.b)
        end

        if ZIF_InfoWindow then
            ZIF_InfoWindow:ClearAllPoints()
            local parentAnchor = WorldMapFrame.ScrollContainer or WorldMapFrame
            ZIF_InfoWindow:SetPoint("BOTTOMRIGHT", parentAnchor, "BOTTOMRIGHT", -10, 60)
        end
        if ZIF_MinimapPanel then
            ZIF_MinimapPanel:ClearAllPoints()
            ZIF_MinimapPanel:SetPoint("BOTTOMRIGHT", UIParent, "BOTTOMRIGHT", -20, 20)
        end
        if ZIF_MapButton then
            ZIF_MapButton:ClearAllPoints()
            ZIF_MapButton:SetPoint("BOTTOMLEFT", WorldMapFrame, "BOTTOMLEFT", 10, 10)
        end

        LockWindows()
        UpdateZoneStrings()
        UpdateZIF_FontStyles()
    end)

    -- Kept for the EllesmereUI skin, which may arrive after the panel is built
    panel.zifCheckboxes = checkboxes
    panel.zifButtons = { moveBtn, resetBtn }
    SkinOptionsPanel(panel)

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
SlashCmdList["ZONEINFOFOREVER"] = OpenSettings

-- Update zone level colors based on current player level
local function UpdateZoneInfoColors(level)
    InvalidateHover()
    local currentLevel = level or UnitLevel("player")
    for _, v in pairs(mapTable) do
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

local function HideZoneInfo(label)
    if ZIF_InfoWindow and not ZIF_InfoWindow.isTesting then ZIF_InfoWindow:Hide() end
    if label.zifLevelText then
        label.zifLevelText:Hide()
        HideLines(label)
    end
end

-- Lays out the zone info and returns the text to use for the map's area label
local function ShowZoneInfo(label, zoneData, name)
    if ZoneInfoForeverDB.useOwnWindow then
        label.zifLevelText:Hide()
        if ZIF_InfoWindow then LayoutPanel(ZIF_InfoWindow, label, zoneData, name) end
        return name
    end

    if ZIF_InfoWindow and not ZIF_InfoWindow.isTesting then ZIF_InfoWindow:Hide() end
    LayoutMapLabel(label, zoneData)
    return (zoneData.iconString or "") .. name
end

-- Hook AreaLabelFrameMixin.OnUpdate
local function AreaLabelOnUpdate(self)
    local map = self.dataProvider:GetMap()
    if not map:IsCanvasMouseFocus() then
        if lastCursorX or lastCursorY then
            lastCursorX, lastCursorY, lastName, lastHoveredMapID = nil, nil, nil, nil
            HideZoneInfo(self)
            self:EvaluateLabels()
        end
        return
    end

    local normalizedCursorX, normalizedCursorY = map:GetNormalizedCursorPosition()
    -- Map queries allocate a new table per call, so they are throttled while the cursor moves
    local now = GetTime()
    if (lastCursorX == normalizedCursorX and lastCursorY == normalizedCursorY) or now < nextQueryTime then
        if lastName then
            self:SetLabel(MAP_AREA_LABEL_TYPE.AREA_NAME, lastName, nil)
        end
        return
    end
    lastCursorX, lastCursorY = normalizedCursorX, normalizedCursorY
    nextQueryTime = now + QUERY_INTERVAL

    local name
    local mapID = map:GetMapID()
    local positionMapInfo = C_Map_GetMapInfoAtPosition(mapID, normalizedCursorX, normalizedCursorY)
    local hoveredMapID = positionMapInfo and positionMapInfo.mapID or nil

    if hoveredMapID and hoveredMapID ~= mapID then
        if hoveredMapID ~= lastHoveredMapID then
            lastHoveredMapID = hoveredMapID
            local zoneData = mapTable[hoveredMapID]
            if zoneData then
                lastHoveredName = ShowZoneInfo(self, zoneData, positionMapInfo.name)
            else
                lastHoveredName = positionMapInfo.name
                HideZoneInfo(self)
            end
        end
        name = lastHoveredName
    else
        name = MapUtil_FindBestAreaNameAtMouse(mapID, normalizedCursorX, normalizedCursorY)
        if lastHoveredMapID ~= nil then
            lastHoveredMapID = nil
            HideZoneInfo(self)
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

local function SaveInfoWindowPosition(s)
    s:StopMovingOrSizing()
    local parentAnchor = WorldMapFrame.ScrollContainer or WorldMapFrame
    local sX, sY = s:GetCenter()
    local pX, pY = parentAnchor:GetCenter()

    if sX and pX then
        local dx, dy = sX - pX, sY - pY
        s:ClearAllPoints()
        s:SetPoint("CENTER", parentAnchor, "CENTER", dx, dy)
        ZoneInfoForeverDB.windowPosX = dx
        ZoneInfoForeverDB.windowPosY = dy
        ZoneInfoForeverDB.windowPoint = "CENTER"
    else
        local p, _, _, x, y = s:GetPoint()
        ZoneInfoForeverDB.windowPosX = x
        ZoneInfoForeverDB.windowPosY = y
        ZoneInfoForeverDB.windowPoint = p
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
            ZIF_InfoWindow = CreateInfoPanel("ZIF_InfoWindow", WorldMapFrame, "TOOLTIP")
            ZIF_InfoWindow:SetScript("OnDragStop", SaveInfoWindowPosition)

            local pt = ZoneInfoForeverDB.windowPoint or "BOTTOMRIGHT"
            local x = ZoneInfoForeverDB.windowPosX or -10
            local y = ZoneInfoForeverDB.windowPosY or 60
            local parentAnchor = WorldMapFrame.ScrollContainer or WorldMapFrame
            ZIF_InfoWindow:SetPoint(pt, parentAnchor, pt, x, y)
            ZIF_InfoWindow:Hide()
        end

        local label = zifTargetProvider.Label
        if not label.zifLevelText then
            label.zifLevelText = label:CreateFontString(nil, "OVERLAY", "GameFontNormal")
            CreateLineFontStrings(label)
            UpdateZIF_FontStyles()
        end

        -- Securely hook SetScript to detect when other addons (like Leatrix) try to overwrite the label script
        hooksecurefunc(label, "SetScript", function(self, scriptType, handler)
            if scriptType == "OnUpdate" and not self.ZIF_Rehooking then
                self.ZIF_Rehooking = true
                self:HookScript("OnUpdate", AreaLabelOnUpdate)
                self.ZIF_Rehooking = false
            end
        end)

        -- Apply initial hook
        if not label.ZIF_Rehooking then
            label.ZIF_Rehooking = true
            label:HookScript("OnUpdate", AreaLabelOnUpdate)
            label.ZIF_Rehooking = false
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

        -- ARTWORK so the EllesmereUI button fill (BACKGROUND) can't cover it
        local icon = ZIF_MapButton:CreateTexture(nil, "ARTWORK")
        icon:SetTexture("Interface\\WorldMap\\UI-World-Icon")
        icon:SetSize(20, 20)
        icon:SetPoint("TOPLEFT", 6, -6)
        ZIF_MapButton.Icon = icon

        local border = ZIF_MapButton:CreateTexture(nil, "OVERLAY")
        border:SetTexture("Interface\\Minimap\\MiniMap-TrackingBorder")
        border:SetSize(54, 54)
        border:SetPoint("TOPLEFT", 0, 0)
        ZIF_MapButton.Border = border

        ZIF_MapButton:SetHighlightTexture("Interface\\Minimap\\UI-Minimap-ZoomButton-Highlight", "ADD")
        SkinMapButton(ZIF_MapButton)

        ZIF_MapButton:SetMovable(true)
        ZIF_MapButton:RegisterForDrag("LeftButton", "RightButton")
        ZIF_MapButton:SetScript("OnDragStart", function(s)
            if IsShiftKeyDown() then s:StartMoving() end
        end)
        ZIF_MapButton:SetScript("OnDragStop", function(s)
            s:StopMovingOrSizing()
            local p, _, _, curX, curY = s:GetPoint()
            ZoneInfoForeverDB.mapBtnX = curX
            ZoneInfoForeverDB.mapBtnY = curY
            ZoneInfoForeverDB.mapBtnPoint = p
        end)

        ZIF_MapButton:SetScript("OnClick", OpenSettings)

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

local function SkinWelcomeWindow(frame)
    if not skin or not frame then return end
    skin.Panel(frame)
    skin.Font(frame.header, skin.GetAccentColor())
    skin.Font(frame.body)
    skin.Button(frame.closeBtn)
    skin.WhiteButtonLabel(frame.closeBtn)
end

local function ShowWelcomeWindow()
    if ZIF_WelcomeFrame then
        ZIF_WelcomeFrame:Show()
        return
    end

    local frame = CreateFrame("Frame", "ZIF_WelcomeWindow", UIParent, "BackdropTemplate")
    frame:SetSize(450, 380)
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

    local text = "Thank you so much for using Zone Info: Forever! I hope it makes your adventures across Azeroth a little easier.\n\n"
    text = text .. "I'm looking forward to seeing all of you when WoW: Forever goes live on |cff00ccffNovember 4th|r!\n\n"
    text = text .. "|cffffff00Quick Tips:|r\n"
    text = text .. "• Type |cff00ccff/zif|r or click the World Map button to open the Settings.\n"
    text = text .. "• Hold |cff00ccffShift|r and drag to freely move the World Map settings button.\n\n"
    text = text .. "|cffffff00Check out my other addons:|r\n"
    text = text .. "• |cff00ff00Forever Quests|r - easily highlights newly added quests.\n"
    text = text .. "• |cff00ff00Class Quests Forever|r - every class quest in one journal, with an alert when a level-up unlocks a new one.\n\n"
    text = text .. "If you have any feedback, don't be shy to comment on the CurseForge page :)"

    body:SetText(text)

    local closeBtn = CreateFrame("Button", nil, frame, "UIPanelButtonTemplate")
    closeBtn:SetSize(120, 26)
    closeBtn:SetPoint("BOTTOM", 0, 25)
    closeBtn:SetText("Awesome, thanks!")
    closeBtn:SetScript("OnClick", function()
        ZoneInfoForeverDB.lastSeenWelcomeVersion = ZIF_WELCOME_VERSION
        frame:Hide()
    end)

    frame.header, frame.body, frame.closeBtn = header, body, closeBtn
    SkinWelcomeWindow(frame)

    ZIF_WelcomeFrame = frame
end

eventFrame:RegisterEvent("ADDON_LOADED")
eventFrame:RegisterEvent("PLAYER_LOGIN")
eventFrame:RegisterEvent("PLAYER_LEVEL_UP")
eventFrame:RegisterEvent("PLAYER_ENTERING_WORLD")
eventFrame:RegisterEvent("ZONE_CHANGED_NEW_AREA")
eventFrame:RegisterEvent("PLAYER_REGEN_DISABLED")
eventFrame:RegisterEvent("PLAYER_REGEN_ENABLED")
eventFrame:SetScript("OnEvent", function(self, event, arg1, arg2)
    if event == "GET_ITEM_INFO_RECEIVED" then
        if pendingItems[arg1] then
            pendingItems[arg1] = nil
            local name = GetItemName and GetItemName(arg1)
            if name then
                itemNames[arg1] = name
            elseif arg2 == false then
                -- Don't keep re-requesting items the server says don't exist
                itemNames[arg1] = "???"
            else
                return -- no name yet; rebuilding now would just re-request it in a loop
            end
            QueueZoneStringsRebuild()
        end
    elseif event == "ADDON_LOADED" and arg1 == "ZoneInfoForever" then
        self:UnregisterEvent("ADDON_LOADED")
        InitializeDB()
        if ZIF_UpdateLocale then ZIF_UpdateLocale() end
        BuildStaticStrings()
        UpdateZoneStrings()
        CreateOptionsPanel()
        -- Loaded after login (e.g. on demand), so PLAYER_LOGIN won't fire
        if IsLoggedIn() then InitializeZoneInfoForever() end
    elseif event == "PLAYER_LOGIN" then
        InitializeZoneInfoForever()
    elseif event == "PLAYER_LEVEL_UP" then
        UpdateZoneInfoColors(arg1)
        UpdateMinimapPanel()
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

-- EllesmereUI skin support. EllesmereUI calls this once at login, only while the user has
-- third-party skinning enabled for this addon; frames created later skin themselves via `skin`.
if EllesmereUI and EllesmereUI.RegisterSkin then
    EllesmereUI.RegisterSkin("ZoneInfoForever", function(S)
        skin = S
        SkinInfoPanel(ZIF_InfoWindow)
        SkinInfoPanel(ZIF_MinimapPanel)
        SkinMapButton(ZIF_MapButton)
        SkinOptionsPanel(ZoneInfoForeverOptionsPanel)
        SkinWelcomeWindow(ZIF_WelcomeFrame)

        -- Map label and panel lines are re-fonted by hand, so follow live EllesmereUI look changes
        S.OnLooksChanged(UpdateZIF_FontStyles)
        UpdateZIF_FontStyles()
    end)
end

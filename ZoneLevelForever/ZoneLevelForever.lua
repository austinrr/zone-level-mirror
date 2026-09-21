-- Zone Level: Forever
-- Standalone addon to show zone levels on the map

local mapTable = {
    -- Eastern Kingdoms
    --[[Alterac Mountains]]		[1416] = {minLevel = 30, 	maxLevel = 40,		minFish = "130",       faction = "Contested"},
    --[[Arathi Highlands]]		[1417] = {minLevel = 30, 	maxLevel = 40,		minFish = "130",       faction = "Contested"},
    --[[Badlands]]				[1418] = {minLevel = 35, 	maxLevel = 45,                             faction = "Contested"},
    --[[Blasted Lands]]			[1419] = {minLevel = 45, 	maxLevel = 55,                             faction = "Contested"},
    --[[Burning Steppes]]		[1428] = {minLevel = 50, 	maxLevel = 58,		minFish = "330",       faction = "Contested"},
    --[[Deadwind Pass]]			[1430] = {minLevel = 55, 	maxLevel = 60,		minFish = "330",       faction = "Contested"},
    --[[Dun Morogh]]			[1426] = {minLevel = 1, 	maxLevel = 10,		minFish = "1",         faction = "Alliance"},
    --[[Duskwood]]				[1431] = {minLevel = 18, 	maxLevel = 30,		minFish = "55",        faction = "Contested"},
    --[[Eastern Plaguelands]]	[1423] = {minLevel = 53, 	maxLevel = 60,		minFish = "330",       faction = "Contested"},
    --[[Elwynn Forest]]			[1429] = {minLevel = 1, 	maxLevel = 10,		minFish = "1",         faction = "Alliance"},
    --[[Hillsbrad Foothills]]	[1424] = {minLevel = 20, 	maxLevel = 30,		minFish = "55",        faction = "Contested"},
    --[[Ironforge]]				[1455] = {minFish = 1,                                                 faction = "Alliance"},
    --[[Loch Modan]]			[1432] = {minLevel = 10,	maxLevel = 20,		minFish = "1",         faction = "Alliance"},
    --[[Redridge Mountains]]	[1433] = {minLevel = 15, 	maxLevel = 25,		minFish = "55",        faction = "Contested"},
    --[[Searing Gorge]]			[1427] = {minLevel = 43, 	maxLevel = 50,                             faction = "Contested"},
    --[[Silverpine Forest]]		[1421] = {minLevel = 10, 	maxLevel = 20,		minFish = "1",         faction = "Horde"},
    --[[Stormwind City]]		[1453] = {minFish = 1,                                                 faction = "Alliance"},
    --[[Stranglethorn Vale]]	[1434] = {minLevel = 30, 	maxLevel = 45,		minFish = "130 (205)", faction = "Contested"},
    --[[Swamp of Sorrows]]		[1435] = {minLevel = 35, 	maxLevel = 45,		minFish = "130",       faction = "Contested"},
    --[[The Hinterlands]]		[1425] = {minLevel = 40, 	maxLevel = 50,		minFish = "205",       faction = "Contested"},
    --[[Tirisfal Glades]]		[1420] = {minLevel = 1, 	maxLevel = 10,		minFish = "1",         faction = "Horde"},
    --[[Undercity]]				[1458] = {minFish = 1,                                                 faction = "Horde"},
    --[[Westfall]]				[1436] = {minLevel = 10, 	maxLevel = 20,		minFish = "1",         faction = "Alliance"},
    --[[Western Plaguelands]]	[1422] = {minLevel = 51, 	maxLevel = 58,		minFish = "205",       faction = "Contested"},
    --[[Wetlands]]				[1437] = {minLevel = 20, 	maxLevel = 30,		minFish = "55",        faction = "Contested"},

    -- Kalimdor
    --[[Ashenvale]]				[1440] = {minLevel = 18, 	maxLevel = 30,		minFish = "55",        faction = "Contested"},
    --[[Azshara]]				[1447] = {minLevel = 45, 	maxLevel = 55,		minFish = "205 (330)", faction = "Contested"},
    --[[Darkshore]]				[1439] = {minLevel = 10,	maxLevel = 20,		minFish = "1",         faction = "Alliance"},
    --[[Darnassus]]				[1457] = {minFish = 1,                                                 faction = "Alliance"},
    --[[Desolace]]				[1443] = {minLevel = 30, 	maxLevel = 40,		minFish = "130",       faction = "Contested"},
    --[[Durotar]]				[1411] = {minLevel = 1, 	maxLevel = 10,		minFish = "1",         faction = "Horde"},
    --[[Dustwallow Marsh]]		[1445] = {minLevel = 35, 	maxLevel = 45,		minFish = "130",       faction = "Contested"},
    --[[Felwood]]				[1448] = {minLevel = 48, 	maxLevel = 55,		minFish = "205",       faction = "Contested"},
    --[[Feralas]]				[1444] = {minLevel = 40, 	maxLevel = 50,		minFish = "205 (330)", faction = "Contested"},
    --[[Moonglade]]				[1450] = {minFish = 205,                                               faction = "Sanctuary"},
    --[[Mulgore]]				[1412] = {minLevel = 1, 	maxLevel = 10,		minFish = "1",         faction = "Horde"},
    --[[Orgrimmar]]				[1454] = {minFish = 1,                                                 faction = "Horde"},
    --[[Silithus]]				[1451] = {minLevel = 55, 	maxLevel = 60,		minFish = "330",       faction = "Contested"},
    --[[Stonetalon Mountains]]	[1442] = {minLevel = 15, 	maxLevel = 27,		minFish = "55",        faction = "Contested"},
    --[[Tanaris]]				[1446] = {minLevel = 40, 	maxLevel = 50,		minFish = "205",       faction = "Contested"},
    --[[Teldrassil]]			[1438] = {minLevel = 1, 	maxLevel = 10,		minFish = "1",         faction = "Alliance"},
    --[[The Barrens]]			[1413] = {minLevel = 10, 	maxLevel = 25,		minFish = "1",         faction = "Horde"},
    --[[Thousand Needles]]		[1441] = {minLevel = 25, 	maxLevel = 35,		minFish = "130",       faction = "Contested"},
    --[[Thunder Bluff]]			[1456] = {minFish = 1,                                                 faction = "Horde"},
    --[[Un'Goro Crater]]		[1449] = {minLevel = 48, 	maxLevel = 55,		minFish = "205",       faction = "Contested"},
    --[[Winterspring]]			[1452] = {minLevel = 55, 	maxLevel = 60,		minFish = "330",       faction = "Contested"},

    -- Forever
    --[[Hyjal]]					[2482] = {minLevel = 60, 	maxLevel = 60,                             faction = "Contested"},
    --[[Zephras Isle]]			[2521] = {minLevel = 1, 	maxLevel = 12,                             faction = "Contested"},
    --[[Riverglades]]			[2548] = {minLevel = 35, 	maxLevel = 45,                             faction = "Contested"},
    --[[Shen'dralas]]			[2652] = {minLevel = 35, 	maxLevel = 45,                             faction = "Contested"},
}

local factionIcons = {
    ["Alliance"]  = "|TInterface\\TargetingFrame\\UI-PVP-Alliance:24:24:6:-5|t",
    ["Horde"]     = "|TInterface\\TargetingFrame\\UI-PVP-Horde:24:24:6:-5|t",
    ["Contested"] = "|TInterface\\TargetingFrame\\UI-PVP-FFA:24:24:6:-5|t",
    ["Sanctuary"] = "",
}

-- Pre-calculate static strings for performance
for k, v in pairs(mapTable) do
    if v.faction and factionIcons[v.faction] then
        v.iconString = factionIcons[v.faction]
    else
        v.iconString = ""
    end

    if v.minFish then
        v.fishString = "Fishing: " .. v.minFish
    end
end

-- Update zone level colors based on current player level
local function UpdateZoneLevelColors()
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

-- Replace AreaLabelFrameMixin.OnUpdate
local function AreaLabelOnUpdate(self)
    self:ClearLabel(MAP_AREA_LABEL_TYPE.AREA_NAME)
    local map = self.dataProvider:GetMap()
    if map:IsCanvasMouseFocus() then
        local name, description
        local mapID = map:GetMapID()
        local normalizedCursorX, normalizedCursorY = map:GetNormalizedCursorPosition()
        local positionMapInfo = C_Map.GetMapInfoAtPosition(mapID, normalizedCursorX, normalizedCursorY)

        if positionMapInfo and positionMapInfo.mapID ~= mapID then
            name = positionMapInfo.name
            
            -- Get pre-calculated level range and icon from table
            local zoneData = mapTable[positionMapInfo.mapID]
            if zoneData then
                name = zoneData.iconString .. name .. zoneData.levelString
                description = zoneData.fishString
            end
        else
            name = MapUtil.FindBestAreaNameAtMouse(mapID, normalizedCursorX, normalizedCursorY)
        end
        if name then
            self:SetLabel(MAP_AREA_LABEL_TYPE.AREA_NAME, name, description)
        end
    end
    self:EvaluateLabels()
end

local function InitializeZoneLevelForever()
    UpdateZoneLevelColors()

    -- Get target provider
    local targetProvider
    if WorldMapFrame and WorldMapFrame.dataProviders then
        for provider in next, WorldMapFrame.dataProviders do
            if provider.Label then
                targetProvider = provider
                break
            end
        end
    end

    if targetProvider then
        targetProvider.Label:SetScript("OnUpdate", AreaLabelOnUpdate)
    end
end

-- Event handling
local frame = CreateFrame("Frame")
frame:RegisterEvent("PLAYER_LOGIN")
frame:RegisterEvent("PLAYER_LEVEL_UP")
frame:SetScript("OnEvent", function(self, event)
    if event == "PLAYER_LOGIN" then
        InitializeZoneLevelForever()
    elseif event == "PLAYER_LEVEL_UP" then
        UpdateZoneLevelColors()
    end
end)

-- Just in case it's loaded after PLAYER_LOGIN
if IsLoggedIn() then
    InitializeZoneLevelForever()
end

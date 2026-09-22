-- Zone Level: Forever
-- Standalone addon to show zone levels on the map

local mapTable = {
    -- Eastern Kingdoms
    --[[Alterac Mountains]]		[1416] = {minLevel = 30, 	maxLevel = 40,		minFish = "130",       dungeons = "City of Dalaran (28-33)", faction = "Contested"},
    --[[Arathi Highlands]]		[1417] = {minLevel = 30, 	maxLevel = 40,		minFish = "130",       faction = "Contested"},
    --[[Badlands]]				[1418] = {minLevel = 35, 	maxLevel = 45,		dungeons = "Uldaman (35-45)", faction = "Contested"},
    --[[Blasted Lands]]			[1419] = {minLevel = 45, 	maxLevel = 55,                             faction = "Contested"},
    --[[Burning Steppes]]		[1428] = {minLevel = 50, 	maxLevel = 58,		minFish = "330",       dungeons = "Blackrock Depths (52-60)\nBlackrock Spire (55-60)\nMolten Core (60)\nBlackwing Lair (60)", faction = "Contested"},
    --[[Deadwind Pass]]			[1430] = {minLevel = 55, 	maxLevel = 60,		minFish = "330",       faction = "Contested"},
    --[[Dun Morogh]]			[1426] = {minLevel = 1, 	maxLevel = 10,		minFish = "1",         dungeons = "The Hall of Thanes (13-18)\nGnomeregan (24-34)", faction = "Alliance"},
    --[[Duskwood]]				[1431] = {minLevel = 18, 	maxLevel = 30,		minFish = "55",        faction = "Contested"},
    --[[Eastern Plaguelands]]	[1423] = {minLevel = 53, 	maxLevel = 60,		minFish = "330",       dungeons = "Stratholme (55-60)\nNaxxramas (60)", faction = "Contested"},
    --[[Elwynn Forest]]			[1429] = {minLevel = 1, 	maxLevel = 10,		minFish = "1",         faction = "Alliance"},
    --[[Hillsbrad Foothills]]	[1424] = {minLevel = 20, 	maxLevel = 30,		minFish = "55",        faction = "Contested"},
    --[[Ironforge]]				[1455] = {minFish = 1,                                                 faction = "Alliance"},
    --[[Loch Modan]]			[1432] = {minLevel = 10,	maxLevel = 20,		minFish = "1",         faction = "Alliance"},
    --[[Redridge Mountains]]	[1433] = {minLevel = 15, 	maxLevel = 25,		minFish = "55",        faction = "Contested"},
    --[[Searing Gorge]]			[1427] = {minLevel = 43, 	maxLevel = 50,                             dungeons = "Blackrock Depths (52-60)\nBlackrock Spire (55-60)\nMolten Core (60)\nBlackwing Lair (60)", faction = "Contested"},
    --[[Silverpine Forest]]		[1421] = {minLevel = 10, 	maxLevel = 20,		minFish = "1",         dungeons = "Shadowfang Keep (18-28)", faction = "Horde"},
    --[[Stormwind City]]		[1453] = {minFish = 1,                                                 dungeons = "The Stockade (22-30)", faction = "Alliance"},
    --[[Stranglethorn Vale]]	[1434] = {minLevel = 30, 	maxLevel = 45,		minFish = "130 (205)", dungeons = "The Drowned City (35-40)\nZul'Gurub (60)", faction = "Contested"},
    --[[Swamp of Sorrows]]		[1435] = {minLevel = 35, 	maxLevel = 45,		minFish = "130",       dungeons = "Sunken Temple (45-55)", faction = "Contested"},
    --[[The Hinterlands]]		[1425] = {minLevel = 40, 	maxLevel = 50,		minFish = "205",       faction = "Contested"},
    --[[Tirisfal Glades]]		[1420] = {minLevel = 1, 	maxLevel = 10,		minFish = "1",         dungeons = "Ruins of Lordaeron (15-20)\nScarlet Monastery (26-45)", faction = "Horde"},
    --[[Undercity]]				[1458] = {minFish = 1,                                                 faction = "Horde"},
    --[[Westfall]]				[1436] = {minLevel = 10, 	maxLevel = 20,		minFish = "1",         dungeons = "The Deadmines (15-25)", faction = "Alliance"},
    --[[Western Plaguelands]]	[1422] = {minLevel = 51, 	maxLevel = 58,		minFish = "205",       dungeons = "Scholomance (55-60)", faction = "Contested"},
    --[[Wetlands]]				[1437] = {minLevel = 20, 	maxLevel = 30,		minFish = "55",        dungeons = "Excavation Site: Wetlands (24-29)", faction = "Contested"},

    -- Kalimdor
    --[[Ashenvale]]				[1440] = {minLevel = 18, 	maxLevel = 30,		minFish = "55",        dungeons = "Blackfathom Deeps (20-30)", faction = "Contested"},
    --[[Azshara]]				[1447] = {minLevel = 45, 	maxLevel = 55,		minFish = "205 (330)", dungeons = "Blackmaw Hold (55-60)", faction = "Contested"},
    --[[Darkshore]]				[1439] = {minLevel = 10,	maxLevel = 20,		minFish = "1",         faction = "Alliance"},
    --[[Darnassus]]				[1457] = {minFish = 1,                                                 faction = "Alliance"},
    --[[Desolace]]				[1443] = {minLevel = 30, 	maxLevel = 40,		minFish = "130",       dungeons = "Maraudon (40-50)", faction = "Contested"},
    --[[Durotar]]				[1411] = {minLevel = 1, 	maxLevel = 10,		minFish = "1",         faction = "Horde"},
    --[[Dustwallow Marsh]]		[1445] = {minLevel = 35, 	maxLevel = 45,		minFish = "130",       dungeons = "Alcaz Prison (48-53)\nOnyxia's Lair (60)", faction = "Contested"},
    --[[Felwood]]				[1448] = {minLevel = 48, 	maxLevel = 55,		minFish = "205",       faction = "Contested"},
    --[[Feralas]]				[1444] = {minLevel = 40, 	maxLevel = 50,		minFish = "205 (330)", dungeons = "Dire Maul (54-60)", faction = "Contested"},
    --[[Moonglade]]				[1450] = {minFish = 205,                                               faction = "Sanctuary"},
    --[[Mulgore]]				[1412] = {minLevel = 1, 	maxLevel = 10,		minFish = "1",         faction = "Horde"},
    --[[Orgrimmar]]				[1454] = {minFish = 1,                                                 dungeons = "Ragefire Chasm (13-18)", faction = "Horde"},
    --[[Silithus]]				[1451] = {minLevel = 55, 	maxLevel = 60,		minFish = "330",       dungeons = "Ruins of Ahn'Qiraj (60)\nTemple of Ahn'Qiraj (60)", faction = "Contested"},
    --[[Stonetalon Mountains]]	[1442] = {minLevel = 15, 	maxLevel = 27,		minFish = "55",        faction = "Contested"},
    --[[Tanaris]]				[1446] = {minLevel = 40, 	maxLevel = 50,		minFish = "205",       dungeons = "Zul'Farrak (42-52)", faction = "Contested"},
    --[[Teldrassil]]			[1438] = {minLevel = 1, 	maxLevel = 10,		minFish = "1",         faction = "Alliance"},
    --[[The Barrens]]			[1413] = {minLevel = 10, 	maxLevel = 25,		minFish = "1",         dungeons = "Wailing Caverns (15-25)\nRazorfen Kraul (25-35)\nRazorfen Downs (35-45)", faction = "Horde"},
    --[[Thousand Needles]]		[1441] = {minLevel = 25, 	maxLevel = 35,		minFish = "130",       faction = "Contested"},
    --[[Thunder Bluff]]			[1456] = {minFish = 1,                                                 faction = "Horde"},
    --[[Un'Goro Crater]]		[1449] = {minLevel = 48, 	maxLevel = 55,		minFish = "205",       dungeons = "Shaper's Terrace (58-60)", faction = "Contested"},
    --[[Winterspring]]			[1452] = {minLevel = 55, 	maxLevel = 60,		minFish = "330",       faction = "Contested"},
    
    -- Forever
    --[[Hyjal]]					[2482] = {minLevel = 60, 	maxLevel = 60,                             dungeons = "Barrow Deeps (60)\nHyjal Summit (60)", faction = "Contested"},
    --[[Zephras Isle]]			[2521] = {minLevel = 1, 	maxLevel = 12,                             faction = "Contested"},
    --[[Riverglades]]			[2548] = {minLevel = 35, 	maxLevel = 45,                             dungeons = "Krol'dok Stronghold (40-55)", faction = "Contested"},
    --[[Shen'dralas]]			[2652] = {minLevel = 35, 	maxLevel = 45,                             faction = "Contested"},
}

local factionIcons = {
    ["Alliance"]  = "|TInterface\\TargetingFrame\\UI-PVP-Alliance:24:24:6:-5|t",
    ["Horde"]     = "|TInterface\\TargetingFrame\\UI-PVP-Horde:24:24:6:-5|t",
    ["Contested"] = "|TInterface\\TargetingFrame\\UI-PVP-FFA:24:24:6:-5|t",
    ["Sanctuary"] = "",
}

-- Optimization caching
local lastCursorX, lastCursorY, lastName, lastDesc
local C_Map_GetMapInfoAtPosition = C_Map.GetMapInfoAtPosition
local MapUtil_FindBestAreaNameAtMouse = MapUtil.FindBestAreaNameAtMouse

-- Configuration & String Builder
local function UpdateZoneStrings()
    if not ZoneLevelForeverDB then return end
    
    lastCursorX = nil -- Invalidate cache when settings change
    
    for k, v in pairs(mapTable) do
        if ZoneLevelForeverDB.showIcons and v.faction and factionIcons[v.faction] then
            v.iconString = factionIcons[v.faction]
        else
            v.iconString = ""
        end

        local descLines = {}
        if ZoneLevelForeverDB.showFishing and v.minFish then
            table.insert(descLines, "Fishing: " .. v.minFish)
        end
        if ZoneLevelForeverDB.showDungeons and v.dungeons then
            table.insert(descLines, "|cffffd100" .. v.dungeons .. "|r")
        end
        
        if #descLines > 0 then
            v.descString = table.concat(descLines, "\n")
        else
            v.descString = nil
        end
    end
end

local function InitializeDB()
    if not ZoneLevelForeverDB then
        ZoneLevelForeverDB = {
            showFishing = true,
            showDungeons = true,
            showIcons = true,
        }
    else
        -- Provide defaults for newly added fields
        if ZoneLevelForeverDB.showFishing == nil then ZoneLevelForeverDB.showFishing = true end
        if ZoneLevelForeverDB.showDungeons == nil then ZoneLevelForeverDB.showDungeons = true end
        if ZoneLevelForeverDB.showIcons == nil then ZoneLevelForeverDB.showIcons = true end
    end
end

local function CreateOptionsPanel()
    local panel = CreateFrame("Frame", "ZoneLevelForeverOptionsPanel", UIParent)
    panel.name = "ZoneLevel: Forever"
    
    local title = panel:CreateFontString(nil, "ARTWORK", "GameFontNormalLarge")
    title:SetPoint("TOPLEFT", 16, -16)
    title:SetText("Zone Level: Forever Settings")

    local function CreateCheckbox(name, labelText, dbKey, yOffset)
        local cb = CreateFrame("CheckButton", name, panel, "InterfaceOptionsCheckButtonTemplate")
        cb:SetPoint("TOPLEFT", 16, yOffset)
        _G[cb:GetName() .. "Text"]:SetText(labelText)
        cb:SetChecked(ZoneLevelForeverDB[dbKey])
        cb:SetScript("OnClick", function(self)
            ZoneLevelForeverDB[dbKey] = self:GetChecked()
            UpdateZoneStrings()
        end)
        return cb
    end

    CreateCheckbox("ZLF_CheckFishing", "Show Fishing Levels", "showFishing", -50)
    CreateCheckbox("ZLF_CheckDungeons", "Show Dungeons & Raids", "showDungeons", -80)
    CreateCheckbox("ZLF_CheckIcons", "Show Faction Icons", "showIcons", -110)

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

-- Replace AreaLabelFrameMixin.OnUpdate
local function AreaLabelOnUpdate(self)
    self:ClearLabel(MAP_AREA_LABEL_TYPE.AREA_NAME)
    local map = self.dataProvider:GetMap()
    if map:IsCanvasMouseFocus() then
        local normalizedCursorX, normalizedCursorY = map:GetNormalizedCursorPosition()
        
        if lastCursorX == normalizedCursorX and lastCursorY == normalizedCursorY then
            if lastName then
                self:SetLabel(MAP_AREA_LABEL_TYPE.AREA_NAME, lastName, lastDesc)
            end
        else
            lastCursorX, lastCursorY = normalizedCursorX, normalizedCursorY
            local name, description
            local mapID = map:GetMapID()
            local positionMapInfo = C_Map_GetMapInfoAtPosition(mapID, normalizedCursorX, normalizedCursorY)

            if positionMapInfo and positionMapInfo.mapID ~= mapID then
                name = positionMapInfo.name
                
                -- Get pre-calculated level range and icon from table
                local zoneData = mapTable[positionMapInfo.mapID]
                if zoneData then
                    name = zoneData.iconString .. name .. zoneData.levelString
                    description = zoneData.descString
                end
            else
                name = MapUtil_FindBestAreaNameAtMouse(mapID, normalizedCursorX, normalizedCursorY)
            end
            
            lastName, lastDesc = name, description
            if name then
                self:SetLabel(MAP_AREA_LABEL_TYPE.AREA_NAME, name, description)
            end
        end
    else
        lastCursorX, lastCursorY, lastName, lastDesc = nil, nil, nil, nil
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
frame:RegisterEvent("ADDON_LOADED")
frame:RegisterEvent("PLAYER_LOGIN")
frame:RegisterEvent("PLAYER_LEVEL_UP")
frame:SetScript("OnEvent", function(self, event, arg1)
    if event == "ADDON_LOADED" and arg1 == "ZoneLevelForever" then
        InitializeDB()
        UpdateZoneStrings()
        CreateOptionsPanel()
    elseif event == "PLAYER_LOGIN" then
        InitializeZoneLevelForever()
    elseif event == "PLAYER_LEVEL_UP" then
        UpdateZoneLevelColors()
    end
end)

-- Just in case it's loaded after PLAYER_LOGIN
if IsLoggedIn() then
    InitializeZoneLevelForever()
end

-- Zone Level: Forever
-- Standalone addon to show zone levels on the map

local mapTable = {
    -- Eastern Kingdoms
    --[[Alterac Mountains]]		[1416] = {minLevel = 30, 	maxLevel = 40,		minFish = "130",},
    --[[Arathi Highlands]]		[1417] = {minLevel = 30, 	maxLevel = 40,		minFish = "130",},
    --[[Badlands]]				[1418] = {minLevel = 35, 	maxLevel = 45,},
    --[[Blasted Lands]]			[1419] = {minLevel = 45, 	maxLevel = 55},
    --[[Burning Steppes]]		[1428] = {minLevel = 50, 	maxLevel = 58,		minFish = "330",},
    --[[Deadwind Pass]]			[1430] = {minLevel = 55, 	maxLevel = 60,		minFish = "330",},
    --[[Dun Morogh]]			[1426] = {minLevel = 1, 	maxLevel = 10,		minFish = "1",},
    --[[Duskwood]]				[1431] = {minLevel = 18, 	maxLevel = 30,		minFish = "55",},
    --[[Eastern Plaguelands]]	[1423] = {minLevel = 53, 	maxLevel = 60,		minFish = "330",},
    --[[Elwynn Forest]]			[1429] = {minLevel = 1, 	maxLevel = 10,		minFish = "1",},
    --[[Hillsbrad Foothills]]	[1424] = {minLevel = 20, 	maxLevel = 30,		minFish = "55",},
    --[[Ironforge]]				[1455] = {minFish = 1,},
    --[[Loch Modan]]			[1432] = {minLevel = 10,	maxLevel = 20,		minFish = "1",},
    --[[Redridge Mountains]]	[1433] = {minLevel = 15, 	maxLevel = 25,		minFish = "55",},
    --[[Searing Gorge]]			[1427] = {minLevel = 43, 	maxLevel = 50},
    --[[Silverpine Forest]]		[1421] = {minLevel = 10, 	maxLevel = 20,		minFish = "1",},
    --[[Stormwind City]]		[1453] = {minFish = 1,},
    --[[Stranglethorn Vale]]	[1434] = {minLevel = 30, 	maxLevel = 45,		minFish = "130 (205)",},
    --[[Swamp of Sorrows]]		[1435] = {minLevel = 35, 	maxLevel = 45,		minFish = "130",},
    --[[The Hinterlands]]		[1425] = {minLevel = 40, 	maxLevel = 50,		minFish = "205",},
    --[[Tirisfal Glades]]		[1420] = {minLevel = 1, 	maxLevel = 10,		minFish = "1",},
    --[[Undercity]]				[1458] = {minFish = 1,},
    --[[Westfall]]				[1436] = {minLevel = 10, 	maxLevel = 20,		minFish = "1",},
    --[[Western Plaguelands]]	[1422] = {minLevel = 51, 	maxLevel = 58,		minFish = "205",},
    --[[Wetlands]]				[1437] = {minLevel = 20, 	maxLevel = 30,		minFish = "55",},

    -- Kalimdor
    --[[Ashenvale]]				[1440] = {minLevel = 18, 	maxLevel = 30,		minFish = "55",},
    --[[Azshara]]				[1447] = {minLevel = 45, 	maxLevel = 55,		minFish = "205 (330)",},
    --[[Darkshore]]				[1439] = {minLevel = 10,	maxLevel = 20,		minFish = "1",},
    --[[Darnassus]]				[1457] = {minFish = 1,},
    --[[Desolace]]				[1443] = {minLevel = 30, 	maxLevel = 40,		minFish = "130",},
    --[[Durotar]]				[1411] = {minLevel = 1, 	maxLevel = 10,		minFish = "1",},
    --[[Dustwallow Marsh]]		[1445] = {minLevel = 35, 	maxLevel = 45,		minFish = "130",},
    --[[Felwood]]				[1448] = {minLevel = 48, 	maxLevel = 55,		minFish = "205",},
    --[[Feralas]]				[1444] = {minLevel = 40, 	maxLevel = 50,		minFish = "205 (330)",},
    --[[Moonglade]]				[1450] = {minFish = 205,},
    --[[Mulgore]]				[1412] = {minLevel = 1, 	maxLevel = 10,		minFish = "1",},
    --[[Orgrimmar]]				[1454] = {minFish = 1,},
    --[[Silithus]]				[1451] = {minLevel = 55, 	maxLevel = 60,		minFish = "330",},
    --[[Stonetalon Mountains]]	[1442] = {minLevel = 15, 	maxLevel = 27,		minFish = "55",},
    --[[Tanaris]]				[1446] = {minLevel = 40, 	maxLevel = 50,		minFish = "205",},
    --[[Teldrassil]]			[1438] = {minLevel = 1, 	maxLevel = 10,		minFish = "1",},
    --[[The Barrens]]			[1413] = {minLevel = 10, 	maxLevel = 25,		minFish = "1",},
    --[[Thousand Needles]]		[1441] = {minLevel = 25, 	maxLevel = 35,		minFish = "130",},
    --[[Thunder Bluff]]			[1456] = {minFish = 1,},
    --[[Un'Goro Crater]]		[1449] = {minLevel = 48, 	maxLevel = 55,		minFish = "205",},
    --[[Winterspring]]			[1452] = {minLevel = 55, 	maxLevel = 60,		minFish = "330",},

    -- Forever
    --[[Hyjal]]					[2482] = {minLevel = 60, 	maxLevel = 60,},
    --[[Zephras Isle]]			[2521] = {minLevel = 1, 	maxLevel = 12,},
    --[[Riverglades]]			[2548] = {minLevel = 35, 	maxLevel = 45,},
    --[[Shen'dralas]]			[2652] = {minLevel = 35, 	maxLevel = 45,},
}

-- Caches the player's level to avoid recalculating colors every frame
local cachedPlayerLevel = -1

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
            
            -- Get level range from table
            local zoneData = mapTable[positionMapInfo.mapID]
            if zoneData and zoneData.minLevel and zoneData.maxLevel and zoneData.minLevel > 0 and zoneData.maxLevel > 0 then
                local currentLevel = UnitLevel("player")
                
                -- Update cached strings only if player level changes
                if currentLevel ~= cachedPlayerLevel then
                    cachedPlayerLevel = currentLevel
                    for k, v in pairs(mapTable) do
                        if v.minLevel and v.maxLevel and v.minLevel > 0 and v.maxLevel > 0 then
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
                                v.levelString = color .. " (" .. v.minLevel .. "-" .. v.maxLevel .. ")" .. (FONT_COLOR_CODE_CLOSE or "|r")
                            else
                                v.levelString = color .. " (" .. v.maxLevel .. ")" .. (FONT_COLOR_CODE_CLOSE or "|r")
                            end
                        end
                    end
                end

                name = name .. (zoneData.levelString or "")

                -- Always show fishing level if available
                if zoneData.minFish then
                    description = "Fishing: " .. zoneData.minFish
                end
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

-- Hook into player login or just execute if WorldMapFrame is already loaded
local frame = CreateFrame("Frame")
frame:RegisterEvent("PLAYER_LOGIN")
frame:SetScript("OnEvent", function(self, event)
    InitializeZoneLevelForever()
    self:UnregisterEvent("PLAYER_LOGIN")
end)

-- Just in case it's loaded after PLAYER_LOGIN
if IsLoggedIn() then
    InitializeZoneLevelForever()
end

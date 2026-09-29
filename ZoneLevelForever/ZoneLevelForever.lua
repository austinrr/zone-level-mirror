-- Zone Level: Forever
-- Standalone addon to show zone levels on the map

local mapTable = {
    -- Eastern Kingdoms
    --[[Alterac Mountains]]		[1416] = {minLevel = 30, 	maxLevel = 40,		minFish = "130",       dungeons = "City of Dalaran (28-33)", transport = "Sky Boats: Zephras Isle", faction = "Contested"},
    --[[Arathi Highlands]]		[1417] = {minLevel = 30, 	maxLevel = 40,		minFish = "130",       faction = "Contested"},
    --[[Badlands]]				[1418] = {minLevel = 35, 	maxLevel = 45,		dungeons = "Uldaman (35-45)", transport = "Boats: Steamwheedle Port", faction = "Contested"},
    --[[Blasted Lands]]			[1419] = {minLevel = 45, 	maxLevel = 55,                             faction = "Contested"},
    --[[Burning Steppes]]		[1428] = {minLevel = 50, 	maxLevel = 58,		minFish = "330",       dungeons = "Blackrock Depths (52-60)\nBlackrock Spire (55-60)\nMolten Core (60)\nBlackwing Lair (60)", faction = "Contested"},
    --[[Deadwind Pass]]			[1430] = {minLevel = 55, 	maxLevel = 60,		minFish = "330",       faction = "Contested"},
    --[[Dun Morogh]]			[1426] = {minLevel = 1, 	maxLevel = 10,		minFish = "1",         dungeons = "The Hall of Thanes (13-18)\nGnomeregan (24-34)", transport = "Deeprun Tram: Stormwind", faction = "Alliance"},
    --[[Duskwood]]				[1431] = {minLevel = 18, 	maxLevel = 30,		minFish = "55",        faction = "Contested"},
    --[[Eastern Plaguelands]]	[1423] = {minLevel = 53, 	maxLevel = 60,		minFish = "330",       dungeons = "Stratholme (55-60)\nNaxxramas (60)", faction = "Contested"},
    --[[Elwynn Forest]]			[1429] = {minLevel = 1, 	maxLevel = 10,		minFish = "1",         transport = "Deeprun Tram: Ironforge", faction = "Alliance"},
    --[[Hillsbrad Foothills]]	[1424] = {minLevel = 20, 	maxLevel = 30,		minFish = "55",        transport = "Boats: Auberdine", faction = "Contested"},
    --[[Ironforge]]				[1455] = {minFish = 1,                                                 faction = "Alliance"},
    --[[Loch Modan]]			[1432] = {minLevel = 10,	maxLevel = 20,		minFish = "1",         faction = "Alliance"},
    --[[Redridge Mountains]]	[1433] = {minLevel = 15, 	maxLevel = 25,		minFish = "55",        faction = "Contested"},
    --[[Searing Gorge]]			[1427] = {minLevel = 43, 	maxLevel = 50,                             dungeons = "Blackrock Depths (52-60)\nBlackrock Spire (55-60)\nMolten Core (60)\nBlackwing Lair (60)", faction = "Contested"},
    --[[Silverpine Forest]]		[1421] = {minLevel = 10, 	maxLevel = 20,		minFish = "1",         dungeons = "Shadowfang Keep (18-28)", faction = "Horde"},
    --[[Stormwind City]]		[1453] = {minFish = 1,                                                 dungeons = "The Stockade (22-30)", faction = "Alliance"},
    --[[Stranglethorn Vale]]	[1434] = {minLevel = 30, 	maxLevel = 45,		minFish = "130 (205)", dungeons = "The Drowned City (35-40)\nZul'Gurub (60)", transport = "Zeppelins: Orgrimmar, Undercity\nBoats: Ratchet", faction = "Contested"},
    --[[Swamp of Sorrows]]		[1435] = {minLevel = 35, 	maxLevel = 45,		minFish = "130",       dungeons = "Sunken Temple (45-55)", faction = "Contested"},
    --[[The Hinterlands]]		[1425] = {minLevel = 40, 	maxLevel = 50,		minFish = "205",       faction = "Contested"},
    --[[Tirisfal Glades]]		[1420] = {minLevel = 1, 	maxLevel = 10,		minFish = "1",         dungeons = "Ruins of Lordaeron (15-20)\nScarlet Monastery (26-45)", transport = "Zeppelins: Orgrimmar, Grom'gol", faction = "Horde"},
    --[[Undercity]]				[1458] = {minFish = 1,                                                 faction = "Horde"},
    --[[Westfall]]				[1436] = {minLevel = 10, 	maxLevel = 20,		minFish = "1",         dungeons = "The Deadmines (15-25)", faction = "Alliance"},
    --[[Western Plaguelands]]	[1422] = {minLevel = 51, 	maxLevel = 58,		minFish = "205",       dungeons = "Scholomance (55-60)", faction = "Contested"},
    --[[Wetlands]]				[1437] = {minLevel = 20, 	maxLevel = 30,		minFish = "55",        dungeons = "Excavation Site: Wetlands (24-29)", transport = "Boats: Theramore, Auberdine", faction = "Contested"},

    -- Kalimdor
    --[[Ashenvale]]				[1440] = {minLevel = 18, 	maxLevel = 30,		minFish = "55",        dungeons = "Blackfathom Deeps (20-30)", faction = "Contested"},
    --[[Azshara]]				[1447] = {minLevel = 45, 	maxLevel = 55,		minFish = "205 (330)", dungeons = "Blackmaw Hold (55-60)", faction = "Contested"},
    --[[Darkshore]]				[1439] = {minLevel = 10,	maxLevel = 20,		minFish = "1",         transport = "Boats: Menethil Harbor, Rut'theran, Southshore", faction = "Alliance"},
    --[[Darnassus]]				[1457] = {minFish = 1,                                                 faction = "Alliance"},
    --[[Desolace]]				[1443] = {minLevel = 30, 	maxLevel = 40,		minFish = "130",       dungeons = "Maraudon (40-50)", faction = "Contested"},
    --[[Durotar]]				[1411] = {minLevel = 1, 	maxLevel = 10,		minFish = "1",         transport = "Zeppelins: Undercity, Grom'gol", faction = "Horde"},
    --[[Dustwallow Marsh]]		[1445] = {minLevel = 35, 	maxLevel = 45,		minFish = "130",       dungeons = "Alcaz Prison (48-53)\nOnyxia's Lair (60)", transport = "Boats: Menethil Harbor", faction = "Contested"},
    --[[Felwood]]				[1448] = {minLevel = 48, 	maxLevel = 55,		minFish = "205",       faction = "Contested"},
    --[[Feralas]]				[1444] = {minLevel = 40, 	maxLevel = 50,		minFish = "205 (330)", dungeons = "Dire Maul (54-60)", transport = "Boats: Feathermoon, Forgotten Coast", faction = "Contested"},
    --[[Moonglade]]				[1450] = {minFish = 205,                                               faction = "Sanctuary"},
    --[[Mulgore]]				[1412] = {minLevel = 1, 	maxLevel = 10,		minFish = "1",         faction = "Horde"},
    --[[Orgrimmar]]				[1454] = {minFish = 1,                                                 dungeons = "Ragefire Chasm (13-18)", faction = "Horde"},
    --[[Silithus]]				[1451] = {minLevel = 55, 	maxLevel = 60,		minFish = "330",       dungeons = "Ruins of Ahn'Qiraj (60)\nTemple of Ahn'Qiraj (60)", faction = "Contested"},
    --[[Stonetalon Mountains]]	[1442] = {minLevel = 15, 	maxLevel = 27,		minFish = "55",        transport = "Sky Boats: Zephras Isle", faction = "Contested"},
    --[[Tanaris]]				[1446] = {minLevel = 40, 	maxLevel = 50,		minFish = "205",       dungeons = "Zul'Farrak (42-52)", transport = "Boats: Powderfuse Port", faction = "Contested"},
    --[[Teldrassil]]			[1438] = {minLevel = 1, 	maxLevel = 10,		minFish = "1",         transport = "Boats: Auberdine", faction = "Alliance"},
    --[[The Barrens]]			[1413] = {minLevel = 10, 	maxLevel = 25,		minFish = "1",         dungeons = "Wailing Caverns (15-25)\nRazorfen Kraul (25-35)\nRazorfen Downs (35-45)", transport = "Boats: Booty Bay", faction = "Horde"},
    --[[Thousand Needles]]		[1441] = {minLevel = 25, 	maxLevel = 35,		minFish = "130",       faction = "Contested"},
    --[[Thunder Bluff]]			[1456] = {minFish = 1,                                                 faction = "Horde"},
    --[[Un'Goro Crater]]		[1449] = {minLevel = 48, 	maxLevel = 55,		minFish = "205",       dungeons = "Shaper's Terrace (58-60)", faction = "Contested"},
    --[[Winterspring]]			[1452] = {minLevel = 55, 	maxLevel = 60,		minFish = "330",       faction = "Contested"},
    
    -- Forever
    --[[Hyjal]]					[2482] = {minLevel = 60, 	maxLevel = 60,                             dungeons = "Barrow Deeps (60)\nHyjal Summit (60)", faction = "Contested"},
    --[[Zephras Isle]]			[2521] = {minLevel = 1, 	maxLevel = 12,                             transport = "Sky Boats: Dalaran, Skywatcher Plateau", faction = "Contested"},
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

        local cF = ZoneLevelForeverDB.colorFishing
        zlfTargetProvider.Label.zlfFishingText:SetTextColor(cF.r, cF.g, cF.b)
        
        local cD = ZoneLevelForeverDB.colorDungeons
        zlfTargetProvider.Label.zlfDungeonText:SetTextColor(cD.r, cD.g, cD.b)
        
        local cT = ZoneLevelForeverDB.colorTransport
        zlfTargetProvider.Label.zlfTransportText:SetTextColor(cT.r, cT.g, cT.b)
    end
    lastCursorX = nil -- force map update
    UpdateMinimapPanel()
end

-- Configuration & String Builder

-- Minimap Panel Logic
local ZLF_MinimapPanel = nil

function UpdateMinimapPanel()
    if not ZoneLevelForeverDB then return end
    
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
        
        ZLF_MinimapPanel.zlfFishingText:SetJustifyH("LEFT")
        ZLF_MinimapPanel.zlfDungeonText:SetJustifyH("LEFT")
        ZLF_MinimapPanel.zlfTransportText:SetJustifyH("LEFT")
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

        local cF = ZoneLevelForeverDB.colorFishing
        ZLF_MinimapPanel.zlfFishingText:SetTextColor(cF.r, cF.g, cF.b)
        local cD = ZoneLevelForeverDB.colorDungeons
        ZLF_MinimapPanel.zlfDungeonText:SetTextColor(cD.r, cD.g, cD.b)
        local cT = ZoneLevelForeverDB.colorTransport
        ZLF_MinimapPanel.zlfTransportText:SetTextColor(cT.r, cT.g, cT.b)

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
            v.fishingString = "Fishing: " .. v.minFish
        else
            v.fishingString = nil
        end
        
        if ZoneLevelForeverDB.showDungeons and v.dungeons then
            v.dungeonString = v.dungeons
        else
            v.dungeonString = nil
        end
        
        if ZoneLevelForeverDB.showTransport and v.transport then
            v.transportString = v.transport
        else
            v.transportString = nil
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
        }
    else
        -- Provide defaults for newly added fields
        if ZoneLevelForeverDB.showFishing == nil then ZoneLevelForeverDB.showFishing = true end
        if ZoneLevelForeverDB.showDungeons == nil then ZoneLevelForeverDB.showDungeons = true end
        if ZoneLevelForeverDB.showIcons == nil then ZoneLevelForeverDB.showIcons = true end
        if ZoneLevelForeverDB.showTransport == nil then ZoneLevelForeverDB.showTransport = true end
        if ZoneLevelForeverDB.useOwnWindow == nil then ZoneLevelForeverDB.useOwnWindow = false end
        if ZoneLevelForeverDB.fontSizeLevel == nil then ZoneLevelForeverDB.fontSizeLevel = 18 end
        if ZoneLevelForeverDB.fontSizeFishing == nil then ZoneLevelForeverDB.fontSizeFishing = 18 end
        if ZoneLevelForeverDB.fontSizeDungeons == nil then ZoneLevelForeverDB.fontSizeDungeons = 18 end
        if ZoneLevelForeverDB.fontSizeTransport == nil then ZoneLevelForeverDB.fontSizeTransport = 18 end
        if ZoneLevelForeverDB.colorFishing == nil then ZoneLevelForeverDB.colorFishing = {r = 1, g = 1, b = 1} end
        if ZoneLevelForeverDB.colorDungeons == nil then ZoneLevelForeverDB.colorDungeons = {r = 1, g = 0.82, b = 0} end
        if ZoneLevelForeverDB.colorTransport == nil then ZoneLevelForeverDB.colorTransport = {r = 0, g = 0.8, b = 1} end
        if ZoneLevelForeverDB.showMinimapPanel == nil then ZoneLevelForeverDB.showMinimapPanel = false end
    end
end

local function CreateOptionsPanel()
    local panel = CreateFrame("Frame", "ZoneLevelForeverOptionsPanel", UIParent)
    panel.name = "ZoneLevel: Forever"
    
    local title = panel:CreateFontString(nil, "ARTWORK", "GameFontNormalLarge")
    title:SetPoint("TOPLEFT", 16, -16)
    title:SetText("ZoneLevel: Forever Settings")

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

    CreateCheckbox("ZLF_CheckFishing", "Show Fishing Levels", "showFishing", -50)
    CreateCheckbox("ZLF_CheckDungeons", "Show Dungeons & Raids", "showDungeons", -80)
    CreateCheckbox("ZLF_CheckTransport", "Show Transportation Routes", "showTransport", -110)
    CreateCheckbox("ZLF_CheckIcons", "Show Faction Icons", "showIcons", -140)
    CreateCheckbox("ZLF_CheckWindow", "Use Dedicated Map Info Window", "useOwnWindow", -170)
    CreateCheckbox("ZLF_CheckMinimapPanel", "Show Minimap Info Panel", "showMinimapPanel", -200)

    CreateSlider("ZLF_SliderLevel", "Level Font Size", "fontSizeLevel", 250, -60, 8, 24, 1)
    CreateSlider("ZLF_SliderFishing", "Fishing Font Size", "fontSizeFishing", 250, -100, 8, 24, 1)
    CreateSlider("ZLF_SliderDungeons", "Dungeons Font Size", "fontSizeDungeons", 250, -140, 8, 24, 1)
    CreateSlider("ZLF_SliderTransport", "Transport Font Size", "fontSizeTransport", 250, -180, 8, 24, 1)

    CreateColorSwatch("ZLF_ColorFishing", "Fishing Color", "colorFishing", 420, -100)
    CreateColorSwatch("ZLF_ColorDungeons", "Dungeons Color", "colorDungeons", 420, -140)
    CreateColorSwatch("ZLF_ColorTransport", "Transport Color", "colorTransport", 420, -180)

    local moveBtn = CreateFrame("Button", "ZLF_MoveWindowBtn", panel, "UIPanelButtonTemplate")
    moveBtn:SetSize(150, 24)
    moveBtn:SetPoint("TOPLEFT", 16, -240)
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
    resetBtn:SetPoint("TOPLEFT", 180, -240)
    resetBtn:SetText("Reset Defaults")
    resetBtn:SetScript("OnClick", function()
        ZoneLevelForeverDB = nil
        InitializeDB()
        
        _G["ZLF_CheckFishing"]:SetChecked(ZoneLevelForeverDB.showFishing)
        _G["ZLF_CheckDungeons"]:SetChecked(ZoneLevelForeverDB.showDungeons)
        _G["ZLF_CheckTransport"]:SetChecked(ZoneLevelForeverDB.showTransport)
        _G["ZLF_CheckIcons"]:SetChecked(ZoneLevelForeverDB.showIcons)
        _G["ZLF_CheckWindow"]:SetChecked(ZoneLevelForeverDB.useOwnWindow)
        _G["ZLF_CheckMinimapPanel"]:SetChecked(ZoneLevelForeverDB.showMinimapPanel)

        _G["ZLF_SliderLevel"]:SetValue(ZoneLevelForeverDB.fontSizeLevel)
        _G["ZLF_SliderFishing"]:SetValue(ZoneLevelForeverDB.fontSizeFishing)
        _G["ZLF_SliderDungeons"]:SetValue(ZoneLevelForeverDB.fontSizeDungeons)
        _G["ZLF_SliderTransport"]:SetValue(ZoneLevelForeverDB.fontSizeTransport)

        local cf = ZoneLevelForeverDB.colorFishing
        _G["ZLF_ColorFishing"].tex:SetColorTexture(cf.r, cf.g, cf.b)
        local cd = ZoneLevelForeverDB.colorDungeons
        _G["ZLF_ColorDungeons"].tex:SetColorTexture(cd.r, cd.g, cd.b)
        local ct = ZoneLevelForeverDB.colorTransport
        _G["ZLF_ColorTransport"].tex:SetColorTexture(ct.r, ct.g, ct.b)

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

                                self.zlfFishingText:SetJustifyH("LEFT")
                                self.zlfDungeonText:SetJustifyH("LEFT")
                                self.zlfTransportText:SetJustifyH("LEFT")

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
                            else
                                self.zlfTransportText:Hide()
                            end
                        end
                    else
                        if ZLF_InfoWindow and not ZLF_InfoWindow.isTesting then ZLF_InfoWindow:Hide() end
                        self.zlfLevelText:Hide()
                        self.zlfFishingText:Hide()
                        self.zlfDungeonText:Hide()
                        self.zlfTransportText:Hide()
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
                local p, rt, rp, x, y = s:GetPoint()
                ZoneLevelForeverDB.windowPosX = x
                ZoneLevelForeverDB.windowPosY = y
                ZoneLevelForeverDB.windowPoint = p
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
local frame = CreateFrame("Frame")
frame:RegisterEvent("ADDON_LOADED")
frame:RegisterEvent("PLAYER_LOGIN")
frame:RegisterEvent("PLAYER_LEVEL_UP")
frame:RegisterEvent("PLAYER_ENTERING_WORLD")
frame:RegisterEvent("ZONE_CHANGED_NEW_AREA")
frame:SetScript("OnEvent", function(self, event, arg1)
    if event == "ADDON_LOADED" and arg1 == "ZoneLevelForever" then
        InitializeDB()
        UpdateZoneStrings()
        CreateOptionsPanel()
    elseif event == "PLAYER_LOGIN" then
        InitializeZoneLevelForever()
    elseif event == "PLAYER_LEVEL_UP" then
        UpdateZoneLevelColors()
    elseif event == "PLAYER_ENTERING_WORLD" or event == "ZONE_CHANGED_NEW_AREA" then
        UpdateMinimapPanel()
    end
end)

-- Just in case it's loaded after PLAYER_LOGIN
if IsLoggedIn() then
    InitializeZoneLevelForever()
end

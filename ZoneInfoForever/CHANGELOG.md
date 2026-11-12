# Changelog

## 1.10.2

### New
- Fishing now also shows the skill at which no fish gets away in the zone, for example "Fishing: 55 (no escapes: 150)" in Hillsbrad Foothills and "Fishing: 1 (no escapes: 75)" in Loch Modan. Below that skill some fish escape; the closer you are to it, the fewer. Lures and fishing pole bonuses count, which is how the 300+ values in the hardest spots are reached.
- Zones with a harder fishing spot name it on its own line instead of the unexplained number in brackets: Jaguero Isle in Stranglethorn Vale, Jademir Lake in Feralas, and the Bay of Storms, Hetaera's Clutch and Scalebeard's Cave in Azshara. The names are in your game's language.
- Fishing levels for Forever's new zones: Mount Hyjal, Zephras Isle, Riverglades and Shen'dralas. These are estimates based on the zone level, as no data exists for them yet; if they're off for you, please let me know in the comments.

## 1.10.1

### New
- Dungeon and raid entrances on the zone maps. Hover an icon to see the dungeon's name and level range, colored for your level; Blackrock Mountain and the Gates of Ahn'Qiraj list every instance behind them, and Dire Maul and Stratholme show which wing or gate each entrance leads to. Forever's new dungeons (Alcaz Prison, Blackmaw Hold, Shaper's Terrace, Krol'dok Stronghold) are included. You can turn the icons off and change their size in the settings.
- If Leatrix Maps already shows its dungeon icons, Zone Info: Forever only adds the entrances Leatrix Maps doesn't have, so nothing shows twice. If you change that Leatrix Maps option, reload the UI (/reload) for Zone Info: Forever to follow.
- Undercity now lists the Ruins of Lordaeron, whose entrance is in the city (it's still listed under Tirisfal Glades too).
- Separate map window: when the map shows a zone, for example your own zone right after you open the map, the window now shows that zone's info. Hovering another zone on a continent map still shows the hovered zone. The info on the map itself (without the separate window) works as before.

### Improvements
- "Unlock Windows": right-click a "Drag Me" box to lock the windows again, so you can close the settings, open the map, drag the box into place and lock it right there.
- "Unlock Windows": the Current Zone panel's drag box now shows above the settings window, so it can't end up hidden behind it, and the boxes grow to fit longer translated titles.
- The drag box now says "Drag Me (Current Zone)!", and the translations call it the Current Zone panel, like the setting does, instead of the minimap panel.
- Herb and ore names are no longer rebuilt after every weapon or defense skill-up, only when your Herbalism or Mining skill changes.

## 1.10.0

### New
- Herb and ore names are colored by your Herbalism or Mining skill: red means you can't gather it yet, orange, yellow and green mean a chance of a skill-up, and grey means no more skill-ups. Without the profession the names keep their usual color. You can turn this off in the settings ("Color herbs and ores by your skill").
- Zone Info: Forever is now in the minimap's addon drawer; click it to open the settings.
- Italian translation. It's a machine translation, so corrections are welcome.

### Improvements
- Transport destinations are now shown in your game's language in every language. English now shows the full place names, for example "Theramore Isle" and "Grom'gol Base Camp".
- Long herb and ore lists wrap onto several lines instead of making the window and map labels very wide.
- The Current Zone panel now starts just above the bag bar instead of hidden under it. A panel you've already moved stays where you put it.

## 1.9.3

### Fixes
- Separate map window: its top-left corner now stays in place and the window grows to the right and down, instead of in every direction. You can park it right under the map and it stays flush there whichever zone you hover. It also stays on screen and keeps its place under the map when the map changes size. A window you placed in an earlier version is converted automatically.
- Current Zone panel: it now grows away from the nearest screen edges (for example left and down when it's under the minimap) instead of possibly in every direction, and it stays on screen. If you placed it in an earlier version, move it once to switch to the new behavior.
- "Unlock Windows" no longer turns on "Use Separate Movable Window" and "Show Current Zone Panel". It shows both boxes to drag, and "Lock Windows" hides any you have turned off.
- Herb and ore names no longer sometimes stay as "..." until you reload.

### Dungeon data
- Ironforge now lists The Hall of Thanes, whose entrance is inside the city (it's still listed under Dun Morogh too).

### Herb and ore data
- Herbs and ores that spawn in large numbers but were missing are now listed in 35 zones, checked against the Forever spawn data in GatherLite. For example, Stranglekelp along the coasts, Dark Iron in Burning Steppes and Searing Gorge, and the rare Silver, Gold and Truesilver veins.
- Zephras Isle now has herb and ore lists.
- Herbs and ores are listed in order of the skill needed to gather them.

## 1.9.2

### Fixes
- The faction icon next to the zone name on the map now stays visible.
- Zone info no longer stays on screen after you click into a zone without moving the mouse.
- With Leatrix Maps "Show zone levels" on, the level is no longer shown twice and the info lines no longer overlap its text.
- "Unlock Windows": hovering a zone no longer overwrites the "Drag Me" window.
- Zone level colors now use your new level right after you level up.
- The world map button now keeps its position after a reload and follows the map once you've moved it.
- Stranglethorn Vale transport routes now reliably show on two lines.

### Dungeon data
- Dustwallow Marsh now lists Alcaz Prison instead of Scalebeard's Cave.
- Removed the incorrect Hive'Zora and Warsong Gulch entries from Mount Hyjal.
- Updated the level ranges of 20 dungeons.
- Blackmaw Hold, Shaper's Terrace and Krol'dok Stronghold now use the game's own localized names.

### Translations
- Settings, the world map button tooltip and the combat message can now be translated, with new translations for all supported languages. These are machine translations, so corrections are welcome.

### Performance
- Hovering the world map no longer repeats the area name lookup and label updates the game already does.

### Under the hood
- Removed code for APIs this client doesn't use, replaced deprecated settings templates (checkboxes play their click sound again), and removed about 200 redundant translation lines.

## 1.9.1
- New welcome message.

## 1.9
- Added EllesmereUI skin support. With EllesmereUI installed, the map info window, the Current Zone panel, the world map button, the settings checkboxes and buttons, and the welcome window match the EllesmereUI look, and zone info text uses your EllesmereUI font. You can turn it off in EllesmereUI under Blizzard Skins+ > Window Skins > Third-Party Addons.

## 1.8.2
- Fixed text showing as squares on Russian, Korean and Chinese clients.

## 1.8.1
- New addon icon.

## 1.8

### Performance
- Herb and ore names no longer cause a full refresh every time the game loads any item (bags, tooltips, auction house). The addon now waits only for its own items, refreshes once when they arrive, and then stops listening.
- Translated zone info (fishing, dungeons, transport) is now prepared once at login instead of on every settings change.
- The Current Zone panel no longer reapplies its fonts and colors on every zone change.
- Much less memory churn while moving the mouse over the world map.

### Fixes
- Herbs and Mining lines no longer disappear from the map after you turn off "Use Dedicated Window".
- Fixed "Sky Boats" being half-translated (e.g. "Sky Schiffe:" in German) in all non-English languages.
- The faction icon next to the zone name on the map no longer vanishes as soon as you move the mouse.
- Thorium Ore is no longer listed twice in Burning Steppes, Eastern and Western Plaguelands, Azshara, Silithus, Un'Goro Crater and Winterspring.
- Hovered zone info now updates right away when you change a setting or when herb and ore names finish loading, instead of showing "..." until you hover another zone.
- The Current Zone panel now updates its level color when you level up.
- "Unlock Windows" now also hides the Herbs and Mining lines while you drag the windows.
- "Unlock Windows" now works for the Current Zone panel even if it was never shown before.
- "Reset Defaults" no longer shows the welcome window again on your next login.
- "Reset Defaults" now also resets the "Hide Current Zone Panel in Combat" checkbox.
- New installs, upgrades and "Reset Defaults" now all use the same default Herbs and Mining colors. Colors you already picked are unchanged.

### Under the hood
- Large internal cleanup: about 280 fewer lines and no more copy-pasted layout code.

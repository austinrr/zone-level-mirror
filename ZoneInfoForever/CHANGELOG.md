# Changelog

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

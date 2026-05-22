# Blackwave Reborn Trainer `v1.0.0`
> Ride the wave. Own the heist.

A feature-rich trainer mod for **PAYDAY 2**, built on the foundation of Pirate Perfection Reborn Trainer.  
Requires **SuperBLT**.

---

## Installation

Place the `Blackwave` folder inside your PAYDAY 2 mods directory:
```
.../Steam/steamapps/common/PAYDAY 2/mods/Blackwave/
```

---

## Keybinds

### Main Menu & In-Game
| Key | Action |
|-----|--------|
| F1 | Help Menu |
| F2 | Configuration Menu |
| F3 | Main Pre-Game Menu / Character Menu |
| F4 | Job Menu / Stealth Menu |
| F5 | Spoof Name Menu / Troll Menu |
| Page Up | Tools Menu |
| Page Down | Music Menu |
| Home | Normalizer Menu |
| Delete | User Self-made Script |

### In-Game Only
| Key | Action |
|-----|--------|
| F6 | Interaction Menu |
| F7 | Mission Menu |
| F8 | Inventory Menu |
| F9 | Equipment Menu |
| F10 | Weapons Menu |
| F11 | Mod Menu |
| F12 | Spawn Menu |
| Insert | Carry Stacker Control |
| End | Instant Win |
| X | X-Ray Vision |
| Z | Replenish |

---

## FAQ

**My DLC items are locked?**  
Set `DLCUnlocker = true` in `Trainer/config.lua`.

**Achievements not working?**  
Set `NoStatsSynced = false` in `config.lua`. Set Steam profile to non-public.

**Game crashes on main menu?**  
Blackwave includes a BeardLib compatibility fix. If it persists, check `mods/logs/` and open an issue.

**Nothing shows in-game?**  
Verify the folder is named exactly `Blackwave` inside `mods/`. Confirm SuperBLT is installed.

---

## Detection Notes

**Client-side flags:**
- Spawning equipment different from last spawned
- Throwing more grenades than allowed
- Wearing DLC items you don't own

**Server-side flags:**
- Same as above, plus hosting heist from unowned DLC

---

## Credits

**By Sulong** — Visual Design & QA: Daktar

Based on [Pirate Perfection Reborn Trainer](https://modworkshop.net) by Baddog-11 and the Pirate Perfection Developer Crew.

---

## Disclaimer

Use at your own risk. No responsibility for bans, corrupted files, or save data issues.  
Be respectful to other players online.

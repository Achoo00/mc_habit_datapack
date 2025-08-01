# Product Requirements Document (PRD): Productivity & Decay Minecraft Datapack

## Overview

**Productivity & Decay** is a single-player Minecraft datapack designed to gamify real-world productivity through a persistent in-game aura system. Players manually log real-life tasks, which influence six aura categories. These categories decay over time and affect gameplay through status effects, recipe restrictions, and visual/environmental changes. The system encourages consistent self-discipline and task completion.

## Goals

* Encourage real-world productivity via in-game accountability
* Track six aura categories and an overall aura level
* Introduce meaningful gameplay effects based on aura levels
* Avoid external mods while keeping performance optimized
* Provide a fully single-player compatible experience

## Core Features

### Aura Categories

* **Health**
* **Intelligence**
* **Creativity**
* **Organization**
* **Social**
* **Productivity**

Each category is tracked separately via scoreboards. Tasks correspond to a single category and contribute to its score. All categories contribute equally to the **overall aura** score.

### Task Logging

* Player receives a command book at start
* Book contains clickable options:

  * Submit Task (+Aura by category & difficulty)
  * Advance Time (+1 Day, +2 Days, etc)
  * Reset Aura (for testing)
  * Confess/Cheat (sets all aura to 0)
  * View Aura Stats (/trigger aura\_view)
* Optional: Renaming a written book to a specific name grants a new command book

### Decay System

* Aura scores decay over time:

  * Passive decay based on real Minecraft ticks
  * Player-triggered decay using time advance buttons
* Timer runs every 60 seconds to process tick-based decay (performance-safe)

### Aura Effects (Tiered)

Aura values range 0-100. Effects scale across tiers (example: 0-50 = Debuff, 51-100 = Normal/Boosted)

#### General Effects

* **Bossbar** for overall aura level
* `/trigger aura_view` shows detailed breakdown
* Status effects: Hunger, Slowness, Weakness, Regeneration, etc
* Particle overlays (ambient warnings)
* Weather control: Thunder or rain during low aura
* Recipe locking/unlocking via advancements

#### Category-Specific Effects (Examples)

| Category     | High Aura                          | Low Aura                                       |
| ------------ | ---------------------------------- | ---------------------------------------------- |
| Health       | Regeneration, full food value      | Hunger effect, food sickness, lower health cap |
| Intelligence | XP boosts, enchant unlocks         | XP loss, enchanting disabled                   |
| Creativity   | More crafting options              | Decorative recipes blocked                     |
| Organization | Backpack unlock, crafting benefits | Inventory limits, no crafting table            |
| Social       | Villagers friendly                 | Villagers ignore/hostile, trades disabled      |
| Productivity | Haste, drop boosts                 | Mining fatigue, tool use restricted            |

### Special Interactions

* Custom aura decay every 60s (safe with efficient scoreboard execution)
* Villagers become hostile or unresponsive when Social aura is low
* Recipe restriction system via advancements (unlock/lock recipes)
* Piglin bartering loot tables adjusted by aura level
* Unlock custom items/features (e.g., magnet, portable chest) based on aura

### Optional Items/Abilities

| Unlock               | Condition         | Notes                                                                                                               |
| -------------------- | ----------------- | ------------------------------------------------------------------------------------------------------------------- |
| Magnet Compass       | High Productivity | Teleports nearby items toward player using `tp` every few seconds (low lag if under 16 block range and 5s cooldown) |
| Portable Backpack    | High Organization | Shulker box-based inventory                                                                                         |
| Tameable animal help | High Social       | Wolves, cats tame faster or spawn more                                                                              |

## Performance & Compatibility

* All mechanics implemented using Minecraft datapack commands and scoreboards
* Single-player only
* No external mods required
* Resource pack optional, not currently required
* Tick-based systems run once every 60s to avoid lag

## Anti-Abuse

* Minimal anti-abuse system; relies on honesty
* Confess/Cheat button resets aura
* No task confirmation (no undo)

## Future Considerations

* Resource pack support for visuals or sound feedback
* Optional end goal (e.g., aura above 90 unlocks final structure)
* Story-driven progression
* Stats export/logging for reflection

## Testing Commands

### Core Aura Commands
```mcfunction
# Reset the entire system
/function productivity_decay:reset_system

# Set a specific aura value (format: 1OOVVV)
# Where: 1=Health, 2=Intelligence, 3=Creativity, 4=Organization, 5=Social, 6=Productivity
#        OO=01 for set, 02 for add, 03 for remove
#        VVV=Value (0-100)
/trigger pd_aura_cmd set 11080   # Set Health to 80
/trigger pd_aura_cmd set 12020   # Add 20 to Health
/trigger pd_aura_cmd set 13030   # Remove 30 from Health

# View all aura scores
/scoreboard objectives setdisplay list pd_health

# Debug current scores
/function productivity_decay:debug_scores
```

### Development Commands
```mcfunction
# Reload datapack after making changes
/reload

# Test the trigger system directly
/function productivity_decay:test_trigger_direct

# Enable trigger for testing (if needed)
/scoreboard players enable @s pd_aura_cmd
```

### Example Test Scenarios
```mcfunction
# Test bounds checking (should clamp to 100)
/trigger pd_aura_cmd set 110150

# Test negative values (should clamp to 0)
/trigger pd_aura_cmd set 130200

# Test all categories
/trigger pd_aura_cmd set 11050   # Health
/trigger pd_aura_cmd set 22050   # Intelligence
/trigger pd_aura_cmd set 33050   # Creativity
/trigger pd_aura_cmd set 44050   # Organization
/trigger pd_aura_cmd set 55050   # Social
/trigger pd_aura_cmd set 66050   # Productivity
```

---

**Status:** In Development
**Scope:** Single-player Vanilla Minecraft, 1.20+
**Owner:** David
**Next Steps:** Implement scoreboards, command book, decay logic, and tier effects.

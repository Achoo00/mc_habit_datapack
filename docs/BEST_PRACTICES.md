# 📘 Minecraft Datapack Reference: Productivity & Decay

This document is the definitive guide for developing and maintaining the *Productivity & Decay* datapack. It defines best practices, core conventions, and key architectural decisions, serving as a comprehensive reference for both new collaborators and future development efforts.

-----

## 📋 Project Overview

  * **Project Name**: Productivity & Decay Minecraft Datapack
  * **Purpose**: Gamify real-world productivity by tracking player behavior and translating it into an in-game aura system.
  * **Target Version**: Minecraft 1.20+
  * **Status**: Core command and aura systems are fully functional.

## 📁 Directory and File Structure

The project structure is organized for clarity and to separate core Minecraft functions from our custom logic.

```plaintext
data/
├── minecraft/
│   └── tags/
│       └── functions/
│           ├── load.json   # Runs once on world load, calls `productivity_decay:init`.
│           └── tick.json   # Runs every game tick, calls `productivity_decay:tick`.
└── productivity_decay/
    ├── functions/
    │   ├── core/           # Contains core logic: initialization, decay, and effects.
    │   │   ├── init.mcfunction
    │   │   ├── decay.mcfunction
    │   │   └── effects.mcfunction
    │   ├── items/          # Manages custom items and their interactions.
    │   │   ├── command_book.mcfunction
    │   │   └── special_items.mcfunction
    │   ├── mechanics/      # Houses all game mechanics logic.
    │   ├── ui/             # Functions for generating the in-game UI, like the book.
    │   └── triggers/       # Functions called via a player-triggered scoreboard.
    │       └── trigger_aura.mcfunction
    └── tags/
```

-----

## ⚙️ Core Architecture and Conventions

### **1. Scoreboard Objectives**

We use scoreboards as the primary way to store and manage all game state data. A `pd_` prefix is used for all objectives to prevent naming conflicts.

#### **Aura Categories**

These objectives track a player's progress in each aura category. Values are clamped between **0 and 100**.

  * `pd_health`
  * `pd_intelligence`
  * `pd_creativity`
  * `pd_organization`
  * `pd_social`
  * `pd_productivity`

#### **Utility Objectives**

These are used for managing core logic and player-triggered actions.

  * `pd_aura_total`: Tracks the player's total combined aura.
  * `pd_timer`: Used for timed events (e.g., decay).
  * `pd_aura_cmd`: A `trigger` objective that allows players to submit custom commands.
  * `pd_temp`, `pd_const`: Temporary objectives used in mathematical calculations.

### **2. Entity Tags**

Tags are used to mark entities for specific functions, improving performance over NBT data checks.

  * `pd_timer`: Applied to a single, persistent entity for tick-based tracking.
  * **Player Tags**:
      * `pd_aura_active`: Indicates a player is being tracked by the datapack.
      * `pd_cheated`: A flag to mark players who have used a cheat command.

### **3. Aura Tiers and Effects**

Player actions and their `pd_aura_total` score determine their tier, which in turn applies various status effects.

| Range     | Tier     | In-Game Effects                     |
| :-------- | :------- | :----------------------------------|
| 0–50      | Low      | Negative status effects, particles, and weather changes. |
| 51–100    | Normal   | The default state with no penalties. |
| 101–150   | High     | Planned buffs and positive effects. |

-----

## 🔁 Key Mechanics & Code Patterns

### **1. Initialization**

The `core/init.mcfunction` is the single source of truth for all setup. It creates all necessary scoreboards, bossbars, and sets initial values.

### **2. Time-Based Decay**

The system uses the `schedule` command for timed events to balance responsiveness and server performance. This replaces a tick-counter workaround.

  * `schedule function productivity_decay:decay 1200t replace`

### **3. Player Command System**

Player-submitted commands are handled via the `pd_aura_cmd` trigger.

  * **Command Format**: A 5-digit integer (`COVVV`), where `C` is the category, `O` is the operation, and `VVV` is the value.
  * **Resolution**: The `trigger_aura.mcfunction` parses this integer, performs the operation, and then re-enables the trigger for the player to use again.

### **4. Command Book UI**

Written books with clickable JSON components are used for a native, survival-mode-compatible UI. Book contents must be regenerated on open to reflect the current game state.

### **5. Performance Optimization**

  * **Strategy**: Minimize command chain depth and batch scoreboard operations to reduce server lag.
  * **Implementation**: Avoid running aura updates every tick; instead, use tag-based player selection for targeted, less frequent updates.

-----

## 🐛 Debugging Log & Key Learnings

This section documents critical bugs and their fixes, providing a valuable historical record for future debugging efforts.

### **Trigger System Failure**

  * **Problem**: Players received "You cannot trigger this objective yet" errors.
  * **Cause**: The system was not re-enabling `trigger` permissions after a single use.
  * **Fix**: Added `scoreboard players enable @s pd_aura_cmd` at the end of the trigger processing function.

### **Command Parsing Flaw**

  * **Problem**: Player-submitted aura values were parsed incorrectly, leading to a miscalculated value.
  * **Cause**: The parsing logic was mismatched with the command's integer format.
  * **Fix**: Rewrote the scoreboard math to correctly handle the 5-digit command integer.

### **"Unknown Function" Error**

  * **Problem**: `init.mcfunction` returned an "Unknown function" error during a complex command sequence.
  * **Cause**: Complex NBT data in a `give` command and highly nested `execute` commands caused parsing issues.
  * **Fix**:
    1.  Broke down complex functions into smaller, focused ones.
    2.  Simplified NBT data where possible.
    3.  Replaced nested `execute` commands with a series of individual commands.
  * **Key Learning**: Keep NBT data as simple as possible in `.mcfunction` files and use separate, explicit commands over complex nested `execute` chains.

-----

## Recent Improvements

### Simplified JSON Structure
- **Problem**: Complex NBT in give commands caused parsing issues
- **Solution**: 
  - Simplified JSON structure
  - Broke down complex commands
  - Improved error handling
- **Result**: More reliable book generation

### Navigation System
- **Problem**: Page tracking was complex
- **Solution**:
  - Implemented scoreboard-based page tracking
  - Added consistent back button behavior
  - Improved error messages
- **Result**: Smoother user experience

### Code Organization
- **Problem**: Functions were becoming too large
- **Solution**:
  - Split into smaller, focused functions
  - Better file organization
  - Clear naming conventions
- **Result**: Easier maintenance and debugging

## ✅ Best Practices Summary

This consolidated list of best practices should be followed for all future development.

1.  **Naming Conventions**: Use the `pd_` prefix for all functions, scoreboards, and tags to ensure consistency and avoid conflicts.
2.  **Performance**:
      * Use tags for player selection over broad selectors (`@a`).
      * Batch scoreboard operations and avoid running them every single tick.
      * Minimize the depth of command chains.
3.  **Maintainability**:
      * Document all complex command chains and functions.
      * Group related functions in logical subdirectories (e.g., `core/`, `items/`).
      * Maintain consistent formatting and use a single `init.mcfunction` as the source of truth for setup.
4.  **Reliability**:
      * Use `trigger` objectives for all player input.
      * Treat dynamic UI elements (like books) as read-only snapshots and regenerate them on access.
      * Test each function independently before incorporating it into a larger command chain.
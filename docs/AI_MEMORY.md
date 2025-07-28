# AI Memory: Productivity & Decay Datapack

## Aura Command System Debugging Log (Session 2)

This log details the series of bugs encountered and fixed while developing the core aura command system. The system is now fully functional.

### 1. Initial Trigger Failure
*   **Problem**: Players would receive a "You cannot trigger this objective yet" error when trying to use `/trigger pd_aura_cmd`.
*   **Root Cause**: The `pd_aura_cmd` trigger objective was not being created or enabled correctly during initialization.
*   **Fix**: Consolidated all scoreboard creation (`pd_health`, `pd_creativity`, etc.), temporary objectives (`pd_temp`, `pd_const`), and the trigger objective (`pd_aura_cmd`) into a single, robust `init.mcfunction`. This function is now the single source of truth for setup.

### 2. Tick Function Not Running
*   **Problem**: Trigger commands were not being processed even when the objective existed.
*   **Root Cause**: The `data/minecraft/tags/functions/tick.json` file was pointing to the wrong function, so the game never ran the `productivity_decay:tick` function that checks for active triggers.
*   **Fix**: Corrected the path in `tick.json` to `"productivity_decay:tick"`.

### 3. Flawed Command Parsing Logic
*   **Problem**: When a trigger was used, the aura value would be set to `100` instead of the intended value (e.g., `80`).
*   **Root Cause**: The parsing logic in `trigger_aura.mcfunction` was written for a 6-digit command format, but we were using a 5-digit format (`COVVV`). This caused the math to be incorrect, resulting in a miscalculated value that was then clamped to 100.
*   **Fix**: Rewrote the scoreboard math in `trigger_aura.mcfunction` to correctly parse a 5-digit integer, isolating the category, operation, and value.

### 4. Broken Command Handlers
*   **Problem**: Even with correct parsing, the `_cmd_set`, `_cmd_add`, and `_cmd_remove` functions were not updating player scores.
*   **Root Cause**: These files contained legacy, broken logic with invalid placeholders (`%s`) and unsupported dynamic commands.
*   **Fix**: Completely rewrote all three command handlers (`_cmd_set.mcfunction`, `_cmd_add.mcfunction`, `_cmd_remove.mcfunction`) from scratch. The new, robust logic now correctly performs the operation (set, add, or remove), clamps the result between 0 and 100, and applies the final value to the correct player scoreboard.

### 5. Single-Use Trigger Lockout
*   **Problem**: After successfully using a trigger command once, players were locked out and received the "You cannot trigger this objective yet" error on subsequent attempts.
*   **Root Cause**: Minecraft automatically revokes a player's permission to use a trigger after one use as a safety measure. The system was not re-enabling it.
*   **Fix**: Added `scoreboard players enable @s pd_aura_cmd` to the end of `trigger_aura.mcfunction`. This immediately re-grants permission to the player, allowing for back-to-back command usage.

**Outcome**: The aura command system is now fully debugged, stable, and complete.

## Project Overview
- **Project Name**: Productivity & Decay Minecraft Datapack
- **Purpose**: Gamify real-world productivity through an in-game aura system
- **Target Version**: Minecraft 1.20+
- **Development Start**: July 2025

## Project Structure
```
mc_habit_datapack/
├── data/
│   ├── minecraft/
│   │   └── tags/
│   │       └── functions/
│   │           └── tick.json
│   └── productivity_decay/
│       ├── functions/
│       │   ├── core/
│       │   ├── items/
│       │   ├── mechanics/
│       │   └── ui/
│       └── tags/
└── docs/
    ├── PRD.md
    ├── TASKS.md
    ├── SUBTASKS.md
    └── AI_MEMORY.md  (this file)
```

## Key Design Decisions

### 1. Aura System Architecture
- **Decision**: Use scoreboard objectives for each aura category
- **Rationale**: Native Minecraft functionality that's performant and reliable
- **Implementation**:
  - One scoreboard objective per category (Health, Intelligence, Creativity, Organization, Social, Productivity)
  - Range: 0-100 for each category
  - Overall aura calculated as average of all categories

### 2. Performance Optimization
- **Decision**: Implement 60-second tick-based updates
- **Rationale**: Balance between responsiveness and server performance
- **Implementation**:
  - Use `schedule` command for 60-second intervals
  - Batch operations where possible
  - Minimize command chain depth

### 3. Task Logging System
- **Decision**: Use written books with clickable components
- **Rationale**: Native UI that works in survival mode
- **Implementation**:
  - JSON text components for clickable actions
  - Persistent storage using scoreboard values

## Completed Tasks

### Task T-00: Project Setup
- Created initial project structure
- Set up documentation framework
- Established version control

## Code References

### Core Functions
- `core/init.mcfunction`: Initializes all scoreboards and player data
- `core/decay.mcfunction`: Handles aura decay logic
- `core/effects.mcfunction`: Manages status effects based on aura levels

### Item Systems
- `items/command_book.mcfunction`: Manages the command book interface
- `items/special_items.mcfunction`: Handles custom items like Magnet Compass

## Debugging Notes

### Issue: Unknown Function Error in Initialization
- **Problem**: Commands like `/function productivity_decay:init` returned "Unknown function" error
- **Symptoms**:
  - Functions worked when called directly but not through other functions
  - Some functions in the same directory were accessible while others weren't
- **Root Cause**: 
  - Complex NBT data in the `give` command was causing parsing issues
  - Nested execute commands with curly braces had compatibility issues
- **Solution**:
  1. Broke down the main function into smaller, focused functions
  2. Replaced complex NBT with simpler, more compatible format
  3. Split combined execute commands into individual commands
  4. Added debug messages to isolate the issue
- **Key Learnings**:
  - Keep NBT data as simple as possible in .mcfunction files
  - Use separate commands instead of complex nested executes when possible
  - Add debug messages to track function execution flow
  - Test each function independently before chaining them

### Issue: Scoreboard Not Updating
- **Problem**: Scoreboard was visible but showed no values
- **Solution**: 
  - Replaced `execute as @a run { ... }` with individual `execute as @a run` commands
  - Added debug messages to confirm score setting
- **Learnings**:
  - Some Minecraft versions have issues with command blocks in .mcfunction files
  - Explicit commands are more reliable than command blocks

### Issue: Performance Lag with Aura Updates
- **Problem**: Frequent scoreboard updates caused server lag
- **Solution**: Implemented batched updates and reduced check frequency
- **Learnings**:
  - Avoid running scoreboard operations every tick
  - Use tag-based player selection for targeted updates

### Issue: Command Book Desynchronization
- **Problem**: Book contents didn't reflect current aura states
- **Solution**: Implemented book regeneration on open
- **Learnings**:
  - Books should be treated as read-only snapshots
  - Always regenerate dynamic content when accessed

## Best Practices
1. **Naming Conventions**:
   - Functions: `namespace:path/to/function`
   - Scoreboards: `pd_` prefix for all objectives
   - Tags: `pd_` prefix with category (e.g., `pd_items_magnet`)

2. **Performance**:
   - Minimize command chain depth
   - Use tag-based player selection
   - Batch operations where possible

3. **Maintainability**:
   - Document complex command chains
   - Use consistent formatting
   - Group related functions in subdirectories

## External References
- [Minecraft Wiki: Datapacks](https://minecraft.fandom.com/wiki/Data_pack)
- [MCStacker](https://mcstacker.net/) - For command generation
- [Minecraft Commands Wiki](https://minecraft.fandom.com/wiki/Commands)

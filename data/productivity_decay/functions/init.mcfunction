# Main initialization function for Productivity & Decay
tellraw @a [{"text":"[Aura System]","color":"gold"},{"text":" --- Full System Initialization --- ","color":"yellow"}]

# --- Step 1: Scoreboard Setup ---
tellraw @a [{"text":"[Aura System]","color":"gold"},{"text":" Setting up scoreboards...","color":"gray"}]
scoreboard objectives add pd_health dummy "Health"
scoreboard objectives add pd_intelligence dummy "Intelligence"
scoreboard objectives add pd_creativity dummy "Creativity"
scoreboard objectives add pd_organization dummy "Organization"
scoreboard objectives add pd_social dummy "Social"
scoreboard objectives add pd_productivity dummy "Productivity"

# --- Step 2: Command & Constant Setup ---
tellraw @a [{"text":"[Aura System]","color":"gold"},{"text":" Setting up command system...","color":"gray"}]
scoreboard objectives add pd_temp dummy "Temporary Variables"
scoreboard objectives add pd_const dummy "Constants"
scoreboard objectives add pd_aura_cmd trigger "Aura Command System"

# Set constant values for command parsing
scoreboard players set #const100000 pd_const 100000
scoreboard players set #const10000 pd_const 10000
scoreboard players set #const10 pd_const 10
scoreboard players set #const1000 pd_const 1000
scoreboard players set #const100 pd_const 100
scoreboard players set #const0 pd_const 0

# Enable the trigger for all players
scoreboard players enable @a pd_aura_cmd

# --- Step 3: Default Values & Items ---
tellraw @a [{"text":"[Aura System]","color":"gold"},{"text":" Setting default values and giving items...","color":"gray"}]
function productivity_decay:core/set_default_values
function productivity_decay:core/give_book

# --- Step 4: Schedule Decay ---
tellraw @a [{"text":"[Aura System]","color":"gold"},{"text":" Scheduling passive decay...","color":"gray"}]
schedule function productivity_decay:core/decay 60s replace

# --- Step 5: Finalize ---
scoreboard objectives setdisplay sidebar pd_health
function productivity_decay:core/update_display
tellraw @a [{"text":"[Aura System]","color":"gold"},{"text":" --- Initialization Complete --- ","color":"green"}]

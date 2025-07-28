# Test the trigger system directly

tellraw @a ["",{"text":"[","color":"gray"},{"text":"Aura System","color":"gold"},{"text":"] ","color":"gray"},{"text":"Testing direct trigger...","color":"yellow"}]

# Enable the trigger for the player
scoreboard players enable @s pd_aura_cmd

# Set a test value (1 = Health, 2 = Intelligence, etc.)
scoreboard players set @s pd_aura_cmd 3

# Manually call the trigger function
function productivity_decay:trigger_aura

# Show debug info
function productivity_decay:debug_scores

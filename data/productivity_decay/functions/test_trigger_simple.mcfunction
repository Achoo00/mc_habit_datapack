# Simple test for the trigger system

# Enable the trigger for the player
scoreboard players enable @s pd_aura_cmd

# Set a test value to the trigger
scoreboard players set @s pd_aura_cmd 1

# Call the trigger function directly
function productivity_decay:trigger_aura

# Show debug info
function productivity_decay:debug_scores

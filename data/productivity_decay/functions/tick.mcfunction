# Run every tick to check for trigger updates

# Check if any player has triggered the aura command
execute as @a[scores={pd_aura_cmd=1..}] run function productivity_decay:trigger_aura

# Update the scoreboard display for all players
function productivity_decay:core/update_display

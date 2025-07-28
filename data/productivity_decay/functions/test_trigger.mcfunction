# Test the trigger system

# Enable the trigger for the player
function productivity_decay:enable_trigger

# Set up a test value (Health to 50)
scoreboard players set @s pd_aura_cmd 11050
function productivity_decay:trigger_aura

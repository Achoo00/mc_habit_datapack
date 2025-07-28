# Safely reset and reinitialize the entire system.
tellraw @a [{"text":"[Aura System]","color":"gold"},{"text":" --- System Resetting --- ","color":"red"}]

# Remove all objectives one by one. This is safer than a separate function.
scoreboard objectives remove pd_health
scoreboard objectives remove pd_intelligence
scoreboard objectives remove pd_creativity
scoreboard objectives remove pd_organization
scoreboard objectives remove pd_social
scoreboard objectives remove pd_productivity
scoreboard objectives remove pd_temp
scoreboard objectives remove pd_const
scoreboard objectives remove pd_aura_cmd

# Re-run the full initialization function to set everything up again.
tellraw @a [{"text":"[Aura System]","color":"gold"},{"text":" Rerunning initialization...","color":"yellow"}]
function productivity_decay:init

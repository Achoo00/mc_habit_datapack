# Aura Manipulation Commands
# Usage: /trigger pd_<category> set|add|remove <value>

# Check if the player has a valid aura category in their trigger
execute if score #aura_category pd_temp matches 1 run function productivity_decay:core/cmd_health

execute if score #aura_category pd_temp matches 2 run function productivity_decay:core/cmd_intelligence

execute if score #aura_category pd_temp matches 3 run function productivity_decay:core/cmd_creativity

execute if score #aura_category pd_temp matches 4 run function productivity_decay:core/cmd_organization

execute if score #aura_category pd_temp matches 5 run function productivity_decay:core/cmd_social

execute if score #aura_category pd_temp matches 6 run function productivity_decay:core/cmd_productivity

# Clear the temp score
scoreboard players set #aura_category pd_temp 0

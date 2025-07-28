# Social Aura Commands
# Usage: /trigger pd_social set|add|remove <value>

# Set up command context
data modify storage productivity_decay:cmd set value {category:"pd_social",value:0,min:0,max:100}

# Check command type and execute appropriate action
execute if score #command_type pd_temp matches 1 run function productivity_decay:core/_cmd_set with storage productivity_decay:cmd {category:"pd_social"}
execute if score #command_type pd_temp matches 2 run function productivity_decay:core/_cmd_add with storage productivity_decay:cmd {category:"pd_social"}
execute if score #command_type pd_temp matches 3 run function productivity_decay:core/_cmd_remove with storage productivity_decay:cmd {category:"pd_social"}

# Show current value
execute store result score @s pd_temp run scoreboard players get @s pd_social
tellraw @s ["",{"text":"[","color":"gray"},{"text":"Social Aura","color":"green"},{"text":"] ","color":"gray"},{"score":{"name":"@s","objective":"pd_temp"},"color":"yellow"},"/100"]

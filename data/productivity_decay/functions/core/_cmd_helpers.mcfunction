# Command helper functions - Not meant to be called directly

# Handle set command
function productivity_decay:core/_cmd_set with storage productivity_decay:cmd {category:"", value:0}

# Handle add command
function productivity_decay:core/_cmd_add with storage productivity_decay:cmd {category:"", value:0}

# Handle remove command
function productivity_decay:core/_cmd_remove with storage productivity_decay:cmd {category:"", value:0}

# Show current value
execute store result score #value_out pd_temp run data get storage productivity_decay:cmd value 1
scoreboard players operation @s pd_temp = #value_out pd_temp
execute store result score #min pd_temp run data get storage productivity_decay:cmd min 1
execute store result score #max pd_temp run data get storage productivity_decay:cmd max 1

tellraw @s ["",{"text":"[","color":"gray"},{"text":"Aura System","color":"gold"},{"text":"] ","color":"gray"},{"score":{"name":"@s","objective":"pd_temp"},"color":"yellow"},"/100"]

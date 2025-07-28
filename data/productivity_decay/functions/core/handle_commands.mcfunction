# Handle aura commands
# Format: /trigger pd_aura_cmd set <category> <operation> <value>
# Where:
# - category: 1=Health, 2=Intelligence, 3=Creativity, 4=Organization, 5=Social, 6=Productivity
# - operation: 1=set, 2=add, 3=remove
# - value: The value to use (1-100)

data modify storage productivity_decay:cmd set value {category:1, operation:1, value:0}

execute store result storage productivity_decay:cmd category int 1 run scoreboard players get @s pd_aura_cmd

# Clear the trigger
scoreboard players set @s pd_aura_cmd 0

# Extract operation (tens digit)
scoreboard players operation #temp1 pd_temp = @s pd_aura_cmd
scoreboard players set #temp2 pd_temp 10
scoreboard players operation #temp1 pd_temp /= #temp2 pd_temp
scoreboard players operation #temp1 pd_temp %= #temp2 pd_temp
execute store result storage productivity_decay:cmd operation int 1 run scoreboard players get #temp1 pd_temp

# Extract value (remaining digits)
scoreboard players operation #value pd_temp = @s pd_aura_cmd
scoreboard players operation #value pd_temp %= #temp2 pd_temp
execute store result storage productivity_decay:cmd value int 1 run scoreboard players get #value pd_temp

# Route to the appropriate command handler
execute if data storage productivity_decay:cmd{operation:1} run function productivity_decay:core/_cmd_set
execute if data storage productivity_decay:cmd{operation:2} run function productivity_decay:core/_cmd_add
execute if data storage productivity_decay:cmd{operation:3} run function productivity_decay:core/_cmd_remove

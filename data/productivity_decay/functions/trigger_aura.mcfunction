# Handle the /trigger pd_aura_cmd command
# Format: /trigger pd_aura_cmd set <value>
# Where value is a number with:
# - First digit: Category (1-6)
# - Second digit: Operation (1=set, 2=add, 3=remove)
# - Remaining digits: Value

# Parse the 5-digit command into temporary scores
# Format: COVVV -> C=Category, O=Operation, VVV=Value
scoreboard players operation #category pd_temp = @s pd_aura_cmd
scoreboard players operation #operation pd_temp = @s pd_aura_cmd
scoreboard players operation #value pd_temp = @s pd_aura_cmd

# Isolate Category (1st digit)
scoreboard players operation #category pd_temp /= #const10000 pd_const

# Isolate Operation (2nd digit)
scoreboard players operation #operation pd_temp %= #const10000 pd_const
scoreboard players operation #operation pd_temp /= #const1000 pd_const

# Isolate Value (last 3 digits)
scoreboard players operation #value pd_temp %= #const1000 pd_const

# Store the parsed values in data storage for the helper functions to use
execute store result storage productivity_decay:cmd category int 1 run scoreboard players get #category pd_temp
execute store result storage productivity_decay:cmd operation int 1 run scoreboard players get #operation pd_temp
execute store result storage productivity_decay:cmd param_value int 1 run scoreboard players get #value pd_temp

# Reset the trigger so it can be used again
scoreboard players set @s pd_aura_cmd 0

# Route to the appropriate command handler based on the operation
execute if score #operation pd_temp matches 1 run function productivity_decay:core/_cmd_set
execute if score #operation pd_temp matches 2 run function productivity_decay:core/_cmd_add
execute if score #operation pd_temp matches 3 run function productivity_decay:core/_cmd_remove

# Re-enable the trigger for the player so they can use it again immediately
scoreboard players enable @s pd_aura_cmd

# Update the scoreboard display
function productivity_decay:core/update_display

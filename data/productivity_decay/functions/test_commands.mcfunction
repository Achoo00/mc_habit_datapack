# Test function for aura commands
tellraw @a ["",{"text":"[","color":"gray"},{"text":"Aura System","color":"gold"},{"text":"] ","color":"gray"},{"text":"Testing aura commands...","color":"yellow"}]

# Test setting health to 75
scoreboard players set @p pd_health 75
function productivity_decay:core/aura_commands with entity @p

# Test adding 10 to intelligence
scoreboard players set @p pd_intelligence 10
function productivity_decay:core/aura_commands with entity @p

# Test removing 5 from creativity
scoreboard players set @p pd_creativity -5
function productivity_decay:core/aura_commands with entity @p

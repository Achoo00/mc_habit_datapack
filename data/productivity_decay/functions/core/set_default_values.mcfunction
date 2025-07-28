# Part 2: Set default aura values for all players

tellraw @a ["",{"text":"[","color":"gray"},{"text":"Aura System","color":"gold"},{"text":"] ","color":"gray"},{"text":"Setting default aura values...","color":"yellow"}]

# Set default values for each aura individually for maximum compatibility
execute as @a run scoreboard players set @s pd_health 50
execute as @a run scoreboard players set @s pd_intelligence 50
execute as @a run scoreboard players set @s pd_creativity 50
execute as @a run scoreboard players set @s pd_organization 50
execute as @a run scoreboard players set @s pd_social 50
execute as @a run scoreboard players set @s pd_productivity 50

# Add initialization tag
execute as @a run tag @s add pd_initialized

# Debugging: Check the health score for the player and tell them
execute as @a run tellraw @s ["",{"text":"Your health score is now: ","color":"yellow"},{"score":{"name":"@s","objective":"pd_health"}}]

tellraw @a ["",{"text":"[","color":"gray"},{"text":"Aura System","color":"gold"},{"text":"] ","color":"gray"},{"text":"Default values set!","color":"green"}]

# Test function to set up and verify the scoreboard

# Set up the scoreboard
tellraw @a ["",{"text":"[","color":"gray"},{"text":"Aura System","color":"gold"},{"text":"] ","color":"gray"},{"text":"Setting up test scores...","color":"yellow"}]

# Set test values
scoreboard players set @s pd_health 50
scoreboard players set @s pd_intelligence 60
scoreboard players set @s pd_creativity 70
scoreboard players set @s pd_organization 80
scoreboard players set @s pd_social 90
scoreboard players set @s pd_productivity 100

# Enable the trigger
scoreboard players enable @s pd_aura_cmd

# Show debug info
function productivity_decay:debug_scores

tellraw @s ["",{"text":"[","color":"gray"},{"text":"Aura System","color":"gold"},{"text":"] ","color":"gray"},{"text":"Test setup complete! Try ","color":"green"},{"text":"/trigger pd_aura_cmd set 11075","color":"white"},{"text":" to set Health to 75","color":"green"}]

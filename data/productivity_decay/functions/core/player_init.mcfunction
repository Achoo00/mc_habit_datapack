# Initialize aura values for a player
# This is called when a player first joins or needs reset

# Set default values if not set
execute unless score @s pd_health matches 1.. run scoreboard players set @s pd_health 50
execute unless score @s pd_intelligence matches 1.. run scoreboard players set @s pd_intelligence 50
execute unless score @s pd_creativity matches 1.. run scoreboard players set @s pd_creativity 50
execute unless score @s pd_organization matches 1.. run scoreboard players set @s pd_organization 50
execute unless score @s pd_social matches 1.. run scoreboard players set @s pd_social 50
execute unless score @s pd_productivity matches 1.. run scoreboard players set @s pd_productivity 50

# Give the player the aura guide book if they don't have it
execute unless entity @s[nbt={Inventory:[{id:"minecraft:written_book",tag:{title:"Aura Guide"}}]}] run give @s written_book{pages:['{"text":"Productivity & Decay\n\nClick to open the menu"}'],title:"Aura Guide",author:"System"}

# Mark player as initialized
tag @s add pd_initialized

# Log initialization
tellraw @s ["",{"text":"[","color":"gray"},{"text":"Productivity & Decay","color":"gold"},{"text":"] ","color":"gray"},{"text":"Aura system initialized!","color":"green"}]
tellraw @s ["",{"text":"[","color":"gray"},{"text":"Productivity & Decay","color":"gold"},{"text":"] ","color":"gray"},{"text":"Type '/function productivity_decay:setup' if you need to reset the system","color":"yellow"}]

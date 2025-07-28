# Debug function to show current aura scores
tellraw @s ["",{"text":"[","color":"gray"},{"text":"Debug","color":"red"},{"text":"] ","color":"gray"},{"text":"Current Aura Scores:","color":"yellow"}]

execute store result score #value pd_temp run scoreboard players get @s pd_health
tellraw @s ["",{"text":"- Health: ","color":"gray"},{"score":{"name":"#value","objective":"pd_temp"},"color":"red"}]

execute store result score #value pd_temp run scoreboard players get @s pd_intelligence
tellraw @s ["",{"text":"- Intelligence: ","color":"gray"},{"score":{"name":"#value","objective":"pd_temp"},"color":"aqua"}]

execute store result score #value pd_temp run scoreboard players get @s pd_creativity
tellraw @s ["",{"text":"- Creativity: ","color":"gray"},{"score":{"name":"#value","objective":"pd_temp"},"color":"light_purple"}]

execute store result score #value pd_temp run scoreboard players get @s pd_organization
tellraw @s ["",{"text":"- Organization: ","color":"gray"},{"score":{"name":"#value","objective":"pd_temp"},"color":"white"}]

execute store result score #value pd_temp run scoreboard players get @s pd_social
tellraw @s ["",{"text":"- Social: ","color":"gray"},{"score":{"name":"#value","objective":"pd_temp"},"color":"green"}]

execute store result score #value pd_temp run scoreboard players get @s pd_productivity
tellraw @s ["",{"text":"- Productivity: ","color":"gray"},{"score":{"name":"#value","objective":"pd_temp"},"color":"yellow"}]

# Show the current trigger value
execute store result score #value pd_temp run scoreboard players get @s pd_aura_cmd
tellraw @s ["",{"text":"[","color":"gray"},{"text":"Debug","color":"red"},{"text":"] ","color":"gray"},{"text":"Trigger value: ","color":"yellow"},{"score":{"name":"#value","objective":"pd_temp"},"color":"white"}]

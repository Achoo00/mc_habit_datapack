# Set command handler
# Assumes storage contains: {category: <num>, param_value: <num>}

# --- 1. Data Retrieval & Clamping ---
# Get the value from storage and clamp it between 0 and 100
execute store result score #value pd_temp run data get storage productivity_decay:cmd param_value 1
execute if score #value pd_temp < #const0 pd_const run scoreboard players set #value pd_temp 0
execute if score #value pd_temp > #const100 pd_const run scoreboard players set #value pd_temp 100

# --- 2. Category Routing ---
# Get the category from storage
execute store result score #category pd_temp run data get storage productivity_decay:cmd category 1

# Route to the correct scoreboard based on category
execute if score #category pd_temp matches 1 run scoreboard players operation @s pd_health = #value pd_temp
execute if score #category pd_temp matches 2 run scoreboard players operation @s pd_intelligence = #value pd_temp
execute if score #category pd_temp matches 3 run scoreboard players operation @s pd_creativity = #value pd_temp
execute if score #category pd_temp matches 4 run scoreboard players operation @s pd_organization = #value pd_temp
execute if score #category pd_temp matches 5 run scoreboard players operation @s pd_social = #value pd_temp
execute if score #category pd_temp matches 6 run scoreboard players operation @s pd_productivity = #value pd_temp

# --- 3. Feedback ---
# Get the name of the category we just modified for the feedback message
function productivity_decay:core/_get_category_name

# Show feedback message to the player
tellraw @s [{"text":"[Aura System]","color":"gold"},{"text":" Set ","color":"yellow"},{"storage":"productivity_decay:cmd","nbt":"category_name","color":"green"},{"text":" to ","color":"yellow"},{"score":{"name":"#value","objective":"pd_temp"},"color":"white"}]

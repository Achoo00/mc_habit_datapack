# Remove command handler
# Assumes storage contains: {category: <num>, param_value: <num>}

# --- 1. Data Retrieval ---
# Get the category and the value-to-remove from storage
execute store result score #category pd_temp run data get storage productivity_decay:cmd category 1
execute store result score #value_to_remove pd_temp run data get storage productivity_decay:cmd param_value 1

# --- 2. Get Current Score ---
# Store the player's current score for the correct category into #current_score
execute if score #category pd_temp matches 1 run scoreboard players operation #current_score pd_temp = @s pd_health
execute if score #category pd_temp matches 2 run scoreboard players operation #current_score pd_temp = @s pd_intelligence
execute if score #category pd_temp matches 3 run scoreboard players operation #current_score pd_temp = @s pd_creativity
execute if score #category pd_temp matches 4 run scoreboard players operation #current_score pd_temp = @s pd_organization
execute if score #category pd_temp matches 5 run scoreboard players operation #current_score pd_temp = @s pd_social
execute if score #category pd_temp matches 6 run scoreboard players operation #current_score pd_temp = @s pd_productivity

# --- 3. Calculation & Clamping ---
# Subtract the value and store it in #new_score
scoreboard players operation #new_score pd_temp = #current_score pd_temp
scoreboard players operation #new_score pd_temp -= #value_to_remove pd_temp

# Clamp the new score between 0 and 100
execute if score #new_score pd_temp < #const0 pd_const run scoreboard players set #new_score pd_temp 0
execute if score #new_score pd_temp > #const100 pd_const run scoreboard players set #new_score pd_temp 100

# --- 4. Apply New Score ---
# Set the player's actual aura score to the new clamped value
execute if score #category pd_temp matches 1 run scoreboard players operation @s pd_health = #new_score pd_temp
execute if score #category pd_temp matches 2 run scoreboard players operation @s pd_intelligence = #new_score pd_temp
execute if score #category pd_temp matches 3 run scoreboard players operation @s pd_creativity = #new_score pd_temp
execute if score #category pd_temp matches 4 run scoreboard players operation @s pd_organization = #new_score pd_temp
execute if score #category pd_temp matches 5 run scoreboard players operation @s pd_social = #new_score pd_temp
execute if score #category pd_temp matches 6 run scoreboard players operation @s pd_productivity = #new_score pd_temp

# --- 5. Feedback ---
# Get the name of the category we just modified for the feedback message
function productivity_decay:core/_get_category_name

# Show feedback message to the player
tellraw @s [{"text":"[Aura System]","color":"gold"},{"text":" Removed ","color":"yellow"},{"score":{"name":"#value_to_remove","objective":"pd_temp"},"color":"white"},{"text":" from ","color":"yellow"},{"storage":"productivity_decay:cmd","nbt":"category_name","color":"green"},{"text":". New total: ","color":"yellow"},{"score":{"name":"#new_score","objective":"pd_temp"},"color":"white"}]

# Simple test function
tellraw @a ["",{"text":"[","color":"gray"},{"text":"Test","color":"gold"},{"text":"] ","color":"gray"},{"text":"Test function is working!","color":"green"}]

# Create a test scoreboard
scoreboard objectives add test_health dummy
scoreboard players set @a test_health 100

# Display the score
execute as @a run tellraw @s ["",{"text":"[","color":"gray"},{"text":"Test","color":"gold"},{"text":"] ","color":"gray"},{"text":"Your test health is: "},{"score":{"name":"@s","objective":"test_health"}}]

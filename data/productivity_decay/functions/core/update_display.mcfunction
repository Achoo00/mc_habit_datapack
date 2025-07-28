# Update the scoreboard display with current aura values

# Health
execute store result score #value pd_temp run scoreboard players get @s pd_health
execute store result entity @s Scores[{Name:"pd_health"}] int 1 run scoreboard players get #value pd_temp

# Intelligence
execute store result score #value pd_temp run scoreboard players get @s pd_intelligence
execute store result entity @s Scores[{Name:"pd_intelligence"}] int 1 run scoreboard players get #value pd_temp

# Creativity
execute store result score #value pd_temp run scoreboard players get @s pd_creativity
execute store result entity @s Scores[{Name:"pd_creativity"}] int 1 run scoreboard players get #value pd_temp

# Organization
execute store result score #value pd_temp run scoreboard players get @s pd_organization
execute store result entity @s Scores[{Name:"pd_organization"}] int 1 run scoreboard players get #value pd_temp

# Social
execute store result score #value pd_temp run scoreboard players get @s pd_social
execute store result entity @s Scores[{Name:"pd_social"}] int 1 run scoreboard players get #value pd_temp

# Productivity
execute store result score #value pd_temp run scoreboard players get @s pd_productivity
execute store result entity @s Scores[{Name:"pd_productivity"}] int 1 run scoreboard players get #value pd_temp

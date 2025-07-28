# Apply decay to all aura categories
# This is called when the decay counter reaches the threshold

# Reset the decay counter
scoreboard players set #decay_counter pd_decay 0

# Apply decay to each aura category (1 point per hour)
execute as @a[scores={pd_health=1..}] run scoreboard players remove @s pd_health 1
execute as @a[scores={pd_intelligence=1..}] run scoreboard players remove @s pd_intelligence 1
execute as @a[scores={pd_creativity=1..}] run scoreboard players remove @s pd_creativity 1
execute as @a[scores={pd_organization=1..}] run scoreboard players remove @s pd_organization 1
execute as @a[scores={pd_social=1..}] run scoreboard players remove @s pd_social 1
execute as @a[scores={pd_productivity=1..}] run scoreboard players remove @s pd_productivity 1

# Ensure no auras go below 0
execute as @a[scores={pd_health=..0}] run scoreboard players set @s pd_health 0
execute as @a[scores={pd_intelligence=..0}] run scoreboard players set @s pd_intelligence 0
execute as @a[scores={pd_creativity=..0}] run scoreboard players set @s pd_creativity 0
execute as @a[scores={pd_organization=..0}] run scoreboard players set @s pd_organization 0
execute as @a[scores={pd_social=..0}] run scoreboard players set @s pd_social 0
execute as @a[scores={pd_productivity=..0}] run scoreboard players set @s pd_productivity 0

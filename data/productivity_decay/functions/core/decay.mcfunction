# Apply passive decay to all aura categories
# This runs every minute

tellraw @a[tag=!notified_aura_low] ["",{"text":"[","color":"gray"},{"text":"Aura System","color":"gold"},{"text":"] ","color":"gray"},{"text":"Auras are decaying...","color":"yellow"}]

# Decrease each aura by 1 point (1 point per minute)
execute as @a[scores={pd_health=1..}] run scoreboard players remove @s pd_health 1
execute as @a[scores={pd_intelligence=1..}] run scoreboard players remove @s pd_intelligence 1
execute as @a[scores={pd_creativity=1..}] run scoreboard players remove @s pd_creativity 1
execute as @a[scores={pd_organization=1..}] run scoreboard players remove @s pd_organization 1
execute as @a[scores={pd_social=1..}] run scoreboard players remove @s pd_social 1
execute as @a[scores={pd_productivity=1..}] run scoreboard players remove @s pd_productivity 1

# Show low aura warnings
execute as @a[scores={pd_health=..20},tag=!notified_health_low] run {
    tellraw @s ["",{"text":"[","color":"gray"},{"text":"Aura System","color":"gold"},{"text":"] ","color":"gray"},{"text":"WARNING: Health Aura is low! ","color":"red"},{"score":{"name":"@s","objective":"pd_health"},"color":"red"},"/100"]
    tag @s add notified_health_low
}

execute as @a[scores={pd_health=21..},tag=notified_health_low] run tag @s remove notified_health_low

# Schedule the next decay check
schedule function productivity_decay:core/decay 60s replace

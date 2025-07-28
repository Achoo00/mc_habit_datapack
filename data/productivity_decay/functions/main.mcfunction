# Main entry point for the Productivity & Decay datapack
# Run this with: /function productivity_decay:main

tellraw @a ["",{"text":"[","color":"gray"},{"text":"Aura System","color":"gold"},{"text":"] ","color":"gray"},{"text":"Starting initialization...","color":"yellow"}]

# Remove all existing auras
scoreboard objectives remove pd_health
scoreboard objectives remove pd_intelligence
scoreboard objectives remove pd_creativity
scoreboard objectives remove pd_organization
scoreboard objectives remove pd_social
scoreboard objectives remove pd_productivity

# Create new objectives
scoreboard objectives add pd_health dummy
scoreboard objectives add pd_intelligence dummy
scoreboard objectives add pd_creativity dummy
scoreboard objectives add pd_organization dummy
scoreboard objectives add pd_social dummy
scoreboard objectives add pd_productivity dummy

# Set default values (50/100)
execute as @a run {
    scoreboard players set @s pd_health 50
    scoreboard players set @s pd_intelligence 50
    scoreboard players set @s pd_creativity 50
    scoreboard players set @s pd_organization 50
    scoreboard players set @s pd_social 50
    scoreboard players set @s pd_productivity 50
    
    # Give the player the book
    give @s written_book 1 0 {pages:['"{\"text\":\"Productivity & Decay\\n\\nWelcome to your Aura Guide!\\n\\nComplete real tasks to maintain your auras.\\nLow auras affect your gameplay!"}'],title:"Aura Guide",author:"System"}
}

# Set up display
scoreboard objectives setdisplay sidebar pd_health

# Schedule decay
schedule function productivity_decay:core/decay 60s replace

tellraw @a ["",{"text":"[","color":"gray"},{"text":"Aura System","color":"gold"},{"text":"] ","color":"gray"},{"text":"Auras initialized! Check your inventory.","color":"green"}]

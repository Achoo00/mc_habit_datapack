# Initialize all aura systems

# Remove existing scoreboards to avoid conflicts
scoreboard objectives remove pd_health
scoreboard objectives remove pd_intelligence
scoreboard objectives remove pd_creativity
scoreboard objectives remove pd_organization
scoreboard objectives remove pd_social
scoreboard objectives remove pd_productivity

# Create scoreboard objectives
scoreboard objectives add pd_health dummy
scoreboard objectives add pd_intelligence dummy
scoreboard objectives add pd_creativity dummy
scoreboard objectives add pd_organization dummy
scoreboard objectives add pd_social dummy
scoreboard objectives add pd_productivity dummy

# Set default values (50/100 for all auras)
execute as @a run {
    scoreboard players set @s pd_health 50
    scoreboard players set @s pd_intelligence 50
    scoreboard players set @s pd_creativity 50
    scoreboard players set @s pd_organization 50
    scoreboard players set @s pd_social 50
    scoreboard players set @s pd_productivity 50
    
    # Give the player an aura guide book
    give @s written_book{
        pages:[
            '{"text":"Productivity & Decay\n\nWelcome to the Aura System!\n\nYour auras affect gameplay.\nComplete tasks to maintain them!"}'
        ],
        title:"Aura Guide",
        author:"System"
    }
    
    tag @s add pd_initialized
}

# Set up the display
scoreboard objectives setdisplay sidebar pd_health

# Schedule the decay function (runs every minute)
schedule function productivity_decay:core/decay 60s replace

# Success message
tellraw @a ["",{"text":"[","color":"gray"},{"text":"Aura System","color":"gold"},{"text":"] ","color":"gray"},{"text":"All auras have been initialized!","color":"green"}]
tellraw @a ["",{"text":"[","color":"gray"},{"text":"Aura System","color":"gold"},{"text":"] ","color":"gray"},{"text":"Check your inventory for the Aura Guide!","color":"yellow"}]

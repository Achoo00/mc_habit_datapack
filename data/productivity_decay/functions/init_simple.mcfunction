# Simplified initialization function

# Part 1: Initial message
tellraw @a ["",{"text":"[","color":"gray"},{"text":"Aura System","color":"gold"},{"text":"] ","color":"gray"},{"text":"Starting simple initialization...","color":"yellow"}]

# Part 2: Create scoreboards
scoreboard objectives add pd_health dummy
scoreboard objectives add pd_intelligence dummy

# Part 3: Set default values
execute as @a run {
    scoreboard players set @s pd_health 50
    scoreboard players set @s pd_intelligence 50
    
    # Try to give a simple book
    give @s written_book 1 0 {pages:['"Simple Book"'],title:"Test Book",author:"System"}
    
    tellraw @s ["",{"text":"[","color":"gray"},{"text":"Aura System","color":"gold"},{"text":"] ","color":"gray"},{"text":"Book should be in your inventory!","color":"green"}]
}

# Part 4: Set up display
scoreboard objectives setdisplay sidebar pd_health

# Part 5: Final message
tellraw @a ["",{"text":"[","color":"gray"},{"text":"Aura System","color":"gold"},{"text":"] ","color":"gray"},{"text":"Simple initialization complete!","color":"green"}]

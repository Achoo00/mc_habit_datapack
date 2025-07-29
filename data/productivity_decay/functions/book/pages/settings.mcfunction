# Settings page for the command book
tellraw @s ["",{"text":"[","color":"gray"},{"text":"Productivity & Decay","color":"gold"},{"text":"] ","color":"gray"},{"text":"Settings will be available soon!","color":"yellow"}]

# Give the player a simple book with a message
give @s written_book{pages:['{"text":"Settings\\n\\nSettings will be available in a future update!","color":"black"}'],title:"Settings",author:"Productivity System"} 1
# Called when clicking the Settings button

tellraw @s ["",{"text":"[","color":"gray"},{"text":"Productivity & Decay","color":"gold"},{"text":"] ","color":"gray"},{"text":"Opening Settings...","color":"yellow"}]

# Store current page in scoreboard to handle back button
scoreboard players set @s pd_page 3


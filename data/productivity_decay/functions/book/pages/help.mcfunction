# Help page for the command book
tellraw @s ["",{"text":"[","color":"gray"},{"text":"Productivity & Decay","color":"gold"},{"text":"] ","color":"gray"},{"text":"Here's how to use the command book:","color":"yellow"}]

# Give the player a simple book with help information
give @s written_book{pages:['{"text":"Help & Info\\n\\nWelcome to the Productivity & Decay system!\\n\\nUse this book to track your auras and log activities.","color":"black"}','{"text":"View Auras\\n\\nCheck your current aura levels and see how they affect your gameplay.","color":"black"}','{"text":"Log Task\\n\\nLog completed tasks and activities to maintain your auras.","color":"black"}','{"text":"Settings\\n\\nConfigure your preferences and system behavior.","color":"black"}'],title:"Help & Info",author:"Productivity System"} 1
# Called when clicking the Help button

tellraw @s ["",{"text":"[","color":"gray"},{"text":"Productivity & Decay","color":"gold"},{"text":"] ","color":"gray"},{"text":"Opening Help...","color":"yellow"}]

# Store current page in scoreboard to handle back button
scoreboard players set @s pd_page 4

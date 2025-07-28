# Part 3: Give the player the Aura Guide book

tellraw @a ["",{"text":"[","color":"gray"},{"text":"Aura System","color":"gold"},{"text":"] ","color":"gray"},{"text":"Giving you the Aura Guide...","color":"yellow"}]

# Give the book using the simplified, working NBT format
give @a written_book{pages:['{"text":"Productivity & Decay\\n\\nWelcome to your Aura Guide!\\n\\nComplete real-world tasks to maintain your auras. Low auras will affect your gameplay!"}'],title:"Aura Guide",author:"The System"} 1

tellraw @a ["",{"text":"[","color":"gray"},{"text":"Aura System","color":"gold"},{"text":"] ","color":"gray"},{"text":"Check your inventory for the guide!","color":"green"}]

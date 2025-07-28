# Simple setup function that calls the core initialization
# Run this with: /function productivity_decay:setup

tellraw @a ["",{"text":"[","color":"gray"},{"text":"Productivity & Decay","color":"gold"},{"text":"] ","color":"gray"},{"text":"Starting setup...","color":"yellow"}]

# Call the core init function
function productivity_decay:core/init

# Give the player a book
give @p written_book{pages:['{"text":"Productivity & Decay\n\nWelcome to the Productivity & Decay system!\n\nYour auras will affect your gameplay.\nComplete real-world tasks to maintain them!"}'],title:"Aura Guide",author:"System"} 1

tellraw @a ["",{"text":"[","color":"gray"},{"text":"Productivity & Decay","color":"gold"},{"text":"] ","color":"gray"},{"text":"Setup complete! Check your inventory for the Aura Guide.","color":"green"}]

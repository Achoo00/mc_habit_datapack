# Simple book giving function with minimal JSON
# Called via: function productivity_decay:book/simple_give

tellraw @s ["",{"text":"[","color":"gray"},{"text":"Productivity & Decay","color":"gold"},{"text":"] ","color":"gray"},{"text":"Giving you the Command Book...","color":"yellow"}]

# Clear any existing books
clear @s written_book

# Give a basic book with a single page
give @s written_book{pages:['{"text":"Command Book\\n\\nWelcome to Productivity & Decay!"}'],title:"Command Book",author:"Productivity System"} 1

tellraw @s ["",{"text":"[","color":"gray"},{"text":"Productivity & Decay","color":"gold"},{"text":"] ","color":"gray"},{"text":"Check your inventory for the Command Book!","color":"green"}]

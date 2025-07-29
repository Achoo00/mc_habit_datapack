# Minimal book test
# Run with: /function productivity_decay:test/minimal_book

tellraw @s ["",{"text":"[","color":"gray"},{"text":"Test","color":"gold"},{"text":"] ","color":"gray"},{"text":"Giving minimal book...","color":"yellow"}]

# Clear any existing books
clear @s written_book

# Give a basic book with no NBT
give @s written_book 1

tellraw @s ["",{"text":"[","color":"gray"},{"text":"Test","color":"gold"},{"text":"] ","color":"gray"},{"text":"Check your inventory for the book!","color":"green"}]

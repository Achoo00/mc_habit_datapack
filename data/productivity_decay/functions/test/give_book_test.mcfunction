# Test function to give the command book
# Run with: /function productivity_decay:test/give_book_test

tellraw @a ["",{"text":"[","color":"gray"},{"text":"Test","color":"gold"},{"text":"] ","color":"gray"},{"text":"Giving test book...","color":"yellow"}]

# Give a basic book with minimal JSON
give @s written_book{pages:['{"text":"Test Book"}'],title:"Test Book",author:"Test"} 1

tellraw @s ["",{"text":"[","color":"gray"},{"text":"Test","color":"gold"},{"text":"] ","color":"gray"},{"text":"Check your inventory for the test book!","color":"green"}]

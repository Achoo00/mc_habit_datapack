# Test book function
tellraw @a ["",{"text":"[","color":"gray"},{"text":"Test","color":"gold"},{"text":"] ","color":"gray"},{"text":"Trying to give book...","color":"yellow"}]

give @s written_book{pages:['"Test Page"'],title:"Test Book",author:"System"}

tellraw @a ["",{"text":"[","color":"gray"},{"text":"Test","color":"gold"},{"text":"] ","color":"gray"},{"text":"Book should be in your inventory!","color":"green"}]

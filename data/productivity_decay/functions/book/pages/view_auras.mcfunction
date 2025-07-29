# View Auras page for the command book
# Called when clicking the View Auras button

tellraw @s ["",{"text":"[","color":"gray"},{"text":"Productivity & Decay","color":"gold"},{"text":"] ","color":"gray"},{"text":"Opening Aura Viewer...","color":"yellow"}]

# Store current page in scoreboard to handle back button
scoreboard players set @s pd_page 1

# Get current aura values and store them in storage
execute store result storage productivity_decay:temp health int 1 run scoreboard players get @s pd_health_aura
execute store result storage productivity_decay:temp strength int 1 run scoreboard players get @s pd_strength_aura
execute store result storage productivity_decay:temp focus int 1 run scoreboard players get @s pd_focus_aura
execute store result storage productivity_decay:temp creativity int 1 run scoreboard players get @s pd_creativity_aura
execute store result storage productivity_decay:temp social int 1 run scoreboard players get @s pd_social_aura
execute store result storage productivity_decay:temp discipline int 1 run scoreboard players get @s pd_discipline_aura

# Give the player a new book with aura information
give @s written_book{pages:['{"text":"Your Auras\\n\\nHere are your current aura levels:","color":"black"}','{"text":"Physical Auras\\n\\n[Health] ","color":"black","extra":[{"score":{"name":"@s","objective":"pd_health_aura"},"color":"red"},{"text":"%\\n[Strength] ","color":"black"},{"score":{"name":"@s","objective":"pd_strength_aura"},"color":"dark_red"},{"text":"%\\n\\n","color":"black"}]}','{"text":"Mental Auras\\n\\n[Focus] ","color":"black","extra":[{"score":{"name":"@s","objective":"pd_focus_aura"},"color":"dark_blue"},{"text":"%\\n[Creativity] ","color":"black"},{"score":{"name":"@s","objective":"pd_creativity_aura"},"color":"dark_purple"},{"text":"%\\n\\n","color":"black"}]}','{"text":"Social Auras\\n\\n[Social] ","color":"black","extra":[{"score":{"name":"@s","objective":"pd_social_aura"},"color":"gold"},{"text":"%\\n[Discipline] ","color":"black"},{"score":{"name":"@s","objective":"pd_discipline_aura"},"color":"dark_green"},{"text":"%\\n\\n[Back]","color":"dark_gray","bold":true,"clickEvent":{"action":"run_command","value":"/function productivity_decay:book/give_book"},"hoverEvent":{"action":"show_text","value":"Return to main menu"}}]}'],title:"Your Auras",author:"Productivity System"} 1
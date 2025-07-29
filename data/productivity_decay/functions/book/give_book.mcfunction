# Function to give the command book to a player
# Called via: function productivity_decay:book/give_book

tellraw @s ["",{"text":"[","color":"gray"},{"text":"Productivity & Decay","color":"gold"},{"text":"] ","color":"gray"},{"text":"Giving you the Command Book...","color":"yellow"}]

# Clear any existing books
clear @s written_book

# Give a book with all navigation pages
give @s written_book{pages:['{"text":"Command Book\\n\\nWelcome to Productivity & Decay!\\n\\nClick a button below:","color":"black"}',     '{"text":"View Auras\\n\\nCheck your current aura levels.\\n\\n","color":"black","extra":[{"text":"[View Auras]","color":"dark_blue","bold":true,"clickEvent":{"action":"run_command","value":"/function productivity_decay:book/pages/view_auras"},"hoverEvent":{"action":"show_text","value":"View your current aura levels"}}]}','{"text":"Log Task\\n\\nLog completed tasks and activities.\\n\\n","color":"black","extra":[{"text":"[Log Task]","color":"dark_green","bold":true,"clickEvent":{"action":"run_command","value":"/function productivity_decay:book/pages/log_task"},"hoverEvent":{"action":"show_text","value":"Log a completed task"}}]}','{"text":"Settings & Help\\n\\nConfigure your settings or get help.\\n\\n","color":"black","extra":[{"text":"[Settings]","color":"dark_purple","bold":true,"clickEvent":{"action":"run_command","value":"/function productivity_decay:book/pages/settings"},"hoverEvent":{"action":"show_text","value":"Configure your settings"}},"\\n\\n",{"text":"[Help]","color":"gold","bold":true,"clickEvent":{"action":"run_command","value":"/function productivity_decay:book/pages/help"},"hoverEvent":{"action":"show_text","value":"Get help with the command book"}}]}'],title:"Command Book",author:"Productivity System"} 1

tellraw @s ["",{"text":"[","color":"gray"},{"text":"Productivity & Decay","color":"gold"},{"text":"] ","color":"gray"},{"text":"Check your inventory for the Command Book!","color":"green"}]
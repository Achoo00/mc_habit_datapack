# Set up scoreboard objectives for commands
scoreboard objectives add pd_temp dummy "Temporary Variables"
scoreboard objectives add pd_aura_cmd trigger "Aura Command System"

# Enable the trigger for all players
scoreboard players enable @a pd_aura_cmd

# Set up the trigger to run our function
scoreboard objectives add pd_trigger dummy
scoreboard players set #aura_trigger pd_trigger 1

tellraw @a ["",{"text":"[","color":"gray"},{"text":"Aura System","color":"gold"},{"text":"] ","color":"gray"},{"text":"Aura command system initialized!","color":"green"}]

tellraw @a ["",{"text":"[","color":"gray"},{"text":"Aura System","color":"gold"},{"text":"] ","color":"gray"},{"text":"Use ","color":"yellow"},{"text":"/trigger pd_aura_cmd set <value>","color":"white"},{"text":" to modify auras","color":"yellow"}]
tellraw @a ["",{"text":"[","color":"gray"},{"text":"Aura System","color":"gold"},{"text":"] ","color":"gray"},{"text":"Format: ","color":"yellow"},{"text":"<category><operation><value>","color":"white"}]
tellraw @a ["",{"text":"[","color":"gray"},{"text":"Aura System","color":"gold"},{"text":"] ","color":"gray"},{"text":"Categories: ","color":"yellow"},{"text":"1=Health 2=Int 3=Creative 4=Org 5=Social 6=Productivity","color":"white"}]
tellraw @a ["",{"text":"[","color":"gray"},{"text":"Aura System","color":"gold"},{"text":"] ","color":"gray"},{"text":"Operations: ","color":"yellow"},{"text":"1=Set 2=Add 3=Remove","color":"white"}]
tellraw @a ["",{"text":"[","color":"gray"},{"text":"Aura System","color":"gold"},{"text":"] ","color":"gray"},{"text":"Example: ","color":"yellow"},{"text":"/trigger pd_aura_cmd set 11050","color":"white"},{"text":" sets Health to 50","color":"yellow"}]

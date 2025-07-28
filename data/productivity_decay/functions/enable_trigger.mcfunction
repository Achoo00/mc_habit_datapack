# Enable the trigger for the executing player
scoreboard players enable @s pd_aura_cmd
tellraw @s ["",{"text":"[","color":"gray"},{"text":"Aura System","color":"gold"},{"text":"] ","color":"gray"},{"text":"Aura commands enabled! Try ","color":"green"},{"text":"/trigger pd_aura_cmd set 11050","color":"white"},{"text":" to set Health to 50","color":"green"}]

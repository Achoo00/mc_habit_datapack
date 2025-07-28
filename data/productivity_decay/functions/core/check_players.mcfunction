# Check for new players that need initialization
# This runs every tick

execute as @a[tag=!pd_initialized] run function productivity_decay:core/player_init

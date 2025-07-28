# Get scoreboard name from category number
# Input: storage productivity_decay:cmd.category (1-6)
# Output: storage productivity_decay:cmd.scoreboard_name

data modify storage productivity_decay:cmd scoreboard_name set value ""

execute if data storage productivity_decay:cmd{category:1} run data modify storage productivity_decay:cmd scoreboard_name set value "pd_health"
execute if data storage productivity_decay:cmd{category:2} run data modify storage productivity_decay:cmd scoreboard_name set value "pd_intelligence"
execute if data storage productivity_decay:cmd{category:3} run data modify storage productivity_decay:cmd scoreboard_name set value "pd_creativity"
execute if data storage productivity_decay:cmd{category:4} run data modify storage productivity_decay:cmd scoreboard_name set value "pd_organization"
execute if data storage productivity_decay:cmd{category:5} run data modify storage productivity_decay:cmd scoreboard_name set value "pd_social"
execute if data storage productivity_decay:cmd{category:6} run data modify storage productivity_decay:cmd scoreboard_name set value "pd_productivity"

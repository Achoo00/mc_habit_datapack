# Get category name from number
# Input: storage productivity_decay:cmd.category (1-6)
# Output: storage productivity_decay:cmd.category_name

data modify storage productivity_decay:cmd category_name set value ""

execute if data storage productivity_decay:cmd{category:1} run data modify storage productivity_decay:cmd category_name set value "Health"
execute if data storage productivity_decay:cmd{category:2} run data modify storage productivity_decay:cmd category_name set value "Intelligence"
execute if data storage productivity_decay:cmd{category:3} run data modify storage productivity_decay:cmd category_name set value "Creativity"
execute if data storage productivity_decay:cmd{category:4} run data modify storage productivity_decay:cmd category_name set value "Organization"
execute if data storage productivity_decay:cmd{category:5} run data modify storage productivity_decay:cmd category_name set value "Social"
execute if data storage productivity_decay:cmd{category:6} run data modify storage productivity_decay:cmd category_name set value "Productivity"

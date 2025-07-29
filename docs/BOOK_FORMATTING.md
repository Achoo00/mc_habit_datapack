# Minecraft Book Formatting Guide

This document contains working examples of how to format written books with clickable text in Minecraft datapacks.

## Basic Book with Clickable Text

```mcfunction
give @s written_book{
    pages:[
        '{"text":"Command Book\\n\\nClick below to view your auras!","clickEvent":{"action":"run_command","value":"/function productivity_decay:book/pages/view_auras"}}'
    ],
    title:"Command Book",
    author:"Productivity System"
} 1
```

## Multi-page Book with Advanced Formatting

```mcfunction
give @s written_book{
    pages:[
        '{"text":"Your Auras\\n\\nHere are your current aura levels:\\n\\n","color":"black","extra":[{"text":"[Back]","color":"dark_red","bold":true,"clickEvent":{"action":"run_command","value":"/function productivity_decay:book/give_book"},"hoverEvent":{"action":"show_text","value":"Return to main menu"}}]}',
        '{"text":"Physical Auras\\n\\n","color":"black","extra":[{"text":"• Health: ","color":"black"},{"score":{"name":"@s","objective":"pd_health_aura"},"color":"red"},"\\n",{"text":"• Strength: ","color":"black"},{"score":{"name":"@s","objective":"pd_strength_aura"},"color":"dark_red"},"\\n\\n",{"text":"[Log Exercise]","color":"dark_green","bold":true,"clickEvent":{"action":"run_command","value":"/trigger pd_log_exercise set 1"},"hoverEvent":{"action":"show_text","value":"Log exercise activity"}}]}',
        '{"text":"Mental Auras\\n\\n","color":"black","extra":[{"text":"• Focus: ","color":"black"},{"score":{"name":"@s","objective":"pd_focus_aura"},"color":"dark_blue"},"\\n",{"text":"• Creativity: ","color":"black"},{"score":{"name":"@s","objective":"pd_creativity_aura"},"color":"dark_purple"},"\\n\\n",{"text":"[Log Study]","color":"dark_green","bold":true,"clickEvent":{"action":"run_command","value":"/trigger pd_log_study set 1"},"hoverEvent":{"action":"show_text","value":"Log study session"}}]}',
        '{"text":"Social & Other Auras\\n\\n","color":"black","extra":[{"text":"• Social: ","color":"black"},{"score":{"name":"@s","objective":"pd_social_aura"},"color":"gold"},"\\n",{"text":"• Discipline: ","color":"black"},{"score":{"name":"@s","objective":"pd_discipline_aura"},"color":"dark_aqua"},"\\n\\n",{"text":"[Log Social]","color":"dark_green","bold":true,"clickEvent":{"action":"run_command","value":"/trigger pd_log_social set 1"},"hoverEvent":{"action":"show_text","value":"Log social activity"}}]}'
    ],
    title:"Your Auras",
    author:"Productivity System"
} 1
```

## Key Points

1. **Escape Newlines**: Use `\\n` for newlines within JSON strings
2. **Single Quotes**: Wrap each page's JSON in single quotes `'...'`
3. **No Trailing Commas**: Ensure no trailing commas after the last element in JSON objects/arrays
4. **Spacing**: No extra spaces or line breaks in the NBT structure
5. **Score Formatting**: Use the exact format for scoreboard references

## Common Issues

- **JSON Syntax Errors**: Always validate your JSON before using it
- **Unknown Function**: Make sure all function paths are correct
- **Click Events Not Working**: Verify the command is properly formatted and the target function exists
- **Book Not Appearing**: Check for syntax errors in the NBT structure

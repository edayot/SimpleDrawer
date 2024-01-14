# arguments: output

$tellraw @s ["Encoded '",{"storage":"dork.base64:io","nbt":"encode.input","color":"aqua"},"' to '",{"text":"$(output)","color":"green","hoverEvent":{"action": "show_text","value": "Copy to Clipboard"},"clickEvent":{"action":"copy_to_clipboard","value":"$(output)"}},"'"]

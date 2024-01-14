# arguments: escaped_output

$tellraw @s ["Decoded '",{"storage":"dork.base64:io","nbt":"decode.input","color":"aqua"},"' to '",{"storage":"dork.base64:io","nbt":"decode.output","color":"green","hoverEvent":{"action": "show_text","value": "Copy to Clipboard"},"clickEvent":{"action":"copy_to_clipboard","value":"$(escaped_output)"}},"'"]

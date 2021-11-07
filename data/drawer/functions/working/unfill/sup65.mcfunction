scoreboard players remove nb SD_tempC 64
execute store result entity @s Item.tag.data.Count long 1 run scoreboard players get nb SD_tempC 
function drawer:working/display
data modify entity @s ItemRotation set value 0b
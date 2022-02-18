#Hacks Fixed NBTtag
execute at @s if block ~ ~ ~ air run data modify entity @s Fixed set value 0b
execute at @s unless block ~ ~ ~ air run data modify entity @s Fixed set value 1b

function simpledrawer:working/display/redstone
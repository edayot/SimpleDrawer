tag @s remove SD_filled
data modify storage simpledrawer:temp info set from entity @s Item.tag.info
data modify entity @s Item set value {id:"minecraft:barrier",Count:1b}
data modify entity @s Item.tag.info set from storage simpledrawer:temp info
function simpledrawer:working/display
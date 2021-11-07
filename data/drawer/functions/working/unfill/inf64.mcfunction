tag @s remove filled
data modify storage drawer:temp info set from entity @s Item.tag.info
data modify entity @s Item set value {id:"minecraft:barrier",Count:1b}
data modify entity @s Item.tag.info set from storage drawer:temp info
function drawer:working/display
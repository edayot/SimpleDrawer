tag @s remove filled
data modify storage simpledrawertemp info set from entity @s Item.tag.info
data modify entity @s Item set value {id:"minecraft:barrier",Count:1b}
data modify entity @s Item.tag.info set from storage simpledrawertemp info
function simpledrawerworking/display
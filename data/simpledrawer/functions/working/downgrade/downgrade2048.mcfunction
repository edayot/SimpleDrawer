execute at @p[tag=SD_adder] run summon item ~ ~ ~ {Tags:["SD_summoned"],Item:{id:"minecraft:gold_ingot",Count:1b,tag:{display:{Name:'{"text":"Gold Upgrade","color":"gold","italic":false}'},CustomModelData:2048,setCount:2048}}}
data modify entity @e[type=item,tag=SD_summoned,limit=1,sort=nearest] Owner set from entity @p[tag=SD_adder] UUID
tag @e remove SD_summoned
execute at @s run playsound minecraft:block.note_block.harp master @s ~ ~ ~ 1 0.8

data modify entity @s Item.tag.info.maxCount set value 1024
function simpledrawerworking/display


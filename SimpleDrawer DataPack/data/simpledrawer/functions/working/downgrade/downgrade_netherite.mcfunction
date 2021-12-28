execute at @p[tag=SD_adder] run summon item ~ ~ ~ {Tags:["SD_summoned"],Item:{id:"minecraft:netherite_ingot",Count:1b,tag:{display:{Name:'{"text":"Netherite Upgrade","color":"black","italic":false}'},CustomModelData:16777216,setCount:16777216}}}
data modify entity @e[type=item,tag=SD_summoned,limit=1,sort=nearest] Owner set from entity @p[tag=SD_adder] UUID
tag @e remove SD_summoned
execute at @s run playsound minecraft:block.note_block.harp master @s ~ ~ ~ 1 0.8

data modify entity @s Item.tag.info.maxCount set value 262144
function simpledrawer:working/display

tag @s add SD_upgrade
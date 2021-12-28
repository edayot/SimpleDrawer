execute at @p[tag=SD_adder] run summon item ~ ~ ~ {Tags:["SD_summoned"],Item:{id:"minecraft:nether_star",Count:1b,tag:{display:{Name:'{"text":"Nether Star Upgrade","color":"dark_grey","italic":false}'},CustomModelData:262144,setCount:262144}}}
data modify entity @e[type=item,tag=SD_summoned,limit=1,sort=nearest] Owner set from entity @p[tag=SD_adder] UUID
tag @e remove SD_summoned
execute at @s run playsound minecraft:block.note_block.harp master @s ~ ~ ~ 1 0.8

data modify entity @s Item.tag.info.maxCount set value 32768
function simpledrawer:working/display

tag @s add SD_upgrade
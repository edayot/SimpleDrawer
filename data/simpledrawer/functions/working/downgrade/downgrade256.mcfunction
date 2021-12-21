execute at @p[tag=SD_adder] run summon item ~ ~ ~ {Tags:["SD_summoned"],Item:{id:"minecraft:flint",Count:1b,tag:{display:{Name:'{"text":"Hopper Upgrade","color":"green","italic":false}'},CustomModelData:20,hopperUpgrade:1}}}
data modify entity @e[type=item,tag=SD_summoned,limit=1,sort=nearest] Owner set from entity @p[tag=SD_adder] UUID
tag @e remove SD_summoned
execute at @s run playsound minecraft:block.note_block.harp master @s ~ ~ ~ 1 0.8

data modify entity @s Item.tag.info.hopper set value 0

execute at @s if entity @s[tag=SD_north] positioned ~ ~ ~0.5 run tag @e[type=glow_item_frame,tag=SD_DrawerBlock,tag=SD_north,distance=..1,sort=nearest,limit=1] add SD_selected2
execute at @s if entity @s[tag=SD_south] positioned ~ ~ ~-0.5 run tag @e[type=glow_item_frame,tag=SD_DrawerBlock,tag=SD_south,distance=..1,sort=nearest,limit=1] add SD_selected2
execute at @s if entity @s[tag=SD_east] positioned ~-0.5 ~ ~ run tag @e[type=glow_item_frame,tag=SD_DrawerBlock,tag=SD_east,distance=..1,sort=nearest,limit=1] add SD_selected2
execute at @s if entity @s[tag=SD_west] positioned ~0.5 ~ ~ run tag @e[type=glow_item_frame,tag=SD_DrawerBlock,tag=SD_west,distance=..1,sort=nearest,limit=1] add SD_selected2
tag @e[type=glow_item_frame,tag=SD_selected2,limit=1] remove SD_hopper

function simpledrawer:working/display
tag @e remove SD_selected2



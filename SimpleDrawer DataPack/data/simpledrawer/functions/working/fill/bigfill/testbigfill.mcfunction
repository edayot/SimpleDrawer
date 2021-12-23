data remove storage simpledrawer:temp ItemDrawer
data modify storage simpledrawer:temp ItemDrawer set from entity @s Item.tag.data

data remove storage simpledrawer:temp ItemDrawer.Count
data remove storage simpledrawer:temp ItemDrawer.Slot
execute store result score maxCount SD_tempC run data get entity @s Item.tag.info.maxCount

execute if entity @s[tag=!SD_full] run function simpledrawer:working/fill/bigfill/slot0/test
execute if entity @s[tag=!SD_full] run function simpledrawer:working/fill/bigfill/slot1/test
execute if entity @s[tag=!SD_full] run function simpledrawer:working/fill/bigfill/slot2/test
execute if entity @s[tag=!SD_full] run function simpledrawer:working/fill/bigfill/slot3/test
execute if entity @s[tag=!SD_full] run function simpledrawer:working/fill/bigfill/slot4/test
execute if entity @s[tag=!SD_full] run function simpledrawer:working/fill/bigfill/slot5/test
execute if entity @s[tag=!SD_full] run function simpledrawer:working/fill/bigfill/slot6/test
execute if entity @s[tag=!SD_full] run function simpledrawer:working/fill/bigfill/slot7/test
execute if entity @s[tag=!SD_full] run function simpledrawer:working/fill/bigfill/slot8/test
execute if entity @s[tag=!SD_full] run function simpledrawer:working/fill/bigfill/slot9/test
execute if entity @s[tag=!SD_full] run function simpledrawer:working/fill/bigfill/slot10/test
execute if entity @s[tag=!SD_full] run function simpledrawer:working/fill/bigfill/slot11/test
execute if entity @s[tag=!SD_full] run function simpledrawer:working/fill/bigfill/slot12/test
execute if entity @s[tag=!SD_full] run function simpledrawer:working/fill/bigfill/slot13/test
execute if entity @s[tag=!SD_full] run function simpledrawer:working/fill/bigfill/slot14/test
execute if entity @s[tag=!SD_full] run function simpledrawer:working/fill/bigfill/slot15/test
execute if entity @s[tag=!SD_full] run function simpledrawer:working/fill/bigfill/slot16/test
execute if entity @s[tag=!SD_full] run function simpledrawer:working/fill/bigfill/slot17/test
execute if entity @s[tag=!SD_full] run function simpledrawer:working/fill/bigfill/slot18/test
execute if entity @s[tag=!SD_full] run function simpledrawer:working/fill/bigfill/slot19/test
execute if entity @s[tag=!SD_full] run function simpledrawer:working/fill/bigfill/slot20/test
execute if entity @s[tag=!SD_full] run function simpledrawer:working/fill/bigfill/slot21/test
execute if entity @s[tag=!SD_full] run function simpledrawer:working/fill/bigfill/slot22/test
execute if entity @s[tag=!SD_full] run function simpledrawer:working/fill/bigfill/slot23/test
execute if entity @s[tag=!SD_full] run function simpledrawer:working/fill/bigfill/slot24/test
execute if entity @s[tag=!SD_full] run function simpledrawer:working/fill/bigfill/slot25/test
execute if entity @s[tag=!SD_full] run function simpledrawer:working/fill/bigfill/slot26/test
execute if entity @s[tag=!SD_full] run function simpledrawer:working/fill/bigfill/slot27/test
execute if entity @s[tag=!SD_full] run function simpledrawer:working/fill/bigfill/slot28/test
execute if entity @s[tag=!SD_full] run function simpledrawer:working/fill/bigfill/slot29/test
execute if entity @s[tag=!SD_full] run function simpledrawer:working/fill/bigfill/slot30/test
execute if entity @s[tag=!SD_full] run function simpledrawer:working/fill/bigfill/slot31/test
execute if entity @s[tag=!SD_full] run function simpledrawer:working/fill/bigfill/slot32/test
execute if entity @s[tag=!SD_full] run function simpledrawer:working/fill/bigfill/slot33/test
execute if entity @s[tag=!SD_full] run function simpledrawer:working/fill/bigfill/slot34/test
execute if entity @s[tag=!SD_full] run function simpledrawer:working/fill/bigfill/slot35/test

tag @s remove SD_full
function simpledrawer:working/display
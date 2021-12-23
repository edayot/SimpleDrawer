data modify entity @s Item.tag.data.Count set from entity @s Item.tag.info.maxCount
scoreboard players operation nbcrate SD_tempC -= maxCount SD_tempC



item modify entity @p[tag=SD_adder] container.23 simpledrawer:set_count

tag @s add SD_full

    
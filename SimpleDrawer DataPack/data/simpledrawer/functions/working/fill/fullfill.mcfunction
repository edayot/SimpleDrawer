data modify entity @s Item.tag.data.Count set from entity @s Item.tag.info.maxCount
scoreboard players operation nbcrate simpledrawer.tempC -= maxCount simpledrawer.tempC



item modify entity @p[tag=simpledrawer.adder] weapon.mainhand simpledrawer:set_count



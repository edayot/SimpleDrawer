data modify entity @s Item.tag.simpledrawer.type set value "star"
advancement grant @p[tag=simpledrawer.adder] only simpledrawer:display/upgrade/star
scoreboard players set #upgrade_success simpledrawer.math 1
data modify entity @s Item.tag.simpledrawer.hopper set value 1b
tag @s add simpledrawer.drawer.hopper
advancement grant @p[tag=simpledrawer.adder] only simpledrawer:display/upgrade/hopper
scoreboard players set #upgrade_success simpledrawer.math 1
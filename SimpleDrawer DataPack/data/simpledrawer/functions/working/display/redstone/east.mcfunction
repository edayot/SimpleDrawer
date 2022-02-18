execute if score temp simpledrawer.tempC matches 0 at @e[type=glow_item_frame,tag=simpledrawer.selected2] run setblock ~ ~ ~ beehive[honey_level=0,facing=east]


scoreboard players operation temp simpledrawer.tempC *= 4 simpledrawer.tempC
scoreboard players operation temp simpledrawer.tempC /= temp2 simpledrawer.tempC
execute if score temp simpledrawer.tempC matches 1 at @e[type=glow_item_frame,tag=simpledrawer.selected2] run setblock ~ ~ ~ beehive[honey_level=1,facing=east]
execute if score temp simpledrawer.tempC matches 2 at @e[type=glow_item_frame,tag=simpledrawer.selected2] run setblock ~ ~ ~ beehive[honey_level=2,facing=east]
execute if score temp simpledrawer.tempC matches 3 at @e[type=glow_item_frame,tag=simpledrawer.selected2] run setblock ~ ~ ~ beehive[honey_level=3,facing=east]
execute if score temp simpledrawer.tempC matches 4 at @e[type=glow_item_frame,tag=simpledrawer.selected2] run setblock ~ ~ ~ beehive[honey_level=4,facing=east]

scoreboard players add #global simpledrawer.new_drawer.id 1



data remove storage simpledrawer:main temp
data modify storage simpledrawer:main temp.simpledrawer set from block ~ ~ ~ Items[0].tag.simpledrawer

execute summon item_display run function simpledrawer:impl/new_drawer/place/base
setblock ~ ~ ~ beehive

function simpledrawer:impl/new_drawer/place/variant


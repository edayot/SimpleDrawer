scoreboard players operation #id simpledrawer.id = @s simpledrawer.id

summon armor_stand ~ ~ ~ {Tags:["simpledrawer.new_drawer.display","simpledrawer.summoned","simpledrawer.new_drawer.display.0"]}

execute as @e[tag=simpledrawer.summoned] run function simpledrawer:impl/new_drawer/working/summon/classic/init




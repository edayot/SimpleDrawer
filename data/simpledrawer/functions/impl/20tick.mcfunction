
execute as @e[tag=simpledrawer.new_drawer.part.base,tag=simpledrawer.new_drawer.to_update] at @s if entity @a[distance=..15] run function simpledrawer:impl/new_drawer/20tick


schedule function simpledrawer:impl/20tick 20t replace

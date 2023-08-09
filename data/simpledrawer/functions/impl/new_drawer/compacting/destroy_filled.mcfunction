scoreboard players add #model simpledrawer.math 3


scoreboard players set #has_material simpledrawer.math 0
execute unless data storage simpledrawer:main temp.simpledrawer{current_material:"none"} run scoreboard players set #has_material simpledrawer.math 1



data modify storage simpledrawer:main temp.dropped_item.tag.display.Name set value '{"translate":"simpledrawer.compacting_new_drawer.filled","color":"white","italic":false}'



execute 
    if score #has_material simpledrawer.math matches 0 
    run function simpledrawer:impl/new_drawer/compacting/destroy_filled_normal:
        execute store result score #count simpledrawer.math run data get storage simpledrawer:main temp.simpledrawer.Items[0].Count
        execute store result score #maxCount simpledrawer.math run data get storage simpledrawer:main temp.simpledrawer.maxCount


        data remove storage simpledrawer:main temp.id
        data remove storage simpledrawer:main temp.Name
        data modify storage simpledrawer:main temp.id set from storage simpledrawer:main temp.simpledrawer.Items[0].id
        data modify storage simpledrawer:main temp.Name set from storage simpledrawer:main temp.simpledrawer.Items[0].tag.display.Name


        data modify entity 93682a08-d099-4e8f-a4a6-1e33a3692301 HandItems[0] set value {id:"minecraft:stone",Count:1b}
        data modify entity 93682a08-d099-4e8f-a4a6-1e33a3692301 HandItems[0].id set from storage simpledrawer:main temp.id
        execute unless data storage simpledrawer:main temp.Name as 93682a08-d099-4e8f-a4a6-1e33a3692301 run item modify entity @s weapon.mainhand simpledrawer:impl/translate/test_translate
        execute if data storage simpledrawer:main temp.Name as 93682a08-d099-4e8f-a4a6-1e33a3692301 run item modify entity @s weapon.mainhand simpledrawer:impl/destroy_display_filled_name

        data modify storage simpledrawer:main temp.dropped_item.tag.display.Lore set from entity 93682a08-d099-4e8f-a4a6-1e33a3692301 HandItems[0].tag.display.Lore

execute
    if score #has_material simpledrawer.math matches 1
    run function simpledrawer:impl/new_drawer/compacting/destroy_filled_material:
        execute store result score #count simpledrawer.math run data get storage simpledrawer:main temp.simpledrawer.Items[0].Count
        execute store result score #maxCount simpledrawer.math run data get storage simpledrawer:main temp.simpledrawer.maxCount

        data remove storage simpledrawer:main temp.material
        data modify storage simpledrawer:main temp.material set from storage simpledrawer:main temp.simpledrawer.current_material

        data modify entity 93682a08-d099-4e8f-a4a6-1e33a3692301 HandItems[0] set value {id:"minecraft:stone",Count:1b}

        execute as 93682a08-d099-4e8f-a4a6-1e33a3692301 run item modify entity @s weapon.mainhand simpledrawer:impl/destroy_display_filled_material

        data modify storage simpledrawer:main temp.dropped_item.tag.display.Lore set from entity 93682a08-d099-4e8f-a4a6-1e33a3692301 HandItems[0].tag.display.Lore
        

        



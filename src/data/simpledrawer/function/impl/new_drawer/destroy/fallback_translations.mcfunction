

item replace entity 93682a08-d099-4e8f-a4a6-1e33a3692301 weapon.mainhand with gold_ingot
data modify entity 93682a08-d099-4e8f-a4a6-1e33a3692301 HandItems[0].id set from storage simpledrawer:main temp.ItemsDestroy[0].item.id
execute as 93682a08-d099-4e8f-a4a6-1e33a3692301 run item modify entity @s weapon.mainhand simpledrawer:impl/destroy/translate

scoreboard players set #success_lore_destroy simpledrawer.math 0
execute store success score #success_lore_destroy simpledrawer.math run data modify entity @s Item.components."minecraft:lore" append from entity 93682a08-d099-4e8f-a4a6-1e33a3692301 HandItems[0].components."minecraft:lore"[0]


execute if score #success_lore_destroy simpledrawer.math matches 0 run item modify entity @s container.0 simpledrawer:impl/destroy/simple_id



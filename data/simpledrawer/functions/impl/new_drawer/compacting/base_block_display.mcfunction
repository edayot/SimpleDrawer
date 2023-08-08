data modify entity @s item.tag.Trim set value {material:"simpledrawer:compacting",pattern:"minecraft:sentry"}


data modify entity @s item.tag.CustomModelData set value 1430000

execute 
    if score #has_material simpledrawer.math matches 1 
    if score #temp_hide simpledrawer.math matches 0
    run data modify entity @s item.tag.CustomModelData set value 1430002

execute 
    if score #has_material simpledrawer.math matches 1 
    if score #temp_hide simpledrawer.math matches 1
    run data modify entity @s item.tag.CustomModelData set value 1430001
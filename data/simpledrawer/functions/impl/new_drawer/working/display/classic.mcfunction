
data modify storage simpledrawer:main temp.Item0 set value {id:"minecraft:air"}
data modify storage simpledrawer:main temp.Item0 set from entity @s Item.tag.simpledrawer.Item0

data remove storage simpledrawer:main temp.ItemDisplay
data modify storage simpledrawer:main temp.ItemDisplay.id set from storage simpledrawer:main temp.Item0.id
data modify storage simpledrawer:main temp.ItemDisplay.Count set value 1b
data modify storage simpledrawer:main temp.ItemDisplay.Damage set from storage simpledrawer:main temp.Item0.Damage
data modify storage simpledrawer:main temp.ItemDisplay.tag.CustomModelData set from storage simpledrawer:main temp.Item0.tag.CustomModelData
data modify storage simpledrawer:main temp.ItemDisplay.tag.Enchantments set from storage simpledrawer:main temp.Item0.tag.Enchantments
data modify storage simpledrawer:main temp.ItemDisplay.tag.SkullOwner set from storage simpledrawer:main temp.Item0.tag.SkullOwner
data modify storage simpledrawer:main temp.ItemDisplay.tag.Potion set from storage simpledrawer:main temp.Item0.tag.Potion
data modify storage simpledrawer:main temp.ItemDisplay.tag.StoredEnchantments set from storage simpledrawer:main temp.Item0.tag.StoredEnchantments
data modify storage simpledrawer:main temp.ItemDisplay.tag.Fireworks set from storage simpledrawer:main temp.Item0.tag.Fireworks
data modify storage simpledrawer:main temp.ItemDisplay.tag.Explosion set from storage simpledrawer:main temp.Item0.tag.Explosion



scoreboard players operation #search_id simpledrawer.math = @s simpledrawer.id
execute as @e[tag=simpledrawer.new_drawer.display.0,limit=1,distance=..3,predicate=simpledrawer:search_id] at @s run function simpledrawer:impl/new_drawer/working/display/classic/update


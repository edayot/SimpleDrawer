

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



# On génère les items à afficher sur l'armor stand
# Tete : Item à afficher 
# Main gauche : Nombre d'item
# Main droite : Nombre de slot

# Pour les numéros on affiche les items selon leur nombre avec 3 chiffres significatifs
# 0-999 : Iron ingot entiers type 125
# 1_000-9_999 : Gold ingot flottants type 1.25k
# 10_000-99_999 : Copper ingot flottants type 12.5k
# 100_000-999_999 : Diamond entiers type 125k
# 1_000_000-9_999_999 : Emerald flottants type 1.25M
# 10_000_000-99_999_999 : Netherite flottants type 12.5M
# 100_000_000-999_999_999 : Stick entiers type 125M
# 1_000_000_000-9_999_999_999 : Coal flottants type 1.25G

# 2^31 = 2_147_483_648

# Rappel : 
# Nombre entiers type 125 :
# - Iron ingot
# - Diamond k
# - Stick M
# Nombres flottants type 1.25:
# - Gold ingot k
# - Emerald M
# - Coal G
# Nombres flottants type 12.5:
# - Copper ingot k
# - Netherite M




# COUNT
data remove storage simpledrawer:main temp.ItemNumber
scoreboard players operation #nb_display simpledrawer.math = @s simpledrawer.drawer.Count0

execute if score @s simpledrawer.drawer.Count0 matches 0..999 run data modify storage simpledrawer:main temp.ItemNumber set value {id:"minecarft:iron_ingot",Count:1b}
execute if score @s simpledrawer.drawer.Count0 matches 0..999 run scoreboard players operation #nb_display simpledrawer.math /= #1 simpledrawer.math

execute if score @s simpledrawer.drawer.Count0 matches 1000..9999 run data modify storage simpledrawer:main temp.ItemNumber set value {id:"minecarft:gold_ingot",Count:1b}
execute if score @s simpledrawer.drawer.Count0 matches 1000..9999 run scoreboard players operation #nb_display simpledrawer.math /= #10 simpledrawer.math

execute if score @s simpledrawer.drawer.Count0 matches 10000..99999 run data modify storage simpledrawer:main temp.ItemNumber set value {id:"minecarft:copper_ingot",Count:1b}
execute if score @s simpledrawer.drawer.Count0 matches 10000..99999 run scoreboard players operation #nb_display simpledrawer.math /= #100 simpledrawer.math

execute if score @s simpledrawer.drawer.Count0 matches 100000..999999 run data modify storage simpledrawer:main temp.ItemNumber set value {id:"minecarft:diamond",Count:1b}
execute if score @s simpledrawer.drawer.Count0 matches 100000..999999 run scoreboard players operation #nb_display simpledrawer.math /= #1000 simpledrawer.math

execute if score @s simpledrawer.drawer.Count0 matches 1000000..9999999 run data modify storage simpledrawer:main temp.ItemNumber set value {id:"minecarft:emerald",Count:1b}
execute if score @s simpledrawer.drawer.Count0 matches 1000000..9999999 run scoreboard players operation #nb_display simpledrawer.math /= #10000 simpledrawer.math

execute if score @s simpledrawer.drawer.Count0 matches 10000000..99999999 run data modify storage simpledrawer:main temp.ItemNumber set value {id:"minecarft:netherite_ingot",Count:1b}
execute if score @s simpledrawer.drawer.Count0 matches 10000000..99999999 run scoreboard players operation #nb_display simpledrawer.math /= #100000 simpledrawer.math

execute if score @s simpledrawer.drawer.Count0 matches 100000000..999999999 run data modify storage simpledrawer:main temp.ItemNumber set value {id:"minecarft:stick",Count:1b}
execute if score @s simpledrawer.drawer.Count0 matches 100000000..999999999 run scoreboard players operation #nb_display simpledrawer.math /= #1000000 simpledrawer.math

execute if score @s simpledrawer.drawer.Count0 matches 1000000000..2147483647 run data modify storage simpledrawer:main temp.ItemNumber set value {id:"minecarft:coal",Count:1b}
execute if score @s simpledrawer.drawer.Count0 matches 1000000000..2147483647 run scoreboard players operation #nb_display simpledrawer.math /= #10000000 simpledrawer.math

scoreboard players add #nb_display simpledrawer.math 1430000

execute store result storage simpledrawer:main temp.ItemNumber.tag.CustomModelData int 1 run scoreboard players get #nb_display simpledrawer.math

# SLOT
data remove storage simpledrawer:main temp.ItemSlot
scoreboard players operation #nb_display simpledrawer.math = @s simpledrawer.drawer.maxCount0

execute if score @s simpledrawer.drawer.maxCount0 matches 0..999 run data modify storage simpledrawer:main temp.ItemSlot set value {id:"minecarft:iron_ingot",Count:1b}
execute if score @s simpledrawer.drawer.maxCount0 matches 0..999 run scoreboard players operation #nb_display simpledrawer.math /= #1 simpledrawer.math

execute if score @s simpledrawer.drawer.maxCount0 matches 1000..9999 run data modify storage simpledrawer:main temp.ItemSlot set value {id:"minecarft:gold_ingot",Count:1b}
execute if score @s simpledrawer.drawer.maxCount0 matches 1000..9999 run scoreboard players operation #nb_display simpledrawer.math /= #10 simpledrawer.math

execute if score @s simpledrawer.drawer.maxCount0 matches 10000..99999 run data modify storage simpledrawer:main temp.ItemSlot set value {id:"minecarft:copper_ingot",Count:1b}
execute if score @s simpledrawer.drawer.maxCount0 matches 10000..99999 run scoreboard players operation #nb_display simpledrawer.math /= #100 simpledrawer.math

execute if score @s simpledrawer.drawer.maxCount0 matches 100000..999999 run data modify storage simpledrawer:main temp.ItemSlot set value {id:"minecarft:diamond",Count:1b}
execute if score @s simpledrawer.drawer.maxCount0 matches 100000..999999 run scoreboard players operation #nb_display simpledrawer.math /= #1000 simpledrawer.math

execute if score @s simpledrawer.drawer.maxCount0 matches 1000000..9999999 run data modify storage simpledrawer:main temp.ItemSlot set value {id:"minecarft:emerald",Count:1b}
execute if score @s simpledrawer.drawer.maxCount0 matches 1000000..9999999 run scoreboard players operation #nb_display simpledrawer.math /= #10000 simpledrawer.math

execute if score @s simpledrawer.drawer.maxCount0 matches 10000000..99999999 run data modify storage simpledrawer:main temp.ItemSlot set value {id:"minecarft:netherite_ingot",Count:1b}
execute if score @s simpledrawer.drawer.maxCount0 matches 10000000..99999999 run scoreboard players operation #nb_display simpledrawer.math /= #100000 simpledrawer.math

execute if score @s simpledrawer.drawer.maxCount0 matches 100000000..999999999 run data modify storage simpledrawer:main temp.ItemSlot set value {id:"minecarft:stick",Count:1b}
execute if score @s simpledrawer.drawer.maxCount0 matches 100000000..999999999 run scoreboard players operation #nb_display simpledrawer.math /= #1000000 simpledrawer.math

execute if score @s simpledrawer.drawer.maxCount0 matches 1000000000..2147483647 run data modify storage simpledrawer:main temp.ItemSlot set value {id:"minecarft:coal",Count:1b}
execute if score @s simpledrawer.drawer.maxCount0 matches 1000000000..2147483647 run scoreboard players operation #nb_display simpledrawer.math /= #10000000 simpledrawer.math

scoreboard players add #nb_display simpledrawer.math 1430000

execute store result storage simpledrawer:main temp.ItemSlot.tag.CustomModelData int 1 run scoreboard players get #nb_display simpledrawer.math

scoreboard players operation #search_id simpledrawer.math = @s simpledrawer.id
execute as @e[tag=simpledrawer.new_drawer.display.0,limit=1,distance=..3,predicate=simpledrawer:search_id] at @s run function simpledrawer:impl/new_drawer/working/display/classic/update


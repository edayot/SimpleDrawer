#craft detection reset
advancement revoke @s only simpledrawer:guide_craft
recipe take @s simpledrawer:guide_craft
clear @s minecraft:knowledge_book 1


summon item ~ ~ ~ {Tags:["summoned"],Item:{id:"minecraft:written_book",Count:1b,tag:{CustomModelData:1374,display:{Lore:['{"translate":"simpledrawer.name","color":"blue","italic":false}']},title:"Simple Drawer Guide",author:"AirDox_",generation:0,pages:[]}}}

data modify entity @e[tag=summoned,limit=1] Item.tag.pages append value '[{"text":"\\uef01\\n\\n\\n\\n\\n\\n","font":"simpledrawer:font","color":"white"},{"text":"\\uff00","font":"simpledrawer:font","color":"white","hoverEvent":{"action":"show_text","contents":[{"text":"Drawer"}]},"clickEvent":{"action":"change_page","value":"2"}},{"text":"\\uff02","font":"simpledrawer:font","color":"white","hoverEvent":{"action":"show_text","contents":[{"translate":"simpledrawer.iron_upgrade"}]},"clickEvent":{"action":"change_page","value":"3"}},{"text":"\\uff03","font":"simpledrawer:font","color":"white","hoverEvent":{"action":"show_text","contents":[{"translate":"simpledrawer.gold_upgrade"}]},"clickEvent":{"action":"change_page","value":"4"}},{"text":"\\uff04\\n\\n\\n","font":"simpledrawer:font","color":"white","hoverEvent":{"action":"show_text","contents":[{"translate":"simpledrawer.diamond_upgrade"}]},"clickEvent":{"action":"change_page","value":"5"}},{"text":"\\uff05","font":"simpledrawer:font","color":"white","hoverEvent":{"action":"show_text","contents":[{"translate":"simpledrawer.star_upgrade"}]},"clickEvent":{"action":"change_page","value":"6"}},{"text":"\\uff06","font":"simpledrawer:font","color":"white","hoverEvent":{"action":"show_text","contents":[{"text":"Netherite"}]},"clickEvent":{"action":"change_page","value":"7"}},{"text":"\\uff01","font":"simpledrawer:font","color":"white","hoverEvent":{"action":"show_text","contents":[{"translate":"simpledrawer.hopper_upgrade"}]},"clickEvent":{"action":"change_page","value":"8"}},{"text":"\\uff07\\n\\n\\n","font":"simpledrawer:font","color":"white","hoverEvent":{"action":"show_text","contents":[{"text":"Downgrade Wrench"}]},"clickEvent":{"action":"change_page","value":"9"}},{"text":"\\uff08","font":"simpledrawer:font","color":"white","hoverEvent":{"action":"show_text","contents":[{"text":"Simple Drawer Guide"}]},"clickEvent":{"action":"change_page","value":"10"}}]'



data modify entity @e[tag=summoned,limit=1] Item.tag.pages append value '{"text":"\\uef02","font":"simpledrawer:font","color":"white"}'
data modify entity @e[tag=summoned,limit=1] Item.tag.pages append value '{"text":"\\uef03","font":"simpledrawer:font","color":"white"}'
data modify entity @e[tag=summoned,limit=1] Item.tag.pages append value '{"text":"\\uef04","font":"simpledrawer:font","color":"white"}'
data modify entity @e[tag=summoned,limit=1] Item.tag.pages append value '{"text":"\\uef05","font":"simpledrawer:font","color":"white"}'
data modify entity @e[tag=summoned,limit=1] Item.tag.pages append value '{"text":"\\uef06","font":"simpledrawer:font","color":"white"}'
data modify entity @e[tag=summoned,limit=1] Item.tag.pages append value '{"text":"\\uef07","font":"simpledrawer:font","color":"white"}'
data modify entity @e[tag=summoned,limit=1] Item.tag.pages append value '{"text":"\\uef08","font":"simpledrawer:font","color":"white"}'
data modify entity @e[tag=summoned,limit=1] Item.tag.pages append value '{"text":"\\uef09","font":"simpledrawer:font","color":"white"}'
data modify entity @e[tag=summoned,limit=1] Item.tag.pages append value '{"text":"\\uef0a","font":"simpledrawer:font","color":"white"}'

data modify entity @e[type=item,tag=SD_summoned,limit=1,sort=nearest] Owner set from entity @s UUID
tag @e remove summoned
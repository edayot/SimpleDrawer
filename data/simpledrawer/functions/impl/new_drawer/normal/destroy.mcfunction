
#data remove storage simpledrawer:main temp.dropped_item.tag.display.Lore[-1]


execute if data storage simpledrawer:main temp.simpledrawer{upgrade:"iron"} run data modify storage simpledrawer:main temp.dropped_item.tag.display.Lore prepend value '{"translate":"simpledrawer.iron_tier","color":"gray","italic":false}'
execute if data storage simpledrawer:main temp.simpledrawer{upgrade:"gold"} run data modify storage simpledrawer:main temp.dropped_item.tag.display.Lore prepend value '{"translate":"simpledrawer.gold_tier","color":"gray","italic":false}'
execute if data storage simpledrawer:main temp.simpledrawer{upgrade:"diamond"} run data modify storage simpledrawer:main temp.dropped_item.tag.display.Lore prepend value '{"translate":"simpledrawer.diamond_tier","color":"gray","italic":false}'
execute if data storage simpledrawer:main temp.simpledrawer{upgrade:"star"} run data modify storage simpledrawer:main temp.dropped_item.tag.display.Lore prepend value '{"translate":"simpledrawer.star_tier","color":"white","italic":false}' 
execute if data storage simpledrawer:main temp.simpledrawer{upgrade:"netherite"} run data modify storage simpledrawer:main temp.dropped_item.tag.display.Lore prepend value '{"translate":"simpledrawer.netherite_tier","color":"aqua","italic":false}' 




#data modify storage simpledrawer:main temp.dropped_item.tag.display.Lore append value '{"translate":"simpledrawer.name","color":"blue","italic":true}'




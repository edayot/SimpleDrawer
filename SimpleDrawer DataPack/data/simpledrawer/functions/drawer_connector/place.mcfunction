execute if block ~ ~ ~ minecraft:furnace[facing=north] run summon glow_item_frame ~ ~ ~ {Facing:1b,ItemRotation:4b,Invulnerable:1b,Tags:["simpledrawer.drawer_connector","simpledrawer.summoned"],Invisible:1b,Silent:1b,Fixed:1b,Item:{id:"minecraft:beehive",Count:1b,tag:{CustomModelData:1430032}}}
execute if block ~ ~ ~ minecraft:furnace[facing=south] run summon glow_item_frame ~ ~ ~ {Facing:1b,ItemRotation:0b,Invulnerable:1b,Tags:["simpledrawer.drawer_connector","simpledrawer.summoned"],Invisible:1b,Silent:1b,Fixed:1b,Item:{id:"minecraft:beehive",Count:1b,tag:{CustomModelData:1430032}}}
execute if block ~ ~ ~ minecraft:furnace[facing=east] run summon glow_item_frame ~ ~ ~ {Facing:1b,ItemRotation:6b,Invulnerable:1b,Tags:["simpledrawer.drawer_connector","simpledrawer.summoned"],Invisible:1b,Silent:1b,Fixed:1b,Item:{id:"minecraft:beehive",Count:1b,tag:{CustomModelData:1430032}}}
execute if block ~ ~ ~ minecraft:furnace[facing=west] run summon glow_item_frame ~ ~ ~ {Facing:1b,ItemRotation:2b,Invulnerable:1b,Tags:["simpledrawer.drawer_connector","simpledrawer.summoned"],Invisible:1b,Silent:1b,Fixed:1b,Item:{id:"minecraft:beehive",Count:1b,tag:{CustomModelData:1430032}}}


setblock ~ ~ ~ minecraft:barrel{CustomName: '{"translate":"simpledrawer.drawer_connector.gui","font":"simpledrawer:gui","color":"white","with":[{"translate":"simpledrawer.drawer_connector","color":"#3F3F3F","font":"minecraft:default"}]}'}
tag @e[tag=simpledrawer.summoned] remove simpledrawer.summoned



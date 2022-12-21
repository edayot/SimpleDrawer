execute if data entity @s Item.tag.simpledrawer{type:"wood"} run advancement grant @p[tag=simpledrawer.adder] only simpledrawer:display/filled/wood
execute if data entity @s Item.tag.simpledrawer{type:"iron"} run advancement grant @p[tag=simpledrawer.adder] only simpledrawer:display/filled/iron
execute if data entity @s Item.tag.simpledrawer{type:"gold"} run advancement grant @p[tag=simpledrawer.adder] only simpledrawer:display/filled/gold
execute if data entity @s Item.tag.simpledrawer{type:"diamond"} run advancement grant @p[tag=simpledrawer.adder] only simpledrawer:display/filled/diamond
execute if data entity @s Item.tag.simpledrawer{type:"star"} run advancement grant @p[tag=simpledrawer.adder] only simpledrawer:display/filled/star
execute if data entity @s Item.tag.simpledrawer{type:"netherite"} run advancement grant @p[tag=simpledrawer.adder] only simpledrawer:display/filled/netherite

scoreboard players set #full simpledrawer.math 1
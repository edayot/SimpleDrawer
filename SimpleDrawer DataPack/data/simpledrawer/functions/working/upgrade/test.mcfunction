




execute unless entity @s[tag=simpledrawer.upgrade] unless data entity @s Item.tag.info{hopper:1} if data entity @p[tag=simpledrawer.adder] SelectedItem.tag{ctc:{id:"hopper_upgrade",from:"airdox_:simpledrawer"}} run function simpledrawer:working/upgrade/material/hopper
execute unless entity @s[tag=simpledrawer.upgrade] if data entity @s Item.tag.info{type:"wood"} if data entity @p[tag=simpledrawer.adder] SelectedItem.tag{ctc:{id:"iron_upgrade",from:"airdox_:simpledrawer"}} run function simpledrawer:working/upgrade/material/iron
execute unless entity @s[tag=simpledrawer.upgrade] if data entity @s Item.tag.info{type:"iron"} if data entity @p[tag=simpledrawer.adder] SelectedItem.tag{ctc:{id:"gold_upgrade",from:"airdox_:simpledrawer"}} run function simpledrawer:working/upgrade/material/gold
execute unless entity @s[tag=simpledrawer.upgrade] if data entity @s Item.tag.info{type:"gold"} if data entity @p[tag=simpledrawer.adder] SelectedItem.tag{ctc:{id:"diamond_upgrade",from:"airdox_:simpledrawer"}} run function simpledrawer:working/upgrade/material/diamond
execute unless entity @s[tag=simpledrawer.upgrade] if data entity @s Item.tag.info{type:"diamond"} if data entity @p[tag=simpledrawer.adder] SelectedItem.tag{ctc:{id:"star_upgrade",from:"airdox_:simpledrawer"}} run function simpledrawer:working/upgrade/material/star
execute unless entity @s[tag=simpledrawer.upgrade] if data entity @s Item.tag.info{type:"star"} if data entity @p[tag=simpledrawer.adder] SelectedItem.tag{ctc:{id:"netherite_upgrade",from:"airdox_:simpledrawer"}} run function simpledrawer:working/upgrade/material/netherite



execute unless entity @s[tag=simpledrawer.upgrade] if data entity @p[tag=simpledrawer.adder] SelectedItem.tag{ctc:{id:"wrench",from:"airdox_:simpledrawer"}} if data entity @s[tag=!simpledrawer.filled] Item.tag.info{hopper:1} if data entity @s Item.tag.info{type:"wood"} run function simpledrawer:working/downgrade/downgrade_wood
execute unless entity @s[tag=simpledrawer.upgrade] if data entity @p[tag=simpledrawer.adder] SelectedItem.tag{ctc:{id:"wrench",from:"airdox_:simpledrawer"}} if data entity @s[tag=!simpledrawer.filled] Item.tag.info{type:"iron"} run function simpledrawer:working/downgrade/downgrade_iron
execute unless entity @s[tag=simpledrawer.upgrade] if data entity @p[tag=simpledrawer.adder] SelectedItem.tag{ctc:{id:"wrench",from:"airdox_:simpledrawer"}} if data entity @s[tag=!simpledrawer.filled] Item.tag.info{type:"gold"} run function simpledrawer:working/downgrade/downgrade_gold
execute unless entity @s[tag=simpledrawer.upgrade] if data entity @p[tag=simpledrawer.adder] SelectedItem.tag{ctc:{id:"wrench",from:"airdox_:simpledrawer"}} if data entity @s[tag=!simpledrawer.filled] Item.tag.info{type:"diamond"} run function simpledrawer:working/downgrade/downgrade_diamond
execute unless entity @s[tag=simpledrawer.upgrade] if data entity @p[tag=simpledrawer.adder] SelectedItem.tag{ctc:{id:"wrench",from:"airdox_:simpledrawer"}} if data entity @s[tag=!simpledrawer.filled] Item.tag.info{type:"star"} run function simpledrawer:working/downgrade/downgrade_star
execute unless entity @s[tag=simpledrawer.upgrade] if data entity @p[tag=simpledrawer.adder] SelectedItem.tag{ctc:{id:"wrench",from:"airdox_:simpledrawer"}} if data entity @s[tag=!simpledrawer.filled] Item.tag.info{type:"netherite"} run function simpledrawer:working/downgrade/downgrade_netherite


execute if entity @s[tag=simpledrawer.filled] if data entity @p[tag=simpledrawer.adder] SelectedItem.tag{ctc:{id:"wrench",from:"airdox_:simpledrawer"}} run tellraw @p[tag=simpledrawer.adder] [{"translate":"simpledrawer.tellraw_prefix","color":"dark_red"},{"translate":"simpledrawer.text.cant_downgrade","color":"red"}]


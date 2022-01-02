




execute unless data entity @s Item.tag.info{hopper:1} if data entity @p[tag=SD_adder] SelectedItem.tag{setType:"hopper"} run function simpledrawer:working/upgrade/hopper
execute if data entity @s Item.tag.info{type:"wood"} if data entity @p[tag=SD_adder] SelectedItem.tag{setType:"iron"} run function simpledrawer:working/upgrade/upgrade
execute if data entity @s Item.tag.info{type:"iron"} if data entity @p[tag=SD_adder] SelectedItem.tag{setType:"gold"} run function simpledrawer:working/upgrade/upgrade
execute if data entity @s Item.tag.info{type:"gold"} if data entity @p[tag=SD_adder] SelectedItem.tag{setType:"diamond"} run function simpledrawer:working/upgrade/upgrade
execute if data entity @s Item.tag.info{type:"diamond"} if data entity @p[tag=SD_adder] SelectedItem.tag{setType:"star"} run function simpledrawer:working/upgrade/upgrade
execute if data entity @s Item.tag.info{type:"star"} if data entity @p[tag=SD_adder] SelectedItem.tag{setType:"netherite"} run function simpledrawer:working/upgrade/upgrade



execute if data entity @p[tag=SD_adder] SelectedItem.tag{downgrade:1b} if data entity @s Item.tag.info{hopper:1} if data entity @s Item.tag.info{type:"wood"} run function simpledrawer:working/downgrade/downgrade_wood
execute if data entity @p[tag=SD_adder] SelectedItem.tag{downgrade:1b} if data entity @s Item.tag.info{type:"iron"} run function simpledrawer:working/downgrade/downgrade_iron
execute if data entity @p[tag=SD_adder] SelectedItem.tag{downgrade:1b} if data entity @s Item.tag.info{type:"gold"} run function simpledrawer:working/downgrade/downgrade_gold
execute if data entity @p[tag=SD_adder] SelectedItem.tag{downgrade:1b} if data entity @s Item.tag.info{type:"diamond"} run function simpledrawer:working/downgrade/downgrade_diamond
execute if data entity @p[tag=SD_adder] SelectedItem.tag{downgrade:1b} if data entity @s Item.tag.info{type:"star"} run function simpledrawer:working/downgrade/downgrade_star
execute if data entity @p[tag=SD_adder] SelectedItem.tag{downgrade:1b} if data entity @s Item.tag.info{type:"netherite"} run function simpledrawer:working/downgrade/downgrade_netherite


execute if entity @s[tag=SD_filled] if data entity @p[tag=SD_adder] SelectedItem.tag{downgrade:1b} run tellraw @p[tag=SD_adder] [{"translate":"simpledrawer.text.cant_downgrade","color":"red"}]
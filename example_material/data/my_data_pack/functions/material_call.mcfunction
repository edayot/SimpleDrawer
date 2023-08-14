# in function tag #simpledrawer:material


execute unless score #success_material simpledrawer.io matches 1 if data storage simpledrawer:io item_material{tag:{ctc:{id:"my_block",from:"my_data_pack"}}} run function my_data_pack:my_material/block

execute unless score #success_material simpledrawer.io matches 1 if data storage simpledrawer:io item_material{tag:{ctc:{id:"my_ingot",from:"my_data_pack"}}} run function my_data_pack:my_material/ingot

execute unless score #success_material simpledrawer.io matches 1 if data storage simpledrawer:io item_material{tag:{ctc:{id:"my_nugget",from:"my_data_pack"}}} run function my_data_pack:my_material/nugget





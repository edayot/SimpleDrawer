#copy Count in a sign and set to name
scoreboard players set temp simpledrawer.tempC 0
execute store result score temp simpledrawer.tempC run data get entity @s Item.tag.data.Count
execute store result score temp2 simpledrawer.tempC run data get entity @s Item.tag.info.maxCount
execute in simpledrawer:intern run setblock 0 -64 0 oak_sign{Text1:'[{"score":{"name":"temp","objective":"simpledrawer.tempC"},"color":"white","bold":false,"italic":false,"underlined":false,"strikethrough":false,"obfuscated":false},{"text":" / ","color":"black","bold":false,"italic":false,"underlined":false,"strikethrough":false,"obfuscated":false},{"score":{"name":"temp2","objective":"simpledrawer.tempC"},"color":"white","bold":false,"italic":false,"underlined":false,"strikethrough":false,"obfuscated":false}]'} replace
execute in simpledrawer:intern run data modify entity @s Item.tag.display.Name set from block 0 -64 0 Text1
execute in simpledrawer:intern run setblock 0 -64 0 bedrock
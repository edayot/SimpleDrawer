scoreboard players set setCount SD_tempC 0
scoreboard players set maxCount SD_tempC 0
scoreboard players set hopperUpgrade SD_tempC 0
scoreboard players set downgrade SD_tempC 0
execute store result score setCount SD_tempC run data get entity @p[tag=SD_adder] SelectedItem.tag.setCount
execute store result score maxCount SD_tempC run data get entity @s Item.tag.info.maxCount
execute store result score hopperUpgrade SD_tempC run data get entity @p[tag=SD_adder] SelectedItem.tag.hopperUpgrade
execute store result score downgrade SD_tempC run data get entity @p[tag=SD_adder] SelectedItem.tag.downgrade


#tellraw @p [{"text":"setCount : "},{"score":{"name":"setCount","objective":"SD_tempC"}}]
#tellraw @p [{"text":"maxCount : "},{"score":{"name":"maxCount","objective":"SD_tempC"}}]

execute if score maxCount SD_tempC matches 256 if score setCount SD_tempC matches 1024 run function drawer:working/upgrade/upgrade
execute if score maxCount SD_tempC matches 1024 if score setCount SD_tempC matches 2048 run function drawer:working/upgrade/upgrade
execute if score maxCount SD_tempC matches 2048 if score setCount SD_tempC matches 32768 run function drawer:working/upgrade/upgrade
execute if score maxCount SD_tempC matches 32768 if score setCount SD_tempC matches 262144 run function drawer:working/upgrade/upgrade
execute if score maxCount SD_tempC matches 262144 if score setCount SD_tempC matches 16777216 run function drawer:working/upgrade/upgrade

execute if score hopperUpgrade SD_tempC matches 1 unless data entity @s Item.tag.info{hopper:1} run function drawer:working/upgrade/hopper

execute if entity @s[tag=!filled] if score downgrade SD_tempC matches 1 if score maxCount SD_tempC matches 256 if data entity @s Item.tag.info{hopper:1} run function drawer:working/downgrade/downgrade256
execute if entity @s[tag=!filled] if score downgrade SD_tempC matches 1 if score maxCount SD_tempC matches 1024 run function drawer:working/downgrade/downgrade1024
execute if entity @s[tag=!filled] if score downgrade SD_tempC matches 1 if score maxCount SD_tempC matches 2048 run function drawer:working/downgrade/downgrade2048
execute if entity @s[tag=!filled] if score downgrade SD_tempC matches 1 if score maxCount SD_tempC matches 32768 run function drawer:working/downgrade/downgrade32768
execute if entity @s[tag=!filled] if score downgrade SD_tempC matches 1 if score maxCount SD_tempC matches 262144 run function drawer:working/downgrade/downgrade262144
execute if entity @s[tag=!filled] if score downgrade SD_tempC matches 1 if score maxCount SD_tempC matches 16777216 run function drawer:working/downgrade/downgrade16777216

execute if entity @s[tag=filled] if score downgrade SD_tempC matches 1 run tellraw @p[tag=SD_adder] [{"text":"Can't downgrade filled drawer","color":"red"}]

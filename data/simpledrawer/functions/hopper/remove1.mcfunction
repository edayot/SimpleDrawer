execute store result score nb SD_tempC run data get entity @s Item.tag.data.Count
scoreboard players remove nb SD_tempC 1
execute if score nb SD_tempC matches ..0 run function simpledrawerworking/unfill/inf64
execute if score nb SD_tempC matches 1.. store result entity @s Item.tag.data.Count long 1 run scoreboard players get nb SD_tempC
execute if score nb SD_tempC matches 1.. run function simpledrawerworking/display


execute store result entity @s Item.tag.info.maxCount int 1 run scoreboard players get setCount SD_tempC
execute if score setCount SD_tempC matches 1024 run clear @p[tag=SD_adder] #simpledrawerupgrade{setCount:1024} 1
execute if score setCount SD_tempC matches 2048 run clear @p[tag=SD_adder] #simpledrawerupgrade{setCount:2048} 1
execute if score setCount SD_tempC matches 32768 run clear @p[tag=SD_adder] #simpledrawerupgrade{setCount:32768} 1
execute if score setCount SD_tempC matches 262144 run clear @p[tag=SD_adder] #simpledrawerupgrade{setCount:262144} 1
execute if score setCount SD_tempC matches 16777216 run clear @p[tag=SD_adder] #simpledrawerupgrade{setCount:16777216} 1

execute at @s run playsound minecraft:entity.experience_orb.pickup neutral @a ~ ~ ~ 1 1
function simpledrawerworking/display
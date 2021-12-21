#say extract3

#reset and set
scoreboard players set nbhopper SD_tempC 0
execute if data block ~ ~ ~ Items[{Slot:3b}] store result score nbhopper SD_tempC run data get block ~ ~ ~ Items[{Slot:3b}].Count

scoreboard players add nbhopper SD_tempC 1
execute if score nbhopper SD_tempC matches ..64 run scoreboard players set @s SD_tempC 0
execute if score nbhopper SD_tempC matches ..64 unless data block ~ ~ ~ Items[{Slot:3b}] run function simpledrawerhopper/items3/firstextract


execute if data block ~ ~ ~ Items[{Slot:3b}] if score nbhopper SD_tempC matches ..64 store result block ~ ~ ~ Items[{Slot:3b}].Count byte 1 run scoreboard players get nbhopper SD_tempC
execute if score nbhopper SD_tempC matches ..64 as @e[type=glow_item_frame,tag=SD_selected] run function simpledrawerhopper/remove1

#say extract3

#reset and set
scoreboard players set nbhopper simpledrawer.tempC 0
execute if data block ~ ~ ~ Items[{Slot:3b}] store result score nbhopper simpledrawer.tempC run data get block ~ ~ ~ Items[{Slot:3b}].Count

scoreboard players add nbhopper simpledrawer.tempC 1
execute if score nbhopper simpledrawer.tempC matches ..64 run scoreboard players set @s simpledrawer.tempC 0
execute if score nbhopper simpledrawer.tempC matches ..64 unless data block ~ ~ ~ Items[{Slot:3b}] run function simpledrawer:hopper_extract/items3/firstextract


execute if data block ~ ~ ~ Items[{Slot:3b}] if score nbhopper simpledrawer.tempC matches ..64 store result block ~ ~ ~ Items[{Slot:3b}].Count byte 1 run scoreboard players get nbhopper simpledrawer.tempC
execute if score nbhopper simpledrawer.tempC matches ..64 as @e[type=glow_item_frame,tag=simpledrawer.selected] run function simpledrawer:hopper_extract/remove1

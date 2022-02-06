#say extract4

#reset and set
scoreboard players set nbhopper simpledrawer.tempC 0
execute if data block ~ ~ ~ Items[{Slot:4b}] store result score nbhopper simpledrawer.tempC run data get block ~ ~ ~ Items[{Slot:4b}].Count

scoreboard players add nbhopper simpledrawer.tempC 1
execute if score nbhopper simpledrawer.tempC matches ..64 run scoreboard players set @s simpledrawer.tempC 0
execute if score nbhopper simpledrawer.tempC matches ..64 unless data block ~ ~ ~ Items[{Slot:4b}] run function simpledrawer:hopper_extract/items4/firstextract


execute if data block ~ ~ ~ Items[{Slot:4b}] if score nbhopper simpledrawer.tempC matches ..64 store result block ~ ~ ~ Items[{Slot:4b}].Count byte 1 run scoreboard players get nbhopper simpledrawer.tempC
execute if score nbhopper simpledrawer.tempC matches ..64 as @e[type=glow_item_frame,tag=simpledrawer.selected] run function simpledrawer:hopper_extract/remove1

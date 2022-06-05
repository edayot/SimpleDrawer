execute at @s if block ~ ~-1 ~ hopper run function simpledrawer:hopper_extract/checkextract
execute at @s if block ~ ~1 ~ hopper[facing=down] run function simpledrawer:hopper_insert/checkinsert


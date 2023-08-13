loot give @s loot simpledrawer:impl/items/guide
scoreboard players add @s simpledrawer.player.input_cooldown 0
scoreboard players add @s simpledrawer.player.output_cooldown 0
scoreboard players enable @s simpledrawer.config
scoreboard players enable @s simpledrawer.update_guide

scoreboard players set @s simpledrawer.config.output_mode 0



scoreboard players set @s simpledrawer.config.input_mode 2




#Output mode
# 0 is 1 output and a double click is 64 (default)
# 1 is 1 output
# 2 is 64 output

#Input mode
# 0 is 1 and double click is whole item
# 1 is one by one
# 2 is the whole item in mainhand (default)

#tellraw all possible output modes with clickable commands







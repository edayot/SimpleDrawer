loot give @s loot simpledrawer:items/guide
scoreboard players add @a simpledrawer.player.input_cooldown 0
scoreboard players add @a simpledrawer.player.output_cooldown 0

#Output mode
# 0 is 1 output and a double click is 64
# 1 is 1 output
# 2 is 64 output
scoreboard players set @s simpledrawer.config.output_mode 0


#Input mode
# 0 is 1 and double click is whole item
# 1 is one by one
# 2 is the whole item in mainhand
scoreboard players set @s simpledrawer.config.input_mode 2

data modify storage simpledrawer:main temp.input_no_slot_no_count set from storage simpledrawer:main temp.input_no_slot
data remove storage simpledrawer:main temp.input_no_slot_no_count.Count

data modify storage simpledrawer:main temp.ItemDrawer_no_count set from storage simpledrawer:main temp.ItemDrawer.tag.simpledrawer.Item
data remove storage simpledrawer:main temp.ItemDrawer_no_count.Count

execute store success score #!same simpledrawer.math run data modify storage simpledrawer:main temp.input_no_slot_no_count set from storage simpledrawer:main temp.ItemDrawer_no_count
execute if score #!same simpledrawer.math matches 0 run function simpledrawer:impl/drawer/working/fill/test_count
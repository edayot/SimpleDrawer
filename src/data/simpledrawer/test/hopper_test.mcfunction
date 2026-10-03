# @dummy
# @template simpledrawer:hopper_test
# @timeout 999999

await delay 2s
await score #loaded itemio.math matches 1
await entity a97c9c67-fde0-4b89-926d-54fa4a866004

loot give @s loot simpledrawer:impl/items/new_drawer

tp @s ~1.5 ~1 ~2.5 -90 50

dummy @s sneak true
dummy @s mainhand 1
await delay 5t
dummy @s use block ~2.5 ~1 ~2.5

assert block ~2 ~3 ~2 minecraft:hopper[enabled=true,facing=down]{Items:[{Slot:0b,count:4,id:"minecraft:iron_block"}],TransferCooldown:0,components:{}}
assert not data block ~2 ~3 ~2 Items[1]
assert block ~2 ~1 ~2 minecraft:hopper[enabled=true,facing=down]{Items:[],TransferCooldown:0,components:{}}
assert not data block ~2 ~1 ~2 Items[0]


loot give @s loot simpledrawer:impl/items/hopper_upgrade
await delay 5t
execute positioned ~2.5 ~1 ~2.5 run dummy @s attack @n[tag=simpledrawer.new_drawer.part.interaction]
assert entity @s[advancements={simpledrawer:display/upgrade/hopper=true}]

await delay 3s
assert block ~2 ~3 ~2 minecraft:hopper[enabled=true,facing=down]{Items:[],TransferCooldown:0,components:{}}
assert not data block ~2 ~3 ~2 Items[0]
assert block ~2 ~1 ~2 minecraft:hopper[enabled=true,facing=down]{Items:[{Slot:0b,count:4,id:"minecraft:iron_block"}],TransferCooldown:0,components:{}}
assert not data block ~2 ~1 ~2 Items[1]

execute positioned ~2.5 ~1 ~2.5 run assert data entity @n[tag=simpledrawer.new_drawer.base] {item:{components: {"minecraft:item_model": "simpledrawer:vide", "minecraft:custom_data": {simpledrawer: {upgrade: "wood", wood_type: "simpledrawer:oak", globalCount: 0, items_counts: {22: 0, 23: 0, 24: 0, 25: 0, 26: 0, 10: 0, 11: 0, 12: 0, 13: 0, 14: 0, 15: 0, 16: 0, 17: 0, 18: 0, 19: 0, 0: 0, 1: 0, 2: 0, 3: 0, 4: 0, 5: 0, 6: 0, 7: 0, 8: 0, 9: 0, 20: 0, 21: 0}, variant: "single", type: "normal", hopper: 1b, maxCount: 256, version: {patch: 0, major: 2, minor: 10}, loot_table: "items/new_drawer"}}}, count: 1, id: "minecraft:barrel"}}



# @public

#drawer guide
execute store result score @s smithed.data if entity @s[scores={smithed.data=0}] if score count smithed.data matches 1 if data storage smithed.crafter:main root.temp{shapeless_crafting_input:[{Count:1b,tag:{ctc:{from:"airdox_:simpledrawer",id:"guide",traits:{items:1b}}}}]} run loot replace block ~ ~ ~ container.16 loot simpledrawer:items/guide

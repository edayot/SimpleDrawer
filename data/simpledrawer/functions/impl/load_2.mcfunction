kill 00022e98-0000-0378-0000-037800000058
summon armor_stand -30000000 20 1610 {Tags:["global.forceload"],NoGravity:1b,Silent:1b,Invulnerable:1b,Marker:1b,Invisible:1b,UUID:[I;143000,888,888,88],HandItems:[{id:"minecraft:stone",Count:1b},{}]}

tag AirDox_ add convention.debug
execute as @a[tag=convention.debug] run function simpledrawer:impl/print_version
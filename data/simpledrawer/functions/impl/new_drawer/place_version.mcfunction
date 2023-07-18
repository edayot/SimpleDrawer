

data modify storage simpledrawer:main temp.version set value {major: 0, minor: 0, patch: 0}
data modify storage simpledrawer:main temp.version set from storage smithed.custom_block:main blockApi.__data.Items[0].tag.simpledrawer.version

execute store result score #drawer.major simpledrawer.math run data get storage simpledrawer:main temp.version.major
execute store result score #drawer.minor simpledrawer.math run data get storage simpledrawer:main temp.version.minor
execute store result score #drawer.patch simpledrawer.math run data get storage simpledrawer:main temp.version.patch


scoreboard players set #success_version simpledrawer.math 0
execute if score #drawer.major simpledrawer.math = #simpledrawer.major load.status 
    if score #drawer.minor simpledrawer.math = #simpledrawer.minor load.status 
    if score #drawer.patch simpledrawer.math = #simpledrawer.patch load.status 
    run function simpledrawer:impl/new_drawer/place


execute if score #success_version simpledrawer.math matches 0 run function simpledrawer:impl/new_drawer/unable_to_place
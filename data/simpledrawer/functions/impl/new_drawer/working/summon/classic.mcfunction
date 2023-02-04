scoreboard players operation #id simpledrawer.id = @s simpledrawer.id

summon armor_stand ~ ~2 ~ {Tags:["simpledrawer.new_drawer.display","simpledrawer.summoned","simpledrawer.new_drawer.display.0"],HasVisualFire:1b,Pose:{RightArm:[0f,0f,0f],LeftArm:[0f,0f,0f]},ShowArms:1b,Invisible:1b,NoGravity:1b,Marker:1b}

execute as @e[tag=simpledrawer.summoned] run function simpledrawer:impl/new_drawer/working/summon/classic/init




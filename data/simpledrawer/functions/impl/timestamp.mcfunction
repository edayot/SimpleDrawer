

function ./timestamp/scoreboard_process:
    $data modify storage simpledrawer:timestamp timestamp set value $(timestamp)L
    execute store result score #timestamp simpledrawer.math run data get storage simpledrawer:timestamp timestamp 0.001

    scoreboard players operation #timestamp_year simpledrawer.math = #timestamp simpledrawer.math
    scoreboard players operation #timestamp_year simpledrawer.math /= #second_in_a_year simpledrawer.math

    scoreboard players operation #current_year_% simpledrawer.math = #timestamp_year simpledrawer.math
    scoreboard players operation #current_year_% simpledrawer.math %= #100 simpledrawer.math

    # enable christmas event from december 1st to mid january aproximately
    scoreboard players set #christmas_event simpledrawer.math 0
    execute if score #current_year_% simpledrawer.math matches 91.. run scoreboard players set #christmas_event simpledrawer.math 1
    execute if score #current_year_% simpledrawer.math matches 0..5 run scoreboard players set #christmas_event simpledrawer.math 1

    execute if score #christmas_event simpledrawer.math matches 1 run function simpledrawer:event/christmas

    


function ./timestamp/process:
    data modify storage simpledrawer:timestamp timestamp set from block -29999990 33 1610 SkullOwner.Properties.textures[0].Value
    data modify storage simpledrawer:timestamp timestamp set string storage simpledrawer:timestamp timestamp 24 -1
    data modify storage dork.base64:io decode.input set from storage simpledrawer:timestamp timestamp
    function dork.base64:api/decode/until {terminator: ",", include_terminator: false}
    data modify storage simpledrawer:timestamp timestamp set from storage dork.base64:io decode.output
    function ./timestamp/scoreboard_process with storage simpledrawer:timestamp


    schedule clear simpledrawer:impl/timestamp




scoreboard players set #success_ts simpledrawer.math 0

execute 
    as @p at @s
    if data block -29999990 33 1610 SkullOwner.Properties.textures[0]
    run scoreboard players set #success_ts simpledrawer.math 1


execute if score #success_ts simpledrawer.math matches 1 run function ./timestamp/process

execute if score #success_ts simpledrawer.math matches 0 run schedule function simpledrawer:impl/timestamp 5t replace



setblock -29999990 33 1610 air
setblock -29999990 33 1610 player_head{SkullOwner:{Name:"jeb_"}}


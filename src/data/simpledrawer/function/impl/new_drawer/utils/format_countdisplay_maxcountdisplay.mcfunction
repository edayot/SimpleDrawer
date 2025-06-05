
#
# Inputs : score #count_display simpledrawer.math
# Outputs : update text_display json component

# Only 3 digits are displayed

scoreboard players operation #number simpledrawer.math = #count_display simpledrawer.math
data modify storage simpledrawer:main temp.dot set value "."

execute if score #count_display simpledrawer.math matches ..999 store result storage simpledrawer:main temp.count_int int 1 run scoreboard players get #number simpledrawer.math
execute if score #count_display simpledrawer.math matches ..999 run data modify storage simpledrawer:main temp.dot set value ""
execute if score #count_display simpledrawer.math matches ..999 run data modify storage simpledrawer:main temp.count_reminder set value ""
execute if score #count_display simpledrawer.math matches ..999 run data modify storage simpledrawer:main temp.count_suffix set value ""





execute if score #count_display simpledrawer.math matches 1000..9999 run scoreboard players operation #number simpledrawer.math /= #10 simpledrawer.math
execute if score #count_display simpledrawer.math matches 1000..9999 run scoreboard players operation #count_int simpledrawer.math = #number simpledrawer.math
execute if score #count_display simpledrawer.math matches 1000..9999 run scoreboard players operation #count_int simpledrawer.math /= #100 simpledrawer.math

execute if score #count_display simpledrawer.math matches 1000..9999 store result storage simpledrawer:main temp.count_int int 1 run scoreboard players get #count_int simpledrawer.math

execute if score #count_display simpledrawer.math matches 1000..9999 run scoreboard players operation #count_int simpledrawer.math *= #100 simpledrawer.math
execute if score #count_display simpledrawer.math matches 1000..9999 run scoreboard players operation #number simpledrawer.math -= #count_int simpledrawer.math
# Number is now between 0 and 99

execute if score #count_display simpledrawer.math matches 1000..9999 store result storage simpledrawer:main temp.count_reminder int 1 run scoreboard players get #number simpledrawer.math

# Add zeros if needed
execute if score #count_display simpledrawer.math matches 1000..9999 if score #number simpledrawer.math matches 0..9 run data modify storage simpledrawer:main temp.dot set value ".0"

execute if score #count_display simpledrawer.math matches 1000..9999 run data modify storage simpledrawer:main temp.count_suffix set value "k"




execute if score #count_display simpledrawer.math matches 10000..99999 run scoreboard players operation #number simpledrawer.math /= #100 simpledrawer.math
execute if score #count_display simpledrawer.math matches 10000..99999 run scoreboard players operation #count_int simpledrawer.math = #number simpledrawer.math
execute if score #count_display simpledrawer.math matches 10000..99999 run scoreboard players operation #count_int simpledrawer.math /= #10 simpledrawer.math

execute if score #count_display simpledrawer.math matches 10000..99999 store result storage simpledrawer:main temp.count_int int 1 run scoreboard players get #count_int simpledrawer.math

execute if score #count_display simpledrawer.math matches 10000..99999 run scoreboard players operation #count_int simpledrawer.math *= #10 simpledrawer.math
execute if score #count_display simpledrawer.math matches 10000..99999 run scoreboard players operation #number simpledrawer.math -= #count_int simpledrawer.math
# Number is now between 0 and 9

execute if score #count_display simpledrawer.math matches 10000..99999 store result storage simpledrawer:main temp.count_reminder int 1 run scoreboard players get #number simpledrawer.math

# Add zeros if needed
# no need to add them

execute if score #count_display simpledrawer.math matches 10000..99999 run data modify storage simpledrawer:main temp.count_suffix set value "k"




execute if score #count_display simpledrawer.math matches 100000..999999 run scoreboard players operation #number simpledrawer.math /= #1000 simpledrawer.math
execute if score #count_display simpledrawer.math matches 100000..999999 run scoreboard players operation #count_int simpledrawer.math = #number simpledrawer.math

execute if score #count_display simpledrawer.math matches 100000..999999 store result storage simpledrawer:main temp.count_int int 1 run scoreboard players get #count_int simpledrawer.math

execute if score #count_display simpledrawer.math matches 100000..999999 run data modify storage simpledrawer:main temp.dot set value ""
execute if score #count_display simpledrawer.math matches 100000..999999 run data modify storage simpledrawer:main temp.count_reminder set value ""
execute if score #count_display simpledrawer.math matches 100000..999999 run data modify storage simpledrawer:main temp.count_suffix set value "k"





execute if score #count_display simpledrawer.math matches 1000000..9999999 run scoreboard players operation #number simpledrawer.math /= #10000 simpledrawer.math
execute if score #count_display simpledrawer.math matches 1000000..9999999 run scoreboard players operation #count_int simpledrawer.math = #number simpledrawer.math
execute if score #count_display simpledrawer.math matches 1000000..9999999 run scoreboard players operation #count_int simpledrawer.math /= #100 simpledrawer.math

execute if score #count_display simpledrawer.math matches 1000000..9999999 store result storage simpledrawer:main temp.count_int int 1 run scoreboard players get #count_int simpledrawer.math

execute if score #count_display simpledrawer.math matches 1000000..9999999 run scoreboard players operation #count_int simpledrawer.math *= #100 simpledrawer.math
execute if score #count_display simpledrawer.math matches 1000000..9999999 run scoreboard players operation #number simpledrawer.math -= #count_int simpledrawer.math
# Number is now between 0 and 99

execute if score #count_display simpledrawer.math matches 1000000..9999999 store result storage simpledrawer:main temp.count_reminder int 1 run scoreboard players get #number simpledrawer.math

# Add zeros if needed
execute if score #count_display simpledrawer.math matches 1000000..9999999 if score #number simpledrawer.math matches 0..9 run data modify storage simpledrawer:main temp.dot set value ".0"

execute if score #count_display simpledrawer.math matches 1000000..9999999 run data modify storage simpledrawer:main temp.count_suffix set value "M"





execute if score #count_display simpledrawer.math matches 10000000..99999999 run scoreboard players operation #number simpledrawer.math /= #100000 simpledrawer.math
execute if score #count_display simpledrawer.math matches 10000000..99999999 run scoreboard players operation #count_int simpledrawer.math = #number simpledrawer.math
execute if score #count_display simpledrawer.math matches 10000000..99999999 run scoreboard players operation #count_int simpledrawer.math /= #10 simpledrawer.math

execute if score #count_display simpledrawer.math matches 10000000..99999999 store result storage simpledrawer:main temp.count_int int 1 run scoreboard players get #count_int simpledrawer.math

execute if score #count_display simpledrawer.math matches 10000000..99999999 run scoreboard players operation #count_int simpledrawer.math *= #10 simpledrawer.math
execute if score #count_display simpledrawer.math matches 10000000..99999999 run scoreboard players operation #number simpledrawer.math -= #count_int simpledrawer.math
# Number is now between 0 and 9

execute if score #count_display simpledrawer.math matches 10000000..99999999 store result storage simpledrawer:main temp.count_reminder int 1 run scoreboard players get #number simpledrawer.math

# Add zeros if needed
# no need to add them

execute if score #count_display simpledrawer.math matches 10000000..99999999 run data modify storage simpledrawer:main temp.count_suffix set value "M"





execute if score #count_display simpledrawer.math matches 100000000..999999999 run scoreboard players operation #number simpledrawer.math /= #1000000 simpledrawer.math
execute if score #count_display simpledrawer.math matches 100000000..999999999 run scoreboard players operation #count_int simpledrawer.math = #number simpledrawer.math

execute if score #count_display simpledrawer.math matches 100000000..999999999 store result storage simpledrawer:main temp.count_int int 1 run scoreboard players get #count_int simpledrawer.math

execute if score #count_display simpledrawer.math matches 100000000..999999999 run data modify storage simpledrawer:main temp.dot set value ""
execute if score #count_display simpledrawer.math matches 100000000..999999999 run data modify storage simpledrawer:main temp.count_reminder set value ""
execute if score #count_display simpledrawer.math matches 100000000..999999999 run data modify storage simpledrawer:main temp.count_suffix set value "M"






execute if score #count_display simpledrawer.math matches 1000000000.. run scoreboard players operation #number simpledrawer.math /= #10000000 simpledrawer.math
execute if score #count_display simpledrawer.math matches 1000000000.. run scoreboard players operation #count_int simpledrawer.math = #number simpledrawer.math
execute if score #count_display simpledrawer.math matches 1000000000.. run scoreboard players operation #count_int simpledrawer.math /= #100 simpledrawer.math

execute if score #count_display simpledrawer.math matches 1000000000.. store result storage simpledrawer:main temp.count_int int 1 run scoreboard players get #count_int simpledrawer.math

execute if score #count_display simpledrawer.math matches 1000000000.. run scoreboard players operation #count_int simpledrawer.math *= #100 simpledrawer.math
execute if score #count_display simpledrawer.math matches 1000000000.. run scoreboard players operation #number simpledrawer.math -= #count_int simpledrawer.math
# Number is now between 0 and 99

execute if score #count_display simpledrawer.math matches 1000000000.. store result storage simpledrawer:main temp.count_reminder int 1 run scoreboard players get #number simpledrawer.math

# Add zeros if needed
execute if score #count_display simpledrawer.math matches 1000000000.. if score #number simpledrawer.math matches 0..9 run data modify storage simpledrawer:main temp.dot set value ".0"

execute if score #count_display simpledrawer.math matches 1000000000.. run data modify storage simpledrawer:main temp.count_suffix set value "B"



#@aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa



#
# Inputs : score #maxCount_display simpledrawer.math
# Outputs : update text_display json component

# Only 3 digits are displayed

scoreboard players operation #number simpledrawer.math = #maxCount_display simpledrawer.math
data modify storage simpledrawer:main temp.maxdot set value "."

execute if score #maxCount_display simpledrawer.math matches ..999 store result storage simpledrawer:main temp.maxcount_int int 1 run scoreboard players get #number simpledrawer.math
execute if score #maxCount_display simpledrawer.math matches ..999 run data modify storage simpledrawer:main temp.maxdot set value ""
execute if score #maxCount_display simpledrawer.math matches ..999 run data modify storage simpledrawer:main temp.maxcount_reminder set value ""
execute if score #maxCount_display simpledrawer.math matches ..999 run data modify storage simpledrawer:main temp.maxcount_suffix set value ""





execute if score #maxCount_display simpledrawer.math matches 1000..9999 run scoreboard players operation #number simpledrawer.math /= #10 simpledrawer.math
execute if score #maxCount_display simpledrawer.math matches 1000..9999 run scoreboard players operation #count_int simpledrawer.math = #number simpledrawer.math
execute if score #maxCount_display simpledrawer.math matches 1000..9999 run scoreboard players operation #count_int simpledrawer.math /= #100 simpledrawer.math

execute if score #maxCount_display simpledrawer.math matches 1000..9999 store result storage simpledrawer:main temp.maxcount_int int 1 run scoreboard players get #count_int simpledrawer.math

execute if score #maxCount_display simpledrawer.math matches 1000..9999 run scoreboard players operation #count_int simpledrawer.math *= #100 simpledrawer.math
execute if score #maxCount_display simpledrawer.math matches 1000..9999 run scoreboard players operation #number simpledrawer.math -= #count_int simpledrawer.math
# Number is now between 0 and 99

execute if score #maxCount_display simpledrawer.math matches 1000..9999 store result storage simpledrawer:main temp.maxcount_reminder int 1 run scoreboard players get #number simpledrawer.math

# Add zeros if needed
execute if score #maxCount_display simpledrawer.math matches 1000..9999 if score #number simpledrawer.math matches 0..9 run data modify storage simpledrawer:main temp.maxdot set value ".0"

execute if score #maxCount_display simpledrawer.math matches 1000..9999 run data modify storage simpledrawer:main temp.maxcount_suffix set value "k"




execute if score #maxCount_display simpledrawer.math matches 10000..99999 run scoreboard players operation #number simpledrawer.math /= #100 simpledrawer.math
execute if score #maxCount_display simpledrawer.math matches 10000..99999 run scoreboard players operation #count_int simpledrawer.math = #number simpledrawer.math
execute if score #maxCount_display simpledrawer.math matches 10000..99999 run scoreboard players operation #count_int simpledrawer.math /= #10 simpledrawer.math

execute if score #maxCount_display simpledrawer.math matches 10000..99999 store result storage simpledrawer:main temp.maxcount_int int 1 run scoreboard players get #count_int simpledrawer.math

execute if score #maxCount_display simpledrawer.math matches 10000..99999 run scoreboard players operation #count_int simpledrawer.math *= #10 simpledrawer.math
execute if score #maxCount_display simpledrawer.math matches 10000..99999 run scoreboard players operation #number simpledrawer.math -= #count_int simpledrawer.math
# Number is now between 0 and 9

execute if score #maxCount_display simpledrawer.math matches 10000..99999 store result storage simpledrawer:main temp.maxcount_reminder int 1 run scoreboard players get #number simpledrawer.math

# Add zeros if needed
# no need to add them

execute if score #maxCount_display simpledrawer.math matches 10000..99999 run data modify storage simpledrawer:main temp.maxcount_suffix set value "k"




execute if score #maxCount_display simpledrawer.math matches 100000..999999 run scoreboard players operation #number simpledrawer.math /= #1000 simpledrawer.math
execute if score #maxCount_display simpledrawer.math matches 100000..999999 run scoreboard players operation #count_int simpledrawer.math = #number simpledrawer.math

execute if score #maxCount_display simpledrawer.math matches 100000..999999 store result storage simpledrawer:main temp.maxcount_int int 1 run scoreboard players get #count_int simpledrawer.math

execute if score #maxCount_display simpledrawer.math matches 100000..999999 run data modify storage simpledrawer:main temp.maxdot set value ""
execute if score #maxCount_display simpledrawer.math matches 100000..999999 run data modify storage simpledrawer:main temp.maxcount_reminder set value ""
execute if score #maxCount_display simpledrawer.math matches 100000..999999 run data modify storage simpledrawer:main temp.maxcount_suffix set value "k"





execute if score #maxCount_display simpledrawer.math matches 1000000..9999999 run scoreboard players operation #number simpledrawer.math /= #10000 simpledrawer.math
execute if score #maxCount_display simpledrawer.math matches 1000000..9999999 run scoreboard players operation #count_int simpledrawer.math = #number simpledrawer.math
execute if score #maxCount_display simpledrawer.math matches 1000000..9999999 run scoreboard players operation #count_int simpledrawer.math /= #100 simpledrawer.math

execute if score #maxCount_display simpledrawer.math matches 1000000..9999999 store result storage simpledrawer:main temp.maxcount_int int 1 run scoreboard players get #count_int simpledrawer.math

execute if score #maxCount_display simpledrawer.math matches 1000000..9999999 run scoreboard players operation #count_int simpledrawer.math *= #100 simpledrawer.math
execute if score #maxCount_display simpledrawer.math matches 1000000..9999999 run scoreboard players operation #number simpledrawer.math -= #count_int simpledrawer.math
# Number is now between 0 and 99

execute if score #maxCount_display simpledrawer.math matches 1000000..9999999 store result storage simpledrawer:main temp.maxcount_reminder int 1 run scoreboard players get #number simpledrawer.math

# Add zeros if needed
execute if score #maxCount_display simpledrawer.math matches 1000000..9999999 if score #number simpledrawer.math matches 0..9 run data modify storage simpledrawer:main temp.maxdot set value ".0"

execute if score #maxCount_display simpledrawer.math matches 1000000..9999999 run data modify storage simpledrawer:main temp.maxcount_suffix set value "M"





execute if score #maxCount_display simpledrawer.math matches 10000000..99999999 run scoreboard players operation #number simpledrawer.math /= #100000 simpledrawer.math
execute if score #maxCount_display simpledrawer.math matches 10000000..99999999 run scoreboard players operation #count_int simpledrawer.math = #number simpledrawer.math
execute if score #maxCount_display simpledrawer.math matches 10000000..99999999 run scoreboard players operation #count_int simpledrawer.math /= #10 simpledrawer.math

execute if score #maxCount_display simpledrawer.math matches 10000000..99999999 store result storage simpledrawer:main temp.maxcount_int int 1 run scoreboard players get #count_int simpledrawer.math

execute if score #maxCount_display simpledrawer.math matches 10000000..99999999 run scoreboard players operation #count_int simpledrawer.math *= #10 simpledrawer.math
execute if score #maxCount_display simpledrawer.math matches 10000000..99999999 run scoreboard players operation #number simpledrawer.math -= #count_int simpledrawer.math
# Number is now between 0 and 9

execute if score #maxCount_display simpledrawer.math matches 10000000..99999999 store result storage simpledrawer:main temp.maxcount_reminder int 1 run scoreboard players get #number simpledrawer.math

# Add zeros if needed
# no need to add them

execute if score #maxCount_display simpledrawer.math matches 10000000..99999999 run data modify storage simpledrawer:main temp.maxcount_suffix set value "M"





execute if score #maxCount_display simpledrawer.math matches 100000000..999999999 run scoreboard players operation #number simpledrawer.math /= #1000000 simpledrawer.math
execute if score #maxCount_display simpledrawer.math matches 100000000..999999999 run scoreboard players operation #count_int simpledrawer.math = #number simpledrawer.math

execute if score #maxCount_display simpledrawer.math matches 100000000..999999999 store result storage simpledrawer:main temp.maxcount_int int 1 run scoreboard players get #count_int simpledrawer.math

execute if score #maxCount_display simpledrawer.math matches 100000000..999999999 run data modify storage simpledrawer:main temp.maxdot set value ""
execute if score #maxCount_display simpledrawer.math matches 100000000..999999999 run data modify storage simpledrawer:main temp.maxcount_reminder set value ""
execute if score #maxCount_display simpledrawer.math matches 100000000..999999999 run data modify storage simpledrawer:main temp.maxcount_suffix set value "M"






execute if score #maxCount_display simpledrawer.math matches 1000000000.. run scoreboard players operation #number simpledrawer.math /= #10000000 simpledrawer.math
execute if score #maxCount_display simpledrawer.math matches 1000000000.. run scoreboard players operation #count_int simpledrawer.math = #number simpledrawer.math
execute if score #maxCount_display simpledrawer.math matches 1000000000.. run scoreboard players operation #count_int simpledrawer.math /= #100 simpledrawer.math

execute if score #maxCount_display simpledrawer.math matches 1000000000.. store result storage simpledrawer:main temp.maxcount_int int 1 run scoreboard players get #count_int simpledrawer.math

execute if score #maxCount_display simpledrawer.math matches 1000000000.. run scoreboard players operation #count_int simpledrawer.math *= #100 simpledrawer.math
execute if score #maxCount_display simpledrawer.math matches 1000000000.. run scoreboard players operation #number simpledrawer.math -= #count_int simpledrawer.math
# Number is now between 0 and 99

execute if score #maxCount_display simpledrawer.math matches 1000000000.. store result storage simpledrawer:main temp.maxcount_reminder int 1 run scoreboard players get #number simpledrawer.math

# Add zeros if needed
execute if score #maxCount_display simpledrawer.math matches 1000000000.. if score #number simpledrawer.math matches 0..9 run data modify storage simpledrawer:main temp.maxdot set value ".0"

execute if score #maxCount_display simpledrawer.math matches 1000000000.. run data modify storage simpledrawer:main temp.maxcount_suffix set value "B"





scoreboard players set simpledrawer load.status 0
schedule clear simpledrawer:8tick
schedule clear simpledrawer:tick

scoreboard objectives remove simpledrawer.drawer.Count
scoreboard objectives remove simpledrawer.drawer.maxCount
scoreboard objectives remove simpledrawer.id
scoreboard objectives remove simpledrawer.io
scoreboard objectives remove simpledrawer.math

data remove storage simpledrawer:main temp
data remove storage simpledrawer:main ItemsNBT
data remove storage simpledrawer:main drawer_type
data remove storage simpledrawer:io input
data remove storage simpledrawer:io output
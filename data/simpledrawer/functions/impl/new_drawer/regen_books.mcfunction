
execute if block ~ ~ ~ chiseled_bookshelf[facing=north] run function simpledrawer:impl/new_drawer/rengen_books/north
execute if block ~ ~ ~ chiseled_bookshelf[facing=south] run function simpledrawer:impl/new_drawer/rengen_books/south
execute if block ~ ~ ~ chiseled_bookshelf[facing=west] run function simpledrawer:impl/new_drawer/rengen_books/west
execute if block ~ ~ ~ chiseled_bookshelf[facing=east] run function simpledrawer:impl/new_drawer/rengen_books/east

#Generate identification number for drawer
data modify storage simpledrawer:main temp.drawer_book set value {id:"minecraft:book",Count:1b,tag:{simpledrawer:{drawer_book:1b,drawer_id:0}}}

execute store result storage simpledrawer:main temp.drawer_book.tag.simpledrawer.drawer_id int 1 run scoreboard players get @s simpledrawer.id

data modify storage simpledrawer:main temp.drawer_book.Slot set value 0b
data modify block ~ ~ ~ Items append from storage simpledrawer:main temp.drawer_book

data modify storage simpledrawer:main temp.drawer_book.Slot set value 1b
data modify block ~ ~ ~ Items append from storage simpledrawer:main temp.drawer_book

data modify storage simpledrawer:main temp.drawer_book.Slot set value 2b
data modify block ~ ~ ~ Items append from storage simpledrawer:main temp.drawer_book

data modify storage simpledrawer:main temp.drawer_book.Slot set value 3b
data modify block ~ ~ ~ Items append from storage simpledrawer:main temp.drawer_book

data modify storage simpledrawer:main temp.drawer_book.Slot set value 4b
data modify block ~ ~ ~ Items append from storage simpledrawer:main temp.drawer_book

data modify storage simpledrawer:main temp.drawer_book.Slot set value 5b
data modify block ~ ~ ~ Items append from storage simpledrawer:main temp.drawer_book


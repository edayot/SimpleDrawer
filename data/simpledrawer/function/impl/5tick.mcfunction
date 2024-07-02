execute 
    as @a at @s 
    if predicate simpledrawer:impl/sneaking 
    positioned ~ ~1.5 ~
    positioned ^ ^ ^2 
    as @e[tag=simpledrawer.new_drawer.base,limit=1,sort=nearest,distance=..3,predicate=simpledrawer:impl/test_version] 
    run function simpledrawer:impl/new_drawer/base_display_noformat

schedule function simpledrawer:impl/5tick 5t replace

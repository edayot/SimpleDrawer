
execute if entity @s[tag=simpledrawer.new_drawer.to_update] if entity @a[distance=..15] run function simpledrawer:impl/new_drawer/base_display_rup

execute if entity @s[predicate=!simpledrawer:impl/test_version] run function simpledrawer:impl/new_drawer/test_version
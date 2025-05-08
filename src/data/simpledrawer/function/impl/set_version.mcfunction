scoreboard players operation simpledrawer.major load.status = #simpledrawer.major load.status
scoreboard players operation simpledrawer.minor load.status = #simpledrawer.minor load.status
scoreboard players operation simpledrawer.patch load.status = #simpledrawer.patch load.status
            

major, minor, patch = ctx.project_version.split('.')
data modify storage simpledrawer:main version set value {"major": int(major), "minor": int(minor), "patch": int(patch)}

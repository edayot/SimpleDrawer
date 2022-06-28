
for i in range(0,4*9):
	function="""
data remove storage simpledrawer:io input
data modify storage simpledrawer:io input set from storage simpledrawer:main temp.ItemPlayer[{Slot:aBab}]
function simpledrawer:drawer/working/input
execute if score #success simpledrawer.io matches 1 run item modify entity @p[tag=simpledrawer.adder] container.aBa simpledrawer:set_count_output
execute if score #success simpledrawer.io matches 1 run scoreboard players set #already simpledrawer.math 1
"""
	function=function.replace("aBa",str(i))
	#write function to file
	with open(str(i)+".mcfunction","w") as f:
		f.write(function)
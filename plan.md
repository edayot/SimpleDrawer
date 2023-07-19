

# DataTypes
## ItemLink
ItemLink are all that define a Item and there entities that represent it
```
<ItemLink>={
    Item:{<Actual item data>},
    Entities:{
        Interaction:<UUID>,
        ItemDisplay:<UUID>,
        TextDisplay:<UUID>
    }
}

```
## UUID
Actual Minecraft entity UUID, a list of 4 32-bit integer

## material
All material that are available in simpledrawer
```
<material_list>=[
    {id:"wood", maxCount:256},
    {id:"iron", maxCount:2048},
    {id:"gold", maxCount:8192},
    {id:"diamond", maxCount:65536},
    {id:"star", maxCount:1048576},
    {id:"netherite", maxCount:1073741824},

]
```



## Drawer entity NBT (minecraft:item_display)
The actual entity that stock all the drawer data and items, also the simpledrawer namespace is identical as it is in the item form of the drawer, all information stored in it can describe all the drawer data
```
{
    data:{
        simpledrawer:{
            Items:[
                <ItemLink>,(...)
            ],
            type:<material>,
            hopper:<bool>
        }
    }
}
```
# Entities
## Interaction entity NBT (minecraft:interaction)
The entity that record all interaction made by the player to it (JE 1.19.4)

Basicly all entities know each other in case we need to. To make glow the item display if you look at it of appear new text. They also all know the base. They know themself but it will not be used in pratice.
```
{
    data:{
        simpledrawer:{
            DrawerEntity:<UUID>,
            Interaction:<UUID>,
            ItemDisplay:<UUID>,
            TextDisplay:<UUID>
        }
    }
}
```
## Item display entity NBT (minecraft:item_display)
The entity that display the item as it is in the gui by changing the thickness to near 0 to be flat on the block
```
{
    data:{
        simpledrawer:{
            DrawerEntity:<UUID>,
            Interaction:<UUID>,
            ItemDisplay:<UUID>,
            TextDisplay:<UUID>
        }
    }
}
```


## Text Display entity NBT (minecraft:text_display)
The entity that will display the count of the entity.
```
{
    data:{
        simpledrawer:{
            DrawerEntity:<UUID>,
            Interaction:<UUID>,
            ItemDisplay:<UUID>,
            TextDisplay:<UUID>
        }
    }
}
```


# Uses
## UUID
To search for UUID, we do a modification of the origin to a fixed entity to execute to a custom UUID : 
```mcfunction
data modify entity <fixed-uuid> Thrower set from entity @s data.simpledrawer.<a-entity>
execute as <fixe-uuid> on origin run function (...)
```
## ItemIO compatibility
We just generate the Items list dynamicly and do what ItemIO do for input and output like normal drawer.

## Texture trims
Texture will be made with new overrides 
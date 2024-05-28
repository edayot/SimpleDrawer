from beet import Context, Font, Texture, LootTable
from model_resolver import beet_default as model_resolver

from dataclasses import dataclass, field
from typing import Optional
from enum import Enum
from PIL import Image, ImageDraw, ImageFont
import json

PAGE_NUMBER = 1
def page_number():
    global PAGE_NUMBER
    PAGE_NUMBER += 1
    return PAGE_NUMBER

class Lang(Enum):
    en_us = "en_us"
    fr_fr = "fr_fr"

    @property
    def namespaced(self):
        return f"simpledrawer:{self.value}"


TranslatedString = tuple[str, dict[Lang, str]]


REGISTRY : dict[str, "Item"] = {}

@dataclass
class Item:
    model: str
    minimal_representation: str
    page_name : Optional[TranslatedString] = None
    description: Optional[TranslatedString] = None
    page_index: int = field(default_factory=page_number)
    add_space_to_page_name: bool = False

    def __post_init__(self):
        REGISTRY[self.model] = self


def get_pos(i: int, j: int):
    if i == 0:
        if j == 0:
            return (24, 24)
        elif j == 1:
            return (96, 24)
        elif j == 2:
            return (168, 24)
    elif i == 1:
        if j == 0:
            return (24, 96)
        elif j == 1:
            return (96, 96)
        elif j == 2:
            return (168, 96)
    elif i == 2:
        if j == 0:
            return (24, 168)
        elif j == 1:
            return (96, 168)
        elif j == 2:
            return (168, 168)
    raise ValueError("Invalid i,j values")

def image_count(count: int) -> Image:
	""" Generate an image showing the result count
	Args:
		count (int): The count to show
	Returns:
		Image: The image with the count
	"""
	# Create the image
	size = 64
	img = Image.new("RGBA", (size, size), (0, 0, 0, 0))
	draw = ImageDraw.Draw(img)
	font_size = 24
	font = ImageFont.truetype(f"./images/minecraft_font.ttf", size = font_size)

	# Calculate text size and positions of the two texts
	text_width = draw.textlength(str(count), font = font)
	text_height = font_size + 6
	pos_1 = (size-text_width), (size-text_height)
	pos_2 = (pos_1[0]-2, pos_1[1]-2)
	
	# Draw the count
	draw.text(pos_1, str(count), (50, 50, 50), font = font)
	draw.text(pos_2, str(count), (255, 255, 255), font = font)
	return img



def add_page(ctx: Context, craft: list[list[Item]], result: Item, count: int):
    # Create a font for the page
    font_path = f'simpledrawer:pages/{result.page_index}'
    if not font_path in ctx.assets.fonts:
        ctx.assets.fonts[font_path] = Font({
            "providers": [
            {
                "type": "reference",
                "id": "minecraft:include/space"
            },
            { "type": "bitmap", "file": "simpledrawer:item/font/none_2_release.png",				"ascent": 7, "height": 8, "chars": ["\uef00"] },
            { "type": "bitmap", "file": "simpledrawer:item/font/none_3_release.png",				"ascent": 7, "height": 8, "chars": ["\uef01"] },
            { "type": "bitmap", "file": "simpledrawer:item/font/none_4_release.png",				"ascent": 7, "height": 8, "chars": ["\uef02"] },
            { "type": "bitmap", "file": "simpledrawer:item/font/none_5_release.png",				"ascent": 7, "height": 8, "chars": ["\uef03"] },
            { "type": "bitmap", "file": "simpledrawer:item/font/template_craft.png",				"ascent": -3, "height": 68, "chars": ["\uef13"] },
	        { "type": "bitmap", "file": "simpledrawer:item/font/template_result.png",				"ascent": -20, "height": 34, "chars": ["\uef14"] },
            ],
        })

    page = [""]
    page.append({
        "translate": result.page_name[0],
        "font":"simpledrawer:medium",
        "color":"black"
    })
    if result.add_space_to_page_name:
        page.append("\n")
    page.append({
        "text":f"\n\uef13 \uef14\n",
        "font":font_path,
        "color":"white"
    })
    page.append("\n")
    char_init = 0xff01 + 12*result.page_index
    for i in range(3):
        for e in range(2):
            page.append({"text":"\uef00\uef00","font":font_path,"color":"white"})
            for j in range(3):
                char_item = char_init
                char_item = f"\\u{char_item:04x}".encode().decode("unicode_escape")
                char_init += 1
                item = craft[i][j]
                render = f"simpledrawer:render/{item.model.replace(':','/')}" if item is not None else "simpledrawer:render/minecraft/block/air"

                # create a char for the item
                if e == 0:
                    ctx.assets.fonts[font_path].data["providers"].append(
                        {
                            "type": "bitmap",
                            "file": f"{render}.png",
                            "ascent": {0: 8, 1: 7, 2: 6}.get(i),
                            "height": 16,
                            "chars": [char_item]
                        }
                    )
                page.append(get_item_json(item, font_path, f'\uef03{char_item}\uef03' if e == 0 else "\uef01"))
            if (i == 0 and e == 1) or (i == 1 and e == 1) or (i == 2 and e == 0):
                page.append({"text":"\uef00\uef00\uef00\uef00","font":font_path,"color":"white"})
                page.append(get_item_json(result, font_path, "\uef02\uef02"))
            if i == 1 and e == 0:
                page.append({"text":"\uef00\uef00\uef00\uef00","font":font_path,"color":"white"})
                char_result = char_init
                char_result = f"\\u{char_result:04x}".encode().decode("unicode_escape")
                char_init += 1
                render_result = f"simpledrawer:render/{result.model.replace(':','/')}"
                ctx.assets.fonts[font_path].data["providers"].append(
                    {
                        "type": "bitmap",
                        "file": f"{render_result}.png",
                        "ascent": 8,
                        "height": 16,
                        "chars": [char_result]
                    }
                )
                char_space = "\uef00\uef00\uef03"
                page.append(get_item_json(result, font_path, f'{char_space}{char_result}{char_space}\uef00'))
            page.append("\n")
    if result.description is not None:
        page.append("\n")
        page.append({
            "translate": result.description[0],
            "color":"black",
            "italic":False
        })
    return json.dumps(page)
            
            



def get_item_json(item: Item | None, font_path: str, char : str = "\uef01"):
    if item is None:
        return {
            "text":char,
            "font":font_path,
            "color":"white"
        }
    if item.page_index == -1:
        return {
            "text":char,
            "font":font_path,
            "color":"white",
            "hoverEvent":{"action":"show_item","contents": item.minimal_representation}
        }
    return {
        "text":char,
        "font":font_path,
        "color":"white",
        "hoverEvent":{"action":"show_item","contents": item.minimal_representation},
        "clickEvent":{"action":"change_page","value":f"{item.page_index}"}
    }


def create_loot_table(ctx: Context, pages: list[str]):
    loot_table = {
        "pools": [
            {
                "rolls": 1,
                "entries": [
                    {
                        "type": "minecraft:item",
                        "name": "minecraft:written_book",
                        "functions": [
                            {
                                "function": "minecraft:set_components",
                                "components": {
                                    "minecraft:written_book_content": {
                                        "title": "Guide",
                                        "author": "AirDox_",
                                        "pages": pages,
                                        "resolved": True
                                    }
                                }
                            }
                        ]
                    }
                ]
            }
        ]
    }
    ctx.data.loot_tables[f"simpledrawer:v{ctx.project_version}/items/guide"] = LootTable(loot_table)




def beet_default(ctx: Context):

    # 1. Construct all needed renders, add them to the ctx    
    air = Item(
        model="minecraft:block/air",
        minimal_representation={"id":"minecraft:air"},
        page_index=-1
    )
    stick = Item(
        model="minecraft:item/stick",
        minimal_representation={"id":"minecraft:stick"},
        page_index=-1
    )
    barrel = Item(
        model="minecraft:item/barrel",
        minimal_representation={"id":"minecraft:barrel"},
        page_index=-1
    )
    oak_planks = Item(
        model="minecraft:item/oak_planks",
        minimal_representation={"id":"minecraft:oak_planks"},
        page_index=-1
    )
    iron_nugget = Item(
        model="minecraft:item/iron_nugget",
        minimal_representation={"id":"minecraft:iron_nugget"},
        page_index=-1
    )
    iron_ingot = Item(
        model="minecraft:item/iron_ingot",
        minimal_representation={"id":"minecraft:iron_ingot"},
        page_index=-1
    )
    diamond = Item(
        model="minecraft:item/diamond",
        minimal_representation={"id":"minecraft:diamond"},
        page_index=-1
    )
    nether_star = Item(
        model="minecraft:item/nether_star",
        minimal_representation={"id":"minecraft:nether_star"},
        page_index=-1
    )
    netherite_ingot = Item(
        model="minecraft:item/netherite_ingot",
        minimal_representation={"id":"minecraft:netherite_ingot"},
        page_index=-1
    )
    redstone = Item(
        model="minecraft:item/redstone",
        minimal_representation={"id":"minecraft:redstone"},
        page_index=-1
    )
    hopper = Item(
        model="minecraft:item/hopper",
        minimal_representation={"id":"minecraft:hopper"},
        page_index=-1
    )
    crafting_table = Item(
        model="minecraft:item/crafting_table",
        minimal_representation={"id":"minecraft:crafting_table"},
        page_index=-1
    )
    oak_log = Item(
        model="minecraft:item/oak_log",
        minimal_representation={"id":"minecraft:oak_log"},
        page_index=-1
    )
    smooth_stone = Item(
        model="minecraft:item/smooth_stone",
        minimal_representation={"id":"minecraft:smooth_stone"},
        page_index=-1
    )
    gold_ingot = Item(
        model="minecraft:item/gold_ingot",
        minimal_representation={"id":"minecraft:gold_ingot"},
        page_index=-1
    )
    book = Item(
        model="minecraft:item/book",
        minimal_representation={"id":"minecraft:book"},
        page_index=-1
    )
    chest = Item(
        model="minecraft:item/chest",
        minimal_representation={"id":"minecraft:chest"},
        page_index=-1
    )
    crafting_table = Item(
        model="minecraft:item/crafting_table",
        minimal_representation={"id":"minecraft:crafting_table"},
        page_index=-1
    )
    piston = Item(
        model="minecraft:item/piston",
        minimal_representation={"id":"minecraft:piston"},
        page_index=-1
    )
    smooth_stone = Item(
        model="minecraft:item/smooth_stone",
        minimal_representation={"id":"minecraft:smooth_stone"},
        page_index=-1
    )

    heavy_workbench = Item(
        model="smithed.crafter:block/table",
        minimal_representation={
            "id":"minecraft:furnace",
            "components": {
                "minecraft:item_name": json.dumps({"translate":"block.smithed.crafter"})
            }
            },
        page_name=("block.smithed.crafter",{}),
        description=("simpledrawer.guide.heavy_workbench",{}),
        add_space_to_page_name=True
    )
    new_drawer = Item(
        model="simpledrawer:block/new_drawer/oak_full_drawers_1",
        minimal_representation={
            "id":"minecraft:furnace",
            "components": {
                "minecraft:item_name": json.dumps({"translate":"simpledrawer.new_drawer.empty"})
            }
        },
        page_name=("simpledrawer.new_drawer.empty",{}),
        description=("simpledrawer.guide.new_drawer",{}),
        add_space_to_page_name=True
    )
    double_new_drawer = Item(
        model="simpledrawer:block/new_drawer/oak_full_drawers_2",
        minimal_representation={
            "id":"minecraft:furnace",
            "components": {
                "minecraft:item_name": json.dumps({"translate":"simpledrawer.double_new_drawer.empty"})
            }
        },
        page_name=("simpledrawer.double_new_drawer.empty",{}),
        description=("simpledrawer.guide.double_new_drawer",{}),
    )
    quadruple_new_drawer = Item(
        model="simpledrawer:block/new_drawer/oak_full_drawers_4",
        minimal_representation={
            "id":"minecraft:furnace",
            "components": {
                "minecraft:item_name": json.dumps({"translate":"simpledrawer.quadruple_new_drawer.empty"})
            }
        },
        page_name=("simpledrawer.quadruple_new_drawer.empty",{}),
        description=("simpledrawer.guide.quadruple_new_drawer",{}),
    )
    compacting_drawer = Item(
        model="simpledrawer:block/new_drawer/compdrawers_open1",
        minimal_representation={
            "id":"minecraft:furnace",
            "components": {
                "minecraft:item_name": json.dumps({"translate":"simpledrawer.compacting_new_drawer.empty"})
            }
        },
        page_name=("simpledrawer.compacting_new_drawer.empty",{}),
        description=("simpledrawer.guide.compacting_new_drawer",{}),
    )

    # 2. Add the filter to the model_resolver
    filter = REGISTRY.keys()
    ctx.meta["model_resolver"]["filter"] = filter
    model_resolver(ctx)
    # add a white point on the top left corner / bottom right corner
    for model in filter:
        path = f"simpledrawer:render/{model.replace(':','/')}"
        if not path in ctx.assets.textures:
            continue
        img = ctx.assets.textures[path].image
        img = img.copy()
        img.putpixel((0,0),(255,255,255,255))
        img.putpixel((img.width-1,img.height-1),(255,255,255,255))
        ctx.assets.textures[path] = Texture(img)

    # 3. Create the crafting recipes
    pages = ['[""]']
    craft=[
        [oak_log, oak_log, oak_log],
        [oak_log, crafting_table, oak_log],
        [smooth_stone, smooth_stone, smooth_stone]
    ]
    result = heavy_workbench
    count = 1
    pages.append(add_page(ctx, craft, result, count))

    craft=[
        [oak_planks, stick, oak_planks],
        [stick, iron_nugget, stick],
        [oak_planks, barrel, oak_planks]
    ]
    result = new_drawer
    count = 1
    pages.append(add_page(ctx, craft, result, count))

    craft=[
        [oak_planks, barrel, oak_planks],
        [stick, iron_nugget, stick],
        [oak_planks, barrel, oak_planks]
    ]
    craft_result=double_new_drawer
    count = 1
    pages.append(add_page(ctx, craft, craft_result, count))

    craft=[
        [oak_planks, barrel, oak_planks],
        [barrel, iron_nugget, barrel],
        [oak_planks, barrel, oak_planks]
    ]
    craft_result=quadruple_new_drawer
    count = 1
    pages.append(add_page(ctx, craft, craft_result, count))

    craft=[
        [smooth_stone,crafting_table,smooth_stone],
        [piston,new_drawer,piston],
        [smooth_stone,iron_ingot,smooth_stone]
    ]
    craft_result=compacting_drawer
    count = 1
    pages.append(add_page(ctx, craft, craft_result, count))



    # print(pages)
    # 4. Create the loot table
    create_loot_table(ctx, pages)


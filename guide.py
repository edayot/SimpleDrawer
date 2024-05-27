from beet import Context, Font, Texture, LootTable
from model_resolver import beet_default as model_resolver

from dataclasses import dataclass, field
from typing import Optional
from enum import Enum
from PIL import Image, ImageDraw, ImageFont
import json

PAGE_NUMBER = 0
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


def create_crafting_image(ctx: Context, craft: list[list[Item]]):
    # Create a 256x256 image based on the craft
    img_base : Image.Image = ctx.assets.textures["simpledrawer:item/font/template_craft"].image
    img = img_base.copy()
    for i, row in enumerate(craft):
        for j, item in enumerate(row):
            path = f"simpledrawer:render/{item.model.replace(':','/')}" 
            img_item = ctx.assets.textures[path].image
            pos_img = get_pos(i,j)
            img.paste(img_item, pos_img, img_item)
    return img

def create_result_image(ctx: Context, result: Item, count: int = 1):
    img_base : Image.Image = ctx.assets.textures["simpledrawer:item/font/template_result"].image
    img = img_base.copy()
    path = f"simpledrawer:render/{result.model.replace(':','/')}"
    img_item = ctx.assets.textures[path].image
    img.paste(img_item, (32, 32), img_item)
    if count > 1:
        img_count = image_count(count)
        img.paste(img_count, (36, 32), img_count)
    return img



def add_page(ctx: Context, craft: list[list[Item]], result: Item, count: int):
    craft_img = create_crafting_image(ctx, craft)
    result_img = create_result_image(ctx, result, count)

    craft_texture_path = f"simpledrawer:item/pages/{result.page_name[0]}_craft"
    result_texture_path = f"simpledrawer:item/pages/{result.page_name[0]}_result"
    ctx.assets.textures[craft_texture_path] = Texture(craft_img)
    ctx.assets.textures[result_texture_path] = Texture(result_img)
    # Create a font for the page
    font_path = f'simpledrawer:pages'
    if not font_path in ctx.assets.fonts:
        print("Creating font")
        ctx.assets.fonts[font_path] = Font({
            "providers": [
            {
                "type": "reference",
                "id": "minecraft:include/space"
            },
            { "type": "bitmap", "file": "simpledrawer:item/font/none_2_release.png",				"ascent": 7, "height": 8, "chars": ["\uef00"] },
            { "type": "bitmap", "file": "simpledrawer:item/font/none_3_release.png",				"ascent": 7, "height": 8, "chars": ["\uef01"] },
            { "type": "bitmap", "file": "simpledrawer:item/font/none_4_release.png",				"ascent": 7, "height": 8, "chars": ["\uef02"] },
            ],
        })
    
    # generate the char index for the page
    # page 1 : \uff01, \uff02
    # page 2 : \uff03, \uff04
    # ...

    char_craft = 0xff01 + 2*result.page_index
    char_result = 0xff02 + 2*result.page_index
    char_craft = f'\\u{char_craft:04x}'
    char_result = f'\\u{char_result:04x}'
    char_craft = char_craft.encode().decode("unicode_escape")
    char_result = char_result.encode().decode("unicode_escape")


    ctx.assets.fonts[font_path].data["providers"].append({
        "type": "bitmap",
        "file": f'{craft_texture_path}.png',
        "ascent": -3,
        "height": 68,
        "chars": [char_craft]
    })
    ctx.assets.fonts[font_path].data["providers"].append({
        "type": "bitmap",
        "file": f'{result_texture_path}.png',
        "ascent": -20,
        "height": 34,
        "chars": [char_result]
    })
    
    page = [""]
    page.append({
        "translate": result.page_name[0],
        "font":"simpledrawer:medium",
        "color":"black"
    })
    page.append({
        "text":f"\n{char_craft} {char_result}\n\n",
        "font":font_path,
        "color":"white"
    })

    for i in range(6):
        real_i=i//2
        page.append({"text":"\uef00\uef00","font":font_path,"color":"white"})
        for j in range(3):
            item = craft[real_i][j]
            page.append(get_item_json(item))
        if i in [1,2,3,4]:
            page.append({"text":"\uef00\uef00\uef00\uef00","font":font_path,"color":"white"})
            page.append(get_item_json(result))
        page.append("\n")
    
    if result.description is not None:
        page.append("\n")
        page.append({
            "translate": result.description[0],
            "color":"black",
            "italic":False
        })
    return json.dumps(page)
            
            



def get_item_json(item: Item | None, font_path: str = "simpledrawer:pages"):
    if item is None:
        return {
            "text":"\uef01",
            "font":font_path,
            "color":"white"
        }
    if item.page_index == -1:
        return {
            "text":"\uef01",
            "font":font_path,
            "color":"white",
            "hoverEvent":{"action":"show_item","contents": item.minimal_representation}
        }
    return {
        "text":"\uef01",
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
        minimal_representation={"id":"minecraft:furnace"},
        page_name=("block.smithed.crafter",{}),
        description=("simpledrawer.guide.heavy_workbench",{}),
    )
    new_drawer = Item(
        model="simpledrawer:block/new_drawer/oak_full_drawers_1",
        minimal_representation={"id":"minecraft:furnace"},
        page_name=("simpledrawer.new_drawer.empty",{}),
        description=("simpledrawer.guide.new_drawer",{}),
    )

    # 2. Add the filter to the model_resolver
    filter = REGISTRY.keys()
    ctx.meta["model_resolver"]["filter"] = filter
    model_resolver(ctx)

    # 3. Create the crafting recipes
    pages = []
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


    # print(pages)
    # 4. Create the loot table
    create_loot_table(ctx, pages)


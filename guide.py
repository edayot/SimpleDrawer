from beet import Context
from model_resolver import beet_default as model_resolver

from dataclasses import dataclass, field
from typing import Optional
from enum import Enum
from PIL import Image, ImageDraw, ImageFont

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


def beet_default(ctx: Context):

    # 1. Construct all needed renders, add them to the ctx    
    air = Item(
        model="minecraft:block/air",
        minimal_representation='{"id":"minecraft:air"}',
        page_index=-1
    )
    stick = Item(
        model="minecraft:item/stick",
        minimal_representation='{"id":"minecraft:stick"}',
        page_index=-1
    )
    barrel = Item(
        model="minecraft:item/barrel",
        minimal_representation='{"id":"minecraft:barrel"}',
        page_index=-1
    )
    oak_planks = Item(
        model="minecraft:item/oak_planks",
        minimal_representation='{"id":"minecraft:oak_planks"}',
        page_index=-1
    )
    iron_nugget = Item(
        model="minecraft:item/iron_nugget",
        minimal_representation='{"id":"minecraft:iron_nugget"}',
        page_index=-1
    )
    iron_ingot = Item(
        model="minecraft:item/iron_ingot",
        minimal_representation='{"id":"minecraft:iron_ingot"}',
        page_index=-1
    )
    diamond = Item(
        model="minecraft:item/diamond",
        minimal_representation='{"id":"minecraft:diamond"}',
        page_index=-1
    )
    nether_star = Item(
        model="minecraft:item/nether_star",
        minimal_representation='{"id":"minecraft:nether_star"}',
        page_index=-1
    )
    netherite_ingot = Item(
        model="minecraft:item/netherite_ingot",
        minimal_representation='{"id":"minecraft:netherite_ingot"}',
        page_index=-1
    )
    redstone = Item(
        model="minecraft:item/redstone",
        minimal_representation='{"id":"minecraft:redstone"}',
        page_index=-1
    )
    hopper = Item(
        model="minecraft:item/hopper",
        minimal_representation='{"id":"minecraft:hopper"}',
        page_index=-1
    )
    crafting_table = Item(
        model="minecraft:item/crafting_table",
        minimal_representation='{"id":"minecraft:crafting_table"}',
        page_index=-1
    )
    oak_log = Item(
        model="minecraft:item/oak_log",
        minimal_representation='{"id":"minecraft:oak_log"}',
        page_index=-1
    )
    smooth_stone = Item(
        model="minecraft:item/smooth_stone",
        minimal_representation='{"id":"minecraft:smooth_stone"}',
        page_index=-1
    )
    gold_ingot = Item(
        model="minecraft:item/gold_ingot",
        minimal_representation='{"id":"minecraft:gold_ingot"}',
        page_index=-1
    )
    book = Item(
        model="minecraft:item/book",
        minimal_representation='{"id":"minecraft:book"}',
        page_index=-1
    )
    chest = Item(
        model="minecraft:item/chest",
        minimal_representation='{"id":"minecraft:chest"}',
        page_index=-1
    )
    crafting_table = Item(
        model="minecraft:item/crafting_table",
        minimal_representation='{"id":"minecraft:crafting_table"}',
        page_index=-1
    )
    piston = Item(
        model="minecraft:item/piston",
        minimal_representation='{"id":"minecraft:piston"}',
        page_index=-1
    )
    smooth_stone = Item(
        model="minecraft:item/smooth_stone",
        minimal_representation='{"id":"minecraft:smooth_stone"}',
        page_index=-1
    )

    heavy_workbench = Item(
        model="smithed.crafter:block/table",
        minimal_representation='{"id":"minecraft:furnace"}',
        page_name=("block.smithed.crafter",{}),
        description=("simpledrawer.guide.heavy_workbench",{}),
    )

    # 2. Add the filter to the model_resolver
    filter = REGISTRY.keys()
    ctx.meta["model_resolver"]["filter"] = filter
    model_resolver(ctx)

    # 3. Create the crafting recipes
    craft=[
        [oak_log, oak_log, oak_log],
        [oak_log, crafting_table, oak_log],
        [smooth_stone, smooth_stone, smooth_stone]
    ]
    craft_img = create_crafting_image(ctx, craft)
    result_img = create_result_image(ctx, heavy_workbench, 4)

    import os
    os.makedirs("./build", exist_ok=True)
    craft_img.save("./build/craft_img.png")
    result_img.save("./build/result_img.png")



    



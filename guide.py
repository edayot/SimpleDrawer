from typing_extensions import Any
from beet import Context, Font, Texture, LootTable, ItemModifier
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

CHAR_INDEX_NUMBER = 0xff01
def char_index_number():
    global CHAR_INDEX_NUMBER
    CHAR_INDEX_NUMBER += 3
    return CHAR_INDEX_NUMBER

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
    minimal_representation: dict
    page_name : Optional[TranslatedString] = None
    description: Optional[TranslatedString] = None
    page_index: int = field(default_factory=page_number)
    add_space_to_page_name: bool = False
    char_index: int = field(default_factory=char_index_number)

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
    font_path = f'simpledrawer:pages'
    page : list[Any]= [""]
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
    for i in range(3):
        for e in range(2):
            page.append({"text":"\uef00\uef00","font":font_path,"color":"white"})
            for j in range(3):
                item = craft[i][j]
                char_item = f"\\u{item.char_index + i:04x}".encode().decode("unicode_escape")
                page.append(get_item_json(item, font_path, f'\uef03{char_item}\uef03' if e == 0 else "\uef01"))
            if (i == 0 and e == 1) or (i == 1 and e == 1) or (i == 2 and e == 0):
                page.append({"text":"\uef00\uef00\uef00\uef00","font":font_path,"color":"white"})
                page.append(get_item_json(result, font_path, "\uef02\uef02"))
            if i == 1 and e == 0:
                page.append({"text":"\uef00\uef00\uef00\uef00","font":font_path,"color":"white"})
                char_result = f"\\u{result.char_index:04x}".encode().decode("unicode_escape")
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
    if item.minimal_representation.get("id") == "minecraft:air":
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
    item_modifier_path = f"simpledrawer:impl/guide_modifier"
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
                                "function": "minecraft:reference",
                                "name": item_modifier_path.replace(":impl/", f":v{ctx.project_version}/")
                            }
                        ]
                    }
                ]
            }
        ]
    }
    item_modifier = [
        {
            "function": "minecraft:set_components",
            "components": {
                "minecraft:written_book_content": {
                    "title": "Guide",
                    "author": "AirDox_",
                    "pages": pages,
                    "resolved": True
                },
                "minecraft:item_model": "simpledrawer:guide",
                "minecraft:custom_data": {
                    "ctc": {
                        "id": "guide",
                        "from": "airdox_:simpledrawer",
                    },
                    "smithed": {
                        "id": "airdox_:simpledrawer/guide",
                    }
                },
                "minecraft:item_name": json.dumps({"translate":"simpledrawer.guide","color":"white"}),
                "minecraft:enchantment_glint_override": False,
                "minecraft:lore": [
                    "{\"translate\":\"simpledrawer.name\",\"color\":\"blue\",\"italic\":true}"
                ]
            }
        },
        {
            "function": "minecraft:reference",
            "name": "simpledrawer:impl/add_versionning".replace("impl/", f"v{ctx.project_version}/")
        }
    ]

    ctx.data.item_modifiers[item_modifier_path.replace(":impl/", f":v{ctx.project_version}/")] = ItemModifier(item_modifier)

    loot_table_path = f"simpledrawer:impl/items/guide"
    ctx.data.loot_tables[loot_table_path.replace(":impl/",f":v{ctx.project_version}/")] = LootTable(loot_table)

    cache = ctx.cache["simpledrawer_guide"]
    with open(cache.get_path(loot_table_path), "w") as f:
        json.dump(loot_table, f, indent=4)
    with open(cache.get_path(item_modifier_path), "w") as f:
        json.dump(item_modifier, f, indent=4)

    cache.json["loot_tables"] = []
    cache.json["item_modifiers"] = []
    cache.json["loot_tables"].append(loot_table_path)
    cache.json["item_modifiers"].append(item_modifier_path)




def create_font(ctx: Context):
    font_path = "simpledrawer:pages"
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

        { "type": "bitmap", "file": "simpledrawer:item/font/drawer.png",				        "ascent": 7, "height": 64, "chars": ["\uee00"] },
        { "type": "bitmap", "file": "simpledrawer:item/logo/github.png",				        "ascent": 7, "height": 25, "chars": ["\uee01"] },
        { "type": "bitmap", "file": "simpledrawer:item/logo/pmc.png",				            "ascent": 7, "height": 25, "chars": ["\uee02"] },
        { "type": "bitmap", "file": "simpledrawer:item/logo/smithed.png",				        "ascent": 7, "height": 25, "chars": ["\uee03"] },
        { "type": "bitmap", "file": "simpledrawer:item/logo/modrinth.png",				        "ascent": 7, "height": 25, "chars": ["\uee04"] },
        ],
    })
    for item in REGISTRY.values():
        render = f"simpledrawer:render/{item.model.replace(':','/')}" if item is not None else "simpledrawer:render/simpledrawer/block/air"
        for i in range(3):
            char_item = f"\\u{item.char_index+i:04x}".encode().decode("unicode_escape")
            ctx.assets.fonts[font_path].data["providers"].append(
                {
                    "type": "bitmap",
                    "file": f"{render}.png",
                    "ascent": {0: 8, 1: 7, 2: 6}.get(i),
                    "height": 16,
                    "chars": [char_item]
                }
            )

def generate_item_list(ctx: Context):
    items = []
    for item in REGISTRY.values():
        if item.page_index == -1:
            continue
        items.append(item)
    items.sort(key=lambda x: x.page_index)
    groups = []
    i = 0
    while i < len(items):
        group = []
        for j in range(6):
            if i+j < len(items):
                group.append(items[i+j])
        groups.append(group)
        i += 6
    res = []
    for group in groups:
        for e in range(2):
            for item in group:
                char_item = f"\\u{item.char_index:04x}".encode().decode("unicode_escape")
                res.append(get_item_json(item, "simpledrawer:pages", f'\uef03{char_item}\uef03' if e == 0 else "\uef01"))
            res.append("\n")
    return res





def beet_default(ctx: Context):
    reset_cache = False
    cache = ctx.cache["simpledrawer_guide"]
    if not reset_cache:
        namespaced_things = [
            ("textures",Texture,"assets"),
            ("fonts",Font,"assets"),
            ("loot_tables",LootTable,"data"),
            ("item_modifiers",ItemModifier,"data")
        ]
        if all(key[0] in cache.json for key in namespaced_things):
            for namespaced in namespaced_things:
                for key in cache.json[namespaced[0]]:
                    key_version = key.replace(f":impl/", f":v{ctx.project_version}/")
                    if namespaced[2] == "data":
                        ctx.data[namespaced[1]][key_version] = namespaced[1](source_path=cache.get_path(key))
                    elif namespaced[2] == "assets":
                        ctx.assets[namespaced[1]][key_version] = namespaced[1](source_path=cache.get_path(key))
                    else:
                        raise ValueError(f"Invalid namespaced type {namespaced[2]}")
            return
    else:
        cache.clear()

    global PAGE_NUMBER

    # 1. Construct all needed renders, add them to the ctx
    air = Item(
        model="simpledrawer:block/air",
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
        model="simpledrawer:block/chest",
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
        model="smithed.crafter:item/table",
        minimal_representation={
            "id":"minecraft:furnace",
            "components": {
                "minecraft:item_name": json.dumps({"translate":"block.smithed.crafter"})
            }
            },
        page_name=("block.smithed.crafter",{}),
        description=("simpledrawer.guide.heavy_workbench",{}),
    )
    new_drawer = Item(
        model="simpledrawer:item/new_drawer/oak_1",
        minimal_representation={
            "id":"minecraft:furnace",
            "components": {
                "minecraft:item_name": json.dumps({"translate":"simpledrawer.new_drawer"})
            }
        },
        page_name=("simpledrawer.new_drawer",{}),
        description=("simpledrawer.guide.new_drawer",{}),
    )
    PAGE_NUMBER += 1
    PAGE_NUMBER += 1
    double_new_drawer = Item(
        model="simpledrawer:item/new_drawer/oak_2",
        minimal_representation={
            "id":"minecraft:furnace",
            "components": {
                "minecraft:item_name": json.dumps({"translate":"simpledrawer.double_new_drawer.empty"})
            }
        },
        page_name=("simpledrawer.double_new_drawer",{}),
        description=("simpledrawer.guide.double_new_drawer",{}),
    )
    quadruple_new_drawer = Item(
        model="simpledrawer:item/new_drawer/oak_4",
        minimal_representation={
            "id":"minecraft:furnace",
            "components": {
                "minecraft:item_name": json.dumps({"translate":"simpledrawer.quadruple_new_drawer.empty"})
            }
        },
        page_name=("simpledrawer.quadruple_new_drawer",{}),
        description=("simpledrawer.guide.quadruple_new_drawer",{}),
    )
    compacting_drawer = Item(
        model="simpledrawer:item/new_drawer/comp_1",
        minimal_representation={
            "id":"minecraft:furnace",
            "components": {
                "minecraft:item_name": json.dumps({"translate":"simpledrawer.compacting_new_drawer.empty"})
            }
        },
        page_name=("simpledrawer.compacting_new_drawer",{}),
        description=("simpledrawer.guide.compacting_new_drawer",{}),
    )
    PAGE_NUMBER += 1
    hopper_upgrade = Item(
        model="simpledrawer:item/hopper_upgrade",
        minimal_representation={
            "id":"minecraft:jigsaw",
            "components": {
                "minecraft:item_name": json.dumps({"translate":"simpledrawer.hopper_upgrade","color":"white"})
            }
        },
        page_name=("simpledrawer.hopper_upgrade",{}),
        description=("simpledrawer.guide.hopper_upgrade",{}),
    )
    iron_upgrade = Item(
        model="simpledrawer:item/iron_upgrade",
        minimal_representation={
            "id":"minecraft:jigsaw",
            "components": {
                "minecraft:item_name": json.dumps({"translate":"simpledrawer.iron_upgrade","color":"white"})
            }
        },
        page_name=("simpledrawer.iron_upgrade",{}),
        description=("simpledrawer.guide.iron_upgrade",{}),
    )
    gold_upgrade = Item(
        model="simpledrawer:item/gold_upgrade",
        minimal_representation={
            "id":"minecraft:jigsaw",
            "components": {
                "minecraft:item_name": json.dumps({"translate":"simpledrawer.gold_upgrade","color":"white"})
            }
        },
        page_name=("simpledrawer.gold_upgrade",{}),
        description=("simpledrawer.guide.gold_upgrade",{}),
    )
    diamond_upgrade = Item(
        model="simpledrawer:item/diamond_upgrade",
        minimal_representation={
            "id":"minecraft:jigsaw",
            "components": {
                "minecraft:item_name": json.dumps({"translate":"simpledrawer.diamond_upgrade","color":"white"})
            }
        },
        page_name=("simpledrawer.diamond_upgrade",{}),
        description=("simpledrawer.guide.diamond_upgrade",{}),
    )
    star_upgrade = Item(
        model="simpledrawer:item/star_upgrade",
        minimal_representation={
            "id":"minecraft:jigsaw",
            "components": {
                "minecraft:item_name": json.dumps({"translate":"simpledrawer.star_upgrade","color":"white"})
            }
        },
        page_name=("simpledrawer.star_upgrade",{}),
        description=("simpledrawer.guide.star_upgrade",{}),
    )
    netherite_upgrade = Item(
        model="simpledrawer:item/netherite_upgrade",
        minimal_representation={
            "id":"minecraft:jigsaw",
            "components": {
                "minecraft:item_name": json.dumps({"translate":"simpledrawer.netherite_upgrade","color":"white"})
            }
        },
        page_name=("simpledrawer.netherite_upgrade",{}),
        description=("simpledrawer.guide.netherite_upgrade",{}),
    )
    downgrade_wrench = Item(
        model="simpledrawer:item/downgrade_wrench",
        minimal_representation={
            "id":"minecraft:jigsaw",
            "components": {
                "minecraft:item_name": json.dumps({"translate":"simpledrawer.downgrade_wrench","color":"white"})
            }
        },
        page_name=("simpledrawer.downgrade_wrench",{}),
        description=("simpledrawer.guide.downgrade_wrench",{}),
    )
    guide = Item(
        model="simpledrawer:item/guide",
        minimal_representation={
            "id":"minecraft:written_book",
            "components": {
                "minecraft:item_name": json.dumps({"translate":"simpledrawer.guide"})
            }
        },
        page_name=("simpledrawer.guide",{}),
        description=("simpledrawer.guide.guide",{}),
    )

    # 2. Add the filter to the model_resolver
    filter = REGISTRY.keys()
    ctx.meta["model_resolver"]["filter"] = filter
    model_resolver(ctx)
    cache.json["textures"] = []
    # add a white point on the top left corner / bottom right corner
    for model in filter:
        path = f"simpledrawer:render/{model.replace(':','/')}"
        if not path in ctx.assets.textures:
            continue
        img : Image.Image = ctx.assets.textures[path].image
        img = img.copy()
        img.putpixel((0,0),(137,137,137,255))
        img.putpixel((img.width-1,img.height-1),(137,137,137,255))
        ctx.assets.textures[path] = Texture(img)
        with open(cache.get_path(path), "wb") as f:
            img.save(f, "PNG")
        cache.json["textures"].append(path)

    # 3. Create the font
    create_font(ctx)
    # cache the font
    font_path = "simpledrawer:pages"
    font = ctx.assets.fonts[font_path].data
    with open(cache.get_path(font_path), "w") as f:
        json.dump(font, f, indent=4)
    if not "fonts" in cache.json:
        cache.json["fonts"] = []
    cache.json["fonts"].append(font_path)

    # 4. Create the crafting recipes
    pages = []
    first_page = json.dumps([
        "",
        {"translate":"simpledrawer.guide_first","font":"simpledrawer:big","color":"black","bold":True},
        "\n\n",
        {"translate":"simpledrawer.guide.first_page","color":"black",},
        "\n",
        *generate_item_list(ctx)
    ])
    pages.append(first_page)


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

    pages.append(json.dumps([
        "",
        {"translate":"simpledrawer.guide.drawers.inserting_title","color":"black","font":"simpledrawer:medium"},
        {"translate":"simpledrawer.guide.drawers.inserting","color":"black"}
    ]))
    pages.append(json.dumps([
        "",
        {"translate":"simpledrawer.guide.drawers.extracting_title","color":"black","font":"simpledrawer:medium"},
        {"translate":"simpledrawer.guide.drawers.extracting","color":"black"}
    ]))

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

    pages.append(json.dumps([
        "",
        {"translate":"simpledrawer.upgrades","font":"simpledrawer:big","color":"black"},
        {"text":"\n\n\n","font":"simpledrawer:big","color":"black"},
        {"translate":"simpledrawer.guide.upgrade","color":"black"}
    ]))

    craft=[
        [stick, stick, stick],
        [hopper, iron_upgrade, hopper],
        [redstone, air, redstone]
    ]
    result = hopper_upgrade
    count = 1
    pages.append(add_page(ctx, craft, result, count))

    craft=[
        [stick, stick, stick],
        [iron_ingot, oak_planks, iron_ingot],
        [iron_ingot, oak_planks, iron_ingot]
    ]
    result = iron_upgrade
    count = 1
    pages.append(add_page(ctx, craft, result, count))

    craft=[
        [stick, stick, stick],
        [gold_ingot, iron_upgrade, gold_ingot],
        [gold_ingot, air, gold_ingot]
    ]
    result = gold_upgrade
    count = 1
    pages.append(add_page(ctx, craft, result, count))

    craft=[
        [stick, stick, stick],
        [diamond, gold_upgrade, diamond],
        [diamond, air, diamond]
    ]
    result = diamond_upgrade
    count = 1
    pages.append(add_page(ctx, craft, result, count))

    craft=[
        [stick, diamond, stick],
        [iron_ingot, diamond_upgrade, iron_ingot],
        [iron_ingot, nether_star, iron_ingot]
    ]
    result = star_upgrade
    count = 1
    pages.append(add_page(ctx, craft, result, count))

    craft=[
        [nether_star, nether_star, nether_star],
        [netherite_ingot, star_upgrade, netherite_ingot],
        [netherite_ingot, netherite_ingot, netherite_ingot]
    ]
    result = netherite_upgrade
    count = 1
    pages.append(add_page(ctx, craft, result, count))

    craft=[
        [air, iron_nugget, iron_upgrade],
        [air, iron_ingot, iron_nugget],
        [iron_ingot, air, air]
    ]
    result = downgrade_wrench
    count = 1
    pages.append(add_page(ctx, craft, result, count))

    craft=[
        [barrel, iron_nugget, air],
        [book, oak_planks, air],
        [air, air, air]
    ]
    result = guide
    count = 1
    pages.append(add_page(ctx, craft, result, count))


    pages.append(json.dumps([
        "",
        {"translate":"simpledrawer.project","font":"simpledrawer:big","color":"black","bold":True},
        {"text":"\n\n","font":"simpledrawer:pages","color":"white"},
        {"translate":"simpledrawer.guide.project_pages","color":"black"},
        {"text":"\n","font":"simpledrawer:pages","color":"white"},
        {"text":"\uee01","font":"simpledrawer:pages","color":"white","hoverEvent":{"action":"show_text","value":{"text":"GitHub"}},"clickEvent":{"action":"open_url","value":"https://github.com/edayot/SimpleDrawer"}},
        {"text":"\uee02","font":"simpledrawer:pages","color":"white","hoverEvent":{"action":"show_text","value":{"text":"Planet Minecraft"}},"clickEvent":{"action":"open_url","value":"https://www.planetminecraft.com/data-pack/simple-drawer/"}},
        {"text":"\uee03","font":"simpledrawer:pages","color":"white","hoverEvent":{"action":"show_text","value":{"text":"Smithed"}},"clickEvent":{"action":"open_url","value":"https://smithed.net/packs/simpledrawer"}},
        {"text":"\uee04","font":"simpledrawer:pages","color":"white","hoverEvent":{"action":"show_text","value":{"text":"Modrinth"}},"clickEvent":{"action":"open_url","value":"https://modrinth.com/datapack/simpledrawer"}},

        {"text":"\n\uef02\uef00\uef00\uef00","font":"simpledrawer:pages","color":"white","hoverEvent":{"action":"show_text","value":{"text":"GitHub"}},"clickEvent":{"action":"open_url","value":"https://github.com/edayot/SimpleDrawer"}},
        {"text":"\uef02\uef00\uef00\uef00","font":"simpledrawer:pages","color":"white","hoverEvent":{"action":"show_text","value":{"text":"Planet Minecraft"}},"clickEvent":{"action":"open_url","value":"https://www.planetminecraft.com/data-pack/simple-drawer/"}},
        {"text":"\uef02\uef00\uef00\uef00","font":"simpledrawer:pages","color":"white","hoverEvent":{"action":"show_text","value":{"text":"Smithed"}},"clickEvent":{"action":"open_url","value":"https://smithed.net/packs/simpledrawer"}},
        {"text":"\uef02\uef00\uef00\uef00","font":"simpledrawer:pages","color":"white","hoverEvent":{"action":"show_text","value":{"text":"Modrinth"}},"clickEvent":{"action":"open_url","value":"https://modrinth.com/datapack/simpledrawer"}},

        {"text":"\n\uef02\uef00\uef00\uef00","font":"simpledrawer:pages","color":"white","hoverEvent":{"action":"show_text","value":{"text":"GitHub"}},"clickEvent":{"action":"open_url","value":"https://github.com/edayot/SimpleDrawer"}},
        {"text":"\uef02\uef00\uef00\uef00","font":"simpledrawer:pages","color":"white","hoverEvent":{"action":"show_text","value":{"text":"Planet Minecraft"}},"clickEvent":{"action":"open_url","value":"https://www.planetminecraft.com/data-pack/simple-drawer/"}},
        {"text":"\uef02\uef00\uef00\uef00","font":"simpledrawer:pages","color":"white","hoverEvent":{"action":"show_text","value":{"text":"Smithed"}},"clickEvent":{"action":"open_url","value":"https://smithed.net/packs/simpledrawer"}},
        {"text":"\uef02\uef00\uef00\uef00","font":"simpledrawer:pages","color":"white","hoverEvent":{"action":"show_text","value":{"text":"Modrinth"}},"clickEvent":{"action":"open_url","value":"https://modrinth.com/datapack/simpledrawer"}},
    ]))


    # print(pages)
    # 5. Create the loot table
    create_loot_table(ctx, pages)

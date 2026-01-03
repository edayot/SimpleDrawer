from copy import deepcopy
from dataclasses import dataclass
from itertools import pairwise
from tkinter import NO
from typing import Any, Iterable, Literal, Optional
from beet import Context, LootTable
from beet.core.utils import split_version
from simple_item_plugin.types import NAMESPACE, Lang
from simple_item_plugin.item import Item, BlockProperties, export_translated_string
from simple_item_plugin.crafting import ShapedRecipe, VanillaItem, ExternalItem, ConditionalCrafting
from simple_item_plugin.guide import ItemGroup, Page

from simple_item_plugin.types import TranslatedString
from beet import Context, Function, ItemModifier
import nbtlib
import json
from beet.contrib.vanilla import Vanilla


class SimpleDrawerItem(Item):
    def create_custom_data(self, ctx: Context):
        res = super().create_custom_data(ctx)
        res["ctc"] = {
            "id": self.id,
            "from": "airdox_:simpledrawer",
        }
        export_translated_string(ctx, self.guide_description) if self.guide_description else None
        return res
    
    def set_components(self):
        res = super().set_components()
        res.append({"function": "minecraft:reference", "name": "simpledrawer:impl/add_versionning"})
        return res





@dataclass
class UpgradeItem:
    type: str
    translate : dict[Lang, str]

    guide_description: Optional[TranslatedString] = None

    @property
    def id(self):
        return f"{self.type}_upgrade"

    def export(self, ctx: Context):
        item = SimpleDrawerItem(
            id=self.id,
            item_name=(
                f"{NAMESPACE}.item.{self.id}",
                self.translate,
            ),
            lore=[
                ("simpledrawer.upgrade_lore", {})
            ],
            guide_description=("simpledrawer.guide.capacity_template",{}, [{
                "nbt": f"drawer_type.{self.type}.maxCount",
                "storage": "simpledrawer:main"
            }]) if self.guide_description is None else self.guide_description,
            components_extra={
                "minecraft:custom_data": {
                    "simpledrawer": {
                        "upgrade": 1,
                    },
                },
            }
        ).export(ctx)
        return item
    
@dataclass(kw_only=True)
class DrawerItem:
    id: str
    wood_type: str
    variant: str
    additional_pages: Optional[list[Page]] = None

    def export(self, ctx: Context):
        item = ExternalItem(
            id=f"airdox_:simpledrawer/{self.id}",
            base_item="minecraft:furnace",
            loot_table_path=f"simpledrawer:impl/items/{self.id}",
            item_model="simpledrawer:new_drawer",
            minimal_representation={
                "id":"minecraft:furnace",
                "components": {
                    "minecraft:item_name": {"translate":f"simpledrawer.{self.id}"},
                    "minecraft:tooltip_display": {
                        "hidden_components": [
                            "minecraft:container",
                        ]
                    },
                    "minecraft:container": [
                        {
                            "slot": 0,
                            "item": {
                                "id": "minecraft:stone",
                                "count": 1,
                                "components": {
                                    "minecraft:custom_data": {
                                        "simpledrawer": {
                                            "wood_type": self.wood_type,
                                            "variant": self.variant,
                                            "items_counts": {str(x):0 for x in range(27)},
                                            "slot_count": 1,
                                        }
                                    }
                                }
                            }
                        }
                    ]
                    
                }
            },
            guide_description=(f"simpledrawer.guide.{self.id}",{}),
            additional_pages=self.additional_pages
        )
        return item.export(ctx)




def beet_default(ctx: Context):
    # ctx.require("simpledrawer.pack")
    ctx.require("simpledrawer.add_mc_version_support")
    ctx.require("simpledrawer.generate_translation")
    ctx.require("simpledrawer.airdox_.add_id")
    ctx.require("simpledrawer.airdox_.test_load_generator")
    ctx.require("simpledrawer.new_drawer_model")
    ctx.require("simpledrawer.create_tape_loot_table")

    cobblestone = VanillaItem(id="minecraft:cobblestone").export(ctx)
    slime_ball = VanillaItem(id="minecraft:slime_ball").export(ctx)
    slime_block = VanillaItem(id="minecraft:slime_block").export(ctx)
    diamond = VanillaItem(id="minecraft:diamond").export(ctx)
    elytra = VanillaItem(id="minecraft:elytra").export(ctx)
    obsidian = VanillaItem(id="minecraft:obsidian").export(ctx)
    book = VanillaItem(id="minecraft:book").export(ctx)
    redstone = VanillaItem(id="minecraft:redstone").export(ctx)
    oak_log = VanillaItem(id="minecraft:oak_log").export(ctx)
    crafting_table = VanillaItem(id="minecraft:crafting_table").export(ctx)
    smooth_stone = VanillaItem(id="minecraft:smooth_stone").export(ctx)
    barrel = VanillaItem(id="minecraft:barrel").export(ctx)
    iron_nugget = VanillaItem(id="minecraft:iron_nugget").export(ctx)
    iron_ingot = VanillaItem(id="minecraft:iron_ingot").export(ctx)
    oak_planks = VanillaItem(id="minecraft:oak_planks").export(ctx)
    stick = VanillaItem(id="minecraft:stick").export(ctx)
    gold_ingot = VanillaItem(id="minecraft:gold_ingot").export(ctx)
    diamond = VanillaItem(id="minecraft:diamond").export(ctx)
    netherite_ingot = VanillaItem(id="minecraft:netherite_ingot").export(ctx)
    nether_star = VanillaItem(id="minecraft:nether_star").export(ctx)
    hopper = VanillaItem(id="minecraft:hopper").export(ctx)
    piston = VanillaItem(id="minecraft:piston").export(ctx)
    observer = VanillaItem(id="minecraft:observer").export(ctx)
    iron_block = VanillaItem(id="minecraft:iron_block").export(ctx)
    ender_pearl = VanillaItem(id="minecraft:ender_pearl").export(ctx)
    dragon_head = VanillaItem(id="minecraft:dragon_head").export(ctx)
    redstone_block = VanillaItem(id="minecraft:redstone_block").export(ctx)
    shulker_shell = VanillaItem(id="minecraft:shulker_shell").export(ctx)



    heavy_workbench = ExternalItem(
        id="smithed:crafter",
        loot_table_path="smithed.crafter:blocks/table",
        item_model="smithed.crafter:table",
        base_item="minecraft:furnace",
        minimal_representation={
            "id":"minecraft:furnace",
            "components": {
                "minecraft:item_name": {"translate":"block.smithed.crafter", "color":"white"},
            }
        }, 
        guide_description=(f"{NAMESPACE}.guide.heavy_workbench", {
            Lang.fr_fr: "C'est une table de craft qui permet de crafter les items de SimpleDrawer.",
            Lang.en_us: "It's a crafting table that allows you to craft SimpleDrawer items."
        })
    ).export(ctx)

    ShapedRecipe(
        items=(
            (oak_log, oak_log, oak_log),
            (oak_log, crafting_table, oak_log),
            (smooth_stone, smooth_stone, smooth_stone),
        ),
        result=(heavy_workbench, 1),
    ).export(ctx, True)

    shulker_tape = SimpleDrawerItem(
        id="shulker_tape",
        item_name=(
            f"{NAMESPACE}.item.shulker_tape",
            {
                Lang.en_us: "Shulker Tape",
                Lang.fr_fr: "Ruban de Shulker",
            }
        ),
        lore=[
            ("simpledrawer.shulker_tape_lore", {
                Lang.en_us: "You can break a drawer with it, it has 40 durability.",
                Lang.fr_fr: "Vous pouvez casser un drawer avec, il a 40 de durabilité.",
            })
        ],
        base_item="minecraft:shulker_shell",
        guide_description=("simpledrawer.guide.shulker_tape", {
            Lang.en_us: "A tape to package drawers to be transported. 40 durability.",
            Lang.fr_fr: "Un ruban pour emballer les drawers à transporter. 40 de durabilité.",
        }),
        components_extra={
            "minecraft:max_stack_size": 1,
            "minecraft:custom_data": {
                "simpledrawer": {
                    "upgrade": 1,
                },
            },
            "minecraft:max_damage": 40,
            "minecraft:damage": 0,
            "minecraft:tool": {
                "damage_per_block": 1,
                "rules": [
                    {
                        "blocks": "minecraft:lodestone",
                        "correct_for_drops": True,
                        "speed": 15.0
                    },
                    {
                        "blocks": "minecraft:beehive",
                        "correct_for_drops": True,
                        "speed": 3.0
                    }
                ]
            }
        }
    ).export(ctx)

    ShapedRecipe(
        items=(
            (slime_ball, None, None),
            (shulker_shell, None, None),
            (slime_ball, None, None),
        ),
        result=(shulker_tape, 1),
        conditional_crafting=ConditionalCrafting(
            fake_player="#config.disable_shulker_tape",
            scoreboard="simpledrawer.math",
            value=0
        )
    ).export(ctx)

    new_drawer = DrawerItem(
        id="new_drawer",
        wood_type="simpledrawer:oak",
        variant="single",
        additional_pages=[
            Page(
                ctx=ctx,
                content=[
                    "",
                    {"translate":"simpledrawer.guide.drawers.inserting_title","color":"black","font":"simpledrawer:medium_font"},
                    {"translate":"simpledrawer.guide.drawers.inserting","color":"black"}
                ]
            ),
            Page(
                ctx=ctx,
                content=[
                    "",
                    {"translate":"simpledrawer.guide.drawers.extracting_title","color":"black","font":"simpledrawer:medium_font"},
                    {"translate":"simpledrawer.guide.drawers.extracting","color":"black"}
                ]
            )
        ]
    ).export(ctx)

    ShapedRecipe(
        items=(
            (oak_planks, stick, oak_planks),
            (stick, iron_nugget, stick),
            (oak_planks, barrel, oak_planks),
        ),
        result=(new_drawer, 1),
    ).export(ctx, True)

    double_new_drawer = DrawerItem(
        id="double_new_drawer",
        wood_type="simpledrawer:oak",
        variant="double",
    ).export(ctx)

    ShapedRecipe(
        items=(
            (oak_planks, barrel, oak_planks),
            (stick, iron_nugget, stick),
            (oak_planks, barrel, oak_planks),
        ),
        result=(double_new_drawer, 1),
    ).export(ctx, True)


    quadruple_new_drawer = DrawerItem(
        id="quadruple_new_drawer",
        wood_type="simpledrawer:oak",
        variant="quadruple",
    ).export(ctx)

    ShapedRecipe(
        items=(
            (oak_planks, barrel, oak_planks),
            (barrel, iron_nugget, barrel),
            (oak_planks, barrel, oak_planks),
        ),
        result=(quadruple_new_drawer, 1),
    ).export(ctx, True)

    drawer_frame = SimpleDrawerItem(
        id="drawer_frame",
        item_name=(
            f"{NAMESPACE}.item.drawer_frame",
            {
                Lang.en_us: "Drawer Frame",
                Lang.fr_fr: "Cadre de drawer",
            }
        ),
        guide_description=("simpledrawer.guide.drawer_frame", {
            Lang.en_us: "A frame used to create drawers.",
            Lang.fr_fr: "Un cadre utilisé pour créer des drawers.",
        }),
    ).export(ctx)

    ShapedRecipe(
        items=(
            (smooth_stone, observer, smooth_stone),
            (iron_block, new_drawer, iron_block),
            (smooth_stone, observer, smooth_stone),
        ),
        result=(drawer_frame, 1),
    ).export(ctx)

    compacting_new_drawer = DrawerItem(
        id="compacting_new_drawer",
        wood_type="simpledrawer:compacting",
        variant="normal",
    ).export(ctx)

    ShapedRecipe(
        items=(
            (smooth_stone, crafting_table, smooth_stone),
            (piston, drawer_frame, piston),
            (smooth_stone, redstone_block, smooth_stone),
        ),
        result=(compacting_new_drawer, 1),
    ).export(ctx)

    drawer_controller = SimpleDrawerItem(
        id="drawer_controller",
        base_item="minecraft:furnace",
        item_name=(f"{NAMESPACE}.item.drawer_controller", {
            Lang.en_us: "Drawer Controller",
            Lang.fr_fr: "Contrôleur de drawer"
        }),
        block_properties=BlockProperties(
            base_block="minecraft:lodestone",
            all_same_faces=False,
            entity_type="marker",
        ),
        guide_description=("simpledrawer.guide.drawer_controller", {
            Lang.en_us: "A controller for drawers, shift-right-click to transfer items to ",
            Lang.fr_fr: "Un contrôleur pour les drawers, shift-clic droit pour",
        }),
        additional_pages=[
            Page(
                ctx=ctx,
                content=[
                    {"translate":"simpledrawer.guide.drawer_controller_2",}
                ]
            ),
            Page(
                ctx=ctx,
                content=[
                    "",
                    {"translate":"simpledrawer.upgrades","font":"simpledrawer:medium_font","color":"black"},
                    {"text":"\n\n","font":"simpledrawer:big","color":"black"},
                    {"translate":"simpledrawer.guide.upgrade","color":"black"}
                ]
            ),
        ]
    ).export(ctx)

    export_translated_string(ctx, ("simpledrawer.guide.drawer_controller_2", {
        Lang.en_us: "nearby drawers. It only accept items that are already in the nearby drawers.",
        Lang.fr_fr: "transférer les items vers les drawers à proximité. Cela n'accepte que les items qui sont déjà dans les drawers à proximité.",
    }))

    ShapedRecipe(
        items=(
            (smooth_stone, nether_star, smooth_stone),
            (ender_pearl, drawer_frame, ender_pearl),
            (smooth_stone, dragon_head, smooth_stone),
        ),
        result=(drawer_controller, 1),
    ).export(ctx)



    iron_upgrade = UpgradeItem(
        type="iron",
        translate={
            Lang.en_us: "Iron Upgrade",
            Lang.fr_fr: "Amélioration en fer"
        }
    ).export(ctx)
    ShapedRecipe(
        items=(
            (stick, stick, stick),
            (iron_ingot, oak_planks, iron_ingot),
            (iron_ingot, oak_planks, iron_ingot),
        ),
        result=(iron_upgrade, 1),
    ).export(ctx)



    gold_upgrade = UpgradeItem(
        type="gold",
        translate={
            Lang.en_us: "Gold Upgrade",
            Lang.fr_fr: "Amélioration en or"
        }
    ).export(ctx)
    ShapedRecipe(
        items=(
            (stick, stick, stick),
            (gold_ingot, iron_upgrade, gold_ingot),
            (gold_ingot, None, gold_ingot),
        ),
        result=(gold_upgrade, 1),
    ).export(ctx)

    diamond_upgrade = UpgradeItem(
        type="diamond",
        translate={
            Lang.en_us: "Diamond Upgrade",
            Lang.fr_fr: "Amélioration en diamant"
        }
    ).export(ctx)
    ShapedRecipe(
        items=(
            (stick, stick, stick),
            (diamond, gold_upgrade, diamond),
            (diamond, None, diamond),
        ),
        result=(diamond_upgrade, 1),
    ).export(ctx)

    star_upgrade = UpgradeItem(
        type="star",
        translate={
            Lang.en_us: "Star Upgrade",
            Lang.fr_fr: "Amélioration en étoile"
        }
    ).export(ctx)
    ShapedRecipe(
        items=(
            (stick, diamond, stick),
            (iron_ingot, diamond_upgrade, iron_ingot),
            (iron_ingot, nether_star, iron_ingot),
        ),
        result=(star_upgrade, 1),
    ).export(ctx)

    netherite_upgrade = UpgradeItem(
        type="netherite",
        translate={
            Lang.en_us: "Netherite Upgrade",
            Lang.fr_fr: "Amélioration en netherite"
        }
    ).export(ctx)
    ShapedRecipe(
        items=(
            (nether_star, nether_star, nether_star),
            (netherite_ingot, diamond_upgrade, netherite_ingot),
            (netherite_ingot, netherite_ingot, netherite_ingot),
        ),
        result=(netherite_upgrade, 1),
    ).export(ctx)

    hopper_upgrade = UpgradeItem(
        type="hopper",
        translate={
            Lang.en_us: "Hopper Upgrade",
            Lang.fr_fr: "Amélioration hopper"
        },
        guide_description=("simpledrawer.guide.hopper_upgrade", {
            Lang.en_us: "Enable hopper capability.",
            Lang.fr_fr: "Active la capacité hopper.",
        }),
    ).export(ctx)
    ShapedRecipe(
        items=(
            (stick, stick, stick),
            (hopper, iron_upgrade, hopper),
            (redstone, None, redstone),
        ),
        result=(hopper_upgrade, 1),
    ).export(ctx)

    downgrade_wrench = SimpleDrawerItem(
        id="downgrade_wrench",
        item_name=(
            f"{NAMESPACE}.item.downgrade_wrench",
            {
                Lang.en_us: "Downgrade Wrench",
                Lang.fr_fr: "Clé de rétrogradation",
            },
        ),
        components_extra={
            "minecraft:custom_data": {
                "simpledrawer": {
                    "downgrade": 1,
                },
            },
        }
    ).export(ctx)
    ShapedRecipe(
        items=(
            (None, iron_nugget, iron_upgrade),
            (None, iron_ingot, iron_nugget),
            (iron_ingot, None, None),
        ),
        result=(downgrade_wrench, 1),
    ).export(ctx)

    guide = SimpleDrawerItem(
        id="guide",
        base_item="minecraft:written_book",
        item_name=(
            f"{NAMESPACE}.item.guide",
            {Lang.en_us: "Guide", Lang.fr_fr: "Guide"},
        ),
        components_extra={
            "minecraft:enchantment_glint_override": False,
            "special:item_modifier": (f"{NAMESPACE}:impl/guide", ),
        },
        guide_description=(f"{NAMESPACE}.guide.description", {
            Lang.en_us: "The guide you are currently holding.",
            Lang.fr_fr: "Le guide que vous tenez actuellement."
        }),
        additional_pages=[
            Page(
                ctx=ctx,
                content=[
                    "",
                    {"translate":"simpledrawer.project","font":"simpledrawer:big_font","color":"black","bold":True},
                    {"text":"\n\n","font":"simpledrawer:pages","color":"white"},
                    {"translate":"simpledrawer.guide.project_pages","color":"black"},
                    {"text":"\n","font":"simpledrawer:pages","color":"white"},
                    {"text":"\u0031","font":"simpledrawer:pages","color":"white","hover_event":{"action":"show_text","value":{"text":"GitHub"}},"click_event":{"action":"open_url","url":"https://github.com/edayot/SimpleDrawer"}},
                    {"text":"\u0032","font":"simpledrawer:pages","color":"white","hover_event":{"action":"show_text","value":{"text":"Planet Minecraft"}},"click_event":{"action":"open_url","url":"https://www.planetminecraft.com/data-pack/simple-drawer/"}},
                    {"text":"\u0033","font":"simpledrawer:pages","color":"white","hover_event":{"action":"show_text","value":{"text":"Smithed"}},"click_event":{"action":"open_url","url":"https://smithed.net/packs/simpledrawer"}},
                    {"text":"\u0034","font":"simpledrawer:pages","color":"white","hover_event":{"action":"show_text","value":{"text":"Modrinth"}},"click_event":{"action":"open_url","url":"https://modrinth.com/datapack/simpledrawer"}},

                    {"text":"\n\uf8f2\uf8f0\uf8f0\uf8f0","font":"simpledrawer:pages","color":"white","hover_event":{"action":"show_text","value":{"text":"GitHub"}},"click_event":{"action":"open_url","url":"https://github.com/edayot/SimpleDrawer"}},
                    {"text":"\uf8f2\uf8f0\uf8f0\uf8f0","font":"simpledrawer:pages","color":"white","hover_event":{"action":"show_text","value":{"text":"Planet Minecraft"}},"click_event":{"action":"open_url","url":"https://www.planetminecraft.com/data-pack/simple-drawer/"}},
                    {"text":"\uf8f2\uf8f0\uf8f0\uf8f0","font":"simpledrawer:pages","color":"white","hover_event":{"action":"show_text","value":{"text":"Smithed"}},"click_event":{"action":"open_url","url":"https://smithed.net/packs/simpledrawer"}},
                    {"text":"\uf8f2\uf8f0\uf8f0\uf8f0","font":"simpledrawer:pages","color":"white","hover_event":{"action":"show_text","value":{"text":"Modrinth"}},"click_event":{"action":"open_url","url":"https://modrinth.com/datapack/simpledrawer"}},

                    {"text":"\n\uf8f2\uf8f0\uf8f0\uf8f0","font":"simpledrawer:pages","color":"white","hover_event":{"action":"show_text","value":{"text":"GitHub"}},"click_event":{"action":"open_url","url":"https://github.com/edayot/SimpleDrawer"}},
                    {"text":"\uf8f2\uf8f0\uf8f0\uf8f0","font":"simpledrawer:pages","color":"white","hover_event":{"action":"show_text","value":{"text":"Planet Minecraft"}},"click_event":{"action":"open_url","url":"https://www.planetminecraft.com/data-pack/simple-drawer/"}},
                    {"text":"\uf8f2\uf8f0\uf8f0\uf8f0","font":"simpledrawer:pages","color":"white","hover_event":{"action":"show_text","value":{"text":"Smithed"}},"click_event":{"action":"open_url","url":"https://smithed.net/packs/simpledrawer"}},
                    {"text":"\uf8f2\uf8f0\uf8f0\uf8f0","font":"simpledrawer:pages","color":"white","hover_event":{"action":"show_text","value":{"text":"Modrinth"}},"click_event":{"action":"open_url","url":"https://modrinth.com/datapack/simpledrawer"}},
                ]
            ),  
        ]
    ).export(ctx)

    ShapedRecipe(
        items=(
            (barrel, iron_nugget, None),
            (book, oak_planks, None),
            (None, None, None),
        ),
        result=(guide, 1),
    ).export(ctx)


    ItemGroup(
        id="special:all_items",
        name=("", {}),
        items_list=[
            heavy_workbench, 
            shulker_tape,
            new_drawer,
            double_new_drawer,
            quadruple_new_drawer,
            drawer_frame,
            compacting_new_drawer,
            drawer_controller,
            iron_upgrade, 
            gold_upgrade,
            diamond_upgrade,
            star_upgrade,
            netherite_upgrade,
            hopper_upgrade,
            downgrade_wrench,
            guide,
        ],
        page_index=-1,
        item_icon=guide
    ).export(ctx)


    




WOOD_TYPES = {
    "acacia",
    "bamboo",
    "birch",
    "cherry",
    "crimson",
    "dark_oak",
    "jungle",
    "mangrove",
    "spruce",
    "warped",
    "oak",
    "pale_oak",
}
DRAWER_TYPES = WOOD_TYPES.copy() | {"ice"}
ALL_DRAWER_TYPES = DRAWER_TYPES.copy() | {"compacting"}


def generate_version_string(versions):
    if not versions:
        return "No versions specified"

    if len(versions) == 1:
        return versions[0]

    version_string = ', '.join(versions[:-1]) + " or " + versions[-1]
    return version_string

def add_mc_version_support(ctx: Context):
    "Injecting mc_version_support"
    t=""
    for dataversion in ctx.meta["mc_supports_dataversion"]:
        t=t+f"execute if score #dataversion simpledrawer.math matches {dataversion} run scoreboard players set #goodversion simpledrawer.math 1\n"
    t=t+'\n'
    final_tellraw='execute unless score #goodversion simpledrawer.math matches 1 run tellraw @a [{"translate":"simpledrawer.tellraw_prefix","color":"dark_red"},{"text": "SimpleDrawer may not work in this version of Minecraft!, it\'s only compatible with {mc_version}","color":"red"}]'
    
    versions=generate_version_string(ctx.meta["mc_supports"])

    t=t+final_tellraw.replace("{mc_version}",versions)+"\n"

    path_function="simpledrawer:impl/mc_version_warning_2"

    ctx.data.functions[path_function].append(t)


def get_translation(item_name, id):
    id = get_real_id(id)
    return {
        "function": "minecraft:set_lore",
        "entity": "this",
        "lore": [
            {
                "translate": "simpledrawer.new_drawer.item_count",
                "with": [
                    item_name,
                    {
                        "score": {
                            "name": "#count_destroy",
                            "objective": "simpledrawer.math"
                        }
                    }
                ],
                "color": "white",
                "italic": False
            }
        ],
        "mode": "append",
        "conditions": [
            {
                "condition": "minecraft:entity_properties",
                "entity": "this",
                "predicate": {
                    "equipment": {
                        "mainhand": {
                            "items": id
                        }
                    }
                }
            }
        ]
    }


    
def get_real_id(id):
    return f"minecraft:{id}" if ":" not in id else id

def get_pack_format(ctx: Context, version: str):
    with open(ctx.cache["simpledrawer"].download("https://raw.githubusercontent.com/misode/mcmeta/refs/heads/summary/versions/data.json"), "r") as f:
        summary = json.load(f)
    for x in summary:
        ver = x["id"]
        if ver == version:
            dp_major = x["data_pack_version"]
            dp_minor = x["data_pack_version_minor"]
            rp_major = x["resource_pack_version"]
            rp_minor = x["resource_pack_version_minor"]
            return (
                (dp_major, dp_minor),
                (rp_major, rp_minor),
            )
    raise ValueError(f"{version} does not exist")


def get_components(ctx: Context, mc_version: str):
    item_components_url = f"https://raw.githubusercontent.com/misode/mcmeta/refs/tags/{mc_version}-summary/item_components/data.json"
    with open(ctx.cache["simpledrawer"].download(item_components_url), "r") as f:
        item_components = json.load(f)
    return item_components

def get_item_modifier(item_components: dict[str, Any]):
    item_modifier: list[dict[str, str]] = []

    for id, components in item_components.items():
        item_name = components["minecraft:item_name"]
        item_name["color"] = "white"
        item_name["italic"] = False
        item_modifier.append(get_translation(item_name, get_real_id(id)))
    return item_modifier

def generate_translation(ctx: Context):

    mc_versions = ctx.meta.get("mc_supports", ["1.20.6"])

    entries = []    

    if len(mc_versions) == 1:
        # on ne créer pas un overlay
        mc_version = mc_versions[0]
        item_components = get_components(ctx, mc_version)
        formats, _ = get_pack_format(ctx, mc_version)
        item_modifier = get_item_modifier(item_components)
        ctx.data.item_modifiers["simpledrawer:impl/destroy/translate"] = ItemModifier(item_modifier)
    else:
        for mc_version in mc_versions:
            item_components = get_components(ctx, mc_version)
            formats, _ = get_pack_format(ctx, mc_version)
            item_modifier = get_item_modifier(item_components)

            impl = f"v{ctx.project_version}/"
            path = "simpledrawer:impl/destroy/translate".replace("impl/", impl)

            directory = f"simpledrawer_{formats[0]}_{formats[1]}"
            overlays: dict[str, Any] = ctx.data.mcmeta.data.setdefault("overlays", {"entries": []})
            entries: list[dict[str, Any]] = overlays["entries"]
            if directory in [x["directory"] for x in entries]:
                continue
            dp = ctx.data.overlays[directory]
            dp.item_modifiers[path] = ItemModifier(item_modifier)
                
            entries.append({
                "directory": directory,
                "min_format": [formats[0], formats[1]],
                "max_format": [formats[0], formats[1]],
                "formats": formats[0],
            })
        
        b = None
        for a, b in pairwise(entries):
            min_format = b["min_format"]
            a["max_format"] = [min_format[0] - 1, 999]
        if b:
            b["max_format"][1] = 999



            



def create_tape_loot_table(ctx: Context):
    vanilla = Vanilla(ctx, minecraft_version=ctx.meta.get("minecraft_version", "1.20.6"))

    originals = [
        "minecraft:blocks/lodestone",
        "minecraft:blocks/beehive",
    ]
    for original in originals:
        original_loot_table = deepcopy(vanilla.data.loot_tables[original].data)
        original_loot_table["pools"].insert(0, {
            "rolls": 1,
            "entries": [
                {
                    "type": "minecraft:loot_table",
                    "value": "simpledrawer:special_tape"
                }
            ]
        })
        original_loot_table["__smithed__"] = {
            "rules": [
                {
                    "type": "smithed:append",
                    "target": "pools[0].entries",
                    "source": {
                        "type": "smithed:reference",
                        "path": "pools[0].entries[0]"
                    }
                }
            ]
        }
        ctx.data.loot_tables[original] = LootTable(original_loot_table)
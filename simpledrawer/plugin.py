from dataclasses import dataclass
from typing import Any, Iterable, Literal, Optional
from beet import Context, ItemModel
from simple_item_plugin.types import NAMESPACE, Lang
from simple_item_plugin.item import Item
from simple_item_plugin.crafting import ShapedRecipe, VanillaItem, ExternalItem
from simple_item_plugin.guide import ItemGroup

from simple_item_plugin.types import TranslatedString
from beet import Context, Function, ItemModifier
import nbtlib
import json


class SimpleDrawerItem(Item):
    def create_custom_data(self, ctx: Context):
        res = super().create_custom_data(ctx)
        res["ctc"] = {
            "id": self.id,
            "from": "airdox_:simpledrawer",
        }
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
    




def beet_default(ctx: Context):
    """
    require:
    - airdox_.add_tests_directory
    - airdox_.allow_function_without_name
    - mecha.contrib.messages
    - bolt

    """

    """

      - guide
    - pack
    - simpledrawer.add_mc_version_support
    - simpledrawer.add_versioning_to_items
    - simpledrawer.generate_translation
    - airdox_.test_load_generator
    
    """
    # ctx.require("simpledrawer.pack")
    ctx.require("simpledrawer.add_mc_version_support")
    ctx.require("simpledrawer.generate_translation")
    ctx.require("simpledrawer.airdox_.test_load_generator")
    ctx.require("simpledrawer.new_drawer_model")

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
        })
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
                "translate": "container.shulkerBox.itemCount",
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


def generate_translation(ctx: Context):

    mc_version = ctx.meta.get("mc_supports", ["1.20.6"])
    mc_version = mc_version[0]

    
    item_components_url = f"https://raw.githubusercontent.com/misode/mcmeta/refs/tags/{mc_version}-summary/item_components/data.json"
    with open(ctx.cache["simpledrawer"].download(item_components_url), "r") as f:
        item_components = json.load(f)


    item_modifier = []

    for id, components in item_components.items():
        item_name = components["minecraft:item_name"]
        item_name["color"] = "white"
        item_name["italic"] = False
        item_modifier.append(get_translation(item_name, get_real_id(id)))
    
    impl = f"v{ctx.project_version}/"
    path = "simpledrawer:impl/destroy/translate".replace("impl/", impl)
    ctx.data.item_modifiers[path] = ItemModifier(item_modifier)
        


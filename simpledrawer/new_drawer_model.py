from typing import Any, Iterable, Literal
from beet import Context, ItemModel
from simpledrawer.plugin import ALL_DRAWER_TYPES


def beet_default(ctx: Context):
    wood_types = iter(ALL_DRAWER_TYPES)

    upgrade = {
        "type": "minecraft:composite",
        "models": [
            generate_upgrade_condition(
                "iron",
                on_true=generate_upgrade_model("iron"),
                on_false=generate_upgrade_condition(
                    "gold",
                    on_true=generate_upgrade_model("gold"),
                    on_false=generate_upgrade_condition(
                        "diamond",
                        on_true=generate_upgrade_model("diamond"),
                        on_false=generate_upgrade_condition(
                            "star",
                            on_true=generate_upgrade_model("star"),
                            on_false=generate_upgrade_condition(
                                "netherite",
                                on_true=generate_upgrade_model("netherite"),
                                on_false={"type": "minecraft:empty"}
                            )
                        )
                    )
                )
            ),
            generate_hopper_condition(
                on_true=generate_plain_model("simpledrawer:item/new_drawer/hopper_upgrade"),
                on_false={"type": "minecraft:empty"}
            ),
        ]
    }

    res = {
        "model": {
            "type": "minecraft:composite",
            "models": [
                iter_wood_types(wood_types),
                generate_tapped_condition(
                    is_empty=upgrade,
                    is_filled=generate_plain_model("simpledrawer:item/new_drawer/tapped")
                )
            ]
        },
        "oversized_in_gui": True,
    }
    ctx.assets.item_models["simpledrawer:new_drawer"] = ItemModel(res)

    

def iter_wood_types(wood_types):
    current = next(wood_types, None)
    if current is None:
        return {"type": "minecraft:empty"}
    on_false = iter_wood_types(wood_types)
    if current == "compacting":
        on_true = generate_slot_count_condition(
            slot_count=1,
            on_true=generate_plain_model("simpledrawer:item/new_drawer/comp_1"),
            on_false=generate_slot_count_condition(
                slot_count=2,
                on_true=generate_plain_model("simpledrawer:item/new_drawer/comp_2"),
                on_false=generate_slot_count_condition(
                    slot_count=3,
                    on_true=generate_plain_model("simpledrawer:item/new_drawer/comp_3"),     
                    on_false={"type": "minecraft:empty"}
                )
            ),
        )
        #TODO: faire un modèle custom vec le tag slot_counts
        return generate_wood_type_condition(
            current,
            on_true=on_true,
            on_false=on_false
        )
    variants = iter(["single", "double", "quadruple"])
    on_true = iter_variants(variants, current)
    return generate_wood_type_condition(
        current,
        on_true,
        on_false
    )
    
def iter_variants(variants: Iterable[Literal["single", "double", "quadruple"]], wood_type: str):
    current = next(variants, None)
    if current is None:
        return {"type": "minecraft:empty"}
    on_false = iter_variants(variants, wood_type)
    current_number = {"single": "1", "double": "2", "quadruple": "4"}[current]
    on_true = generate_plain_model(f"simpledrawer:item/new_drawer/{wood_type}_{current_number}")
    return generate_variant_condition(
        current,
        on_true=on_true,
        on_false=on_false
    )


def generate_wood_type_condition(wood_type: str, on_true: Any, on_false: Any,):
    """
    Generate a condition for a wood type.
    :param wood_type: The wood type.
    :param on_true: The value if the condition is true.
    :param on_false: The value if the condition is false.
    :return: The condition.
    """
    if wood_type not in ALL_DRAWER_TYPES:
        raise ValueError(f"Invalid wood type: {wood_type}. Valid types are: {', '.join(ALL_DRAWER_TYPES)}")
    return {
        "type": "minecraft:condition",
        "property": "minecraft:component",
        "predicate": "minecraft:container",
        "value": {
            "items": {
                "contains": [
                    {
                        "predicates": {
                            "minecraft:custom_data": {
                                "simpledrawer": {
                                    "wood_type": f"simpledrawer:{wood_type}"
                                }
                            }
                        }
                    }
                ]
            }
        },
        "on_true": on_true,
        "on_false": on_false,
    }

def generate_variant_condition(variant: Literal["single", "double", "quadruple", "normal"], on_true: Any, on_false: Any,):
    """
    Generate a condition for a variant.
    :param variant: The variant type.
    :param on_true: The value if the condition is true.
    :param on_false: The value if the condition is false.
    :return: The condition.
    """
    return {
        "type": "minecraft:condition",
        "property": "minecraft:component",
        "predicate": "minecraft:container",
        "value": {
            "items": {
                "contains": [
                    {
                        "predicates": {
                            "minecraft:custom_data": {
                                "simpledrawer": {
                                    "variant": variant
                                }
                            }
                        }
                    }
                ]
            }
        },
        "on_true": on_true,
        "on_false": on_false,
    }

def generate_slot_count_condition(slot_count: int, on_true: Any, on_false: Any,):
    """
    Generate a condition for a slot count.
    :param slot_count: The slot count.
    :param on_true: The value if the condition is true.
    :param on_false: The value if the condition is false.
    :return: The condition.
    """
    return {
        "type": "minecraft:condition",
        "property": "minecraft:component",
        "predicate": "minecraft:container",
        "value": {
            "items": {
                "contains": [
                    {
                        "predicates": {
                            "minecraft:custom_data": f"{{simpledrawer: {{slot_count: {slot_count}b }} }}"
                        }
                    }
                ]
            }
        },
        "on_true": on_true,
        "on_false": on_false,
    }


def generate_tapped_condition(is_empty: Any, is_filled: Any,):
    """
    Generate a condition for a tapped drawer.
    :param on_true: The value if the condition is true.
    :param on_false: The value if the condition is false.
    :return: The condition.
    """
    return {
        "type": "minecraft:condition",
        "property": "minecraft:component",
        "predicate": "minecraft:container",
        "value": {
            "items": {
                "contains": [
                    {
                        "predicates": {
                            "minecraft:custom_data": (
                                    "{simpledrawer: {items_counts: {"
                                    "0: 0, 1: 0, 2: 0, 3: 0, 4: 0, 5: 0, "
                                    "6: 0, 7: 0, 8: 0, 9: 0, 10: 0, "
                                    "11: 0, 12: 0, 13: 0, 14: 0, 15: 0, "
                                    "16: 0, 17: 0, 18: 0, 19: 0, 20: 0, "
                                    "21: 0, 22: 0, 23: 0, 24: 0, 25: 0, "
                                    "26: 0}}}"
                                )
                        }
                    }
                ]
            }
        },
        "on_true": is_empty,
        "on_false": is_filled,
    }


def generate_upgrade_condition(upgrade: str, on_true: Any, on_false: Any,):
    """
    Generate a condition for a variant.
    :param upgrade: The upgrade type.
    :param on_true: The value if the condition is true.
    :param on_false: The value if the condition is false.
    :return: The condition.
    """
    return {
        "type": "minecraft:condition",
        "property": "minecraft:component",
        "predicate": "minecraft:container",
        "value": {
            "items": {
                "contains": [
                    {
                        "predicates": {
                            "minecraft:custom_data": {
                                "simpledrawer": {
                                    "upgrade": upgrade
                                }
                            }
                        }
                    }
                ]
            }
        },
        "on_true": on_true,
        "on_false": on_false,
    }

def generate_hopper_condition(on_true: Any, on_false: Any,):
    """
    Generate a condition for a variant.
    :param on_true: The value if the condition is true.
    :param on_false: The value if the condition is false.
    :return: The condition.
    """
    return {
        "type": "minecraft:condition",
        "property": "minecraft:component",
        "predicate": "minecraft:container",
        "value": {
            "items": {
                "contains": [
                    {
                        "predicates": {
                            "minecraft:custom_data": "{simpledrawer: {hopper: 1b}}"
                        }
                    }
                ]
            }
        },
        "on_true": on_true,
        "on_false": on_false,
    }


def generate_upgrade_model(upgrade: str) -> dict[str, str]:
    return generate_plain_model(f"simpledrawer:item/new_drawer/{upgrade}_upgrade")
    


def generate_plain_model(model: str) -> dict[str, str]:
    return {
        "type": "minecraft:model",
        "model": model,
    }
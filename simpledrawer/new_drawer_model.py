from typing import Any, Iterable, Literal
from beet import Context, ItemModel
from simpledrawer.plugin import ALL_DRAWER_TYPES


def beet_default(ctx: Context):
    wood_types = iter(ALL_DRAWER_TYPES)
    res = {
        "model": iter_wood_types(wood_types)
    }
    ctx.assets.item_models["simpledrawer:new_drawer"] = ItemModel(res)

    

def iter_wood_types(wood_types):
    current = next(wood_types, None)
    if current is None:
        return {"type": "minecraft:empty"}
    on_false = iter_wood_types(wood_types)
    if current == "compacting":
        on_true = generate_solt_count_condition(
            slot_count=1,
            on_true=generate_tapped_compacting_condition(
                is_empty=generate_plain_model("simpledrawer:item/new_drawer/comp_1"),
                is_filled=generate_plain_model("simpledrawer:item/new_drawer/comp_1_tapped"),
            ),
            on_false=generate_solt_count_condition(
                slot_count=2,
                on_true=generate_tapped_compacting_condition(
                    is_empty=generate_plain_model("simpledrawer:item/new_drawer/comp_2"),
                    is_filled=generate_plain_model("simpledrawer:item/new_drawer/comp_2_tapped"),
                ),
                on_false=generate_solt_count_condition(
                    slot_count=3,
                    on_true=generate_tapped_compacting_condition(
                        is_empty=generate_plain_model("simpledrawer:item/new_drawer/comp_3"),
                        is_filled=generate_plain_model("simpledrawer:item/new_drawer/comp_3_tapped"),
                    ),
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
    on_true = generate_tapped_condition(
        is_empty=generate_plain_model(f"simpledrawer:item/new_drawer/{wood_type}_{current_number}"),
        is_filled=generate_plain_model(f"simpledrawer:item/new_drawer/{wood_type}_{current_number}_tapped")
    )
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
                            "minecraft:custom_data": "{simpledrawer: {globalCount: 0}}"
                        }
                    }
                ]
            }
        },
        "on_true": is_empty,
        "on_false": is_filled,
    }

def generate_solt_count_condition(slot_count: int, on_true: Any, on_false: Any,):
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
                            "minecraft:custom_data": f"{{simpledrawer: {{slot_count: {slot_count}b }} }}"
                        }
                    }
                ]
            }
        },
        "on_true": on_true,
        "on_false": on_false,
    }


def generate_tapped_compacting_condition(is_empty: Any, is_filled: Any,):
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
                            "minecraft:custom_data": "{simpledrawer: {items_counts: {0: 0, 1: 0, 2: 0}}}"
                        }
                    }
                ]
            }
        },
        "on_true": is_empty,
        "on_false": is_filled,
    }


def generate_plain_model(model: str):
    return {
        "type": "minecraft:model",
        "model": model,
    }


import json 

# On génère les items à afficher sur l'armor stand
# Tete : Item à afficher 
# Main gauche : Nombre d'item
# Main droite : Nombre de slot

# Pour les numéros on affiche les items selon leur nombre avec 3 chiffres significatifs
# 0-999 : Iron ingot entiers type 125
# 1_000-9_999 : Gold ingot flottants type 1.25k
# 10_000-99_999 : Copper ingot flottants type 12.5k
# 100_000-999_999 : Diamond entiers type 125k
# 1_000_000-9_999_999 : Emerald flottants type 1.25M
# 10_000_000-99_999_999 : Netherite flottants type 12.5M
# 100_000_000-999_999_999 : Stick entiers type 125M
# 1_000_000_000-9_999_999_999 : Coal flottants type 1.25G

# 2^31 = 2_147_483_648

# Rappel : 
# Nombre entiers type 125 :
# - Iron ingot
# - Diamond k
# - Stick M
# Nombres flottants type 1.25:
# - Gold ingot k
# - Emerald M
# - Coal G
# Nombres flottants type 12.5:
# - Copper ingot k
# - Netherite M




all_model=[{"item":"iron_ingot","type_display":"int","suffix":"no"},
    {"item":"gold_ingot","type_display":"float_x_xx","suffix":"k"},
    {"item":"copper_ingot","type_display":"float_xx_x","suffix":"k"},
    {"item":"diamond","type_display":"int","suffix":"k"},
    {"item":"emerald","type_display":"float_x_xx","suffix":"M"},
    {"item":"netherite_ingot","type_display":"float_xx_x","suffix":"M"},
    {"item":"stick","type_display":"int","suffix":"M"},
    {"item":"coal","type_display":"float_x_xx","suffix":"G"}
]


def generate(model_base):
    print(f"{model_base['item']}_base.json")
    with open(f"{model_base['item']}_base.json","r") as f:
        model=json.load(f)
    
    #add override to the model
    model["overrides"]=[]
    for i in range(0,1000):
        model["overrides"].append({
            "predicate": {
                "custom_model_data": 1430000+i
            },
            "model": f"simpledrawer:item/numbers/{model_base['suffix']}/{model_base['type_display']}/{i}"
        })
    #write the model to a file
    with open(f"{model_base['item']}.json","w") as f:
        json.dump(model,f,indent=4)
        
    


for model_base in all_model:
    generate(model_base)
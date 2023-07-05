

from colormath.color_diff import delta_e_cie2000
from colormath.color_objects import LabColor, sRGBColor
from colormath import color_conversions


def normalize_rgb(color):
    return color[0] / 255, color[1] / 255, color[2] / 255

# Convertir les couleurs RGB en valeurs CIELAB
def rgb_to_lab(color):
    # Convertir la couleur RGB en objet sRGBColor
    rgb_color = sRGBColor(color[0], color[1], color[2])
    
    # Convertir la couleur sRGBColor en objet LabColor
    lab_color = color_conversions.convert_color(rgb_color, LabColor)
    
    # Retourner les composantes L, a et b de la couleur Lab
    return lab_color.lab_l, lab_color.lab_a, lab_color.lab_b

# Calculer la distance entre les couleurs CIELAB
def distance_color(color1, color2):
    # Conversion des couleurs RGB 0-255 en 0-1
    color1_normalized = normalize_rgb(color1)
    color2_normalized = normalize_rgb(color2)
    
    # Conversion des couleurs normalisées en valeurs CIELAB
    color1_lab = sRGBColor(*color1_normalized)
    color2_lab = sRGBColor(*color2_normalized)
    color1_lab = color_conversions.convert_color(color1_lab, LabColor)
    color2_lab = color_conversions.convert_color(color2_lab, LabColor)
    
    # Calcul de la différence de luminosité entre les couleurs CIELAB
    delta_l = abs(color1_lab.lab_l - color2_lab.lab_l)
    
    return delta_l



# import image module
from PIL import Image, ImageDraw, ImageFont
import numpy as np

def generate_pixel(i,j):
    init_color=init.getpixel((i,j))
    i_min,j_min=-1,-1

    d=255
    if not init_color in ignored_colors:
        init_material_color_list=[]
        for k in range(init_material.size[0]):
            for l in range(init_material.size[1]):
                init_material_color=init_material.getpixel((k,l))
                if not init_material_color in init_material_color_list:
                    init_material_color_list.append(init_material_color)
                    d_new=distance_color(init_color,init_material_color)
                    if d_new<d:
                        d=d_new
                        i_min,j_min=k,l
                        init_material_color_min=init_material_color
        #print(init_color,init_material_color_min,d)
        d_before=d
        generated.putpixel((i,j),generated_material.getpixel((i_min,j_min)))
        i_min,j_min=-1,-1
        init_material_color_list=[]
        for k in range(init_material2.size[0]):
            for l in range(init_material2.size[1]):
                init_material_color=init_material2.getpixel((k,l))
                if not init_material_color in init_material_color_list:
                    init_material_color_list.append(init_material_color)
                    d_new=distance_color(init_color,init_material_color)
                    if d_new<d:
                        d=d_new
                        i_min,j_min=k,l
                        init_material_color_min=init_material_color
        #print(init_color,init_material_color_min,d)
        if d_before>3*d and False:
            generated.putpixel((i,j),generated_material2.getpixel((i_min,j_min)))
    else:
        generated.putpixel((i,j),init_color)


ignored_colors=[]

def distance_color(color1,color2):
    color1_normalized = normalize_rgb(color1)
    color2_normalized = normalize_rgb(color2)
    return calculate_color_distance(rgb_to_lab(color1_normalized),rgb_to_lab(color2_normalized))



for texture_type in ["front_1","front_2","front_4","side","trim"]:
    init=Image.open(f"oak/drawers_oak_{texture_type}.png")
    init_material=Image.open("oak/oak_planks.png")
    init_material2=Image.open("oak/oak_log.png")


    for material in ["cherry","mangrove"]:

        generated=Image.new("RGB",(init.size[0],init.size[1]),(0,0,0))
        generated_material=Image.open(f"new_wood/{material}_planks.png")
        generated_material2=Image.open(f"new_wood/{material}_log.png")

        # iterate over init image pixels and generate new image

        for i in range(init.size[0]):
            for j in range(init.size[1]):
                generate_pixel(i,j)


        generated.save(f"new_wood/drawers_{material}_{texture_type}.png")


                





import os
import pathlib
from PIL import Image


path = pathlib.Path(__file__).parent
print(path)
replace_1 = [
    [(6,1), (7,1)],
    [(9,1), (7,1)],
]
replace_2 = [
    *replace_1,
    [(6,9), (7,9)],
    [(9,9), (7,9)],
]

for filepath in path.iterdir():
    if str(filepath).endswith("1.png"):
        img = Image.open(filepath)
        for r in replace_1:
            img.putpixel(r[0], img.getpixel(r[1]))
        img.save(filepath)
    elif str(filepath).endswith("2.png"):
        img = Image.open(filepath)
        for r in replace_2:
            img.putpixel(r[0], img.getpixel(r[1]))
        img.save(filepath)




import json
import os
from pathlib import Path

INIT = Path(__file__).parent
path = INIT.parent / "models" / "item"

print(path)

for p in (path).glob("**/*.json"):
    relative = str(p.relative_to(path))
    destination = INIT / relative
    
    model = {
        "model": {
            "type": "model",
            "model": f"simpledrawer:item/{relative.removesuffix('.json')}"
        }
    }

    os.makedirs(destination.parent, exist_ok=True)
    with destination.open("w") as f:
        json.dump(model, f, indent=4)




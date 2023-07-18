
import json


for i in range(16):
    predicate={
	"condition": "minecraft:location_check",
	"predicate": {
		"light": {
			"light": i
		}
	}
}

    with open(f"{i}.json", "w") as f:
        json.dump(predicate, f, indent=4)



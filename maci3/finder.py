import json
import os

stream = os.system('yabai -m query --windows | head -n 20 | grep "Finder" ')

# data = json.loads(stream)

print(stream)

# print(data["has-focus"])

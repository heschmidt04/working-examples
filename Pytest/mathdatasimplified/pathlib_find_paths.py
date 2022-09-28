from pathlib import Path

path = Path.cwd()

print(f"Current path: {path}")
print(f"Parent: {path.parent}")
print(f"Grandparent: {path.parent.parent}")



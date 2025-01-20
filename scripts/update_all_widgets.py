import os
import json

REPO_PATH = "majesticui-flutter"
WIDGETS = ["majestic_card", "majestic_appbar"]
OUTPUT_FILE = os.path.join(REPO_PATH, "all_widgets.json")

def read_main_dart(widget_name):
    """Reads content from main.dart in the widget directory."""
    lib_path = os.path.join(REPO_PATH, widget_name, "lib", "main.dart")
    if os.path.exists(lib_path):
        with open(lib_path, "r", encoding="utf-8") as f:
            return f.read()
    return None

def update_all_widgets():
    """Generates all_widgets.json by aggregating main.dart content."""
    all_widgets = []

    # Load existing JSON if available
    if os.path.exists(OUTPUT_FILE):
        with open(OUTPUT_FILE, "r", encoding="utf-8") as f:
            all_widgets = json.load(f)

    # Process each widget
    for widget in WIDGETS:
        content = read_main_dart(widget)
        if content:
            widget_entry = {
                "name": widget.replace("majestic_", ""),  # Remove "majestic_" prefix
                "files": [
                    {
                        "name": f"{widget}.dart",
                        "dir": "majestic/ui",
                        "content": json.dumps(content)  # Stringify the content
                    }
                ],
                "type": "ui"
            }
            # Add or update widget in all_widgets
            all_widgets = [w for w in all_widgets if w["name"] != widget_entry["name"]]
            all_widgets.append(widget_entry)

    # Write back to JSON
    with open(OUTPUT_FILE, "w", encoding="utf-8") as f:
        json.dump(all_widgets, f, indent=2)

if __name__ == "__main__":
    update_all_widgets()

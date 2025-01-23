# python scripts/refresh.py && git add . && git commit -m "" && cd app && flutter build web && firebase deploy --only hosting

import os
import json
import yaml
import re

REPO_PATH = "./"
# REPO_PATH = "/home/runner/work/majestic-ui-flutter/majestic-ui-flutter/"
SRC_PATH = os.path.join(REPO_PATH, 'src')


def scan_dart_projects(src_path):
    projects = []

    # Iterate through directories in src folder
    for project_dir in os.listdir(src_path):
        project_path = os.path.join(src_path, project_dir)

        # if project_path.split("/")[-1] != "user_feed": continue
        
        # Skip if not a directory
        if not os.path.isdir(project_path):
            continue

        # Path to pubspec.yaml
        pubspec_path = os.path.join(project_path, 'pubspec.yaml')
        
        # Skip if no pubspec.yaml
        if not os.path.exists(pubspec_path):
            continue

        # Read pubspec.yaml
        with open(pubspec_path, 'r') as f:
            pubspec_data = yaml.safe_load(f)

        widget_name = pubspec_data.get('name', '')

        # Prepare project info
        project_info = {
            "name": widget_name,
            "label": pubspec_data.get('label', ''),
            "description": pubspec_data.get('description', ''),
            "usage": "USAGE",  # Placeholder, you might want to customize this
            "files": [],
            "dependencies": [dep for dep in pubspec_data.get('dependencies', {}).keys() if dep != "flutter"],
            "type": "ui",  # Placeholder, you might want to detect this dynamically
            "author": "Ronak99",
            "github": "https://github.com/Ronak99"
        }

        # Scan lib folder for Dart files
        lib_path = os.path.join(project_path, 'lib')

        if os.path.exists(lib_path):
            # Recursively find all Dart files
            dart_files = []
            for root, _, files in os.walk(lib_path):
                dart_files.extend([os.path.join(root, f) for f in files if f.endswith('.dart')])

            print(dart_files)

            for file_path in dart_files:
                # Read file content
                with open(file_path, 'r') as f:
                    content = f.read()

                # Calculate relative directory
                rel_dir = os.path.relpath(os.path.dirname(file_path), lib_path).replace('\\', '/')

                # If only one Dart file exists in the entire project, directory is majestic/ui
                if len(dart_files) == 1:
                    directory = "majestic/ui"
                else:
                    # If more than one file, handle nested directories
                    if rel_dir == '.':
                        directory = f"majestic/ui/{widget_name}"
                    else:
                        directory = f"majestic/ui/{widget_name}/{rel_dir}"

                project_info['files'].append({
                    "name": os.path.basename(file_path),
                    "dir": directory,
                    "content": content
                })

            projects.append(project_info)

    return projects

def update_all_widgets():
    """Generates all_widgets.json by aggregating main.dart content."""
    
    # Scan projects and generate JSON
    projects_data = scan_dart_projects(SRC_PATH)
    
    # Write to output file
    with open('all_widgets.json', 'w') as f:
        json.dump(projects_data, f, indent=2)
    
    print(f"Scanned {len(projects_data)} projects. Results saved to project_scan_results.json")

if __name__ == "__main__":
    update_all_widgets()

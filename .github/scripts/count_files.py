import os
import json
from datetime import datetime

def count_files(directory):
    total_files = 0
    for root, dirs, files in os.walk(directory):
        # Skip .git directory
        if '.git' in dirs:
            dirs.remove('.git')
        total_files += len(files)
    return total_files

if __name__ == "__main__":
    flutter_repo_path = os.environ['FLUTTER_REPO_PATH']
    datasource_repo_path = os.environ['DATASOURCE_REPO_PATH']
    
    # Count files in Flutter repository
    file_count = count_files(flutter_repo_path)
    
    # Create JSON data
    data = {
        "files": file_count,
        "timestamp": datetime.utcnow().isoformat()
    }
    
    # Write to file in datasource repository
    output_path = os.path.join(datasource_repo_path, 'file_count.json')
    with open(output_path, 'w') as f:
        json.dump(data, f, indent=2)
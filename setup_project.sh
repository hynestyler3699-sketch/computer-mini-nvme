#!/bin/bash
set -e

# Create project directory
mkdir -p ~/projects/WorshipEngine
cd ~/projects/WorshipEngine

echo "Creating project structure..."

# Create directories
mkdir -p src/engine
mkdir -p assets/weights
mkdir -p assets/audio
mkdir -p models
mkdir -p logs
mkdir bin

# Create files
touch src/main.py
touch src/engine/__init__.py
touch src/engine/core.py
touch src/engine/rvc.py
touch build.sh
touch requirements.txt
touch .env
touch .gitignore

echo "Populating requirements.txt..."
# Populate requirements.txt
cat <<REQEOF > requirements.txt
torch
numpy
librosa
soundfile
pyinstaller
faiss-cpu
scipy
REQEOF

echo "Creating virtual environment..."
# Create virtual environment
python3 -m venv venv
source venv/bin/activate

echo "Installing dependencies..."
# Install requirements
pip install --upgrade pip
pip install -r requirements.txt

echo "Creating build.sh..."
# Populate build.sh
cat <<BUILDEOF > build.sh
#!/bin/bash

# Ensure we are in the project root or adjust path logic as needed
# This assumes the script is run from project root

source venv/bin/activate

pyinstaller \\
  --name worship-engine \\
  --onefile \\
  --add-data "assets:assets" \\
  src/main.py

echo "Build complete."
BUILDEOF

chmod +x build.sh

echo "Setup complete!"

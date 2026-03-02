#!/bin/bash

# Ensure we are in the project root or adjust path logic as needed
# This assumes the script is run from project root

source venv/bin/activate

pyinstaller \
  --name worship-engine \
  --onefile \
  --add-data "assets:assets" \
  src/main.py

echo "Build complete."

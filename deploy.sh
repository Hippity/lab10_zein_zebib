!/bin/bash

set -e

SCRIPT_NAME="app.py"
VIRTUAL_ENV="venv"

echo "Starting deployment of $APP_NAME..."

# Virtual environment already exists with the requirments no need to run pip install or create a new folder

# Activate venv
echo "Activating virtual environment..."
source $VIRTUAL_ENV/bin/activate

# Run the Python script
echo "Running $SCRIPT_NAME..."
python3 $SCRIPT_NAME

echo "Deactivating virtual environment..."
deactivate

echo "Deployment completed successfully!"

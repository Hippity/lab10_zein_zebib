!/bin/bash

set -e

APP_NAME="Greet"
SCRIPT_NAME="app.py"
VENV_DIR="venv"

echo "Starting deployment of $APP_NAME..."

# Create a virtual environment (if it doesn't exist)
if [ ! -d "$VENV_DIR" ]; then
    echo "Creating virtual environment..."
    python3 -m venv $VENV_DIR
fi

# Activate venv
echo "Activating virtual environment..."
source $VENV_DIR/bin/activate

# Install dependencies 
echo "Installing dependencies..."
pip install -r requirements.txt

# Run the Python script
echo "Running $SCRIPT_NAME..."
python3 $SCRIPT_NAME

echo "Deactivating virtual environment..."
deactivate

echo "Deployment completed successfully!"

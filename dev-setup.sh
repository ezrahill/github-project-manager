#!/bin/bash
set -e

# Ensure we're in the project root
cd "$(dirname "$0")"

# Check if python version matches pyenv setting
if command -v pyenv 1>/dev/null 2>&1; then
    echo "✅ Using pyenv to manage Python version"
    if [ -f .python-version ]; then
        PYTHON_VERSION=$(cat .python-version)
        echo "🐍 Required Python version: $PYTHON_VERSION"

        # Check if the required Python version is already installed
        if pyenv versions --bare | grep -q "^$PYTHON_VERSION$"; then
            echo "✅ Python $PYTHON_VERSION is already installed"
        else
            echo "📥 Installing Python $PYTHON_VERSION..."
            pyenv install $PYTHON_VERSION
        fi

        pyenv local $PYTHON_VERSION
    else
        echo "⚠️ No .python-version file found"
    fi
fi

# Create virtual environment if it doesn't exist
if [ ! -d ".venv" ]; then
    echo "🏗️ Creating virtual environment..."
    python -m venv .venv
fi

# Activate the virtual environment
echo "🚀 Activating virtual environment..."
source .venv/bin/activate

# Install package in development mode
echo "📦 Installing package in development mode..."
pip install -e .
pip install pytest pytest-cov black

# Export PYTHONPATH to include current directory
export PYTHONPATH=$PYTHONPATH:$(pwd)

# Run tests if requested
if [ "$1" == "test" ]; then
    echo "🧪 Running tests..."
    PYTHONPATH=. pytest -v tests/
elif [ "$1" == "coverage" ]; then
    echo "📊 Running tests with coverage..."
    PYTHONPATH=. pytest --cov=github_project_manager tests/
    coverage report -m
elif [ "$1" == "lint" ]; then
    echo "🧹 Running linter..."
    black --check .
elif [ "$1" == "format" ]; then
    echo "✨ Formatting code..."
    black .
elif [ "$1" == "all" ]; then
    echo "🧪 Running full test suite..."
    black --check .
    PYTHONPATH=. pytest --cov=github_project_manager tests/
    coverage report -m
fi

echo "✅ Setup complete! Virtual environment is activated."
echo "Run 'deactivate' when you're done to exit the virtual environment."